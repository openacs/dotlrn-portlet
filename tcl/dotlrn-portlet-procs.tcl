#
#  Copyright (C) 2001, 2002 OpenForce, Inc.
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_library {

    Procedures to supports the "dotlrn" portlet. The "dotlrn" portlet shows
    the subcommunities of the community's portal where it's located. This portal
    is not to be confused with the "dotlrn-main" portal, that goes on user's
    workspace portals and shows the communities that they are members of.

    @creation-date September 30 2001
    @author arjun@openforce.net
    @cvs-id $Id$

}

namespace eval dotlrn_portlet {

    ad_proc -private get_my_name {
    } {
        return "dotlrn_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "dotlrn-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        # get the param from the dotlrn package
	return [ad_parameter subcommunities_pretty_plural dotlrn]
    }

    ad_proc -public link {
    } {
	return ""
    }

    ad_proc -public add_self_to_page {
	{-portal_id:required}
	{-community_id:required}
    } {
	Adds a dotlrn PE to the given communities's portal

	@param portal_id
	@param community_id

	@return element_id The new element's id
    } {
	set element_id [portal::add_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -pretty_name [get_pretty_name] \
            -force_region [ad_parameter "dotlrn_portlet_force_region" [my_package_key]] \
        ]

	portal::set_element_param $element_id community_id $community_id

	return $element_id
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
	Removes the dotlrn PE from the portal.
    } {
        # since there can be only one dotlrn pe on the portal use:
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
	 cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf
    }

}

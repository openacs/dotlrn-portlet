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

    Procedures to supports dotlrn admin portlets

    @creation-date September 30 2001
    @author arjun@openforce.net
    @author ben@openforce.net
    @version $Id$

}

namespace eval dotlrn_admin_portlet {

    ad_proc -private get_my_name {
    } {
        return "dotlrn_admin_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "Group Administration"
    }

    ad_proc -public my_package_key {
    } {
        return "dotlrn-portlet"
    }

    ad_proc -public link {
    } {
	return ""
    }

    ad_proc -public add_self_to_page {
	{-portal_id:required}
	{-community_id:required}
    } {
	Adds the dotlrn admin PE to the given page with the community_id as
        as parameter

	@param portal_id The page to add self to
	@param community_id The dotlrn community to show info about

	@return element_id The new element's id
    } {
	set element_id [portal::add_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -force_region [ad_parameter "dotlrn_admin_portlet_force_region" [my_package_key]] \
        ]

        # set the community_id param that this portlet needs
        portal::set_element_param $element_id "community_id" $community_id

	return $element_id
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
	Removes a dotlrn PE from the given portal
    } {
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
            -config_list $cf \
            -template_src "dotlrn-admin-portlet"
    }

}

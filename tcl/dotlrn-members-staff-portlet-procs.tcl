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

    Procedures to supports the dotlrn "members staff" portlet aka "Staff List"

    @author arjun@openforce.net
    @cvs-id $Id$
}

namespace eval dotlrn_members_staff_portlet {

    ad_proc -private get_my_name {
    } {
        return "dotlrn_members_staff_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "dotlrn-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "Staff List"
    }

    ad_proc -public link {
    } {
	return ""
    }

    ad_proc -public add_self_to_page {
	{-portal_id:required}
	{-community_id:required}
    } {
        Add the "dotlrn members staff" portlet to the page
    } {
        set force_region [ad_parameter \
            "dotlrn_members_staff_portlet_force_region" \
            [my_package_key] \
        ]

        set element_id [portal::add_element \
            -portal_id $portal_id \
            -pretty_name [get_pretty_name] \
            -portlet_name [get_my_name] \
            -force_region $force_region
        ]

        portal::set_element_param $element_id community_id $community_id

        return $element_id
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
    } {
	Removes the PE from the given page
    } {
        portal::remove_element \
            -portal_id $portal_id \
            -portlet_name [get_my_name]
    }

    ad_proc -public show {
	 cf
    } {
	 Call the template to display

	 @param cf A config array
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "dotlrn-members-staff-portlet"
    }

}

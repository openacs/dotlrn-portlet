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

    Procedures to support the dotlrn "members" portlet
    
    @author arjun@openforce.net 
    @cvs-id $Id$

}

namespace eval dotlrn_members_portlet {

    ad_proc -private get_my_name {
    } {
        return "dotlrn_members_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "dotlrn-portlet"
    }


    ad_proc -public get_pretty_name {
    } {
        return "Members"
    }

    ad_proc -public link {
    } {
	return ""
    }

    ad_proc -public add_self_to_page { 
        {-page_id ""}
	portal_id 
	community_id
    } {
        Adds the dotlrn "members" portlet to the given portal. 
        Pass along the community_id
    } {
        set element_id [portal::add_element \
                    -pretty_name [get_pretty_name] \
                    -portal_id $portal_id \
                    -page_id $page_id \
                    -portlet_name [get_my_name] 
        ]

        portal::set_element_param $element_id "community_id" $community_id
        return $element_id
    }

    ad_proc -public show { 
	 cf 
    } {
    } {
        portal::show_proc_helper \
                -package_key [my_package_key] \
                -config_list $cf \
                -template_src "dotlrn-members-portlet"
    }

    ad_proc -public remove_self_from_page { 
        portal_id 
    } {
	Removes the dotlrn "memebers"  PE from the given portal
    } {
        portal::remove_element \
                -portal_id $portal_id \
                -portlet_name [get_my_name]
    }
}
 


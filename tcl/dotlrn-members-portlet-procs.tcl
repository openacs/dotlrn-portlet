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

    Procedures to supports the dotlrn "members"  portlet

    Copyright Openforce, Inc.
    Licensed under GNU GPL v2 
    
    @author arjun@openforce.net 
    @cvs-id $Id$

}

namespace eval dotlrn_members_portlet {

    ad_proc -private my_name {
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
        
    } {
        return [portal::add_element_or_append_id \
                -pretty_name [get_pretty_name] \
                -portal_id $portal_id \
                -page_id $page_id \
                -portlet_name [my_name] \
                -value_id $community_id \
                -key community_id ]
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
                -template_src "dotlrn-members-portlet"
    }

    ad_proc -public remove_self_from_page { 
        portal_id 
        community_id 
    } {
	Removes the PE from the given page 
    } {
	# get the element IDs (could be more than one!)
	set element_ids [portal::get_element_ids_by_ds $portal_id [my_name]]

	# remove all elements
	db_transaction {
	    foreach element_id $element_ids {
		portal::remove_element $element_id
	    }
	}
    }

    ad_proc -public edit { 
	nothing here, move along
    } {
	return ""
    }

    ad_proc -public make_self_available { 
 	portal_id 
    } {
 	wrapper
    } {
 	portal::make_datasource_available \
 		$portal_id [portal::get_datasource_id [my_name]]
    }

    ad_proc -public make_self_unavailable { 
	portal_id 
    } {
        wrapper
    } {
	portal::make_datasource_unavailable \
		$portal_id [portal::get_datasource_id [my_name]]
    }
}

 


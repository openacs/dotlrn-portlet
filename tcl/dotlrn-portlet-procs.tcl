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

# /packages/dotlrn-portlets/tcl/dotlrn-portlets-procs.tcl
ad_library {

Procedures to supports dotlrn portlets

Copyright Openforce, Inc.
Licensed under GNU GPL v2 

@creation-date September 30 2001
@author arjun@openforce.net 
@cvs-id $Id$

}

namespace eval dotlrn_portlet {

    ad_proc -private my_name {
    } {
        return "dotlrn_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "dotlrn-portlet"
    }


    ad_proc -public get_pretty_name {
    } {
	return [ad_parameter -package_id [dotlrn::get_package_id] subcommunities_pretty_plural]

    }

    ad_proc -public link {
    } {
	return ""
    }


    ad_proc -public add_self_to_page { 
	portal_id 
	community_id
    } {
	Adds a dotlrn PE to the given page with the community_id as
	opaque data in the portal configuration.
    
	@return element_id The new element's id
	@param portal_id The page to add self to
	@param community_id The dotlrn community to show info about
	@author arjun@openforce.net
	@creation-date Sept 2001
    } {
	# Tell portal to add this element to the page
	set element_id [portal::add_element \
                -pretty_name [get_pretty_name] \
                -force_region 2 \
                $portal_id \
                [my_name]]
	
	# The default param must be configured
	set key "community_id"
	# set value [portal::get_element_param $element_id $key]

	portal::set_element_param $element_id $key $community_id

	return $element_id
    }

    ad_proc -public show { 
	 cf 
    } {
	 Call the template to display
    
	 @param cf A config array
	 @author arjun@openforce.net
    } {
        portal::show_proc_helper \
                -package_key [my_package_key] \
                -config_list $cf

    }

    ad_proc -public remove_self_from_page { 
	  portal_id 
	  community_id 
    } {
	Removes a dotlrn PE from the given page 
    
	@param portal_id The page to remove self from
	@param community_id
	@author arjun@openforce.net
	@creation-date Sept 2001
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
 	Wrapper for the portal:: proc
 	
 	@param portal_id
 	@author arjun@openforce.net
 	@creation-date Nov 2001
    } {
 	portal::make_datasource_available \
 		$portal_id [portal::get_datasource_id [my_name]]
    }

    ad_proc -public make_self_unavailable { 
	portal_id 
    } {
	Wrapper for the portal:: proc
	
	@param portal_id
	@author arjun@openforce.net
	@creation-date Nov 2001
    } {
	portal::make_datasource_unavailable \
		$portal_id [portal::get_datasource_id [my_name]]
    }
}

 


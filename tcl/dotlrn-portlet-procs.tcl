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
    return "dotlrn-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "Class Information"
    }

    ad_proc -public add_self_to_page { 
	page_id 
	community_id
    } {
	Adds a dotlrn PE to the given page with the community_id as
	opaque data in the portal configuration.
    
	@return element_id The new element's id
	@param page_id The page to add self to
	@param community_id The dotlrn community to show info about
	@author arjun@openforce.net
	@creation-date Sept 2001
    } {
	# Tell portal to add this element to the page
	set element_id [portal::add_element_to_region $page_id [my_name] 2]
	
	# The default param must be configured
	set key "community_id"
	# set value [portal::get_element_param $element_id $key]

	portal::set_element_param $element_id $key $community_id

	return $element_id
    }

    ad_proc -public show { 
	 cf 
    } {
	 Display the PE
    
	 @return HTML string
	 @param cf A config array
	 @author arjun@openforce.net
	 @creation-date Sept 2001
    } {

	array set config $cf	

	set query "select pretty_name, description 
	from dotlrn_communities
	where community_id = $config(community_id)"

	if { $config(shaded_p) == "f" } {
	    
	    # for now query the DM directly
	    if { [db_0or1row select_comminity_info $query] } {
		set data "$pretty_name - <i>$description</i>"
	    } else {
		set data "Community info not found. Contact webmaster, please!"
	    }
	    
	    append data "<p><a href=student-list>List of Students</a>"
	} else {
	    set data ""
	}
	
	return $data

    }

    ad_proc -public remove_self_from_page { 
	  portal_id 
	  community_id 
    } {
	Removes a dotlrn PE from the given page 
    
	@param page_id The page to remove self from
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

    ad_proc -public make_self_available { 
 	page_id 
    } {
 	Wrapper for the portal:: proc
 	
 	@param page_id
 	@author arjun@openforce.net
 	@creation-date Nov 2001
    } {
 	portal::make_datasource_available \
 		$page_id [portal::get_datasource_id [my_name]]
    }

    ad_proc -public make_self_unavailable { 
	page_id 
    } {
	Wrapper for the portal:: proc
	
	@param page_id
	@author arjun@openforce.net
	@creation-date Nov 2001
    } {
	portal::make_datasource_unavailable \
		$page_id [portal::get_datasource_id [my_name]]
    }
}

 


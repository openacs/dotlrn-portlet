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
	set element_id [portal::add_element $page_id [my_name]]
	
	# The default param must be configured
	set key "community_id"
	set value [portal::get_element_param $element_id $key]

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
		
	# for now query the DM directly
	if { [db_0or1row select_comminity_info $query] } {
	    set data "$pretty_name - <i>$description</i>"
	} else {
	    set data "Community info not found. Contact webmaster, please!"
	}

	ns_log notice "AKS-dotlrn-portlet got here $data"
	
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
	# Find out the element_id that corresponds to this 
	# community_id/portal_id pair
	if { [db0or1row get_element_id "
	select pem.element_id as element_id
	from portal_element_parameters pep, portal_element_map pem
	where pem.portal_id = $portal_id and
	pep.element_id = pem.element_id and
	pep.key = 'community_id' and
	pep.value = $community_id"]  } {
	     
	    # delete the params
	    # delete the element from the map

	} else {
	    ad_return_complaint 1 "dotlrn_portlet::remove_self_from_page: Invalid portal_id and/or community_id given."
	    ad_script_abort
	}

	# this call removes the PEs params too
	set element_id [portal::remove_element {$portal_id $element_id}]
    }
}

 


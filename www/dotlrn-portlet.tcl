# www/dotlrn-portlet.tcl
ad_page_contract {
    The display logic for the dotrn (Group Info)  portlet

    @author Arjun Sanyal (arjun@openforce.net)
    @cvs_id $Id$
} -properties {
    
}

array set config $cf	
set community_id $config(community_id)

set pretty_name [dotlrn_community::get_community_name $community_id]
set subcomm_pretty_plural   [ad_parameter subcommunities_pretty_plural dotlrn]
set description [dotlrn_community::get_community_description $community_id]
set has_subcomm_p \
        [dotlrn_community::has_subcommunity_p -community_id $community_id]

set subcomm_data \
        [dotlrn_community::get_subcomm_chunk -community_id $community_id]



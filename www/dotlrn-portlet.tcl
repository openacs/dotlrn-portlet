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
set description [dotlrn_community::get_community_description $community_id]

if {[dotlrn::user_can_read_private_data_p]} {
    set member_link "<p><a href=\"members\">List of Members</a>"
} else  {
    set member_link ""
}

set subcomm_list [dotlrn_community::get_subcomm_list -community_id $community_id]

if {[llength $subcomm_list] > 0} {

    set subcomm_data "Subcommunities: <P><ul>"
    
    foreach subcomm_id $subcomm_list {
        append subcomm_data \
                "<li><a href=[dotlrn_community::get_community_url $subcomm_id]>[dotlrn_community::get_community_name $subcomm_id]</li>"
    }

    append subcomm_data "</ul>"

} else {
    
    set subcomm_data ""
}


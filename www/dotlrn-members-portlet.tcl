ad_page_contract {
    The display logic for the dotrn members portlet

    @author Arjun Sanyal (arjun@openforce.net)
    @cvs_id $Id$
} -properties {
    
}

array set config $cf	
set community_id $config(community_id)

if {[dotlrn::user_can_read_private_data_p]} {
    set member_data "FIXME: here's where the list of members will go<p>role, first name, last name, email <P>
<a href=\"members\">List of Members</a>"
} else  {
    set member_data ""
}


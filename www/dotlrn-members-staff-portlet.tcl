ad_page_contract {
    The display logic for the dotrn "staff list" PE

    @author Arjun Sanyal (arjun@openforce.net)
    @cvs_id $Id$
} -properties {
    
}

array set config $cf	
set community_id $config(community_id)

set staff_data "FIXME: here's where the staff data will go: <P>
profs <P>
ta's<P>
ca's<P>
"

if {[dotlrn::user_can_read_private_data_p]} {
    set student_list_link "show student list<P>
    <p><a href=\"members\">List of Members</a>"
} else  {
    set student_list_link ""
}

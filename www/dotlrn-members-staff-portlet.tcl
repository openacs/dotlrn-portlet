# copied from dotlrn/www/members-chunk.tcl

ad_page_contract {
    @author yon (yon@milliped.com)
    @creation-date Jan 08, 2002
    @version $Id$
} -query {
} -properties {
    users:multirow
}

array set config $cf	

set user_id [ad_conn user_id]
set referer [ad_conn url]
set community_id [dotlrn_community::get_community_id]

set admin_p [dotlrn::user_can_admin_community_p -user_id $user_id $community_id]
set read_private_data_p [dotlrn::user_can_read_private_data_p $user_id]

# Get all users for this community, including role
set rel_types_list [dotlrn_community::get_allowed_rel_types -community_id $community_id]

foreach rel_type $rel_types_list {

    set rel_pn [dotlrn_community::get_role_pretty_name_from_rel_type \
                   -rel_type $rel_type]

    template::multirow create $rel_type rel_id rel_type user_id first_names last_name email member_link

    set list_of_users \
            [dotlrn_community::list_users_in_role \
              -rel_type $rel_type $community_id]

    foreach user $list_of_users {
        template::multirow append $rel_type \
                [lindex $user 0] \
                $rel_pn \
                [lindex $user 2] \
                [lindex $user 3] \
                [lindex $user 4] \
                [lindex $user 5] \
                [acs_community_member_link -user_id [lindex $user 2] -label "[lindex $user 3] [lindex $user 4]"]  
    }
}


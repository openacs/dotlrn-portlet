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
set  referer [ad_conn url]
set community_id [dotlrn_community::get_community_id]

set admin_p [dotlrn::user_can_admin_community_p -user_id $user_id $community_id]
set read_private_data_p [dotlrn::user_can_read_private_data_p $user_id]

# Get all users for this community, including role
template::util::list_of_ns_sets_to_multirow \
    -rows [dotlrn_community::list_users $community_id] \
    -var_name "users"

ad_return_template

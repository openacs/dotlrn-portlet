#  Copyright (C) 2001, 2002 MIT
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
set community_id $config(community_id)

set admin_p [dotlrn::user_can_admin_community_p -user_id $user_id -community_id $community_id]
set read_private_data_p [dotlrn::user_can_read_private_data_p -user_id $user_id -object_id $community_id]
set spam_p [dotlrn::user_can_spam_community_p -user_id [ad_get_user_id] -community_id $community_id]

# Get all users for this community, including role
template::util::list_of_ns_sets_to_multirow \
    -rows [dotlrn_community::list_users $community_id] \
    -var_name "users"

template::multirow foreach users { 
    set role [dotlrn_community::get_role_pretty_name -community_id $community_id -rel_type $rel_type]
}


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


# www/dotlrn-admin-portlet.tcl
ad_page_contract {
    The display logic for the dotlrn admin portlet. This shows the
    "Group Administration" section of the group admin page.

    @author Arjun Sanyal (arjun@openforce.net)
    @author Ben Adida (ben@openforce)
    @cvs_id $Id$
} -properties {
}

# get some basics
array set config $cf
set community_id $config(community_id)
set dotlrn_admin_p [dotlrn::admin_p]
set dotlrn_admin_url "[dotlrn::get_url]/admin"
set sub_pretty_name [ad_parameter subcommunities_pretty_name dotlrn]
set sub_pretty_plural [ad_parameter subcommunities_pretty_plural dotlrn]
set admin_pretty_name [ad_parameter dotlrn_admin_pretty_name dotlrn]

# get the community info
db_1row select_community_info {}

# get the subcomm info
set rows [dotlrn_community::get_subcomm_info_list -community_id $community_id]
template::util::list_of_ns_sets_to_multirow -rows $rows -var_name subgroups

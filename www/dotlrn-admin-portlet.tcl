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


# www/news-portlet.tcl
ad_page_contract {
    The display logic for the dotlrn admin portlet

    @author Arjun Sanyal (arjun@openforce.net)
    @author Ben Adida (ben@openforce)
    @cvs_id $Id$
} -properties {
    
}

array set config $cf	
set community_id $config(community_id)

set dotlrn_admin_p [dotlrn::admin_p]
set dotlrn_admin_url "[dotlrn::get_url]/admin"

db_1row select_community_info {}

db_multirow subgroups select_subgroups {}

# hack for now
set n_subgroups 0

# get the right pretty name, plural for subgroups
set sub_pretty_name [ad_parameter subcommunities_pretty_name dotlrn]
set sub_pretty_plural [ad_parameter subcommunities_pretty_plural dotlrn]


ad_return_template



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

# hack for now
set n_subgroups 0

ad_return_template

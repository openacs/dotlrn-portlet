ad_library {
    Automated tests for the dotlrn-portlet package.

    @author Héctor Romojaro <hector.romojaro@gmail.com>
    @creation-date 2020-08-19
    @cvs-id $Id$
}

aa_register_case -procs {
        dotlrn_admin_portlet::link
        dotlrn_portlet::link
        dotlrn_members_portlet::link
        dotlrn_members_staff_portlet::link
        dotlrn_members_staff_portlet::get_pretty_name
        dotlrn_members_portlet::get_pretty_name
        dotlrn_admin_portlet::get_pretty_name
        dotlrn_admin_portlet::my_package_key
    } -cats {
        api
        production_safe
    } dotlrn_portlet_links_names_keys {
        Test diverse link, name and key procs.
} {
    aa_equals "dotLRN admin portlet link"                   "[dotlrn_admin_portlet::link]" ""
    aa_equals "dotLRN portlet link"                         "[dotlrn_portlet::link]" ""
    aa_equals "dotLRN members portlet link"                 "[dotlrn_members_portlet::link]" ""
    aa_equals "dotLRN members staff portlet link"           "[dotlrn_members_staff_portlet::link]" ""
    aa_equals "dotLRN members staff portlet pretty name"    "[dotlrn_members_staff_portlet::get_pretty_name]" "#dotlrn-portlet.members_staff_portlet_pretty_name#"
    aa_equals "dotLRN portlet pretty name"                  "[dotlrn_members_portlet::get_pretty_name]" "#dotlrn-portlet.members_portlet_pretty_name#"
    aa_equals "dotLRN admin portlet pretty name"            "[dotlrn_admin_portlet::get_pretty_name]" "#dotlrn-portlet.admin_pretty_name#"
    aa_equals "dotLRN admin portlet package key"            "[dotlrn_admin_portlet::my_package_key]" "dotlrn-portlet"
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:

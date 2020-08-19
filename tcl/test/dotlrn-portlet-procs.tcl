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
    } -cats {
        api
        production_safe
    } dotlrn_portlet_links {
        Test diverse link procs.
} {
    aa_equals "dotLRN admin portlet link"           "[dotlrn_admin_portlet::link]" ""
    aa_equals "dotLRN portlet link"                 "[dotlrn_portlet::link]" ""
    aa_equals "dotLRN members portlet link"         "[dotlrn_members_portlet::link]" ""
    aa_equals "dotLRN members staff portlet link"   "[dotlrn_members_staff_portlet::link]" ""
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:

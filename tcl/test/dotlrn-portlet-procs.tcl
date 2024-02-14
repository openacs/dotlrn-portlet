ad_library {
    Automated tests for the dotlrn-portlet package.

    @author Héctor Romojaro <hector.romojaro@gmail.com>
    @creation-date 2020-08-19
    @cvs-id $Id$
}

aa_register_case -procs {
    dotlrn_admin_portlet::show
    dotlrn_admin_portlet::get_my_name
    dotlrn_members_portlet::show
    dotlrn_members_portlet::get_my_name
    dotlrn_members_staff_portlet::show
    dotlrn_members_staff_portlet::get_my_name
    dotlrn_portlet::show
    dotlrn_portlet::get_my_name
} -cats {
    api
    smoke
} dotlrn_render_portlet {
    Test the rendering of the portlets
} {
    #
    # We prefer a community with subcommunities so that we can test
    # the dotlrn_portlet properly, but we will take any when none is
    # available.
    #
    set community_id [db_string get_community {
        select c.community_id
          from dotlrn_communities c
               left join dotlrn_communities s
                 on s.parent_community_id = c.community_id
         order by s.community_id, c.community_id
        fetch first 1 rows only
    } -default ""]

    if {$community_id eq ""} {
        aa_log_result fail "No communities. This test cannot be performed."
        return
    }

    foreach shaded_p {true false} {

        set cf [list \
                    community_id $community_id \
                    shaded_p $shaded_p \
                   ]

        foreach portlet {
            dotlrn_admin_portlet dotlrn_members_portlet dotlrn_members_staff_portlet dotlrn_portlet
        } {
            set section_name $portlet
            if {$shaded_p} {
                append section_name " (shaded)"
            }
            aa_section $section_name

            set portlet [acs_sc::invoke \
                             -contract portal_datasource \
                             -operation Show \
                             -impl [${portlet}::get_my_name] \
                             -call_args [list $cf]]

            aa_log "Portlet returns: [ns_quotehtml $portlet]"

            aa_false "No error was returned" {
                [string first "Error in include template" $portlet] >= 0
            }

            aa_false "No unresolved message keys" {
                [string first "MESSAGE KEY MISSING: " $portlet] >= 0
            }

            aa_true "Portlet contains something" {
                [string length [string trim $portlet]] > 0
            }
        }
    }
}

aa_register_case -procs {
        dotlrn_admin_portlet::link
        dotlrn_portlet::link
        dotlrn_portlet::get_pretty_name
        dotlrn_members_portlet::link
        dotlrn_members_portlet::get_my_name
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
    aa_equals "dotLRN portlet pretty name"                  "[dotlrn_portlet::get_pretty_name]" "[dotlrn::parameter -name subcommunities_pretty_plural]"
    aa_equals "dotLRN members portlet pretty name"          "[dotlrn_members_portlet::get_pretty_name]" "#dotlrn-portlet.members_portlet_pretty_name#"
    aa_equals "dotLRN members portlet my_name"              "[dotlrn_members_portlet::get_my_name]" "dotlrn_members_portlet"
    aa_equals "dotLRN admin portlet pretty name"            "[dotlrn_admin_portlet::get_pretty_name]" "#dotlrn-portlet.admin_pretty_name#"
    aa_equals "dotLRN admin portlet package key"            "[dotlrn_admin_portlet::my_package_key]" "dotlrn-portlet"
}

aa_register_case -procs {
        dotlrn_portlet::add_self_to_page
        dotlrn_portlet::remove_self_from_page
        dotlrn_members_portlet::add_self_to_page
        dotlrn_members_portlet::remove_self_from_page
        dotlrn_members_staff_portlet::add_self_to_page
        dotlrn_members_staff_portlet::remove_self_from_page
        dotlrn_admin_portlet::add_self_to_page
        dotlrn_admin_portlet::remove_self_from_page
    } -cats {
        api
    } dotlrn_portlet_add_remove_from_page {
        Test add/remove portlet procs.
} {
    #
    # Helper proc to check portal elements
    #
    proc portlet_exists_p {portal_id portlet_name} {
        return [db_0or1row portlet_in_portal {
            select 1 from dual where exists (
              select 1
                from portal_element_map pem,
                     portal_pages pp
               where pp.portal_id = :portal_id
                 and pp.page_id = pem.page_id
                 and pem.name = :portlet_name
            )
        }]
    }
    #
    # Start the tests
    #
    aa_run_with_teardown -rollback -test_code {
        #
        # Create a community.
        #
        # As this is running in a transaction, it should be cleaned up
        # automatically.
        #
        set community_id [dotlrn_community::new -community_type dotlrn_community -pretty_name foo]
        if {$community_id ne ""} {
            aa_log "Community created: $community_id"
            set portal_id [dotlrn_community::get_admin_portal_id -community_id $community_id]
            set package_id [dotlrn::instantiate_and_mount $community_id [dotlrn_portlet::my_package_key]]
            #
            # dotlrn_portlet
            #
            set portlet_name [dotlrn_portlet::get_my_name]
            #
            # Add portlet.
            #
            dotlrn_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Remove portlet.
            #
            dotlrn_portlet::remove_self_from_page -portal_id $portal_id
            aa_false "Portlet is in community portal after removal" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Add portlet.
            #
            dotlrn_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # dotlrn_members_portlet
            #
            set portlet_name [dotlrn_members_portlet::get_my_name]
            #
            # Add portlet.
            #
            dotlrn_members_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Members portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Remove portlet.
            #
            dotlrn_members_portlet::remove_self_from_page -portal_id $portal_id
            aa_false "Members portlet is in community portal after removal" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Add portlet.
            #
            dotlrn_members_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Members portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # dotlrn_members_staff_portlet
            #
            set portlet_name [dotlrn_members_staff_portlet::get_my_name]
            #
            # Add portlet.
            #
            dotlrn_members_staff_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Members staff portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Remove portlet.
            #
            dotlrn_members_staff_portlet::remove_self_from_page -portal_id $portal_id
            aa_false "Members staff portlet is in community portal after removal" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Add portlet.
            #
            dotlrn_members_staff_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Members staff portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # admin_portlet
            #
            set portlet_name [dotlrn_admin_portlet::get_my_name]
            #
            # Add portlet.
            #
            dotlrn_admin_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Admin portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Remove portlet.
            #
            dotlrn_admin_portlet::remove_self_from_page -portal_id $portal_id
            aa_false "Admin portlet is in community portal after removal" "[portlet_exists_p $portal_id $portlet_name]"
            #
            # Add portlet.
            #
            dotlrn_admin_portlet::add_self_to_page -portal_id $portal_id -community_id $community_id
            aa_true "Admin portlet is in community portal after addition" "[portlet_exists_p $portal_id $portlet_name]"
        } else {
            aa_error "Community creation failed"
        }
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:

--
-- packages/dotlrn-portlet/sql/oracle/dotlrn-portlets-create.sql
--

-- Creates dotlrn admin datasource

-- Copyright (C) 2001 OpenForce, Inc.
-- @author Arjun Sanyal (arjun@openforce.net)
-- @author Ben Adida (ben@openforce.net)   
-- @creation-date 2002-01-19

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource.new(
    name             => 'dotlrn_admin_portlet',
    description      => 'Displays the dotlrn community admin info '
  );



  -- 4 defaults procs

  -- shadeable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shadeable_p',
	value => 'f'
);	

  -- shaded_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'shaded_p',
	value => 'f'
);	

  -- hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'hideable_p',
	value => 'f'
);	

  -- user_editable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'user_editable_p',
	value => 'f'
);	

  -- link_hideable_p 
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 't',
	key => 'link_hideable_p',
	value => 't'
);

  -- portlet-specific procs

  -- community_id must be configured!
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 'f',
	key => 'community_id',
	value => ''
);	

end;
/
show errors

declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl.new (
		'portal_datasource',
		'dotlrn_admin_portlet',
		'dotlrn_admin_portlet'
	);

end;
/
show errors

declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'MyName',
	       'dotlrn_admin_portlet::my_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'GetPrettyName',
	       'dotlrn_admin_portlet::get_pretty_name',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'Link',
	       'dotlrn_admin_portlet::link',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'AddSelfToPage',
	       'dotlrn_admin_portlet::add_self_to_page',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'Show',
	       'dotlrn_admin_portlet::show',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'Edit',
	       'dotlrn_admin_portlet::edit',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'RemoveSelfFromPage',
	       'dotlrn_admin_portlet::remove_self_from_page',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'MakeSelfAvailable',
	       'dotlrn_admin_portlet::make_self_available',
	       'TCL'
	);

	foo := acs_sc_impl.new_alias (
	       'portal_datasource',
	       'dotlrn_admin_portlet',
	       'MakeSelfUnavailable',
	       'dotlrn_admin_portlet::make_self_unavailable',
	       'TCL'
	);

end;
/
show errors

declare
	foo integer;
begin

	-- Add the binding
	acs_sc_binding.new (
	    contract_name => 'portal_datasource',
	    impl_name => 'dotlrn_admin_portlet'
	);
end;
/
show errors

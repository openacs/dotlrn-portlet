--
-- packages/bboard-portlet/sql/bboard-portlets-create.sql
--

-- Creates bboard datasources for portal portlets

-- Copyright (C) 2001 OpenForce, Inc.
-- @author Arjun Sanyal (arjun@openforce.net)
-- @creation-date 2001-30-09

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html

declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource.new(
    data_type        => 'tcl_proc',
    mime_type        => 'text/html',
    name             => 'bboard-portlet',
    description      => 'Displays the bboard for a given instance_id ',
    content	     => 'bboard_portlet::show',
    configurable_p   => 't'
  );

  -- Instance_id must be configured
  portal_datasource.set_def_param (
	datasource_id => ds_id,
	config_required_p => 't',
	configured_p => 'f',
	key => 'instance_id',
	value => ''
);	

end;
/
show errors


<%

    #
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

%>

<!-- aks: shading is broken for this portlet -->

<%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_instructor_rel] %>:
  <ul>
  <if @n_profs@ gt 0>
    <multiple name="users">
      <if @users.rel_type@ eq "dotlrn_instructor_rel">
      <li>     
        <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
        <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
          (<a href="mailto:@users.email@">@users.email@</a>)
        </if>
      </if>
    </multiple>
  </if>
  <else>
    <li><small>No <%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_instructor_rel] %></small>
  </else>
  </ul>

<p>

<%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_ta_rel] %>:
  <ul>
  <if @n_tas@ gt 0>
    <multiple name="users">
      <if @users.rel_type@ eq "dotlrn_ta_rel">
      <li>     
        <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
        <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
          (<a href="mailto:@users.email@">@users.email@</a>)
        </if>
      </if>
    </multiple>
  </if>
  <else>
    <li><small>No <%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_ta_rel] %></small>
  </else>
  </ul>

<p>

<%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_ca_rel] %>:
  <ul>
  <if @n_cas@ gt 0>
    <multiple name="users">
      <if @users.rel_type@ eq "dotlrn_ca_rel">
      <li>     
        <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
        <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
          (<a href="mailto:@users.email@">@users.email@</a>)
        </if>
      </if>
    </multiple>
  </if>
  <else>
    <li><small>No <%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_ca_rel] %></small>
  </else>
  </ul>

<if @read_private_data_p@>
<br>
<a href="members"><%= [dotlrn_community::get_role_pretty_plural -community_id $community_id -rel_type dotlrn_student_rel] %> List</a>
</if>

<%

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

%>


<ul>

  <if @dotlrn_admin_p@ eq 1>
    <li><a href="@dotlrn_admin_url@">dotLRN Administration</a>
  </if>

  <li>
    <a href="one-community-portal-template">Customize This Portal</a>
  </li>

  <li>
    Membership
    <ul>
      <li><a href="members">Manage Membership</a> - Add/Remove @pretty_name@ members</li>
      <li>
        Change Enrollment Policy
        - <if @join_policy@ eq "closed">closed</if><else><a href="join-policy-toggle?policy=closed">closed</a></else>
        | <if @join_policy@ eq "open">open</if><else><a href="join-policy-toggle?policy=open">open</a></else>
        | <if @join_policy@ eq "needs approval">wait</if><else><a href="join-policy-toggle?policy=needs%20approval">wait</a></else>
      </li>
      <li>
        <a href="user-add?type=student&access_level=limited&read_private_data_p=t">Add a Limited Access user to this community</a>
        - This allows you to register new users and give them access to just this community.
      </li>
      <li>
        <a href="user-add?type=student&access_level=limited&read_private_data_p=f">Add a Limited Access Guest user to this community</a>
        - This allows you to register new non-MIT users and give them access to just this community.
        Information about students who are part of this community will not be available to this user.
      </li>
    </ul>
  </li>

  <li>@sub_pretty_plural@
    <ul>
      <multiple name="subgroups">
        <li><a href=@subgroups.url@>@subgroups.pretty_name@</a><small>
            [<a href=@subgroups.url@one-community-admin>Admin</a> |
            <a href=subcommunity-delete>Delete</a>]</small>
      </multiple>
      <li><a href=subcommunity-new>New @sub_pretty_name@</a></ul>
  </li>
  
  <li><a href="applets">Manage Applets</a></li>

</ul>


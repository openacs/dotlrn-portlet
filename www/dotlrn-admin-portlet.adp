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
  <li><a href="@dotlrn_admin_url@">@admin_pretty_name@</a></li>
  <li><a href="clone">Copy this group</a></li>
  <if @archived_p@ eq t>
  <li><a href="@dotlrn_admin_url@/archived-communities"><font color=red>This group is archived</font></a>
  </if>
  <else>
    <li><a href="subcommunity-archive">Archive this group</a></li>
  </else>
  <br>
</if>

  <li><a href="community-edit">Edit properties</a></li>
  <br>

  <li><a href="one-community-portal-configure">Customize layout</a></li>
  <br>

  <li>
    Membership
    <ul>
      <li><a href="members">Manage Membership</a> - Add/Remove @pretty_name@ members</li>
      <li>
        Change Enrollment Policy -
          <if @join_policy@ eq "open">Open</if><else><a href="join-policy-toggle?policy=open">Open</a></else>
        | <if @join_policy@ eq "closed">Closed</if><else><a href="join-policy-toggle?policy=closed">Closed</a></else>
        |&nbsp;<if @join_policy@ eq "needs approval">Needs&nbsp;Approval</if><else><a href="join-policy-toggle?policy=needs%20approval">Needs&nbsp;Approval</a></else>
      </li>
      <li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=t">Add a Limited Access user to this community</a>
        - This allows you to register new users and give them access to just this community.
      </li>
      <li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=f">Add a Limited Access Guest user to this community</a>
        - This allows you to register new non-MIT users and give them access to just this community.
        Information about students who are part of this community will not be available to this user.
      </li>
    </ul>
  </li>
  <br>

  <li>@sub_pretty_plural@
    <ul>
<multiple name="subgroups">
      <li>
        <a href="@subgroups.url@">@subgroups.pretty_name@</a>
        <nobr><small>[
          <a href="@subgroups.url@one-community-admin">Administer</a>
          |
          <a href="subcommunity-archive?community_id=@subgroups.community_id@">Archive</a>
        ]</small></nobr>
      </li>
</multiple>
      <br>
      <li><a href="subcommunity-new">New @sub_pretty_name@</a>
    </ul>
  </li>
  <br>
  
  <li><a href="applets">Manage Applets</a></li>

</ul>

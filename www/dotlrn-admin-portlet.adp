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
     <li><a href="members">Manage Membership</a> - Add/Remove @pretty_name@ members</li>

      <li>
        Change Enrollment Policy -
          <if @join_policy@ eq "open">Open</if><else><a href="join-policy-toggle?policy=open">Open</a></else>
        | <if @join_policy@ eq "closed">Closed</if><else><a href="join-policy-toggle?policy=closed">Closed</a></else>
        |&nbsp;<if @join_policy@ eq "needs approval">Needs&nbsp;Approval</if><else><a href="join-policy-toggle?policy=needs%20approval">Needs&nbsp;Approval</a></else>
      </li>
<p>
  <li><a href="one-community-portal-configure">Customize Portal Layout</a></li>
      <li>
        Change Bulk Mail Policy -
          <if @members_can_spam_p@ true>All members</if><else><a href="spam-policy-toggle?policy=all">All members</a></else>
          | <if @members_can_spam_p@ false>Only admins</if><else><a href="spam-policy-toggle?policy=admins">Only admins</a></else>
          can send bulk mail to this community.
      </li>
  <li><a href="community-edit">Edit Group Properties</a> - Change name, description, etc.</li>

<if @subcommunity_p@ eq 0>
<p>
<if @club_p@ eq 0>
<li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=t">Create a new Limited Access user</a> - Only use this to create an account for cross-registered students who do not have accounts from a previous class.
</if>
<li>        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=f">Create a new Limited Access Guest user</a>
        - Only use this to create accounts for non-affiliated users who do not already have an account.
        Information about other members of this community will not be available to this user.
</li>
</ul>
</if>
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

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
  <li><a href="clone">#dotlrn-portlet.Copy_this_group#</a></li>
  <if @archived_p@ eq t>
  <li><a href="@dotlrn_admin_url@/archived-communities"><font color=red>#dotlrn-portlet.lt_This_group_is_archive#</font></a>
  </if>
  <else>
    <li><a href="subcommunity-archive">#dotlrn-portlet.Archive_this_group#</a></li>
  </else>
  <br>
</if>

  <li><a href="community-edit">#dotlrn-portlet.Edit_properties#</a></li>
  <br>

  <li><a href="one-community-portal-configure">#dotlrn-portlet.Customize_layout#</a></li>
  <br>

  <li>
    #dotlrn-portlet.Membership#
    <ul>
      <li><a href="members">#dotlrn-portlet.Manage_Membership#</a> - #dotlrn-portlet.lt_-_AddRemove_pretty_na#</li>
      <li>
        #dotlrn-portlet.lt_Change_Enrollment_Pol# -
          <if @join_policy@ eq "open">#dotlrn-portlet.Open#</if><else><a href="join-policy-toggle?policy=open">#dotlrn-portlet.Open#</a></else>
        | <if @join_policy@ eq "closed">#dotlrn-portlet.Closed#</if><else><a href="join-policy-toggle?policy=closed">#dotlrn-portlet.Closed#</a></else>
        |&nbsp;<if @join_policy@ eq "needs approval">#dotlrn-portlet.Needs_Approval#</if><else><a href="join-policy-toggle?policy=needs%20approval">#dotlrn-portlet.Needs_Approval#</a></else>
      </li>
      <li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=t">#dotlrn-portlet.lt_Add_a_Limited_Access_#</a>
        - #dotlrn-portlet.lt_-_This_allows_you_to_#
      </li>
      <li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=f">#dotlrn-portlet.lt_Add_a_Limited_Access__1#</a>
        - #dotlrn-portlet.lt_-_This_allows_you_to__1#
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
          <a href="@subgroups.url@one-community-admin">#dotlrn-portlet.Administer#</a>
          |
          <a href="subcommunity-archive?community_id=@subgroups.community_id@">#dotlrn-portlet.Archive#</a>
        ]</small></nobr>
      </li>
</multiple>
      <br>
      <li><a href="subcommunity-new">#dotlrn-portlet.New_sub_pretty_name#</a>
    </ul>
  </li>
  <br>
  
  <li><a href="applets">#dotlrn-portlet.Manage_Applets#</a></li>

</ul>

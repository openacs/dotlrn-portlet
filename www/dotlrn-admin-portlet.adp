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
     <li><a href="members">#dotlrn-portlet.Manage_Membership#</a> - #dotlrn-portlet.lt_AddRemove_pretty_name#</li>

      <li>
        #dotlrn-portlet.lt_Change_Enrollment_Pol# -
          <if @join_policy@ eq "open"><b>#dotlrn-portlet.Open#</b></if><else><a href="join-policy-toggle?policy=open">#dotlrn-portlet.Open#</a></else>
        | <if @join_policy@ eq "closed"><b>#dotlrn-portlet.Closed#</b></if><else><a href="join-policy-toggle?policy=closed">#dotlrn-portlet.Closed#</a></else>
        |&nbsp;<if @join_policy@ eq "needs approval"><b>#dotlrn-portlet.Needs_Approval#</b></if><else><a href="join-policy-toggle?policy=needs%20approval">#dotlrn-portlet.Needs_Approval#</a></else>
      </li>
<p>
  <li><a href="one-community-portal-configure">#dotlrn-portlet.lt_Customize_Portal_Layo#</a></li>
      <li>
        #dotlrn-portlet.lt_Change_Bulk_Mail_Poli# -
          <if @members_can_spam_p@ true><b>#dotlrn-portlet.All_members#</b></if><else><a href="spam-policy-toggle?policy=all">#dotlrn-portlet.All_members#</a></else>
          | <if @members_can_spam_p@ false><b>#dotlrn-portlet.Only_admins#</b></if><else><a href="spam-policy-toggle?policy=admins">#dotlrn-portlet.Only_admins#</a></else>
          #dotlrn-portlet.lt_can_send_bulk_mail_to#
      </li>
  <li><a href="community-edit">Edit Group Properties</a> - Change name, description, etc.</li>

<if @subcommunity_p@ eq 0>
<p>
<if @club_p@ eq 0>
<li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=t">#dotlrn-portlet.lt_Create_a_new_Limited_#</a> - #dotlrn-portlet.lt_Only_use_this_to_crea#
</if>
<li>        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=f">#dotlrn-portlet.lt_Create_a_new_Limited__1#</a>
        - #dotlrn-portlet.lt_Only_use_this_to_crea_1#
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

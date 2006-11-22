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

<if @dotlrn_admin_p@ eq 1>
<ul>
  <li><a href="@dotlrn_admin_url@" title="#dotlrn-portlet.goto_admin_pretty_name#">@admin_pretty_name@</a></li>
  <li><a href="dotlrn-group-admin-faq" title="#dotlrn-portlet.goto_Administrator_FAQ#">#dotlrn-portlet.Administrator_FAQ#</a></li>
  <li><a href="clone" title="#dotlrn-portlet.Copy_this_group#">#dotlrn-portlet.Copy_this_group#</a></li>
  <if @archived_p@ eq t>
  <li><a href="@dotlrn_admin_url@/archived-communities" title="#dotlrn-portlet.goto_archived_communities#"><font color=red>#dotlrn-portlet.lt_This_group_is_archive#</font></a></li>
  </if>
  <else>
    <li><a href="subcommunity-archive" title="#dotlrn-portlet.Archive_this_group#">#dotlrn-portlet.Archive_this_group#</a></li>
  </else>
   <if @club_p@ eq 0>
     <li><a href="class-term-change?pretty_name=@pretty_name;noquote@" title="#dotlrn-portlet.Change_term_of_pretty_name#">#dotlrn-portlet.Change_term#</a></li>
   </if>
   <li>
    #dotlrn-portlet.lt_Guests_Can_View_Membership_Info# -
      <if @guests_can_view_private_data_p@><b>#acs-kernel.common_yes#</b>&nbsp;|&nbsp;<a href="privacy-policy-toggle?policy=no" title="#dotlrn-portlet.Toggle_privacy_policy_to_no#">#acs-kernel.common_no#</a></if><else><a href="privacy-policy-toggle?policy=yes" title="#dotlrn-portlet.Toggle_privacy_policy_to_yes#">#acs-kernel.common_Yes#</a>&nbsp;|&nbsp;<b>#acs-kernel.common_no#</b></else>
  </li>
</ul>
</if>

<ul>
<if @manage_membership_p@ eq 1 or @dotlrn_admin_p@ eq 1 >
     <li><a href="members" title="#dotlrn-portlet.goto_Manage_Membership#">#dotlrn-portlet.Manage_Membership#</a> - #dotlrn-portlet.lt_AddRemove_pretty_name#</li>
     <if @member_email_enabled_p@ defined>
       <li><a href="member-email" title="#dotlrn-portlet.Edit_Welcome_Message#">#dotlrn-portlet.Edit_Welcome_Message#</a>
       - <if @member_email_enabled_p@ eq "t"><b>#acs-subsite.Enabled#</b></if>
         <else><a href="member-email-toggle" title="#dotlrn-portlet.enable_welcome_message#">#acs-subsite.Enabled#</a></else> |
         <if @member_email_enabled_p@ ne "t"><b>#acs-subsite.Disabled#</b></if>
         <else><a href="member-email-toggle" title="#dotlrn-portlet.disable_welcome_message#">#acs-subsite.Disabled#</a></else>
     </if>
     <else>
       <li><a href="member-email" title="#dotlrn-portlet.lt_Create_Welcome_Messag#">#dotlrn-portlet.lt_Create_Welcome_Messag#</a>
     </else></li>
</if>

<if @enrollment_policy_p@ eq 1 or @dotlrn_admin_p@ eq 1 >
      <li>
        #dotlrn-portlet.lt_Change_Enrollment_Pol# -
          <if @join_policy@ eq "open"><b>#dotlrn-portlet.Open#</b></if><else><a href="join-policy-toggle?policy=open">#dotlrn-portlet.Open#</a></else>
        | <if @join_policy@ eq "closed"><b>#dotlrn-portlet.Closed#</b></if><else><a href="join-policy-toggle?policy=closed">#dotlrn-portlet.Closed#</a></else>
        |&nbsp;<if @join_policy@ eq "needs approval"><b>#dotlrn-portlet.Needs_Approval#</b></if><else><a href="join-policy-toggle?policy=needs%20approval">#dotlrn-portlet.Needs_Approval#</a></else>
      </li>
</if>
</ul>

<ul>
<if @customize_portal_layout_p@ eq 1 or @dotlrn_admin_p@ eq 1 >
  <li><a href="one-community-portal-configure">#dotlrn-portlet.lt_Customize_Portal_Layo#</a></li>
  <li><a href="element-list">#dotlrn-portlet.lt_Change_Name_Portlet#</a></li>
</if>
 <li><a href="change-site-template?referer=@referer@">#dotlrn.Customize_Template#</a></li>
      <li>
        #dotlrn-portlet.lt_Change_Bulk_Mail_Poli# -
          <if @members_can_spam_p@ true><b>#dotlrn-portlet.All_members#</b></if><else><a href="spam-policy-toggle?policy=all">#dotlrn-portlet.All_members#</a></else>
          | <if @members_can_spam_p@ false><b>#dotlrn-portlet.Only_admins#</b></if><else><a href="spam-policy-toggle?policy=admins">#dotlrn-portlet.Only_admins#</a></else>
          #dotlrn-portlet.lt_can_send_bulk_mail_to#
      </li>
  <li><a href="community-edit">#dotlrn-portlet.edit_gr_props#</a> - #dotlrn-portlet.change_name_etc#</li>
</ul>

<if @subcommunity_p@ eq 0>
<ul>

  <if @club_p@ eq 0>
    <if @create_limited_user_p@ eq 1 or @dotlrn_admin_p@ eq 1 >
      <li>
        <a href="user-add?type=student&can_browse_p=0&read_private_data_p=t">#dotlrn-portlet.lt_Create_a_new_Limited_#</a> - #dotlrn-portlet.lt_Only_use_this_to_crea# </li>
      </if>
   </if>


   <if @create_guest_user_p@ eq 1 or @dotlrn_admin_p@ eq 1 >
      <li><a href="user-add?type=student&can_browse_p=0&read_private_data_p=f">#dotlrn-portlet.lt_Create_a_new_Limited__1#</a>
        - #dotlrn-portlet.lt_Only_use_this_to_crea_1#
     </li>
   </if>
</ul>
</if>

<ul>

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
	<li><p><a href="subcommunity-new">#dotlrn-portlet.New_sub_pretty_name#</a></p></li>
      </ul>
  </li>
  </ul>

<if @manage_applets_p@ eq 1 or @dotlrn_admin_p@ eq 1 >
<ul>
  <li><a href="applets">#dotlrn-portlet.Manage_Applets#</a></li>
</ul>
</if>

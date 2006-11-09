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


<if @config.shaded_p@ ne "t">
<if @read_private_data_p@ eq 1>

<table class="table-display" cellpadding=3 cellspacing=0 summary="#dotlrn-portlet.members_portlet_pretty_name#">
<caption>#dotlrn-portlet.members_portlet_pretty_name#</caption>
  <tr class="table-header">
	<th id="bio"></th>
    <th id="name">#dotlrn.Name#</th>
	<th id="email">#dotlrn.Email_1#</th>
	<th id="role">#dotlrn.Role#</th>
  </tr>

  <multiple name="users">
  <group column="role">
  <if @users.rownum@ odd>
  <tr class="odd">
  </if>
  <else>
  <tr class="even">
  </else>

    <td headers="bio">
      <if @users.portrait_p@ true or @users.bio_p@ true>
        <a href="@users.community_member_url@"><img src="/resources/acs-subsite/profile-16.png" height="16" width="16" alt="#acs-subsite.Profile#" title="#acs-subsite.lt_User_has_portrait_title#" border="0"></a>
      </if>
    </td>
    <td headers="name">
      <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
    </td>
    <td headers="email">
      @users.email;noquote@
    </td>
    <td headers="role">
	<i>@users.role@</i>
    </td>
  </tr>
  </group>
  </multiple>
</table>

<if @spam_p@ true or @admin_p@ eq 1>
<p>
<ul>
<if @spam_p@ true>
  <li><a href="spam-recipients?community_id=@community_id@&referer=@referer@">#dotlrn-portlet.Email_Members#</a></li>
</if>
<if @admin_p@ eq 1>
      <li><a href="members">#dotlrn-portlet.Sortmanage#</a></li>
</if>
</ul>
</p>
</if>
</if>
<else>
        <% # The user is not allowed to read the member list - he/she is maybe a guest %>
	#dotlrn-portlet.lt_Sorry_this_functional#
</else>
</if>
<else>
   <% # The portal is shaded - should not be displayed %>
   <br>
</else>

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

<table class="table-display" cellpadding=3 cellspacing=0>
  <tr class="table-header">
    <td align=right colspan=4>
      <a href="members"><if @admin_p@ ne 1>#dotlrn-portlet.Sort#</if><else>#dotlrn-portlet.Sortmanage#</else></a>
    </td>
  </tr>

  <multiple name="users">
  <group column="role">
  <if @users.rownum@ odd>
  <tr class="odd">
  </if>
  <else>
  <tr class="even">
  </else>

    <td>
      <if @users.portrait_p@ true or @users.bio_p@ true>
        <a href="@users.community_member_url@"><img src="/resources/acs-subsite/profile-16.png" height="16" width="16" alt="#acs-subsite.Profile#" title="#acs-subsite.lt_User_has_portrait_title#" border="0"></a>
      </if>
    </td>
    <td>
      <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
    </td>
    <td>
      <a href="mailto:@users.email@">@users.email@</a>
    </td>
    <td>
	<i>@users.role@</i>
    </td>
  </tr>
  </group>
  </multiple>
</table>

<if @spam_p@ true>
<p>
<ul>
  <li><a href="spam?community_id=@community_id@&referer=@referer@">#dotlrn-portlet.Email_Members#</a></li>
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

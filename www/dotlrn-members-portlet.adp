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
<tr class="table-header"><td align=right colspan=3>
<a href="members">Sort
<if @admin_p@ eq 1>
/manage
</if>
</a>
</td></tr>
<multiple name="users">
<group column="role">
<if @users.rownum@ odd>
<tr class="odd">
</if>
<else>
<tr class="even">
</else>

<td>
      <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
</td><td>    
      <a href="mailto:@users.email@">@users.email@</a>
</td><td>
	<i>@users.role@</i>
</td></tr>
  </group>


</multiple>
</table>
<if @spam_p@ true>
<ul>
<li>        <a href="spam?community_id=@community_id@&referer=@referer@">Email Members</a>
</ul>
</if>

</if>
<else>
	Sorry, this functionality is not available to guests
</else>
</if>
<else>
<br>
</else>

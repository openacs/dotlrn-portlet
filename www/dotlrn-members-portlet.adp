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

<if @config.shaded_p@ ne "t">

<ul>

<multiple name="users">

  <li>
    <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
    
    <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
      (<a href="mailto:@users.email@">@users.email@</a>)
    </if>
      <i>@users.role@</i>

    <if @admin_p@ eq 1>
      <small>[<a href="deregister?user_id=@users.user_id@&amp;referer=members">deregister</a>]</small>
    </if>
    <else>
      <if @user_id@ eq @users.user_id@>
        <small>[<a href="deregister?">deregister</a>]</small>
      </if>
    </else>

</multiple>

</ul>

<if @admin_p@ eq 1>
   <form method="get" action="member-add">
      Add A Member: <input type="text" name="search_text"><input type="submit" value="search">
      <input type="hidden" name="referer" value="@referer@">
    </form>
</if>


</if>
<else>
  <br>
</else>

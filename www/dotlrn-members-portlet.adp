<if @config.shaded_p@ ne "t">
<br>
<ul>
<multiple name="users">
  <li>
    <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
<if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
    (<a href="mailto:@users.email@">@users.email@</a>)
</if>
    , <i>@users.rel_type@</i>
<if @admin_p@ eq 1 or @user_id@ eq @users.user_id@>
    &nbsp; (FIXME deregister link) </li>

    <!-- include src="deregister-link" url="deregister?user_id=@users.user_id@&referer=@referer@" label="Drop Membership" -->
</if>
</multiple>
<if @admin_p@ eq 1>
   <form method="get" action="member-add">
      Add A Member: <input type="text" name="search_text"><input type="submit" value="search">
      <input type="hidden" name="referer" value="@referer@">
    </form>
</if>
</ul>



</if>
<else>
  <br>
</else>

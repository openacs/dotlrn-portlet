<if @config.shaded_p@ ne "t">

<ul>

<multiple name="users">

  <li>
    <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
    
    <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
      (<a href="mailto:@users.email@">@users.email@</a>)
    </if>
      <i><%= [dotlrn_community::get_role_pretty_name_from_rel_type -rel_type $users(rel_type)] %></i>

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

<!-- aks: shading is broken for this portlet -->

Professors:
  <ul>
  <if @n_profs@ gt 0>
    <multiple name="users">
      <if @users.rel_type@ eq "dotlrn_instructor_rel">
      <li>     
        <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
        <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
          (<a href="mailto:@users.email@">@users.email@</a>)
        </if>
      </if>
    </multiple>
  </if>
  <else>
    <li><small>No Professors</small>
  </else>
  </ul>

<p>

Teaching Assistants:
  <ul>
  <if @n_tas@ gt 0>
    <multiple name="users">
      <if @users.rel_type@ eq "dotlrn_ta_rel">
      <li>     
        <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
        <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
          (<a href="mailto:@users.email@">@users.email@</a>)
        </if>
      </if>
    </multiple>
  </if>
  <else>
    <li><small>No Teaching Assistants</small>
  </else>
  </ul>

<p>

Course Assistants:
  <ul>
  <if @n_cas@ gt 0>
    <multiple name="users">
      <if @users.rel_type@ eq "dotlrn_ca_rel">
      <li>     
        <%= [acs_community_member_link -user_id $users(user_id) -label "$users(first_names) $users(last_name)"] %>
        <if @read_private_data_p@ eq 1 or @user_id@ eq @users.user_id@>
          (<a href="mailto:@users.email@">@users.email@</a>)
        </if>
      </if>
    </multiple>
  </if>
  <else>
    <li><small>No Course Assistants</small>
  </else>
  </ul>

<br>

<a href=members>Student List</a>


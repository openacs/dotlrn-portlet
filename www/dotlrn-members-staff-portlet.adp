<if @config.shaded_p@ ne "t">
<br>

Professors:
<ul>
  <if @dotlrn_instructor_rel:rowcount@ gt 0>
  <multiple name="dotlrn_instructor_rel">
    <li>
       @dotlrn_instructor_rel.member_link@
       <if @read_private_data_p@ eq 1 or @user_id@ eq @dotlrn_instructor_rel.user_id@>
         (<a href="mailto:@dotlrn_instructor_rel.email@">@dotlrn_instructor_rel.email@</a>)
       </if>
    </li>
  </multiple>
  </if>
  <else>
    <small>No Professors</small>
  </else>
</ul>

<P>

Teaching Assistants:
<ul>
  <if @dotlrn_ta_rel:rowcount@ gt 0>
  <multiple name="dotlrn_ta_rel">
    <li>
      <%= [acs_community_member_link \
         -user_id $dotlrn_ta_rel(user_id) \
         -label "$dotlrn_ta_rel(first_names) \
          $dotlrn_ta_rel(last_name)"] \
       %>
       <if @read_private_data_p@ eq 1 or @user_id@ eq @dotlrn_ta_rel.user_id@>
         (<a href="mailto:@dotlrn_ta_rel.email@">@dotlrn_ta_rel.email@</a>)
       </if>
    </li>
  </multiple>
  </if>
  <else>
    <small>No Teaching Assistants</small>
  </else>
</ul>

Course Assistants:
<ul>
  <if @dotlrn_ca_rel:rowcount@ gt 0>
  <multiple name="dotlrn_ca_rel">
    <li>
      <%= [acs_community_member_link \
         -user_id $dotlrn_ca_rel(user_id) \
         -label "$dotlrn_ca_rel(first_names) \
          $dotlrn_ca_rel(last_name)"] \
       %>
       <if @read_private_data_p@ eq 1 or @user_id@ eq @dotlrn_ca_rel.user_id@>
         (<a href="mailto:@dotlrn_ca_rel.email@">@dotlrn_ca_rel.email@</a>)
       </if>
    </li>
  </multiple>
  </if>
  <else>
    <small>No Course Assistants</small>
  </else>
</ul>


<br>

FIXME: student list link 

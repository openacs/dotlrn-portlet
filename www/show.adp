AKS28: instance_id is @instance_id@
  <if @messages:rowcount@ eq 0>
  <i>There are no messages available.</i><p>
  </if>
  <else>
  <table>
  <multiple name=messages>
   <tr>
    <td><a href="">@messages.title@</a></td>
     <td>@messages.full_name@</td> 
     <td><%= [expr @messages.num_replies@-1] %></td>
     <if @sent_date_p@ not nil and @sent_date_p@ ne 0>
     <td>@messages.sent_date@</td>
     </if>	
   </tr>
  </multiple>
  </table>
  </else>
</else>


<if @config.shaded_p@ ne "t">

  @pretty_name@ - <i>@description@</i>

  <if @has_subcomm_p@ eq 1>

    <P>

    @subcomm_pretty_plural@: <P>
  
    <ul>

    @subcomm_data@
  
    </ul>
  </if>
</if>
<else>
  <br>
</else>

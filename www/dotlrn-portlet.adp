<if @config.shaded_p@ ne "t">

  <if @has_subcomm_p@ eq 1>

    <P>

    @subcomm_pretty_plural@: <P>
  
    <ul>

    @subcomm_data@
  
    </ul>
  </if>
  <else>
    <small>No @subcomm_pretty_plural@</small>
  </else>

</if>
<else>
  <br>
</else>

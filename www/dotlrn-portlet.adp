<if @config.shaded_p@ ne "t">

  <if @has_subcomm_p@ eq 1>

    <ul>

      <li>@subcomm_pretty_plural@:
  
      <ul>

        @subcomm_data@
  
      </ul>

    </ul>

  </if>
  <else>
    <small>No @subcomm_pretty_plural@</small>
  </else>

</if>
<else>
  <br>
</else>

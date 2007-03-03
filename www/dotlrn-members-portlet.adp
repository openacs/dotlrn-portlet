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
<listtemplate name="users"></listtemplate>
<if @spam_p@ true or @admin_p@ eq 1>
<p>
<ul>
<if @spam_p@ true>
  <li><a href="spam-recipients?community_id=@community_id@&referer=@referer@" title="#dotlrn-portlet.Email_Members#">#dotlrn-portlet.Email_Members#</a></li>
</if>
<if @admin_p@ eq 1>
      <li><a href="members" title="#dotlrn-portlet.Sortmanage#">#dotlrn-portlet.Sortmanage#</a></li>
</if>
</ul>
</p>
</if>
</if>
<else>
        <% # The user is not allowed to read the member list - he/she is maybe a guest %>
	#dotlrn-portlet.lt_Sorry_this_functional#
</else>
</if>
<else>
   <% # The portal is shaded - should not be displayed %>
   <br>
</else>

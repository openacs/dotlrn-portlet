<?xml version="1.0"?>

<queryset>
  <fullquery name="select_community_info">
    <querytext>
      select community_type,
             pretty_name,
             description,
             portal_template_id,
             join_policy,
             admin_portal_id
      from dotlrn_communities,groups
      where community_id = :community_id
        and groups.group_id = community_id
    </querytext>
  </fullquery>

</queryset>

# /packages/portal-creator/www/datasources/bboard/summarize.tcl

ad_page_contract {
    Summarizes all bboard applications mounted directly below this node

    @author Arjun Sanyal (arjun@openforce.net)
    @creation-date Sept 2001
    @cvs-id $Id$
} {
    instance_id:integer,notnull
} -properties {}

#db_0or1row forum_info forum_info_select {
#    select short_name, moderated_p, bboard_id
#    from bboard_forums
#    where forum_id = :forum_id
#}
#
db_multirow messages messages_select {
#    select message_id, title, num_replies,
#    first_names||' '||last_name as full_name,
#    to_char(last_reply_date,'MM/DD/YY hh12:Mi am') as last_updated
#    from bboard_messages_all b, persons
#    where forum_id = :forum_id
#    and sent_date > decode(:last_n_days, 0, '1976-01-01', sysdate - :last_n_days)
#    and person_id = sender
#    and reply_to is null
#    order by sent_date desc
#
}
    
ad_return_template

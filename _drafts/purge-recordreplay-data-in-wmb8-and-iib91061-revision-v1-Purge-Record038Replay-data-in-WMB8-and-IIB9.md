---
id: 1070
title: 'Purge Record&#038;Replay data in WMB8 and IIB9'
date: 2013-08-12T08:57:53+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2013/08/12/1061-revision-v1/
permalink: /2013/08/12/1061-revision-v1/
---
If you have followed [my article on Record and Replay in WMB 8 (also applies to IIB 9)](http://www.ibm.com/developerworks/websphere/tutorials/1212_storey/), or perhaps you are already using Record and Replay in your Broker deployment, you &nbsp;may have wondered how to clear out the data which will build up over time when recording.

As there are no official tool or instructions for doing this, I thought I would take a moment to give some brief instructions on how you can achieve this yourself.

At the moment, in WMB 8 and IIB 9 only two tables are used to store recorded data: &#8220;**wmb_msgs**&#8221; stores each recorded message and some metadata, and &#8220;**wmb\_binary\_data**&#8221; is used if a message body or exception list was recorded. As the tables have no enforced referential integrity all we have to do when deleting data is remove it from the tables in the correct order. For example you could use the following commands to remove messages older than 15th November 2011

> <pre>DELETE FROM wmb_binary_data WHERE wmb_msgkey IN (SELECT wmb_msgs.wmb_msgkey FROM wmb_msgs WHERE event_timestamp &lt; '2011-11-15 14:54:35.121')
DELETE FROM wmb_msgs WHERE event_timestamp &lt; '2011-11-15 14:54:35.121'</pre>

As you will likely want a more complicated WHERE clause, and to check it carefully, you may want to create a sql instruction file, for example with the following content:

> <pre>-- connect to DB
CONNECT TO rrrdb
-- set an alternate schema if the default doesn't apply to you
-- SET SCHEMA WMB
-- now do our deletes
DELETE FROM wmb_binary_data WHERE wmb_msgkey IN (SELECT wmb_msgs.wmb_msgkey FROM wmb_msgs WHERE event_timestamp &lt; '2011-11-15 14:54:35.121')
DELETE FROM wmb_msgs WHERE event_timestamp &lt; '2011-11-15 14:54:35.121'</pre>

Save this in a file, and you can then edit it and check it carefully, then run it with `db2 -f purge.sql`

You will notice that we are using strings as our timestamps. This is actually correct, as they are stored as VARCHAR in the table as we couldn&#8217;t think of any reason to parse then and turn then into timestamp types in the database, so instead went for the slightly better performing option of a VARCHAR. This of course means you must format your dates in the full ISO standard, with YYYY-MM-DD, always using two digit months and days. 

You can also add your own additions to the where clause, just make sure you add it to both DELETE statements.

You don&#8217;t have to do this on a db2 command line of course, you could write your own script or application to run the database commands for you, and even add it to a cronjob if desired.

**N.B.** I have only tested this with db2, though I am pretty certain the same SQL should work in any other database supported by Record & Replay.

(Also posted on [the official IBM Integration Bus blog](https://www.ibm.com/developerworks/community/blogs/c7e1448b-9651-456c-9924-f78bec90d2c2/entry/purge_record_replay_data_in_wmb8_and_iib9?lang=en))
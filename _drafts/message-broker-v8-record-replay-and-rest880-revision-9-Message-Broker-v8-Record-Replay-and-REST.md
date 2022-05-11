---
id: 905
title: 'Message Broker v8: Record, Replay and REST'
date: 2012-01-06T09:06:59+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2012/01/06/880-revision-9/
permalink: /2012/01/06/880-revision-9/
---
IBM WebSphere Message Broker v8 was released in December last year &#8211; There is an [announcement](http://www-01.ibm.com/common/ssi/ShowDoc.jsp?docURL=/common/ssi/rep_ca/1/897/ENUS211-391/index.html&lang=en) and [comparison of versions](http://www-01.ibm.com/software/integration/messagebrokerproductline/versions/index.html) on the IBM website.

IBM WebSphere Message Broker introduced Record and Replay as part of its version 8 release. I thought I would just write a brief quickstart guide to getting running with record and replay, and in particular with working with the new REST interface which comes with it. There is actually a [Record and Replay specific PDF](ftp://public.dhe.ibm.com/software/integration/wbibrokers/docs/V8.0/Record_and_replay.pdf) available too, which contains all the details you might want for using Record and Replay (far more detail than I cover here). The main reason I am writing this, is it can be a little daunting trying to get Record and Replay going, as it does have a fair bit of configuration, and involves a few areas of a quite large product.

<!--more-->

### Setting up Recording

From your WMB install dir, run the db2 schema file to create the sample database for Record and Replay. Edit the file if you want to use a database name other than MB8RECORD, a specific schema or increase the storage size per message above 5mb.

> <pre>db2 -tvf ddl/db2/DataCaptureSchema.sql</pre>

Set the password for your database

> <pre>mqsisetdbparms MB8BROKER -n MBRECORD -u username -p password</pre>

Set the DataCaptureStore configurable service to set where to record to and which EG to do the recording (You can also do any of these configurable service steps via the Message Broker Explorer gui)

> <pre>mqsicreateconfigurableservice MB8BROKER -c DataCaptureStore -o MyCaptureStore \
   -n "dataSourceName,egForRecord" -v "MBRECORD,default"</pre>

Define where to record messages from. Use a wildcard to set all configurable services. Note that double quotes (&#8220;&#8221;) are required on unix, windows will want single quotes (&#8221;)

> <pre>mqsicreateconfigurableservice MB8BROKER -c DataCaptureSource -o MyCaptureSource \
   -n "dataCaptureStore,topic" -v "MyCaptureStore,$SYS/Broker/MB8BROKER/Monitoring/#"</pre>

Alternatively you can list the flows explicitly with topics like &#8220;_$SYS/Broker/MB8BROKER/Monitoring/ExecutionGroupName/FlowName_&#8221; While we are configuring everything, set a replay destination too. Set EG default to replay to queue &#8220;REPLAY&#8221; on queue manager MB8QMGR

> <pre>mqsicreateconfigurableservice MB8BROKER -c DataDestination -o MyDestination \
   -n "egForReplay,endpoint,endpointType" -v "default,wmq:/msg/queue/REPLAY@MB8QMGR,WMQDestination"</pre>

### Setting up Monitoring

Now your broker is configured for recording, you will need to setup something to be recorded. Event Monitoring is used to emit data to record, so either follow the monitoring sample, read the docs on [Event Monitoring](http://publib.boulder.ibm.com/infocenter/wmbhelp/v7r0m0/topic/com.ibm.etools.mft.doc/ac60386_.htm) or edit the sample monitoring profile in _sample/RecordReplay/basicMonitoringProfile.xml _to replace NODENAME with the name of your flow&#8217;s input node. Of course you can also configure event monitoring from within the flow editor in the toolkit &#8211; simply select a node and you will find monitoring in the properties view. If you have the flow source already, it is much easier to set the monitoring in the toolkit than it is to do it via the command line. You can also then use the _mqsireportflowmonitoring_ command afterwards to give you the xml monitoring profile being used (which is basically what you are setting in the toolkit when setting the monitoring options on a flow)

There are two specific properties which are worth mentioning when it comes to monitoring for Record and Replay.  
If you tick the include bitstream option in the toolkit then the body of your message will be recorded. Choose a sensible encoding, as if you select CDATA and your body will not be a valid XML element, you will break the monitoring and no event will be emitted. If in doubt, use the hexbinary or base64 encoding. It is worth saying that if you record MQ headers, and replay that message, the headers will be attempted to be reused. Other transport headers will just end up in the body of your message.  
The other option I wanted to mention was the UserData area of Event Monitoring. If you include $ExceptionList in your monitoring settings, then if an error occurs and an event is emitted, the exception list will be included in the monitoring message. This will be recorded, and will be available from the Record and Replay web interface and REST Api.

If you used a monitoring profile you will need to configure the profile with the following commands:

> <pre>mqsicreateconfigurableservice MB8BROKER -c MonitoringProfiles -o MyProfile \
   -n profileProperties -p sample/RecordReplay/basicMonitoringProfile.xml
mqsichangeflowmonitoring MB8BROKER -e default -f MyFlow -m  MyProfile</pre>

Monitoring normally defaults to off, so you will probably need to turn it on with:

> <pre>mqsichangeflowmonitoring MB8BROKER -e default -f MyFlow -c active</pre>

You can check that monitoring is correctly active with the command

> <pre>mqsireportflowmonitoring MB8BROKER -n -e default -f MyFlow</pre>

You should see output like

> <pre>BIP8911I: Monitoring settings for flow 'MyFlow' in execution group 'default' -  State?: active, ProfileName: 'MyProfile'.
BIP8912I: Event: 'IN.transaction.End',  Event name: 'IN.transaction.End',  Configured?: yes,  State?: enabled.
BIP8912I: Event: 'IN.transaction.Rollback',  Event name: 'IN.transaction.Rollback',  Configured?: yes,  State?: enabled.</pre>

You can now put messages through your flow and they will be recorded.

### Enabling the REST interface and Web UI

To enable the REST interface and Web UI you need to enable the HTTP server and set the port for it to run on. You will also need to set which ExecutionGroup will process requests to view recorded messages. (You can also do this via the MBX properties, see the properties for your broker, and for your DataCaptureStore ConfigurableService)

> <pre>mqsichangeproperties MB8BROKER -b webadmin -o server -n enabled -v true
mqsichangeproperties MB8BROKER -b webadmin -o HTTPConnector -n port -v 8080
mqsichangeproperties MB8BROKER -o DataCaptureStore -c MyCaptureStore -n egForView -v default</pre>

You can also configure HTTPS if you prefer, details are in the product documentation.

### Viewing recorded data

You can of course view all the data via a web browser by pointing to the url _http://localhost:8080_ but you can also do it all via the command line. The following will get back the most recent 30 recorded pieces of data from your captureStore MyCaptureStore.

> <pre>$curl "http://localhost:8080/datacapturestore/MyCaptureStore/"</pre>

This returns quite a large XML list of messages, so let&#8217;s try getting just one message.

> <pre>$curl "http://localhost:8080/datacapturestore/DefaultCaptureStore/?numberOfEntriesPerPage=1"
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;DataCaptureStore TotalResults="92" NumberOfEntriesPerPage="1" PageNumber="1"&gt;
&lt;DataCaptureEntry wmb_msgkey="414d51204d4238514d475220202020203d1bc14e4d290020:414d51204d4238514d475220202020203d1bc14e1b3a0020"
  has_bitstream="Y" has_exception="N" has_userdata="N" event_type="IN.transaction.End"
  event_name="IN.transaction.End" event_srcaddr="IN.transaction.End" broker_name="MB8BROKER"
  broker_uuid="d405fc08-0ec6-11e1-9d9b-7f0000010000" exgrp_name="default" exgrp_uuid="7fd654a2-3301-0000-0080-d4d9103989f9"
  msgflow_name="MyFlow" msgflow_uuid="0a4555a2-3301-0000-0080-e2ed33c9dfcd" appl_name="" appl_uuid="" library_name=""
  library_uuid="" node_name="IN" node_type="ComIbmMQInputNode" detail="IN" terminal_name="" key_fld_1_nm=""
  key_fld_2_nm="" key_fld_3_nm="" key_fld_4_nm="" key_fld_5_nm="" event_timestamp="2011-11-16 11:25:00.647"
  local_transaction_id="9f228bde-1045-11e1-9fac-7f0000010000-1" parent_transaction_id="" global_transaction_id=""/&gt;
&lt;/DataCaptureStore&gt;</pre>

You can of course filter on any of the data fields above as follows.

> <pre>$curl "http://localhost:8080/datacapturestore/DefaultCaptureStore/?numberOfEntriesPerPage=1&has_bitstream=Y"</pre>

Filtering is possible on all the above columns, with the addition that you can also set a timestamp range with The REST Api has documentation at _docs/REST/index.html_ which covers all these options.

You can also query which DataCaptureStores are setup for viewing by loading the base url &#8220;http://localhost:8080/datacapturestore/&#8221;

You may then want to download the body of a recorded message. (My example has a shortened url as the message key rather long. Use the wmb_msgkey from your above list requests) Depending on how you set the data to be recorded in your monitoring profile, you will get back a different encoding data

> <pre>$curl "http://localhost:8080/datacapturestore/DefaultCaptureStore/12345"
&lt;Data encoding="base64Binary"&gt;SGVsbG8gV29ybGQK&lt;/Data&gt;</pre>

You don&#8217;t have to get the data back as encoded payloads wrapped in XML. If you set download=true then you will just get the decoded bitstream

> <pre>$curl "http://localhost:8080/datacapturestore/DefaultCaptureStore/12345?download=true"
HelloWorld</pre>

You can also download an ExceptionList if your message has one recorded; set payload=exceptionlist to get the exceptionlist instead of the bitstream. This can also be combined with download=true

> <pre>$curl "http://localhost:8080/datacapturestore/DefaultCaptureStore/12345?payload=exceptionlist&download=true"</pre>

### Replaying recorded data

As we already defined a DataDestination called _MyDestination_ above, we have somewhere we can replay to. Again, you can do this via the web browser quite easily, but doing it with curl isn&#8217;t hard either.

> <pre>$curl "http://localhost:8080/datacapturestore/DefaultCaptureStore/12345" -d "replaydestination=MyDestination"</pre>

### Viewing more about your broker

There are lots of other details about your broker and what is deployed on it available via &#8220;http://localhost:8080/admin&#8221;. See the REST Api documentation for full details

> <pre>$curl "http://localhost:7101/admin"
&lt;?xml version="1.0"?&gt;
&lt;brokerResponse brokerName="MB8BROKER" completionCode="ok"&gt;
&lt;executiongroup name="default" runstate="running" path="/admin/executiongroup/default"&gt;&lt;/executiongroup&gt;
&lt;executiongroup name="test" runstate="running" path="/admin/executiongroup/test"&gt;&lt;/executiongroup&gt;
&lt;log name="Log" runstate="" path="/admin/log/Log"&gt;&lt;/log&gt;
&lt;adminqueue name="Administration Queue" runstate="" path="/admin/adminqueue/Administration Queue"&gt;&lt;/adminqueue&gt;
&lt;/brokerResponse&gt;</pre>
> 
> <pre>$curl "http://localhost:7101/admin/executiongroup/test/"
&lt;?xml version="1.0"?&gt;
&lt;brokerResponse brokerName="MB8BROKER" completionCode="ok"&gt;
&lt;application name="TestXpath" runstate="running" path="/admin/executiongroup/test/application/TestXpath"&gt;&lt;/application&gt;
&lt;/brokerResponse&gt;</pre>
> 
> <pre>$curl "http://localhost:7101/admin/executiongroup/test/properties"
&lt;?xml version="1.0"?&gt;
&lt;brokerResponse brokerName="MB8BROKER" completionCode="ok"&gt;
&lt;Name&gt;test&lt;/Name&gt;&lt;ShortDescription&gt;&lt;/ShortDescription&gt;&lt;LongDescription&gt;&lt;/LongDescription&gt;
&lt;Type&gt;ExecutionGroup&lt;/Type&gt;&lt;UUID&gt;3adf66ca-3301-0000-0080-814338bb17bb&lt;/UUID&gt;&lt;FlowDebugPort&gt;0&lt;/FlowDebugPort&gt;
&lt;TraceNodes&gt;on&lt;/TraceNodes&gt;&lt;Running&gt;true&lt;/Running&gt;
&lt;/brokerResponse&gt;</pre>

&#8220;http://localhost:7101/admin/executiongroup/test/extendedproperties&#8221; will return a very large amount of information.

Several /admin paths also support recurse=true, for example to see everything deployed on your broker use &#8220;http://localhost:8080/admin?recurse=true&#8221;

&nbsp;

&nbsp;

This was only a brief introduction to Record and Replay in WMB 8, and there is much more detail in the normal documentation. Hopefully a future update to WMB will bring more power and functionality to this area, as well as some more database support. Obviously I can&#8217;t say what will be added, let alone when, but I hope you get some value out of what is there currently.
---
id: 898
title: Message Broker v8 with MySQL
date: 2011-12-14T09:28:31+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2011/12/14/884-revision-2/
permalink: /2011/12/14/884-revision-2/
---
Now that you know that you can use [Message Broker v8 on Ubuntu](http://www.strangeparty.com/2011/12/14/websphere-message-broker-on-ubuntu/) for development, you may be wondering if you can use some of the databases that are more common on Linux, such as MySQL. You can!

IBM WebSphere Message Broker now uses UnixODBC to connect to many databases. Though not supported by IBM, you can actually connect to MySQL from Message Broker using UnixODBC.

If you are on Ubuntu, you can install the MySQL UnixODBC dirver and the MySQL server with apt-get:

> <pre>apt-get install libmyodbc mysql-server</pre>

Your environment variable _$ODBCINI_ should point to your _odbc.ini_, mine points to /var/mqsi/odbc/odbc.ini and the base file was copied from _/opt/IBM/mqsi/8.0.0.0/ODBC/unixodbc/odbc.ini_

You need to set a database definition for a mysql database, something like the following (assuming &#8220;wmb&#8221; is the name of your MySQL database created later)

> <pre>[MYSQL]
Description     = MYSQL DB
Driver          = MySQL
Database        = wmb
Server          = 127.0.0.1
Port            = 3306</pre>

You also need to make sure your _$ODBCSYSINI_ points to the folder (not the file) where your _odbcinst.ini_ file has been copied to. Mine is set to _/var/mqsi/odbc_ and the _odbcinst.ini_ file was copied from _/opt/mqsi/8.0.0.0/ODBC/unixodbc/odbcinst.ini_, you also need to add a definition to explain to UnixODBC how to connect to a mysql database

The following should be enough to get UnixODBC working with MySQL

> <pre>#Sample from package libmyodbc
[MySQL]
Description     = MySQL driver
Driver          = /usr/lib/odbc/libmyodbc.so
Setup           = /usr/lib/odbc/libodbcmyS.so
CPTimeout       =
CPReuse         =</pre>

Now create a mysql database (_mysqladmin create wmb_). You may need to GRANT some permissions to your user in MySQL, or add yourself to the mysql group and logout and back in again.

You can now check the database connection using the WMB mqsicvp command, which will also describe which database functions are available:

<pre>mqsicvp -n MYSQL -u anton -p password</pre>

<pre>BIP8270I: Connected to Datasource 'MYSQL' as user 'anton'. The datasource platform is 'MySQL', version '5.1.58-1ubuntu1'.
===========================
databaseProviderVersion      = 5.1.58-1ubuntu1
driverVersion                = 05.01.0006
driverOdbcVersion            = 03.51
driverManagerVersion         = 03.52.0002.0002
driverManagerOdbcVersion     = 03.52
databaseProviderName         = MySQL
datasourceServerName         = 127.0.0.1 via TCP/IP
databaseName                 = wmb
odbcDatasourceName           = MYSQL
driverName                   = libmyodbc5.so
supportsStoredProcedures     = Yes
procedureTerm                = stored procedure
accessibleTables             = No
accessibleProcedures         = No
identifierQuote              = `
specialCharacters            = None
describeParameter            = No
schemaTerm                   =
tableTerm                    = table
sqlSubqueries                = 31
activeEnvironments           = 0
maxDriverConnections         = 0
maxCatalogNameLength         = 192
maxColumnNameLength          = 192
maxSchemaNameLength          = 0
maxStatementLength           = 8192
maxTableNameLength           = 192
supportsDecimalType          = Yes
supportsDateType             = Yes
supportsTimeType             = No
supportsTimeStampType        = No
supportsIntervalType         = No
supportsAbsFunction          = Yes
supportsAcosFunction         = Yes
supportsAsinFunction         = Yes
supportsAtanFunction         = Yes
supportsAtan2Function        = Yes
supportsCeilingFunction      = Yes
supportsCosFunction          = Yes
supportsCotFunction          = Yes
supportsDegreesFunction      = Yes
supportsExpFunction          = Yes
supportsFloorFunction        = Yes
supportsLogFunction          = Yes
supportsLog10Function        = Yes
supportsModFunction          = Yes
supportsPiFunction           = Yes
supportsPowerFunction        = Yes
supportsRadiansFunction      = Yes
supportsRandFunction         = Yes
supportsRoundFunction        = Yes
supportsSignFunction         = Yes
supportsSinFunction          = Yes
supportsSqrtFunction         = Yes
supportsTanFunction          = Yes
supportsTruncateFunction     = Yes
supportsConcatFunction       = Yes
supportsInsertFunction       = Yes
supportsLcaseFunction        = Yes
supportsLeftFunction         = Yes
supportsLengthFunction       = Yes
supportsLTrimFunction        = Yes
supportsPositionFunction     = Yes
supportsRepeatFunction       = Yes
supportsReplaceFunction      = Yes
supportsRightFunction        = Yes
supportsRTrimFunction        = Yes
supportsSpaceFunction        = Yes
supportsSubstringFunction    = Yes
supportsUcaseFunction        = Yes
supportsExtractFunction      = Yes
supportsCaseExpression       = Yes
supportsCastFunction         = Yes
supportsCoalesceFunction     = Yes
supportsNullIfFunction       = Yes
supportsConvertFunction      = No
supportsSumFunction          = Yes
supportsMaxFunction          = Yes
supportsMinFunction          = Yes
supportsCountFunction        = Yes
supportsBetweenPredicate     = Yes
supportsExistsPredicate      = Yes
supportsInPredicate          = Yes
supportsLikePredicate        = Yes
supportsNullPredicate        = Yes
supportsNotNullPredicate     = Yes
supportsLikeEscapeClause     = Yes
supportsClobType             = Yes
supportsBlobType             = Yes
charDatatypeName             = char
varCharDatatypeName          = varchar
longVarCharDatatypeName      = long varchar
clobDatatypeName             = N/A
timeStampDatatypeName        = N/A
binaryDatatypeName           = binary
varBinaryDatatypeName        = varbinary
longVarBinaryDatatypeName    = long varbinary
blobDatatypeName             = N/A
intDatatypeName              = integer
doubleDatatypeName           = double
varCharMaxLength             = 0
longVarCharMaxLength         = 0
clobMaxLength                = 0
varBinaryMaxLength           = 0
longVarBinaryMaxLength       = 0
blobMaxLength                = 0
timeStampMaxLength           = 0
identifierCase               = Mixed
escapeCharacter              = \
longVarCharDatatype          = -1
clobDatatype                 = 0
longVarBinaryDatatype        = -4
blobDatatype                 = 0

BIP8273I: The following datatypes and functions are not natively 
supported by datasource 'MYSQL' using this ODBC driver:
Unsupported datatypes: 'TIME, TIMESTAMP, INTERVAL' Unsupported functions: 'CONVERT'</pre>

<pre>Examine the specific datatypes and functions not supported
natively by this datasource using this ODBC driver.
When using these datatypes and functions within ESQL, the
associated data processing is done within WebSphere Message
Broker rather than being processed by the database provider.  

Note that "functions" within this message can refer to functions or predicates. 

BIP8071I: Successful command completion.</pre>

There &#8211; done! Now you can use MySQL with WebSphere Message Broker on Ubuntu. Don&#8217;t forget to set the database password with _mqsisetdbparms_ before trying to actually connect from your database nodes.

Also, the name of the database according to WMB is &#8220;MYSQL&#8221; as that is what I defined in the odbc.ini. The name of the database according to mysql is &#8220;wmb&#8221;. They don&#8217;t need to be different, but it might help having unique names if you are trying to track down a database connection issue.

Of course, the mysql database server does not need to be local to the broker &#8211; The mysql odbc driver should allow you connect to any accessible tcpip mysql server.
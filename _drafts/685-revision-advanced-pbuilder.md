---
id: 686
title: advanced pbuilder
date: 2010-06-17T20:42:52+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2010/06/17/685-revision/
permalink: /2010/06/17/685-revision/
---
`#!/bin/bash<br />
# script from Jamin W. Collins  BTS: #255165<br />
# name this script 'pbuilder-woody-i386', 'pbuilder-sid-amd64', 'pbuilder-sarge-i386', 'pbuilder-experimental-amd64' etc.<br />
#set -x` 

``OPERATION=$1<br />
export DISTRIBUTION=`basename $0 | cut -f2 -d '-'`<br />
ARCH=`basename $0 | cut -f3 -d '-'`<br />
PROCEED=false<br />
BASE_DIR="/var/cache/pbuilder"<br />
case $OPERATION in<br />
create|update|build|clean|login|execute )<br />
PROCEED=true<br />
;;<br />
esac</p>
<p>#Throw an error if filename is .changes, as we work on dsc (I keep trying to build a .changes)<br />
if [[ "$2" =~ .*\.changes ]]<br />
then<br />
echo pbuilder works on .dsc files, not .changes!<br />
exit 1;<br />
fi</p>
<p>if ( $PROCEED == true ) then<br />
shift<br />
#run pbuilder<br />
linux32 sudo pbuilder $OPERATION \<br />
--debootstrapopts --arch --debootstrapopts $ARCH \<br />
--distribution $DISTRIBUTION \<br />
--basetgz $BASE_DIR/$DISTRIBUTION-$ARCH/base.tgz \<br />
--buildresult /tmp/ \<br />
--aptcache $BASE_DIR/aptcache \<br />
$@</p>
<p>else<br />
echo "Invalid command..."<br />
echo "Valid commands are:"<br />
echo "   create"<br />
echo "   update"<br />
echo "   build"<br />
echo "   clean"<br />
echo "   login"<br />
echo "   execute"<br />
exit 1<br />
fi</p>
<p>anton@ocdc:~$ cat /usr/bin/pdebuild-base-linker<br />
#!/bin/sh<br />
export DISTRIBUTION=`basename $0 | cut -f2 -d '-'`<br />
ARCH=`basename $0 | cut -f3 -d '-'`<br />
TIMESTAMP=`date "+%y%m%d%H%M%S"`<br />
BASE_DIR="/var/cache/pbuilder"<br />
LOGFILE=$BASE_DIR/result/$DISTRIBUTION-$ARCH-result/logfile-$TIMESTAMP<br />
CONFIGFILE=$BASE_DIR/pbuilderrc-$DISTRIBUTION-$ARCH</p>
<p>``

`#linux32 pdebuild --configfile $CONFIGFILE --logfile $LOGFILE --debbuildopts -a$ARCH<br />
#linux32 pdebuild --configfile $CONFIGFILE --debbuildopts -a$ARCH<br />
export BASETGZ=$BASE_DIR/$DISTRIBUTION-$ARCH/base.tgz<br />
linux32 pdebuild --debbuildopts -a$ARCH -- --basetgz $BASETGZ --buildresult $PWD/..<br />
`
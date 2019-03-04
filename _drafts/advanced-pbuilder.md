---
id: 685
title: advanced pbuilder
date: 2010-06-17T20:43:44+00:00
author: Anton Piatek
layout: post
guid: http://www.strangeparty.com/?p=685
permalink: /?p=685
aktt_notify_twitter:
  - 'yes'
  - 'yes'
categories:
  - Debian
  - Ubuntu
tags:
  - Debian
  - development
  - Linux
  - packaging
  - ubuntu
---
 `export DIST=karmic;<br />
export MIRROR=http://ubuntu.hursley.ibm.com/ubuntu-repository/;<br />
sudo mkdir /var/cache/pbuilder/$DIST-$ARCH; \<br />
sudo pbuilder create --basetgz /var/cache/pbuilder/$DIST-$ARCH/base.tgz --mirror $MIRROR --distribution $DIST \<br />
--extrapackages "sysv-rc ocdc-archive-keyring"  \<br />
--othermirror "deb http://ocdc.hursley.ibm.com/repo/ safe ibm-core $DIST |deb http://ocdc.hursley.ibm.com/repo/ beta ibm-core $DIST"  \<br />
--debootstrapopts --arch --debootstrapopts $ARCH  --debootstrapopts --include --debootstrapopts sysv-rc \<br />
--debootstrap debootstrap`

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
esac``

``#Throw an error if filename is .changes, as we work on dsc (I keep trying to build a .changes)<br />
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
---
id: 587
title: New gpg/pgp key
date: 2009-11-08T12:53:51+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2009/11/08/581-revision-6/
permalink: /2009/11/08/581-revision-6/
---
I suspect only a few readers here will care, but I have a new gpg/pgp key

<!--more-->

  
If the message below is not verifiable, it is probably mangled by your browser &#8211; a plain-text version is at <http://strangeparty.com/new_key.txt>

<pre>-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256,SHA1                                

I have migrated my gpg keys to a stronger key
My old key was:                              

  pub   1024D/B307BAEF 2004-04-22
  Key fingerprint = 116A 5F01 1E5F 1ADE 78C6  EDB3 B9B6 E622 B307 BAEF

and my new key is

  pub   4096R/74B1FA37 2009-11-05
  Key fingerprint = 7401 96D3 E037 2F8F 5965  A358 4046 71FD 74B1 FA37

You can get my key with the following command on linux

  wget -q -O- http://strangeparty.com/anton.gpg | gpg --import -

or by downloading http://strangeparty.com/anton.gpg and importing manually

You can also fetch it from the keyserver with

  gpg --keyserver pgp.mit.edu --recv-key 74B1FA37

If you have my old key, you can verify that I have signed my new one with
my old one with

  gpg --check-sigs 74B1FA37

If you are paranoid and want to check you have downloaded the right key,
you can check the fingerprint of the key against the one above with

  gpg --fingerprint 74B1FA37

If you are completely satisfied, you may want to sign my new key

  gpg --sign-key 74B1FA37

If you do sign me key, please either email me that signature (email the
output of the following command to anton@piatek.co.uk)

  gpg --armor --export 74B1FA37

(Or the following if you have a mail client on your box)

  gpg --armor --export 74B1FA37 | mail -s 'OpenPGP Signatures' anton@piatek.co.uk

Or you can just get gpg/pgp to upload it direct to a keyserver

  gpg --keyserver pgp.mit.edu --send-key 74B1FA37
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAEBCAAGBQJK9r5vAAoJEEBGcf10sfo3mosP/3SvPGY5Rh3swpPsIk6MhM8c
1I9FqFDdwKDdzVg1BR3YMo3UXY6zE/LpBzr63s1CtdUZTbVrm8fuav9CSgdk+PUj
f04ssi5LHrBTY9X7QYF/wgL8skE4ByHf4QGEMR5lfBi8vl35OHaf0yhXXmypKxuV
+f3keX0gpcWrcdn7JKva4J4CJ617QsfNnR/EFQXBBYiwPYkWRSMkSLT6JOO7Y6FY
WPbI+Me2kOe6nlNHx/4OTg7ev9kkIV2Y+dgOQcZIEF6WBL51DzvR4AZApih00Ny+
qD3Hpo+kDSSB6PGKOMVxYbHvFAdwQjQTiptTnsu2TX+0hQypQlrGRvEKXSUg5dn6
HO6AHkfeZ+J3WUfhQVQHHNIdSPT8mpRBLR24INsI8sxtxe9EQezjUJOYKc/BhMY8
n9H1dIdAMtrdz+fFG7cqXsYMY8xs3zUZMa/nyu4uKobLtuUnItRS09Zhqxk51C0k
hqRIEvJybk5i9B9ytUT3zRSQrTL9aLEaJGHq1CcE64ABCLXt8QixSB+60EfR3MVT
otBflmiLaV5UE0x98GZ/JtLTRHKj/vR28/45vhWXSEAJO3A6t3A9qmfg2/YP/vWc
ddFpgK7kDFcQu4hvPzEKWwZUnw9jzP50msjr5Vpcn4/FS7zGPFaPmCWC4h22yxhL
h1aBCg2ijxrHwHDxT3QWiEYEARECAAYFAkr2vm8ACgkQubbmIrMHuu/v2QCePQud
lf4D6cZqvJMHGwv3mvm/I5wAnjSFS4Y2l8OUzCjeZOgTeVGjAMeU
=cmth
-----END PGP SIGNATURE-----</pre>
---
id: 584
title: New gpg/pgp key
date: 2009-11-08T12:45:02+00:00
author: Anton Piatek
layout: revision
guid: http://www.strangeparty.com/2009/11/08/581-revision-3/
permalink: /2009/11/08/581-revision-3/
---
I suspect only a few readers here will care, but I have a new gpg/pgp key

<!--more-->

<pre>-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1,SHA256

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

iEYEARECAAYFAkrzJdgACgkQubbmIrMHuu8VwQCcDXlG2X434UFNF8/8dEq3gTCJ
XagAmwfYUo2pvHVdrG58l4kO9L2eAoIfiQIcBAEBCAAGBQJK8yXYAAoJEEBGcf10
sfo3OEAP/i1mJRkmfs5ROboxtf17MpWJxmyxasohh2YFHrLWgLjn0Yr/7kBhE85k
LztavKgheNI41fsNA1sV+aqJBHNRVGX4ZlYG8u2W+r+jhAhwFUj3UDoM/PtNmRKO
ospJWfzYAHt6x1g00X9wrcGq9mIGWR7nBbAFz44BnbCb3OPlDNFFYelEyAwHBTJ2
I83CnXM773QGRKwdkrBP6bedB0emaRiXB/bbGVHxSEDfuRD1gzz22w0JvFVTgD9h
FZJ5Gi6o0lBZnpodD1+x/HNnKs5QRUCYRd4BCRput2LgCPFKBNhVacwsZyAf+QJW
8ZhTf7q2K+0Q41eYdxByhekILtXc6Ebbn8lNoh8h0368/H3cBlLiuwG5n6SQN4B4
7eoUtQMbSf2CRSSVb39xRvNh98vZjPswe+lTTCSAluMi3PKpDI3CmN76Ky6fI+cO
f2fIy7Q5AYj2rtZlUxf6C8fh4O83quFHmxBfMGAIYLpvPiGLYt6SBqJQyvTegAfh
7OHM42qBFOTEifvgDpjgbiclilQpHTe+wNAkJnMr8/W8JxQRYMG32CS54FnbmPvh
zz7Fpq3TIp3YyJnrhdORZ7MbLdowS4AxndPLFz9EwoKh+RPpmutWEJvGDhak8FwA
C/Q1Ft11tAvWHKOaUMBFAb4VoEO/knJrwqOQhPHA9ohjeU27NZyL
=FoTi
-----END PGP SIGNATURE-----</pre>
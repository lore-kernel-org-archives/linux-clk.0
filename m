Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Martin Sperl <kernel@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] clk: bcm2835: mark enabled pll_dividers as critical
In-Reply-To: <BC74AA10-C36C-4643-B979-0617D222D605@martin.sperl.org>
References: <1461660989-11846-1-git-send-email-kernel@martin.sperl.org> <8737q8dv5f.fsf@eliezer.anholt.net> <BC74AA10-C36C-4643-B979-0617D222D605@martin.sperl.org>
Date: Tue, 26 Apr 2016 18:30:25 -0700
Message-ID: <87bn4v6dou.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Martin Sperl <kernel@martin.sperl.org> writes:

> Sent from my iPad
>> On 26.04.2016, at 21:31, Eric Anholt <eric@anholt.net> wrote:
>>=20
>> kernel@martin.sperl.org writes:
>>=20
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>=20
>>> The bcm2835 firmware enables several clocks and plls before
>>> booting the linux kernel.
>>>=20
>>> These plls should never get disabled as it may result in a
>>> stopped system clock and more.
>>>=20
>>> So during probing we check if the pll_divider is enabled
>>> and if it is then mark that pll_divider as critical.
>>> As a consequence this will also enable the corresponding parent pll.
>>>=20
>>> Here the list of pll_div that are marked as critical:
>>> [    2.022437] bcm2835-clk 20101000.cprman: found enabled pll_div plla_=
core - marking it as critical
>>> [    2.031640] bcm2835-clk 20101000.cprman: found enabled pll_div pllb_=
arm - marking it as critical
>>> [    2.040966] bcm2835-clk 20101000.cprman: found enabled pll_div pllc_=
core0 - marking it as critical
>>> [    2.050351] bcm2835-clk 20101000.cprman: found enabled pll_div pllc_=
per - marking it as critical
>>> [    2.059427] bcm2835-clk 20101000.cprman: found enabled pll_div plld_=
core - marking it as critical
>>> [    2.068590] bcm2835-clk 20101000.cprman: found enabled pll_div plld_=
per - marking it as critical
>>> [    2.077724] bcm2835-clk 20101000.cprman: found enabled pll_div pllh_=
pix - marking it as critical
>>=20
>> Yeah, pllh_pix isn't critical, though.  We want it to get turned off
>> when the driver asks to disable its clock, or we're going to just waste
>> a pile of power.
>>=20
>> I'm sending out a patch that marks the VPU clock as critical (it's the
>> also AXI bus, so it certainly is critical), which should solve your
>> aux_uart clock disabling problem, I think.
>
> The problem is that it also fails on the pcm clock alone when pllc or=20
> plld_per are used as parent, but it is fine when osc is used...=20

For that you're going to want the HAND_OFF patches that mturquette is
working on: Don't let the clock and its parents get turned off until a
driver has shown up that has referenced the clock and done at least a
prepare on it once.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXIBYxAAoJELXWKTbR/J7ochoP/2a9ZHs1KnYh5iipMjBlcElM
7W+OnQXH3CpvlfibiMVw3QquzKNohaox8X7iOjI+krEuckfjGB4AXArHCrEflee3
8YXaq1FWnemAyYJhMAF0A5jHGqcd9h7wj3mstePUI79qh0Pzs9cHl8/OmAbNJYvN
U5PbaWWMJsD195u/WC0ncqY5zNHOHxsRVHKjMn9rJzY7k6O3QP8iolj7gruCJGpt
Whhj2/+RHFznajShu7Sr59YOWpF0JCoOWa50A3ZveYwzzvYr++jquvyBI0NeTyb1
H3eEFLb5qbPSzBnES/8Z7Koj1okeq5iH3XQrjwO82hQEEjvdz/bcmcXfChnS27mH
SCwCYrGmEJaoXK1Krw5CL3dVBNsjBMs9aPUZB7pO4yBoy/z8b07d5fAXuEdv7p6G
8JmnRCuBwydgTpg/WxrkUSlmUCJAib/+VdxvHJu4eBdPZEDnvpnVdFtLwMrEJeBV
UtKiXXAHvIup7ynx8oNCnvKQCV5DOQBAXSNhNB7/8yhkBWRs/4KqAzOmBr56Dsca
zSRo2BqD5d/XJwv6zr3yiMq5nUgJP/BiwFCG3saxQEK0lAh/z54LjnyjvAr/1leC
noiPCoSwwKgho7rCUObBNtqLz0I7mNHL74XZz02XXdKdaZ1t1sx6Ivjq0BER6hcG
PuyzwCbvEQzeRVCF9uca
=BmQS
-----END PGP SIGNATURE-----
--=-=-=--

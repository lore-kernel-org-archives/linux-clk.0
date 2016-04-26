Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V2] clk: bcm2835: mark enabled pll_dividers as critical
In-Reply-To: <1461660989-11846-1-git-send-email-kernel@martin.sperl.org>
References: <1461660989-11846-1-git-send-email-kernel@martin.sperl.org>
Date: Tue, 26 Apr 2016 12:31:24 -0700
Message-ID: <8737q8dv5f.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> The bcm2835 firmware enables several clocks and plls before
> booting the linux kernel.
>
> These plls should never get disabled as it may result in a
> stopped system clock and more.
>
> So during probing we check if the pll_divider is enabled
> and if it is then mark that pll_divider as critical.
> As a consequence this will also enable the corresponding parent pll.
>
> Here the list of pll_div that are marked as critical:
> [    2.022437] bcm2835-clk 20101000.cprman: found enabled pll_div plla_core - marking it as critical
> [    2.031640] bcm2835-clk 20101000.cprman: found enabled pll_div pllb_arm - marking it as critical
> [    2.040966] bcm2835-clk 20101000.cprman: found enabled pll_div pllc_core0 - marking it as critical
> [    2.050351] bcm2835-clk 20101000.cprman: found enabled pll_div pllc_per - marking it as critical
> [    2.059427] bcm2835-clk 20101000.cprman: found enabled pll_div plld_core - marking it as critical
> [    2.068590] bcm2835-clk 20101000.cprman: found enabled pll_div plld_per - marking it as critical
> [    2.077724] bcm2835-clk 20101000.cprman: found enabled pll_div pllh_pix - marking it as critical

Yeah, pllh_pix isn't critical, though.  We want it to get turned off
when the driver asks to disable its clock, or we're going to just waste
a pile of power.

I'm sending out a patch that marks the VPU clock as critical (it's the
also AXI bus, so it certainly is critical), which should solve your
aux_uart clock disabling problem, I think.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXH8INAAoJELXWKTbR/J7otVUQAJ4aN/17wZsUQ71ndSusPZEY
8CYcngPD7FdixSSJidmWaHa4Lu0/16syWkhiRX+jYVU9+T7R+z24cJonBq7zcLY+
TtvuOs+dQbb4fizAQOZJ1L582/K9kZRrrTxGld9gbQL+3KjxBvv7UOraF/PYv7C2
Xf9wxcHc5s3drpp/lhxZC8HRRNqLCw2soyAAISUazpxSgbOciWsYKc33jm9gdnbr
6s38yHOAIjdj8KwHYJarcv+sLxObhG74AFkdemGmzOKQIu0GHpzXrmsppV4jRmON
zlGyTscGWxsYgYnXMGHg6QHUBvJX8yLcQIclys3ax8Y4+kMqmv9sN1IQyxC0JPBm
dMbzwfhicOstbLt7zicqu7Qbcf781xxZUv2D6CabEU4E2mAvkYMZOJ585eNiyatu
akKfschJAjjPKbu1aAKQcKyfJ8T1KIgVIpECJD4CV53hHDOTrEgUIVt1Jr/zMN5B
trC3C09hV7voytldKHLoa57Dqi61VELv/1skMbzVCVHCnd0CD7eZ8TgUUvWFpt81
2b1jVvf/iTDCq4btTg2FeRFENl24Obq2yuUiUk87/O190KUfEfaFRkfTRSPzHV0N
NqdDhj4CA78hDqJK39q00iIryJMTt3Sw9QvrIuyXlGzFo5tQgX4iZx15ApANrXBS
XQnLz/p1mJKaw+SQ550H
=0t3l
-----END PGP SIGNATURE-----
--=-=-=--

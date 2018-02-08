Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: bcm2835: Protect sections updating shared registers
In-Reply-To: <20180208134338.24590-2-boris.brezillon@bootlin.com>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com> <20180208134338.24590-2-boris.brezillon@bootlin.com>
Date: Thu, 08 Feb 2018 15:14:08 +0000
Message-ID: <87shab5xa7.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> CM_PLLx and A2W_XOSC_CTRL registers are accessed by different clock
> handlers and must be accessed with ->regs_lock held.
> Update the sections where this protection is missing.
>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlp8aUAACgkQtdYpNtH8
nuh8cA//XtKGZJiKBHfSNoV1a827YLr1Ffush7cWpS3WsQX7hz7jLIqgSU8YF79u
MIXJ0y3gY862J4Z+RPm9rNhBbglsBkRpRUCUejr/ZsZ0zzzwxvK59mYoICzxWs61
ZqL2AVlg0gBlb7ygQAq84NMnWQOafo5AUR5X8Sq3Om2h3RgShJOJoRXNR+KReRn6
Oh8TlZ0OYDJgjzFsTPRNO6QEhOGpE6z+bJUMiaTaQ+cWaFdtrKCVIryySWuGBhJ3
p12eFVqd9gW+Iq2sA+3h8apPyeZUcvhAyLIJ08FoUROZJybyZ1Ux7zwBOMEcwHtx
j/TxZWySaRkf3LXvvJiOK/qhisxNKOG8D+L6SCsW3q5P9cKP7AKwujO2bPocXg/A
cvGo17/p2YJJWh8e8LSfs9y2k9SBrUiw7PlkQQjq2lf3jXYHI9aKngvB5M9kAazR
V36+n8kzve5uEuTQVgd6fYn//v0Ehfz4E7QgZKri/HLIR3RBjfUZxhNf43TCbYTo
b69btLXXAi2+Z5m1oyFlK5940iP4mgKsUOC9spBrEfOmpEViRK/8H60g/2xPlUWr
TmaT+8m85kGzoztHG1gKfYDp4sdbGXWbu1Emek4ZUtheqpWsLgcXoM4DSBLWncKK
p/UQ8UmcaqfqpVTN+50vpgOfHvrqpua2QM//thI1bMqSrZsgiXc=
=+qqJ
-----END PGP SIGNATURE-----
--=-=-=--

Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Phil Elwell <phil@raspberrypi.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Danilo Krummrich <danilokrummrich@dk-develop.de>
Subject: Re: [PATCH 2/5] clk: bcm2835: no need to check return value of debugfs_create functions
In-Reply-To: <20180529160804.1982-2-gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org> <20180529160804.1982-2-gregkh@linuxfoundation.org>
Date: Wed, 30 May 2018 12:39:35 -0700
Message-ID: <877enlndag.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

I like it.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsO/fcACgkQtdYpNtH8
nujWTw/+KV8pwgjNlxYXajZ6DqAFrwwhFKyDgLVtMOzQriOfsd+L2zoMq/Darbof
NIIsEfUCS16y00Ouf/RR7hWYXEL41Q8LEXLvFEEem7dw35CqVt2q7a6F1qAbsFtX
j3AQc6skqAFx6h1XQER/kdcpWx6HVezECSNbSx3k3bVz/K6MvcGw4vg/6oIg8yju
xlumWXkFI6BZYFBHlAiEXs/sRKh0WK+OqRJSU1b4OTMyFrtCr69YANFGkLWi7ZLo
MECFpEbqenR4rVpVGH3uHn4dgNeSLKI8FN7g0bxJGIFKnePYgQ4S6QuP1KgPKbiC
rzVWz0xUtBUtCCQA5DdRld941r+ixz8FIC99gR2tOAvkacgfWY0oKSZY2rpwP1sy
LqP2PcElhHJUyso3ezI1wC39Pamg6wldldELmJnYYVH+Xk8xPaHpRiKCvAJXogCY
e0yH3iINdaNNtRF/I/Uzoa7lC38Ns3NUW6am4S3KMS9Ct5QeCFxNK0V+9aXMJ+91
+pzPnJTHKH7oYRDqdXfDL/CPC25q4+eIWtw0PSCg3PRR+VKV6hyIXLVBK47aaqKT
bTCj9JHBqIpakVU6WfJQccC1L2IeV2ea4sA8snb2tj+oU0wLo7cA/peeqDyf9zNh
uvXLlyqCf1vfJzUocZfV5SpunyovBjPPHqVeXqcuMSn6lGcmq2w=
=udKK
-----END PGP SIGNATURE-----
--=-=-=--

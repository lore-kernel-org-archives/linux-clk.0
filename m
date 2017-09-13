Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:53520 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751148AbdIMSmn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Sep 2017 14:42:43 -0400
Date: Wed, 13 Sep 2017 20:42:41 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/2] clk: sunxi-ng: Add several flags to H3 CCU
Message-ID: <20170913184241.b3dypwygczkfxrvx@flea.lan>
References: <20170910124006.60250-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xzbuttpreyeidiv5"
In-Reply-To: <20170910124006.60250-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--xzbuttpreyeidiv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2017 at 08:40:04PM +0800, Icenowy Zheng wrote:
> The H3 CCU is the earliest driver that uses sunxi-ng clk framework, and
> some problems show when doing further development.
>=20
> This patchset fixes some issues by add several clock flags.
>=20
> The first patch solves the problem that setting some PLL before ungating
> them will trigger timeout for waiting for lock by adds CLK_SET_RATE_UNGATE
> flag.
>=20
> The second patch solves the problem that H3 GPU clock is not really tweak=
ed
> by add CLK_SET_RATE_PARENT flag to it.

Queued both for 4.15, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xzbuttpreyeidiv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZuXwhAAoJEBx+YmzsjxAg9mwP/1/JIorQpXXDUOqFxq3B3IMc
5UCAngx6ZlH89bv4ACOT5ZhBTfMJxHC8VsBawnqsbz+U7BZE4/SFbNDJ1aNzrzmB
8/UP4K6aZG5B8TsThL59385LP3VH0/sJrtALUbkxVifi8oSYHQIZdRdwJHaPfgQM
wykCS3S+tT/i3T+A8B8Qq19u2yHd1tIqnW2goCpmnpIIkTpOJJkg7Rtn7HG66JY+
S2+2J9cSB2aHtMyRukyk3P05x1n9HbOH548u0orDMqEAmIfm0LM0kKICpzhGqmlj
1SqllHxKPOW/FpeFyfruHI61+atcvfVSaq+4WJCWrWVhhK4iM/53I6aDL1D4tD1f
Z8g8i83VT243gH+uOWpT6T052dYh47AJLzM5o+nOc/pDJPcXq7CDDT7BbZhqaKPZ
o/k0yE512ez77Ky06I2ij9E+qIy+ZWl+1a6DleHxJGgYPrSYVsW7w/FaymfJOwsZ
qNUqgikE7Z8ev7eMEM1iR7ZFcVZ/ghIGENM5fILHOHIDXS4ROw8oPrMbfmcYs3Yw
Kpm/FKtTlq0oiYM6AZTcY4PSlPZPKgN322/HiKRK8YtL4kwzZzNEcAcvWBs3alP1
/gBlkp0Qlt6sKshZWuKCZku95t/lIZ0UE7kSR9KIuCP8J8OAc/uYrfsOWBo9iPmi
19Sema3rfsqI7viAL7oP
=+yXi
-----END PGP SIGNATURE-----

--xzbuttpreyeidiv5--

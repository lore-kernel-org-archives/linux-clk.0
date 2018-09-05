Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:33506 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726242AbeIELaj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Sep 2018 07:30:39 -0400
Date: Wed, 5 Sep 2018 09:01:53 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun50i: h6: Add 2x fixed post-divider to
 MMC module clocks
Message-ID: <20180905070153.a5ba6razlhdwdjde@flea>
References: <20180820134013.16527-1-icenowy@aosc.io>
 <153540143478.129321.8502068006504989469@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="64gjh43w4wb2y7ri"
In-Reply-To: <153540143478.129321.8502068006504989469@swboyd.mtv.corp.google.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--64gjh43w4wb2y7ri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2018 at 01:23:54PM -0700, Stephen Boyd wrote:
> Quoting Icenowy Zheng (2018-08-20 06:40:13)
> > On the H6, the MMC module clocks are fixed in the new timing mode,
> > i.e. they do not have a bit to select the mode. These clocks have
> > a 2x divider somewhere between the clock and the MMC module.
> >=20
> > To be consistent with other SoCs supporting the new timing mode,
> > we model the 2x divider as a fixed post-divider on the MMC module
> > clocks.
> >=20
> > This patch adds the post-dividers to the MMC clocks, following the
> > approach on A64.
> >=20
> > Fixes: 542353ea ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
>=20
> This commit doesn't exist. Did you mean:
>=20
> 524353ea48
>=20
> instead?

I changed it. Please also use 12-characters commit IDs, as recommended
in the kernel documentation.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--64gjh43w4wb2y7ri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPf2AACgkQ0rTAlCFN
r3SZCQ//U7fTlRzK3nbV79CQPigCtjxAfJk46/xpkxQ36wz9RcAKfOkxvqJ8u22V
tAsQQoaLgkdSpwyIaLyaVX7Z9r0fiNOX7e8hJGZC+UqwZ3I/Tllk2l16p0AmRySM
sUeM7z6e84gETwv3YcZyVUFQXSd/gsXDhZ6jO2tP8OmprFvxciIJjRuN7Paqct0F
GQcBzgRt7Xle5eSkFqxV8WAbaETaUETtMOENzNskhE+pTD1slPHrim+bhSFYza6P
58OoFztk4s/XCqd78kzW7y7j8/IleWH5CSu4LAnWC6Oo19t0Dxn1agYzHTEa20dj
qA7l0bSmrRbnY/1hqQLbYToBvNavQqmcFZbk0Ge5wSRYhIqo8T9S3Bs8UM043u9/
y5o6YODtIeNvk+/X3uh2bhi5DXbKF+1FzAaKPHHAgsR7an7LJpfSP0wnWkew/moz
EGwJJ6wiEWUM7AcO92XoLgaMl6WjaKV90uDqHxGfKjcDPpvw/P8vTny8iNMUPoCV
Bcj0hsT7gS4Me+zCFUbcJ1Hc762lZz1zM6Iq6Vu3h1YYW9SlDaBJcIG178/fO501
HXV8JCu/eF0kCit11x/V4g6Ys1nAnlfH6WsRGoUWxJi0sTjEm1BF82kjQ5T2YBik
+GAUwMzXwSsU5kEhVeuS6qyE9HfB6EjQ/Evy3Xe7upmaLZ+3t7Q=
=ZDFf
-----END PGP SIGNATURE-----

--64gjh43w4wb2y7ri--

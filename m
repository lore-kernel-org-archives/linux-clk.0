Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 28 Feb 2017 08:52:43 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/4] ARM: sun7i: Convert sun7i SoC to sunxi-ng
Message-ID: <20170228075243.gschowjzagwuxgok@lukather>
References: <20170227210914.18954-1-plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vuvp4e2gkxtnurrf"
In-Reply-To: <20170227210914.18954-1-plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--vuvp4e2gkxtnurrf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Priit,

On Mon, Feb 27, 2017 at 11:09:10PM +0200, Priit Laes wrote:
> Hi,
>=20
> This is serie brings another SoC into the sunxi-ng world.
>=20
> As mentioned in sun5i conversion, this is pretty much standard
> stuff as all the required clocks were already implemented in
> the sunxi-ng framework.

Thanks a lot for that work. I think the A10 should be converted at the
same time, and both would share the same driver.

Fortunately, if I recall properly, both are not too far off.

Thanks again,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vuvp4e2gkxtnurrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtSxGAAoJEBx+YmzsjxAgvmkP/3HQMhfRAVnfsrlxwxUecL/f
0EcBFHD67QDk/PsniL6OuhfrFqISClbLlICCFgN4B+pNuVG4d08W9nKdDL4FlLYf
Tp37DpcAHEhAlMsbD4b4Mh1o338BECwD8MH7l22PS2hSwTwVyjMKC05BXrMfzRO3
7yw+QPrfBw/5kZwE3HTajNwpHE8p+P8ybAQ53UMoU+gRtSvV+2F/WjsHOHFZ1p/W
WICyv8H3Wy1g06QyOnjqoAvFFXIITNgzLNSBn3YJfCoSs+pYnUSmeiXwWGRcN5r9
sZpGRPAXJP6vLskqOOuyO69r/IRGpFfFRcvS516Sd72tIVrM55HuZeKdxgc7QZLK
GTwDS7Yx8Bn/f0kogKoaA+Xg0pAV8aNnowhq7bQMzoVtrq8w0X1bkXVAxH4R5KwK
uxvTIW0/ZkXwe6T3aaS7P9p4IrfovJVzhfWp4LrUghBdCQswRCucmi5/6882GvG8
vkShcjXaWfRCP1D9DIsM4LUFUGDbJldMBwmoBWzbRjv27UJz7T2vZeFJgzY6c0nv
B4Ytk4SrOH3AbrG8HbsI6N+iK0rEJgEupTRziRUXQXPnpaKBKAtd2nvDoI81tcdo
y7luUVpfJiVktRy9Cje3jQo+bOe4PuATp+BXjnSmbWpLyPYBQQgkbYTMmPRgk5AA
z+ac9tr9arAEkBzHvtk4
=JTxW
-----END PGP SIGNATURE-----

--vuvp4e2gkxtnurrf--

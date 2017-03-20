Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 20 Mar 2017 10:33:55 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH] clk: sunxi-ng: fix recalc_rate formula of NKMP clocks
Message-ID: <20170320093355.wougjul675q3hru7@lukather>
References: <20170317201943.45190-1-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170317201943.45190-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7523850218092673963=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============7523850218092673963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hepdbv2zwagcac3t"
Content-Disposition: inline


--hepdbv2zwagcac3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2017 at 04:19:43AM +0800, Icenowy Zheng wrote:
> In commit e66f81bbd746 ("clk: sunxi-ng: Implement factors offsets"), the
> final formula of NKMP clocks' recalc_rate is refactored; however, the
> refactored formula broke the calculation due to some C language operand
> priority problem -- the priority of operand >> is lower than * and /,
> makes the formula being parsed as "(parent_rate * n * k) >> (p / m)", but
> it should be "(parent_rate * n * k >> p) / m".
>=20
> Add the pair of parentheses to fix up this issue. This pair of
> parentheses used to exist in the old formula.
>=20
> Fixes: commit e66f81bbd746 ("clk: sunxi-ng: Implement factors offsets")

You shouldn't have commit here.

> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Fixed it, and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hepdbv2zwagcac3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz6H+AAoJEBx+YmzsjxAg0okP/2uU+/Golxd8n5Hk1uuKXa8A
XJ7+8Qj7hv7jDAgs9zc7Y9ADSzYs+/qNdXcXVkgj1oa1JMfUuHegKfgBvyun3M4I
PVr2fUQBVJuxDt+LpUqgDdacuT+CnDjhJ5BSVxgOSWheaj9YnOBwZG0fJmp4ET3/
JYRE8WeapBkc+o2zQKwqYFBR9d1v9nhgK8bn2MtF9W0KTgoxB/XTl/XpYbhWjeY/
1FoF4kZHz9OsfEXaj+wDicS0c3x4xrGb34pGBDon/x+eaPgZRXkWigFC0FAVhsAw
laQ5UTx4ZgU51KjyxwxsSnkOLkrY4n1S4SnMpfwGD97XfWKw6YPLiQt8iXvHCDC4
pl++1I1D7/VhaWSYRE64dBHbHcGhzRXzI2XpjVl/LXFvK3bm3ozeq9WDpIlYh34u
pQ/rp7D6GXvL4WYGDr8YQ7kSLyX1AN8fhX38cjnCIrybsR8J5528RSiRd4LTImvK
u0IBieYGP2wK7TbHfZSVkvTTF+uwcAYZBcC7KRoVfhFiAWBz5U4uGbqFGIw+7b57
AdW4qU4MpLNika/qEQeJDJO9l0It4txPcrj0SMGyCPrtTatIbWq1VqpzrZCODtBD
GnME1wXGDRaw7qfP2plXGWbak2mU34T50Dgx1m/Wub9J8BF6j1VD47xv2Xkkk0V2
T3Ih4GdLVGRwCgm/pDJS
=P2t5
-----END PGP SIGNATURE-----

--hepdbv2zwagcac3t--


--===============7523850218092673963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7523850218092673963==--

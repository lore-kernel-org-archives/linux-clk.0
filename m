Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 25 Nov 2016 07:35:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: megous@megous.com
Cc: dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
Message-ID: <20161125063546.n3s3dpxdi6ashjtq@lukather>
References: <20161125002852.18097-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="les5wtydnwypwiwv"
In-Reply-To: <20161125002852.18097-1-megous@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--les5wtydnwypwiwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2016 at 01:28:47AM +0100, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>=20
> When adjusting PLL_CPUX on H3, the PLL is temporarily driven
> too high, and the system becomes unstable (oopses or hangs).
>=20
> Add a notifier to avoid this situation by temporarily switching
> to a known stable 24 MHz oscillator.
>=20
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Tested-by: Lutz Sammer <johns98@gmx.net>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--les5wtydnwypwiwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYN9u+AAoJEBx+YmzsjxAgWgIP/2bmarhjizHyNpWPB+iEOC18
iXNdiubaPWF3tpc5Z0VaR2XOshxT4m7r89p5ICVxYcuhmuU72//vPgOD8xzgE+Wp
6U6Qy6WTcDu/paFCRR/gpQ2wY89vLHkbkosp5KtBhXg5M4riF/zPPDiDzIWHWOhy
sEhB1hyFVJBGTrbV4bvDPN0+6XxvhNfOiwOc3uDlVLWUQQQjt9iFC/CVLWQPK592
h76pMIuZZgWz/O2pwPvfeA1izmagkadQQ2vwhcOwPgEudBEHmw71KkG8MySTnlNI
xI+BRaTuDfELxFNvyrj9NVLAqbJmwmpIbbrBHo0bkhtQJbLuwir4VJF6Ydwiot5p
23FMGaCgwLAnNsK9jROx480XnUv6tXY+MU4KWzomdTCTG7JK5hbhcW5PDCveRCiJ
OTmd2o9T87uiURx05lTcwOoLQ4b/g2CiHOS1j0paRl/APH8uOENd+EP/nUf1Tx+z
neGywvnCuyNmJgJRvGSBbJqxKupVpUKRrR+9xgXZTmIVd1gqRqOvj/7hnv0KQV+K
BGDUo8yb5aplKGKNt77oMsWvyWw+VPRfpHI5JvrSOebdmpeH7IkZQUgbjXH4T9sd
XyPgukHmcfZHA3G3IrWN24JlvsdAk2Dl10ux+fwIIXRsmv6ZKl9Vc7d8jnTOUZ5p
6kePpNvrsxRZ87nrufpm
=byEW
-----END PGP SIGNATURE-----

--les5wtydnwypwiwv--

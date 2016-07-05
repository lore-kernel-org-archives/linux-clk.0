Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 Jul 2016 08:13:39 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org,
	Boris BREZILLON <boris.brezillon@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: sunxi: make clk-* explicitly non-modular
Message-ID: <20160705061339.GB7643@lukather>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-9-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
In-Reply-To: <20160704211220.5685-9-paul.gortmaker@windriver.com>
List-ID: <linux-clk.vger.kernel.org>


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2016 at 05:12:18PM -0400, Paul Gortmaker wrote:
> We have the following file --> Kconfig mapping:
>=20
> sunxi/clk-factors.c              obj-y
> sunxi/clk-sun6i-apb0-gates.c     CONFIG_MFD_SUN6I_PRCM (bool)
> sunxi/clk-sun6i-apb0.c           CONFIG_MFD_SUN6I_PRCM
> sunxi/clk-sun6i-ar100.c          CONFIG_MFD_SUN6I_PRCM
> sunxi/clk-sun8i-apb0.c           CONFIG_MFD_SUN6I_PRCM
> sunxi/clk-sun9i-mmc.c            obj-y
>=20
> Hence none of these are being built as a module by anyone.
>=20
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get mostly the same changes, so they are handled in batch.
>=20
> Changes are (1) convert to builtin_platform_register, (2) use the
> init.h header, (3) delete the MODULE_LICENCE/MODULE_AUTHOR and
> associated tags, and (4) delete any ".remove" functions.
>=20
> There was a stray module.h in a file not using any init.h or
> module.h stuff, so we simply removed that one.
>=20
> In two cases, we explicitly disallow a driver unbind, since that
> doesn't have a sensible use case anyway, and it allows us to drop
> the ".remove" code for non-modular drivers.
>=20
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>=20
> We delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
>=20
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: "Emilio L=F3pez" <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXe1ATAAoJEBx+YmzsjxAgNO4P+gJHrc4HngSfIN9yusPi+EEn
bRdp78Uj08H1yk/FTf4Yvo+Sy3D3VnVqzrJEe+CaFEb+17tKOt0O6G9Zk88ZdoyC
53Cq7Nxc/EfsaOZLPiRtmdvzWFBc49acmz63sl1fDZbK6w98iDOg6rwCu9e2+6ez
o5YF+U1xIlehXiGooYdTzcLfVyR1Zr21M6GmWZ8ZXd77kWhT270QMflDvKocowkk
2GvpASHicIDIzxWuoKHSlPmxegrRWDaY0c1W5Qw4HFyI5Ak6wpmqLA0GcbIy08OO
m5+OvR+Qmu57aYP2wxwhcr+eB3n+A5XeMfF1jWimbx0pJwBY0I29/WhtcNQ5I6Aa
7F5c1OcfFyWSALdkwhYWqVc8oJ2u4GyNkrH9jTRYhy0z8FiSosDDoVD0YWVTOpbK
BKr5eimjczMJmUa+m54JThWSY0RZAQ6OBiBRJGsmDaqq0zxSm6WzkGvCTD+aUTS9
WopzANLB6ZOPGHwbzd1xYeUqIazJu3eTe41GG+AforlNUa1SWwsSICFDwv1/lcMZ
R/LFT+GWkR/qXPdYEm/odyx6WrOOEQkaTvXpUo/UqO6d1sCprvFKFZ32hELDhdzl
qxEweE8075/XP0LYuaCWkOIo5zQgb7/0bqEayqrFhREFm3TCEH271brMtEpK5KJ/
9UWZowRjKr4odJzJzu99
=mCln
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--

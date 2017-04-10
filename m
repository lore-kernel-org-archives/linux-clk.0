Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 10 Apr 2017 10:00:48 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.11, bis
Message-ID: <20170410080048.l7xjndj457wa2b2q@lukather>
References: <20170406074121.tkivdvghbr27tr54@lukather>
 <20170406231003.GS7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l2gir7nq57qwo7vk"
In-Reply-To: <20170406231003.GS7065@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--l2gir7nq57qwo7vk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2017 at 04:10:03PM -0700, Stephen Boyd wrote:
> On 04/06, Maxime Ripard wrote:
> > Hi Mike, Stephen,
> >=20
> > Please pull the following changes for one of the 4.11-rc's
> >=20
> > Thanks!
> > Maxime
> >=20
> > The following changes since commit b467e08a15563dede0d37d3233baa24fb97a=
7310:
> >=20
> >   clk: sunxi-ng: fix recalc_rate formula of NKMP clocks (2017-03-20 10:=
34:05 +0100)
> >=20
> > are available in the git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/=
sunxi-clk-fixes-for-4.11-2
> >=20
> > for you to fetch changes up to d054a839a0986136374d49f9f9fbc264abae9c4c:
> >=20
> >   clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER (2017-=
03-27 13:37:05 +0200)
> >=20
> > ----------------------------------------------------------------
> > Allwinner clock fixes for 4.11, bis
> >=20
> > A few patches to fix a build error and a few minor typos and bugs in the
> > sunxi-ng code
> >=20
> > ----------------------------------------------------------------
> > Chen-Yu Tsai (3):
> >       clk: sunxi-ng: use 1 as fallback for minimum multiplier
> >       clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum mismatch
> >       clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code
> >=20
> > Tobias Regnery (1):
> >       clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER
> >=20
>=20
> Two of these are fixes for regressions in v4.10? Why are these
> critical for the v4.11 release? The comment patch is totally
> bogus, it's not fixing any sort of regression that is causing
> problems for people so I'm not sure why it was put into this pull
> request. Am I right in assuming that the only real patch we need
> out of here is the last one for the build error from randconfigs?
> If so I can cherry-pick that from the branch into fixes and the
> rest can go the next merge window.
>=20
> Not pulling for now.

Actually, all of them but the comment fix are real fix.

"clk: sunxi-ng: use 1 as fallback for minimum multiplier" can lead to
a multiplier set to 0 in some cases (depending on the rate asked for),
and "clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum
mismatch" will prevent inconsistensies in factors selection between
round_rate and set_rate.

So, yes, they are not critical fixes in the sense that it will fix a
panic. but still those are bugs.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--l2gir7nq57qwo7vk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY6zusAAoJEBx+YmzsjxAgVVQP/ij54NPjzbGqjfOWc9fpoUvu
Ya2VzouMIXpDZI7tnuQM96Bd5xSoXGgASrbz6x1TM5zhtFoNVAvVEjEbVOw96ZJu
zJgJ3lWyxCHcvgA3C1IgsZsINFbRckYibjggBCE/h73VfZaR8F2OPCZ2yEydpK1o
QXbLLpT6CDRHZk+B2ciW7NY9VQB77Olf0WxAYi0Rcp1T6rgNLn2c/8jxRh7AN1nC
W7/bBGKcWbSKClSm40gRXAIyI0bBIOpR6hveRiSu4U4ZFsfdULAwrXA05ijgUBfb
B/rOrmnpBEiRJ9sCw8sNjbXrjiVh4ZUgZ4EC6IlOXM+hNtRD7k8Vi57biN0aHix7
gJrpuIz8z1jt6qq6lXegvM4fmh0EfJYKA/ektlLB4njoAJ4eKDdoJ1RxZJiAf2NS
sVwVMdl707lcrsmFv3JYeRycErIZy/r+wPCc4RepAs6ATWKnmNGz4aTwpJzYQ4Za
+ejT+DBKjn3/EQsr+yG5pGVcE9yuoBB1Sr4FqdVCw9h7/KDb5EECfWIO5G8MaBL8
lNVISJAHQbESOfSJsv8w+FNJ4WLBegEV2vyaawUGGIgc1Qrp+eI8oplfoRM1CGQm
5G5dN0tDR45W84WY9UJprynA6iexlWFsZbky5/SNXTmUZht6Qhpg7qhn71acmt3s
jhvMdFX39cVZfGjAHXbI
=dX34
-----END PGP SIGNATURE-----

--l2gir7nq57qwo7vk--

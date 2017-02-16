Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 16 Feb 2017 18:53:18 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: ccu-sun5i needs nkmp
Message-ID: <20170216175318.fuj375743jt43um4@lukather>
References: <20170214213005.2848151-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fr5iuajkkwudz4xy"
In-Reply-To: <20170214213005.2848151-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>


--fr5iuajkkwudz4xy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 10:29:45PM +0100, Arnd Bergmann wrote:
> A randconfig build ran into this rare link error:
>=20
> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.1+0x4): undefi=
ned reference to `ccu_nkmp_ops'
> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.7+0x4): undefi=
ned reference to `ccu_nkmp_ops'
>=20
> This adds the missing 'select'.
>=20
> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queued as a fix for 4.11, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fr5iuajkkwudz4xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpecGAAoJEBx+YmzsjxAgk3EP/2+ry8D9N2rDfzPBIF9EbEfD
um30yQeBrOClVmy4eJRQOXOiG+9YBqGv0Ms8R5dKptpRMZ324Tow1XK4Gtzi7Ll0
0l4CrvrzpNTaAYXgcjFiIhcKGXFycL2v/cWaXzxFfu8bHajKpfozlHTh7LPfhwYM
T+b2jly2Tv/PSHeFnDypres5eHtkcZYQZXw3Wj48hP+IJnq9x3+DVT3o2iyzaQLj
fhGXOur00Ap9+owtuBEc3dXeZhzkDXAi3aFxbhpjIWqnB7WmQkK2a8vkLZIRilxJ
JGW2GnZofNT+czAsBvyxRfigdRAt6nmQBKtXkHPDSJPtZvC0303udbB8x/WtBvfW
gAj5ABbYn/j1u2nFn9Xw+7884OwW/HpKElKkAqAhFoara1PHdi8VmXomFWiCavVt
ade1hLgDfleyTVEtuKlkKObDP6skQR4AbF3ulRhoo/BW8+WA6zT536eDRRF815Ql
kM4QHX0vGorN0tKOXL7n8fyAh8fmAHOL0pGBeb98G+5rRVTemAXpUZJGemi/4lyo
Fi+psqNlkBfoqerpuaaFEqS8bCB4ZbnKyEl/SQ2mI9NB0o79/Jpkc51rckElmNcV
tFLYEBT62/6pcXO8aPGMzzUhm5z3m0wS2kbq82Dvq1kFMVhXQ8CM1uUiiwG2S3bF
MfEoX41yQdfo8JIgP6Rx
=gVPP
-----END PGP SIGNATURE-----

--fr5iuajkkwudz4xy--

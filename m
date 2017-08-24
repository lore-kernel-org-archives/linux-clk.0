Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 24 Aug 2017 10:50:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: fix uninitialized access
Message-ID: <20170824085035.uznlemp5dzpts5ms@flea.lan>
References: <20170823143937.2176025-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nymlfymace5gdopi"
In-Reply-To: <20170823143937.2176025-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>


--nymlfymace5gdopi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 04:39:27PM +0200, Arnd Bergmann wrote:
> gcc-8 reports an uninitialized variable access in a code path
> that we would see with incorrect DTB input:
>=20
> drivers/clk/sunxi/clk-sun8i-bus-gates.c: In function 'sun8i_h3_bus_gates_=
init':
> drivers/clk/sunxi/clk-sun8i-bus-gates.c:85:27: error: 'clk_parent' may be=
 used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>=20
> This works around by skipping invalid input and printing a warning
> instead if it ever happens. The problem was apparently part of the
> initiali driver submission, but older compilers don't notice it.
>=20
> Fixes: ab6e23a4e388 ("clk: sunxi: Add H3 clocks support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

That's weird it stayed for that long without any compiler noticing.

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Mike, Stephen, can you pick it up as a fix? We don't have anything
else coming your way.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nymlfymace5gdopi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnpNbAAoJEBx+YmzsjxAgCi0P/RMcqNg8wTz19tCWbq1TJRzY
wX2amoZtd/OvKihlSY1GPoQveEUpQceFwJOU7d/ceBcu0GYFaypOtdcrPTcmhUPV
FnL3fcoFS9R7fDfPQUSYEsQx+pO6FxJI/hwQFosG5/dGeihielKHBc38nlmXa5pE
IGV7fZXrIe1MBG4TOE2kItjisPe/33CdrgBv7Si4l5YYwSi+IcLFGfLwkOJGfGgf
ZMLhuRK2rSOlRQ+CtA7SqClAwTpsrXMfmoXmELJXzDNRduQ4Ycr5GwFIA3h0Z7Iy
bpAXepxoyCyRmLHYhW6sp6aMunnBHxfrCIgbWhpuo7yCLc5JVwsYXWGwx3bmjhhE
1HCsR7PyrOD4W14F3yataEfR2rkLbRa/v+L6AHlzuWChSqkCG2NGbcmzKcA6qhG1
88VRqslNIx52d01Vzi+CkhYx86zRJAULqsCgAEEl17OWovHthwlzf4oyfFf9vaGy
ODpGoLBBPDswFmFXP/KDVJ2gLgSPcRAHZDpL78JPed7M/BybaqGcmM82WiCM3IEa
3CHgr7ZMCYsjQwhsteOhqLLrg1X/HHeHFHqxXRBW7NJApBczn0vCoHrVhpHurqX7
J/cane4Mcnjq/IwYR8zlJT6uy1s4sL63rmkEl+q8l6/raP+PomxPQnTYOtlnMy1q
pSyL8IF8VKfESo3+H62j
=4GpJ
-----END PGP SIGNATURE-----

--nymlfymace5gdopi--

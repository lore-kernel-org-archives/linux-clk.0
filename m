Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 22 Oct 2015 10:36:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Remove clk_{register,unregister}_multiplier()
Message-ID: <20151022083647.GQ10947@lukather>
References: <1445470433-28374-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rUztinBX/EQDJOOk"
In-Reply-To: <1445470433-28374-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--rUztinBX/EQDJOOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Oct 21, 2015 at 04:33:53PM -0700, Stephen Boyd wrote:
> These APIs aren't used, so remove them. This can be reverted if
> we get a user at some point.
>=20
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Suggested-by: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Reviewed-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--rUztinBX/EQDJOOk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWKKAfAAoJEBx+YmzsjxAg8EIP/0fkuCWP7Z6+uAY/iV88uuO8
2Hw5ZShacelvjayRD+gFPSj8zKYVZ4g1blUKod6aaMNvv6113peKud5ovYTE/bv8
QZ/JMXW9d+V1QVUgKs84x95ggakTPWpkKbifOYW/M06QCpS4+6MumL2dy/fKuJN0
udvbUz4UXn51GiWp8j7FlypWRVGkF2lPF1O/hjIrrRlMFk1d/87zzA6N0pPT326p
VbUbvbp8LNgE1MgupASIyueEaJtFoXXIUIzXAhcNesqVU9vfQmwoGg/LPz7kwQ22
UFWkVRxWjzFQ5IML05Nz6YuU6Q8iaya/g6QjUbSt9afam84RfFWUkXYCA4Xq0+Rm
byA1r5UFftaYc6QtwY1hCfLs6nWup6CPaU/Lo7QgrB/wvVfQWVbobr/JTwWlP+Io
ydUloAIxXkcATJ9i/N4xhqNWhfH2jsMqFG5es9PMpe/WCIOCPorRoKPkxF/cuajF
hKu/FEPeUSwn0ItgzerqHpflxGFGTDrcA7SFU0JAMjV87iro7gyxW2pb1y1bWxYn
zcMZhy9mADaxTF4ZEDH/xHXU87PmnhijN6bSpHvplHvhyC2UpI/TTzTMzzAv9c+i
8xflNIbepsTVqURNb8FLpW5GQBYupDwxCgolC6ziLozeGtpDJ/W+J7AdRDsgIPn3
SSssFDysh/6MvbCO2XwW
=nudM
-----END PGP SIGNATURE-----

--rUztinBX/EQDJOOk--

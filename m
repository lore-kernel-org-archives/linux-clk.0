Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Jul 2016 10:57:11 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] clk: sunxi-ng: nk: Make ccu_nk_find_best static
Message-ID: <20160726085711.GC7190@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-3-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
In-Reply-To: <1469516671-19377-3-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:24PM +0800, Chen-Yu Tsai wrote:
> make C=3D2 reports:
>=20
>   CHECK   drivers/clk/sunxi-ng/ccu_nk.c
> drivers/clk/sunxi-ng/ccu_nk.c:17:6: warning: symbol 'ccu_nk_find_best' was
> not declared. Should it be static?
>=20
> ccu_nk_find_best is only used within ccu_nk.c. So make it static to get
> rid of this warning.
>=20
> Fixes: adbfb0056e03 ("clk: sunxi-ng: Add N-K-factor clock support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlyXnAAoJEBx+YmzsjxAgUI4P/3XbwhVUfyT6JgI01OnSJcn5
MP6HQtXLGLlmpqjTfzIJz+zYlyjEXXq8I5LDWPSiXUF8snOH2lP2nQkgqLpgQE2F
EjOHF3ag0vCHS5wB93jtZEK3GK/1s+KuLBhAjWSOb0IUsWHL3cWMlyqQ7mr4g78F
wOr0f1z8aSYLd50PX9O/HaL6gSPJh6J3h7b6okIrtPbjVT7IgDhmC0oBXAyHcAVC
AXUwWhCOeFfHN9aQb/1zFJRjBuWB4Z4lyCATDXqQ8ivN3+xng3gmr9u4AW+7Ljgg
88Y6TESrHhwXxEZk2oBNQqWtZZuVwY70uaaiy4pckDZGzyFYsRK0oOVKAgGvrva4
S91manZUWuIIoQua01ZlVqSyViqaX1XgAE311dLY2XWJ8smrFv1clIF0EtGt+VCr
iQfkiyNWiR+OJKlZtLLABCR0QPrFAOQRsVpdqshOZE3oq+vNXh2LfO534wCljcVh
qUOqeQ3WZY4ClfZlqVHUj6A+aY0WxHgELdkgkLd3f/551Ez3NfjbOD60kkGDaO1F
kyMZKcNIYsWl8ndPHhN/OF/Oy2/EEbtEK/jUMTEh1Oj/H64LNYM4CFejR6zUd9+z
IwWVZcxb7JSrH6jLn230HeN/ELQZxNV62IRz0Jv0GsKTPt59R9uT2KK1uZ4ajHsx
NQ0sPYRMuBmdEAlmCkSY
=6FB5
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--

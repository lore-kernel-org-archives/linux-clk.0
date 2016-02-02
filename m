Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 2 Feb 2016 18:33:40 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: don't mark sun6i_ar100_data __initconst
Message-ID: <20160202173340.GA4652@lukather>
References: <1453727747-23307-11-git-send-email-wens@csie.org>
 <1454428571-4040607-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ON0CT8LY+wgE1XqS"
In-Reply-To: <1454428571-4040607-1-git-send-email-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>


--ON0CT8LY+wgE1XqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 04:55:30PM +0100, Arnd Bergmann wrote:
> The clk-sun6i-ar100 clk driver is a platform driver that may use
> deferred probing, so its probe function must not access
> __init symbols. Kbuild warns about this:
>=20
> WARNING: drivers/clk/sunxi/built-in.o(.text+0x15f0): Section mismatch in =
reference from the function sun6i_a31_ar100_clk_probe() to the (unknown ref=
erence) .init.rodata:(unknown)
> The function sun6i_a31_ar100_clk_probe() references
> the (unknown reference) __initconst (unknown).
> This is often because sun6i_a31_ar100_clk_probe lacks a __initconst
> annotation or the annotation of (unknown) is wrong.
>=20
> Removing the __initconst annotation avoids the warning and makes
> deferred probing work.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 3ca2377b6fed ("clk: sunxi: rewrite sun6i-ar100 using factors clk")

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ON0CT8LY+wgE1XqS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsOh0AAoJEBx+YmzsjxAgNZUQAIPH+/ZLru4oqDSpb2GdVCVv
GDb87NYMLlhOrk2Xhl4YrJjC7drtBZosWEzgQzUkKc3o2+LS7O5UBYxX8hI76vrB
iaPNE8oC0iHglfLPJ5m+x7HIAMHkMvI6KZLC8L15O0Bhq2Y/WAyg66y3D5Iht3/y
ED+rHxJMGj6Mwec48koIGQtNDwxY7JFaflBqnmJFOWHCv7bdbm+vYqubJAfa3fEO
cSv9lavTG/u5wmlqmR3C2AdJgEfEwaiYAZsf2GXfyIqaki96pRMpvyuAOjSW12jr
Em8C5l+SiaihzoHyZw5mEXeEtQhXYyWPeAFY9XzfgsH2lRtzRs8FyaIkAGTFPPHo
eF83UjGNAqpAHZMptCTrSU+Mo0WrEsmU06kPa7bjSpE57h8DaiqMeeQC0vjvQmat
ScC8K4P1WwSP+UbAr2GCg+PrkHlCzQswH8FvC9f7OR2LifzeGZfS2RwoCNFjjDdD
cbRVtNnQsR4JUFk4ZCifY3GSHBUX5QXgm3mBeXCdn1sUBdboW1tMZD2HoSY1HTAU
l9SgjfAzLuotu7kmiwfHvH265IdHT2OInMskUc3/qruhHSAYa46e/phyFoLxw4nb
qvi+qAvpiwpL6+tf0O2ASVOaXtEPI/w6T1VRh7doOIGh1+AfVzmkL76AKAxNzEgb
JSbAbfc+lzbaVXMyrtXG
=Voyh
-----END PGP SIGNATURE-----

--ON0CT8LY+wgE1XqS--

Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Feb 2016 13:17:13 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, heiko@sntech.de,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Remove clk_register_clkdev calls
Message-ID: <20160204121713.GH4270@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-6-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
In-Reply-To: <1454402834-6385-6-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 09:47:14AM +0100, Maxime Ripard wrote:
> Now that our protection code doesn't use the global name lookup anymore, =
we
> can remove the clkdev registrations.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWs0FJAAoJEBx+YmzsjxAgQIEQAJyYOwqR/t4+64PhQRuXbKtP
nYVAn1Fu9afG6hgO/cAIESoYIxQTFks5snKiSIjNFafk0643GgpmokmugWLQNyIi
l9Qz4SYIzB7sLF3umWvJizCILYin/pkrRGeyviMAfX6nCNq6MKf/rukMUG6TMMZv
fSljFuh1udgIbWgI8PPiAjp387KEjX8dQctwYwqm1Qz4HlQvnA+gYUoXO4Jnkgr0
oCm8GsWj0Cnbwgc/w4jHIcFvyL4XTtQ7khPc+0zGD5HdqjBe1TsUpA8QogVzMCrL
nIfXujcYn7Z7bxYND+nzkA56WzXhUg7D+S7JcwHNswh0TLVznnCkEAWEW6gD2fUu
wiVoO/t5tT2SZVUS2OS0BZvcCW8KX8QD7nf1zTMrgVaZDIdcUZ7tdqduu1VP+fds
yRrnoxfFLYUI7cNR/4r6UMa3ye+lAAahPRoMo+jZweVzRGNVPtI83x2uZhP3YLWi
HLzaX1bWmJS6fN4AgYDF2xjkUHybzE+9Q4kvpfo0AyTSaT1rRx2F5ssPTBdHDr/7
YzToaUazXmFuvFBuhovi2xDAflUrMyEaOZCPxGJaz3s5ssTMGEDmGLqhSTnoYQUw
v62tTEQv22SJEbRfZOx5BMQ2GMT8feahSjv18Q56t6RsBuEngkkiB6iEQFUNCxqr
JI5HlY0xElXrHqV/Z3dO
=+1cf
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--

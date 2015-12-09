Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 9 Dec 2015 10:17:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5] clk: sunxi: Add CLK_OF_DECLARE support for
 sun8i-a23-apb0-clk driver
Message-ID: <20151209091744.GW27957@lukather>
References: <1449126330-21595-1-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9+ohdFDUqiMJzwPo"
In-Reply-To: <1449126330-21595-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--9+ohdFDUqiMJzwPo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 03:05:30PM +0800, Chen-Yu Tsai wrote:
> The APBS clock on sun9i is the same as the APB0 clock on sun8i. With
> sun9i we are supporting the PRCM clocks by using CLK_OF_DECLARE,
> instead of through a PRCM mfd device and subdevices for each clock
> and reset control. As such we need a CLK_OF_DECLARE version of
> the sun8i-a23-apb0-clk driver.
>=20
> Also, build it for sun9i/A80, and not just for configurations with
> MFD_SUN6I_PRCM enabled.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9+ohdFDUqiMJzwPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZ/G4AAoJEBx+YmzsjxAgznoQAKd3m6or10ovne3wo9WH3RdX
ZR4A8bAITnlxq/YW1/l8IOPvWaeAieQIWiLVZ9QiKAFCogCiVklzuSKawcVJ0OrP
UE4vSqvHJ9xsu/JDREtEuJPuSy1pf7E2rswylsKoQJHEvZzjt6Jg2G6NeTqJkbRd
RDQrnqxNUk+v+86JyiDqPEw3Zkxvvphv45z/sHHoVhld6FCt2pgREP/K6lpEi3XZ
BiXpxENmUoa24TVkR2UhnJUx87BRtVOjHWWWClRYoN0lYgQpggdl2nyAcJXo/Ta8
WuYziNpoMDgsKPl69mvoXeW3J2cHmNvPQNojUoGd4v52Jp0S+VZ3cjOefP2cikF1
QSr84SEW3NJKmh/8BDNlFsf8ZIXMDmwi7h4F+h0FzOsHc/Xv1ZnygzI0qfsMBFcq
XBq+4cJcuAOa5DEQY7hSxXbAmB2uR0yGWb3teRSrAGeTKZDr/IR4acGEonIx+JdI
zTCdStYoOAIHAOEO6UOYsgsw1CAZsUJPSUbQmlUyROWeynCiZ8pozYXEMCt3b+wW
lYORUAlEyZ10udGU8UcbTcUIddvcXoYuqurBOp4NiEkD9kt407+miyaheeKrNJin
b2XZUdLlItKeYJstI43UnxqRt5aQDxE84lIbhWfG5FZxwRa6dmI1j30Ie8HditVM
pLqqaVmKEuIfxNwD8E8n
=9N6G
-----END PGP SIGNATURE-----

--9+ohdFDUqiMJzwPo--

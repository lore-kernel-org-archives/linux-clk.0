Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 18:29:55 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 06/11] clk: sunxi: factors: Consolidate get_factors
 parameters into a struct
Message-ID: <20160127172955.GK4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-7-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JsihDCElWRmQcbOr"
In-Reply-To: <1453727747-23307-7-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--JsihDCElWRmQcbOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:42PM +0800, Chen-Yu Tsai wrote:
> The .get_factors callback of factors_clk has 6 parameters. To extend
> factors_clk in any way that requires adding parameters to .get_factors
> would make that list even longer, not to mention changing all the
> function declarations.
>=20
> Do this once now and consolidate all the parameters into a struct.
> Also drop the space before function pointer arguments, since checkpatch
> complains.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JsihDCElWRmQcbOr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqP6TAAoJEBx+YmzsjxAg/0AP/1+XHJzMuZOqBgZjGRpnU/hb
xq8u/FknfpaRg3chvYOJhjuTcJvUWJ4Ex6SmXwJZp/3vG+x09f/qF20K+iZn4dal
9kn8ZlIgIb0rkVySPfa80c0JMQVbByGehSvP1J1UOpFfvtpUnOUzRfsGndGBc0ld
+bu8a2e4pCLrKA/KQ43pE1qLuHVf9ruIbub19rFtefSTOyJU/1Qu+iyF0rCbs2i2
Yt98AynsYdDT8su0H8urh3U288ilFkARM2YgvAHmkHocrjvthE+Bv0jGT36we23g
NIi+Kr4i76ePybpM/ooO0QYWmBXHuHhkG42egReZbMKNbvpznLMtO/1Y5SWcPMzx
DELJ4pNarCwQFNO5pu/CugPHtPEIOUu4585vglZbdoVcXcGkuLeCoI/XA8pIuz36
M6Ptwb+KobdQJO0B1HESvXPnKHvt3Cl719Z5CcBtNSh72vbBZjyjfZ0+whaX6/FD
bVhCjcAFNMR/2K5TlUFb1oFMTiRW+xvSBv3FzGYWB87CIvY87Fr22ZJtzM5ZOKpV
G+OGtCfbhdlj8DbNoGSfEY5VYPE44zT38w604tBOa+0lJYbowGjT2mrP0czHCCod
ax7m49NPMG46cPOX4NOfauvTTFoMp1DCraskLxDnzKBRuKZZc9zedtX0EFpMGj8q
OzxTCe2bPlzFoURzC5wf
=G28G
-----END PGP SIGNATURE-----

--JsihDCElWRmQcbOr--

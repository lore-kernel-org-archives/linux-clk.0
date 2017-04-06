Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 6 Apr 2017 09:10:52 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: sunxi-ng: Display index when clock registration
 fails
Message-ID: <20170406071052.t342oowda5yu5bdw@lukather>
References: <20170405165227.6985-1-plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5cykndpr3qfmglbd"
In-Reply-To: <20170405165227.6985-1-plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--5cykndpr3qfmglbd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 07:52:27PM +0300, Priit Laes wrote:
> Add clock index to clock registration failure message. Clock name
> is sometimes not available, when things go really wrong.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5cykndpr3qfmglbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5en3AAoJEBx+YmzsjxAg7fkP/iaFPLlhGSxUkkTxegkts7C/
ju7ruQUcCckHfX/3r8zW9Y7oCtaDgkEX8ks6nSTGfyWk8R44Fukb1FhaBlbDW19C
YueJ2XZI3hnmHDZfnd0whpxOrPsxxjSYE7nkAyYZsRcdIsn2cwe0I4ov8GJSDdb1
lGqYsD+fXmVIzNvV9TxCkY99s+y14iIvpSULM/wC/QOICaQSzkxRkrsOp2jXboWR
KDXtkNDxAnmMlzzyUA62SSdEUM2p6LPlQMM8X0YO6IaZQSga+v+dOM3Cjb6KSy16
Pz+MyJ/M6ZSiP1PHB+YeRRbESG6rReu8WucYgSj1rgC103dQnRSHfQlhnIkhiThG
T3iScBLH9XnqPGIlqJEFH8CUm4upnbCFgXyb8V02F/jMZjDjO5mgY5lMG60MQzPS
a+++6bfl1ro8mpzC56VbdjCgTJ7zARnV1KHkk09A2B3N/yiS4SA+uPgXnjgrGCDL
ni9/elna0WOY9dAiXCC6sBvFVUr0O/J6O/NrG8gOIRamr1un+e3x4YNcKAPwNEMB
2FGCrvyMoSjI65OsVGe9GorVFzBi5SSsXnaXtZ0vM+Oo2pYYOnG5/JL+JyA8fjuw
1nEqIqENTXSbZ/ByrR4scKfhsDiSxvFemqVcLwnB/o0b6gHwMzQzjCyoJCBwv7HL
uNLADI4ylFFzW8Vfh4p5
=DLcV
-----END PGP SIGNATURE-----

--5cykndpr3qfmglbd--

Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Sep 2017 12:01:50 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 09/13] drm/sun4i: hdmi: Add support for controller
 hardware variants
Message-ID: <20170926100150.5rgmraenrriekhna@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-10-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vn4jicumbtbjskss"
In-Reply-To: <20170926065919.24446-10-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--vn4jicumbtbjskss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:15AM +0000, Chen-Yu Tsai wrote:
> The HDMI controller found in earlier Allwinner SoCs have slight
> differences between the A10, A10s, and the A31:
>=20
>   - Need different initial values for the PLL related registers
>=20
>   - Different behavior of the DDC and TMDS clocks
>=20
>   - Different register layout for the DDC portion
>=20
>   - Separate DDC parent clock on the A31
>=20
>   - Explicit reset control
>=20
> For the A31, the HDMI TMDS clock has a different value offset for
> the divider. The HDMI DDC block is different from the one in the
> other SoCs. As far as the DDC clock goes, it has no pre-divider,
> as it is clocked from a slower parent clock, not the TMDS clock.
> The divider offset from the register value is different. And the
> clock control register is at a different offset.
>=20
> A new variant data structure is created to store pointers to the
> above functions, structures, and the different initial values.
> Another flag notates whether there is a separate DDC parent clock.
> If not, the TMDS clock is passed to the DDC clock create function,
> as before.
>=20
> Regmap fields are used to deal with the different register layout
> of the DDC block.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vn4jicumbtbjskss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiWOAAoJEBx+YmzsjxAgPMcQAKhJka5rdrFFsuwE4TzuM/uL
01lg0F08m96IHLjmQoZit6Wopz6E1ABGLdkjEG1TFAXZU+bvBi19xC4X6K6MUaIj
HhR5cZOauwQBliHkOR3Z9Wzxfzu9Z7zO+c76DAqvyaWgSR3DYM3Vs/jE6hQCj5Nb
H6G6tHV9M9Jh0holZYsewec6x87N8X3IVkqm/lF/MMN4UbJDLviu9bhcUaN4Sp73
xfsp3cQ7E7WIQW3cQa/prQXn9IaLBoXAAblzlyxY3KZPYYyrTSPal7o4BghT7inb
glS1evTlnXZNE0W9azkVkwnm41fXnJH/JBWa4dQtVAenzp6SlHt8lBDHk6VGcgal
qcxLEb4CawFkmC0nQSwEoBAEmUhiReqLn9IdZ6MNQMzEL7pZPa9wnQ9676xaYHyV
FGROBVHTOKyjpFRfbyNMp2UeRMoba4E7QNTykBuwyaRTSza1l/7dcaaKMs1cbWkH
iHWCT9q0nNmWCjFiW2vMeOKpEy12chiDy9j0S9T4hkARnha2GEINTLy9Ly2m5b40
nbprpEAbz6T4wdrP5KIGNmiiYU+dhCWBMxYaiYGCYM2CGdhgnGLl/OcxwKngF0ya
yd8w/tjgydVppc9mNouf96dG/ZSdh1JHjFeCRiUN3i1HQ5qP8H44yCSEV0vcXtlS
ZK17qJzwTsub7bSeN9Zb
=JMgp
-----END PGP SIGNATURE-----

--vn4jicumbtbjskss--

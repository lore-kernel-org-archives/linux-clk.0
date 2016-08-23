Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 23 Aug 2016 22:00:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/7] clk: sunxi: add generic multi-parent bus clock
 gates driver
Message-ID: <20160823200019.GQ2598@lukather>
References: <20160808172149.30861-1-andre.przywara@arm.com>
 <20160808172149.30861-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tk6xM/wkRlnXD2NA"
In-Reply-To: <20160808172149.30861-4-andre.przywara@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--tk6xM/wkRlnXD2NA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2016 at 06:21:45PM +0100, Andre Przywara wrote:
> The Allwinner H3 SoC introduced bus clock gates with potentially
> different parents per clock gate register. The H3 driver chose to
> hardcode the actual parent clock relation in the code.
> Add a new driver (which has the potential to drive the H3 and also
> the simple clock gates as well) which uses the power of DT to describe
> this relationship in an elegant and flexible way.
> Using one subnode for every parent clock we get away with a single
> DT compatible match, which can be used as a fallback value in the
> actual DTs without the need to add specific compatible strings to the
> code.  This avoids adding a new driver or function for every new SoC.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Jean-Francois Moine <moinejf@free.fr>
> ---
>  drivers/clk/sunxi/Makefile          |   1 +
>  drivers/clk/sunxi/clk-multi-gates.c | 105 ++++++++++++++++++++++++++++++=
++++++

Aside from my initial objections (that I still have),
drivers/clk/sunxi is in maintainance-only mode, we won't merge any new
drivers there.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tk6xM/wkRlnXD2NA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvKtTAAoJEBx+YmzsjxAgThgP/2dRxsuTLrE+OYHyAaRUfmdG
8A7v5oIboixVokD6rPp/lCv5lZiPNo0Y3J+mFnXs1l5eD1k4tL8ynLHEw7YKwDfB
HYp0kBQX/lNyfNm5UnLzO3f22js3LUt081EdS7v5atZ46/bTXwTpPnOLP0f5JOQS
op7uPc26M9NwH5vLcuhYIutJgTOF+p0LEK8wXni/VnPQDeopOdq+Mxt3Sg2eCW96
zie9hvOBRtookjPLa0sXfKdiK9BtDn7DW09RQhqbBfI9SzO/sks7qpzAzmUIjs2s
ory7IBIYurQxG9DnEeDYY9bB+U6vNoGXpjOfz5FqbdUNf/4GRgtNtvfKnb5XrLpL
A+bWksPeIY3X7Yzp3SR+eyeUWU1GELIxwnU5CJBxB4O6sJRTZewO80H0DMy/n7Tf
3AmXwkYLR97JDJQTe04+4elT4MW3Qtn6oYZDfxXjlNyyjs1PGIoGQba+9N4WJPur
bzI5CkV2l7eLw9oyefCh9PDbYFwCsb09JSG6fC4uiXUYjlUFJ5HcMGiLMhv2p+H7
nZYnpntX6dhEAiePhtR6hpKJnaCIBhRn4Qam4WB4CxHoH9NG4VEg6iX73Ln7/fJ/
zrIH5rw2kEsrtPgjoml3UfNLlqos3BDfSMwMOX+roKkIRABuObONjZO0MqHlyWv2
2aCDwf01HMVU8rvNJt3p
=pOJl
-----END PGP SIGNATURE-----

--tk6xM/wkRlnXD2NA--

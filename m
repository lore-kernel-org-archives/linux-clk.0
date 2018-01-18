Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 18 Jan 2018 11:53:23 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com,
	wens@csie.org, architt@codeaurora.org, a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, Jose.Abreu@synopsys.com,
	narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 01/12] clk: sunxi-ng: Mask nkmp factors when setting
 register
Message-ID: <20180118105323.fk65vo42eyc6dbzz@flea.lan>
References: <20180117201421.25954-1-jernej.skrabec@siol.net>
 <20180117201421.25954-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6q4btm2bzec5t5fe"
In-Reply-To: <20180117201421.25954-2-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>


--6q4btm2bzec5t5fe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2018 at 09:14:10PM +0100, Jernej Skrabec wrote:
> Currently, if one of the factors isn't present, bit 0 gets always set to
> 1. For example, A83T has NMP PLLs modelled as NKMP PLL without K. Since
> K is not specified, it's offset, width and shift is 0. Driver assumes
> that lowest value possible is 1, otherwise we would get division by 0.
> That situation causes that bit 0 is always set, which may change wanted
> clock rate.
>=20
> Fix that by masking every factor according to it's specified width.
> Factors with width set to 0 won't have any influence to final register
> value.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6q4btm2bzec5t5fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpgfKIACgkQ0rTAlCFN
r3SYvQ//UmbXMWHqepUl1Du0cP1776UEhGRH+prCCnAn4zBccM113wgozjTlbgI1
dlzdYZXV0EtWq2NA+wERaE4zi9owZismhBSUwIQtwcrorfyviSgsijCt9PtRGkio
doxYa/izgqhtz/Aj9NM7ekN/aKbzkjKveH/+KpTFkvI388cIwrumIbdyBL3lLq4J
t9djyJYWxeASezywALXjdR1kyhUnbUCGoTWa3IsftSGhMORKByEVNrkOsMfnNoOz
oyEhpMhNDrPCViUtodvj1GxEAlw7jvOAfqi0MdqbjAXa2XezaJgguxNKWbv/VJwI
wYHvMVN9lBMB+mO9BQL9BbVKoV+yh0CBtYBKJbBlKjitYp5TvYIfDfwB3gh3P7uv
ffAJg3hVe1z4YJFwhQ0VsCm8QvnZJpE/5PBQkhZP4n+uUfgkVjj99ssH3VlF2qf0
zkbilkHjh/EafoZ2xyCp0pL1PzOi3f8GtaM3IFdo+AVqrTKfB+mORZUsFMRn/9NS
Xy+cQ3hSSRDtVDV7ryXihAkAQniQa8GxclUfsxaztqAvAdtnAFl2q4H8amI5x+QZ
Xns+ybiAp42/io40xLoi8uNKrsslCEuHR8ZxxpeTpxpdONqUTYPCPjkaFqpCNd+a
SnWA05Y9WfupockFvcPkvrmcnUzuUgwSTZ3ZdyKdNrEsXcz2St0=
=NRHy
-----END PGP SIGNATURE-----

--6q4btm2bzec5t5fe--

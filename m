Return-Path: <balbi@ti.com>
Date: Wed, 30 Sep 2015 11:43:39 -0500
From: Felipe Balbi <balbi@ti.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
CC: <balbi@ti.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Jean-Christophe
 Plagniol-Villard <plagnioj@jcrosoft.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 15/16] usb: gadget: atmel: access the PMC using regmap
Message-ID: <20150930164339.GQ32625@saruman.tx.rr.com>
Reply-To: <balbi@ti.com>
References: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1443629469-15086-16-git-send-email-alexandre.belloni@free-electrons.com>
 <20150930163102.GM32625@saruman.tx.rr.com>
 <560C1027.9060100@atmel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O7Os1+MGCLLi8F5z"
In-Reply-To: <560C1027.9060100@atmel.com>
List-ID: <linux-clk.vger.kernel.org>

--O7Os1+MGCLLi8F5z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 06:39:03PM +0200, Nicolas Ferre wrote:
> Le 30/09/2015 18:31, Felipe Balbi a =E9crit :
> > On Wed, Sep 30, 2015 at 06:11:08PM +0200, Alexandre Belloni wrote:
> >> Use regmap to access the PMC to avoid using at91_pmc_read and
> >> at91_pmc_write.
> >>
> >> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> >=20
> > can I take this through my tree or does it have any dependences with th=
e rest of
> > the series ?
>=20
> Hi Felipe,
>=20
> Well, I have the feeling that these changes would require the regmap to
> be in place before using it. So yes, it has a strong dependency with the
> rest of the series (and DT modifications like the 06/16 patch actually).
>=20
> So, I think that Alexandre would agree with me that we should take the
> whole series with us through the arm-soc tree. An alternative would be
> to delay the inclusion of the USB part a little bit...
>=20
> Thanks for the heads-up Felipe, Bye,

hey no problem. I have no objections to $subject:

Acked-by: Felipe Balbi <balbi@ti.com>

--=20
balbi

--O7Os1+MGCLLi8F5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDBE7AAoJEIaOsuA1yqREuLwP/R4TT28gWm8hI1JekQV6t0EK
XzJu2XCRx95qKgeVmg9gpurNe3onAionpehSWQSIugkhcV/4tUatwTc0tkRnXZBL
hYapgKH2Ut3qnqdkVE9xG0kCauiz45gdAw3u/ff2cDDuLneROJkTMFx0VtnLlj33
9vL0yIcZkOvkYh1m6q5hP9qtPMKOaoThKlYkvMWu0esMoVTjwWIMdki/yn+YyMEg
5Y4BiGFF0WocKD4A6he2LxBtciMi/Gb8heVlW4+ibC6CNWaNBy21B6KWpUXIy7J7
VGfbpkghomE2RogufcxHMK1w2JubCWP+FUh6eK/tObeMpHGPrpLDqRK0Lea8mBVQ
pNOWKUvyXEvCyuZgDvcX0Q0maOH6kV6dO5LldMO8k/wgCfoG9B9gKZ0FXxVE+JOj
AEsQ5jd0gU74W/VLUJFml8TYRZGdp6lIFwHmbxBbsTy94wWXbd4zP35+/Theb/gg
7Tc6MI65HT7CXrDDLsf27yzYoO9mGDnaLVmfdAH+iitY4YzpxeazN0arbU5HFPS6
JcbGx+lUK7ut9pHSJvzaHkxESuPE7Ox8Gi6aRM4UUBPMppXSVikn+sl3XU0AoAuj
KIlYj65YfVHIqXMKlcM5JWiVygaN6QYl1qkSUV3jYLpt8RHp7MD6sClOJsBrJq+y
xta1VSkhnkuLsC6VE8FL
=6nY3
-----END PGP SIGNATURE-----

--O7Os1+MGCLLi8F5z--

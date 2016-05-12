Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 12 May 2016 08:59:43 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [linux-sunxi] Re: [PATCH v4 01/11] clk: sunxi: Add display and
 TCON0 clocks driver
Message-ID: <20160512065943.GX3733@lukather>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
 <1461590572-4027-2-git-send-email-maxime.ripard@free-electrons.com>
 <20160506223002.GE3492@codeaurora.org>
 <20160508200308.GF6167@lukather>
 <20160509223238.GW3492@codeaurora.org>
 <20160509223924.GX3492@codeaurora.org>
 <1462907459.9981.0.camel@plaes.org>
 <20160511221541.GG3492@codeaurora.org>
 <1463024360.16747.4.camel@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5T9d2Bf7JajBsgKp"
In-Reply-To: <1463024360.16747.4.camel@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--5T9d2Bf7JajBsgKp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 06:39:20AM +0300, Priit Laes wrote:
> On Wed, 2016-05-11 at 15:15 -0700, Stephen Boyd wrote:
> > On 05/10, Priit Laes wrote:
> > >=20
> > > On Mon, 2016-05-09 at 15:39 -0700, Stephen Boyd wrote:
> > > >=20
> > > > On 05/09, Stephen Boyd wrote:
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > Ok I applied this one to clk-next.
> > > > >=20
> > > > And I squashed this in to silence the following checker warning.
> > > >=20
> > > > drivers/clk/sunxi/clk-sun4i-display.c:110:33: warning: Variable
> > > > length array is used.
> > > >=20
> > > > ---8<---
> > > > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c
> > > > b/drivers/clk/sunxi/clk-sun4i-display.c
> > > > index f02e250e64ed..f8ff6c4a5633 100644
> > > > --- a/drivers/clk/sunxi/clk-sun4i-display.c
> > > > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > > > @@ -107,7 +107,7 @@ static int
> > > > sun4i_a10_display_reset_xlate(struct
> > > > reset_controller_dev *rcdev,
> > > > =A0static void __init sun4i_a10_display_init(struct device_node
> > > > *node,
> > > > =A0					=A0=A0const struct
> > > > sun4i_a10_display_clk_data *data)
> > > > =A0{
> > > > -	const char *parents[data->parents];
> > > > +	const char *parents[4];
> > > This change breaks at least de_[bf]e clocks which have 3 clock
> > > parents.
>=20
> > I just used the largest data->parents number, which was 4. How
> > does that break anything?
>=20
> If you look at the=A0sun4i_a10_display_init, it contains this block:
>=20
> =A0 =A0 ret =3D of_clk_parent_fill(node, parents, ARRAY_SIZE(parents));
> =A0=A0=A0=A0if (ret !=3D ARRAY_SIZE(parents)) {
> =A0=A0=A0=A0=A0=A0=A0=A0pr_err("%s: Could not retrieve the parents\n", cl=
k_name);
> =A0=A0=A0=A0=A0=A0=A0=A0goto unmap;
> =A0=A0=A0=A0}
>=20
> of_clk_parent_fill returns 3 for de_be/de_fe nodes, and
> ARRAY_SIZE(parents) is 4.

Replacing both ARRAY_SIZE(parents) by data->parents would work though.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--5T9d2Bf7JajBsgKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXNCnfAAoJEBx+YmzsjxAgnjIP/RtQp6ZsO9cOdO0iG6mhAFsg
7ba3kAr6Y93EKyVa3lUGwmvf+z0O+Q6QcZateNCbYCWAl6Z3aHgfF6dMJzB+Y6Wd
9zImOiG8O9deMOFO4I6Si9DCag2e99R3FcGcEcmoeX/ty8J0i8zxNrZaJlW/2LWf
uJcxtuSvGN9mghZFnHQ+DcKiy8murqw3JB0iY5QxFnLY7MUB9GgVpSe7HT1St004
VsFrsYfmgiIwOWefxLnUgiS4pBiYRjsmxNR0ApBxeqEcjE7tsRZW+nv0U/mlhbq8
aUCMz7b4qf+jfLFpc6MGP4TgGluNCzXCXMsHZa9eOQXsVjwy1gpxo27bsp0wpWvH
08lTNUOkOGseh4dK53EOT8dKJ3n+GrnpZvag/RXUC/ZrwfnShkVHQEtcsd6dcqBK
tgHSWs/ZviIkRY2xyUXUtceUQC/PDgrUTtQH4ECu651Qv9ufXpLq94AF1WD2eNq9
KUNliJ67GRhL970s1gAidI1NBDG8ZQe0b/nysZ62yVV+7q8lC6FwvhS2Cdvl0d7u
u9t2+xfWBJ/gdrrvTm1GCL18i44z8iQaerkvTiK+nmiBrGK0R55sMpcvMtxfph4x
lRmbX7Vb9x1+K5qLfOEF50EugozoDa2YDmll2qbEJ+95QVy5lgl4DcRufHidsfjC
OF69rLpAz0u/DPNr01XK
=Zvlj
-----END PGP SIGNATURE-----

--5T9d2Bf7JajBsgKp--

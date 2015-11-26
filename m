Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 26 Nov 2015 21:09:42 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jisheng Zhang <jszhang@marvell.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, linux-sunxi@googlegroups.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] ARM: dts: sun9i: Add A80 PRCM clocks and reset
 control nodes
Message-ID: <20151126200942.GQ32142@lukather>
References: <1448357536-26613-1-git-send-email-wens@csie.org>
 <1448357536-26613-5-git-send-email-wens@csie.org>
 <20151124182709.7671f12f@xhacker>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AYCDT44HuZYhsDxA"
In-Reply-To: <20151124182709.7671f12f@xhacker>
List-ID: <linux-clk.vger.kernel.org>


--AYCDT44HuZYhsDxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 06:27:09PM +0800, Jisheng Zhang wrote:
> + Sebastian
>=20
> On Tue, 24 Nov 2015 17:32:15 +0800
> Chen-Yu Tsai wrote:
>=20
> > This adds the supported PRCM clocks and reset controls to the A80 dtsi.
> > The DAUDIO module clocks are not supported yet.
> >=20
> > Also update clock and reset phandles for r_uart.
> >=20
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  arch/arm/boot/dts/sun9i-a80.dtsi | 79 ++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 78 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i=
-a80.dtsi
> > index 1118bf5cc4fb..a4ce348c0831 100644
> > --- a/arch/arm/boot/dts/sun9i-a80.dtsi
> > +++ b/arch/arm/boot/dts/sun9i-a80.dtsi
> > @@ -164,6 +164,14 @@
> >  					     "usb_phy2", "usb_hsic_12M";
> >  		};
> > =20
> > +		pll3: clk@06000008 {
> > +			/* placeholder until implemented */
> > +			#clock-cells =3D <0>;
> > +			compatible =3D "fixed-clock";
> > +			clock-rate =3D <0>;
> > +			clock-output-names =3D "pll3";
> > +		};
> > +
> >  		pll4: clk@0600000c {
> >  			#clock-cells =3D <0>;
> >  			compatible =3D "allwinner,sun9i-a80-pll4-clk";
> > @@ -350,6 +358,68 @@
> >  					"apb1_uart2", "apb1_uart3",
> >  					"apb1_uart4", "apb1_uart5";
> >  		};
> > +
> > +		cpus_clk: clk@08001410 {
> > +			compatible =3D "allwinner,sun9i-a80-cpus-clk";
> > +			reg =3D <0x08001410 0x4>;
> > +			#clock-cells =3D <0>;
> > +			clocks =3D <&osc32k>, <&osc24M>, <&pll4>, <&pll3>;
> > +			clock-output-names =3D "cpus";
> > +		};
> > +
> > +		ahbs: ahbs_clk {
> > +			compatible =3D "fixed-factor-clock";
> > +			#clock-cells =3D <0>;
> > +			clock-div =3D <1>;
> > +			clock-mult =3D <1>;
> > +			clocks =3D <&cpus_clk>;
> > +			clock-output-names =3D "ahbs";
> > +		};
>=20
> Dear Sebastian and all,
>=20
> I just want to take the sunxi clk support in mainline for example.
>=20
> I'm not sure I understand correctly, it seems to me that some maintainers=
 draw a
> line: "having a node for every clock" is a no, no[1]. But here we saw one=
 node for
> cpus_clk and apbs below. And <0x08001410 0x4>; <0x0800141c 0x4>; shows th=
ey
> are close each other, so should we merge them into a single clock complex=
 node
> then use mfd, regmap in clk driver?
>=20
> But IMHO, sunxi dts nodes really represent real HW, so I still can't unde=
rstand
> why we could not have each node for cpus_clk and apbs. Can you please kin=
dly
> teach me?

I'm totally lacking any context, but I'll reply. My view on this is
that they both represent the hardware, simply with a different model.

This preference of the clk maintainers and active clk developers
regarding the model to choose has evolved over time. When we started
the sunxi support, having one node per clock was the preferred way to
do things.

Berlin came much later, and the preference at that time was to have
the entire clock controller represented as single opaque block to the
consumers.

Both have pros and cons. The approach we took allows for an easier mix
and match, especially if the clocks you have in one SoC are reused in
others, without modifying the source code (or barely). AFAIK, this is
also the approach took by mvebu, except that their clock tree is much
much much simpler.

The approach Berlin took allows to have an easier maintainance and
more flexibility, for example to deal with clock registration
ordering, or clocks that share registers.

Our approach works just fine in our case, and I feel no incentive to
move to the new model (quite the opposite actually), but I guess it
also depends on how your clock controller is built, how many SoCs you
have to support, and how much clocks they are sharing.

I hope it clears things up.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--AYCDT44HuZYhsDxA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWV2cGAAoJEBx+YmzsjxAge4UP/1dNK3tRpoodHqT6ZCFMx4qa
Qq1Mv2OJ/x4ZuoSGkpO/FNe88UO3UfCvYIFzycvmTfFrtkwElBC3Y4fTP8hBg4ZX
AkQxAIHzbYnmfsjmrezxEta1P5+VGsOsmNIzqO/XUKlBrLYGD/1xtOikkf6Ru5mM
cfzI1C6DZl3scjULoCNA7S3D3RA17H6VVl32egbxoZF5urYqR+fAYiS7BHIKgWoB
XbFg7As6q/E0HBHKRRk5uBlMcPT7Gy3GUMJ5geB4ZaSQBef8wZuGyLyeGpZMmzTW
Ux1ELncY6dRJ9HXQ+yxkcqCcXi+71LeXXJmjPx40/3YGb0CSMhpwuT9O/0V9eKx4
5JlR34lbFPODiSYwfYqPCP+D5xNVNrkS0tj/aGwjobCl652MAHQfSd5r+fVjJZFK
BLedS2RFq/CYnAOaoV9aVkFnVrfK675GjLYvyO+rX7wYckbwtgGLaeTOzxawi9kk
mgOYdYsoVCR+ae6pOHxRvjBTh9Ll5s1XQOiqLkhObmUWi1J+sPvLknZiE/TbXL4o
sC1dbCbR8+iHikRcfvCfM9xgpUh2e9MFKQsQNOLK8ig297R95VKlZG8WqGzImvKW
VvPYb7U0KB3Cn9Z7OP8/gf8HYbRw0fBAont8JoFc4zu+/7N5EmK6kLuJ1ur9fS1H
7w5JcJCdwC4cHnPuI3Ma
=IvvX
-----END PGP SIGNATURE-----

--AYCDT44HuZYhsDxA--

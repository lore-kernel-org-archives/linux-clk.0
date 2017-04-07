Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 7 Apr 2017 15:38:05 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [linux-sunxi] Re: [PATCH v2 1/6] clk: sunxi-ng: Add sun4i/sun7i
 CCU driver
Message-ID: <20170407133805.aiythp3hdvuyhcrc@lukather>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <ac8c4dab4f160ec605d52120517774bf1de87c2e.1490545262.git-series.plaes@plaes.org>
 <20170327075438.cw3d6s7zyeemenwr@lukather>
 <20170404200919.GA22159@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lqy2yxkxvenv3klk"
In-Reply-To: <20170404200919.GA22159@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--lqy2yxkxvenv3klk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Priit,

On Tue, Apr 04, 2017 at 08:09:19PM +0000, Priit Laes wrote:
> > > +/* Not documented on A10 */
> > > +static SUNXI_CCU_GATE(pll_periph_sata_clk, "pll-periph-sata", "pll-p=
eriph",
> > > +		      0x028, BIT(14), 0);
> >=20
> > The rate doesn't come from pll-periph directly, does it?
>=20
> So it uses hosc (24MHz parent clock) instead of pll-periph?

I never looked too much at this, but it looks more like the input is
pll-periph-sata itself.

> > > +/* Undocumented on A10 */
> > > +static SUNXI_CCU_PHASE(mmc0_output_clk, "mmc0_output", "mmc0",
> > > +		       0x088, 8, 3, 0);
> > > +/* Undocumented on A10 */
> > > +static SUNXI_CCU_PHASE(mmc0_sample_clk, "mmc0_sample", "mmc0",
> > > +		       0x088, 20, 3, 0);
> >=20
> > The A10 doesn't have them.
>=20
> Are you sure? Although, they weren't listed in datasheet, they are defined
> in the sun4i-a10.dtsi:
>=20
> mmc0_clk: clk@01c20088 {
>         #clock-cells =3D <1>;
>         compatible =3D "allwinner,sun4i-a10-mmc-clk";
>         reg =3D <0x01c20088 0x4>;
>         clocks =3D <&osc24M>, <&pll6 1>, <&pll5 1>;
>         clock-output-names =3D "mmc0",
>                              "mmc0_output",
>                              "mmc0_sample";
> };

Yes, those clocks have been introduced in the A20, but we didn't find
out until much later, which is why there's still left overs in the
DT. We're not using them in the driver for the A10 either (but we do
for the A20, obviously).

> > > +/* TODO: Check whether A10 actually supports osc32k as 4th parent? */
> > > +static const char *const ir_parents_sun4i[] =3D { "hosc", "pll-perip=
h",
> > > +						"pll-ddr-other" };
> >=20
> > What does the BSP say about this?
>=20
> sun7i datasheet mentions osc32k, but BSP code for sun4i, sun5i and sun7i
> is identical and supports only 3 first parents without osc32k.

Ok. Leave the TODO for now, we'll fix it if relevant.

> > > +/* Undocumented on A10 */
> > > +static SUNXI_CCU_MUX_WITH_GATE(spdif_clk, "spdif", audio_parents,
> > > +			       0x0c0, 16, 2, BIT(31), CLK_SET_RATE_PARENT);
> >=20
> > This doesn't seem to exist at all on the A10
>=20
> Wasn't listed in datasheet, but it's in BSP and also in sun4i-a10.dtsi:
>=20
> spdif_clk: clk@01c200c0 {
>         #clock-cells =3D <0>;
>         compatible =3D "allwinner,sun4i-a10-mod1-clk";
>         reg =3D <0x01c200c0 0x4>;
>         clocks =3D <&pll2 SUN4I_A10_PLL2_8X>,
>                  <&pll2 SUN4I_A10_PLL2_4X>,
>                  <&pll2 SUN4I_A10_PLL2_2X>,
>                  <&pll2 SUN4I_A10_PLL2_1X>;
>         clock-output-names =3D "spdif";
> };

Ack.

> > > +/*
> > > + * TODO: SATA clock also supports external clock as parent via BIT(2=
4)
> > > + * The external clock is probably an optional crystal or oscillator
> > > + * that can be connected to the SATA-CLKM / SATA-CLKP pins.
> > > + */
> > > +static SUNXI_CCU_GATE(sata_clk, "sata", "pll-periph-sata",
> > > +		      0x0c8, BIT(31), 0);
> >=20
> > The rate won't be good here either. This is supposed to be 100MHz.
>=20
> Hmm.. I tested SATA with Cubietruck. Or what do you mean?

As long as you don't have any dependency on the rate itself, as long
as the gate is opened, I expect it to work. But the rate itself will
be reported wrong.

> > > +static const char *const csi_isp_parents[] =3D { "pll-video0", "pll-=
ve",
> > > +					       "pll-ddr-other", "pll-sata" };
> > > +
> > > +static SUNXI_CCU_M_WITH_MUX_GATE(csi_isp_clk, "csi-isp",
> > > +				 csi_isp_parents,
> > > +				 0x120, 0, 4, 24, 2, BIT(31), 0);
> >=20
> > We've been calling it sclk in the other SoC iirc. Any particular
> > reason to call it differently?
>=20
> It's called ISP in BSP and A10 manual.
> In A20 it's indeed Special Clock Register (SCLK).

Let's call it SCLK too then, for consistency.

> > > +static const char *const out_parents[] =3D { "hosc", "osc32k", "hosc=
" };
> > > +static SUNXI_CCU_MP_WITH_MUX_GATE(out_a_clk, "out-a", out_parents,
> > > +				  0x1f0, 8, 5, 20, 2, 24, 2, BIT(31), 0);
> > > +static SUNXI_CCU_MP_WITH_MUX_GATE(out_b_clk, "out-b", out_parents,
> > > +				  0x1f4, 8, 5, 20, 2, 24, 2, BIT(31), 0);
> >=20
> > There's a fixed pre-divider on the first hosc of 750.
>=20
> Nice catch.
>=20
> So it should be something like this:
>=20
> [snip]
> static const char *const out_parents[] =3D { "osc24M", "osc32k", "osc24M"=
 };
> static const struct ccu_mux_fixed_prediv out_prediv =3D {
>         .index =3D 0, .div =3D 750
> };

I think it shoud still be hosc (or at least, the name that you used
for the gate controlling the 24MHz oscillator input).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lqy2yxkxvenv3klk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY55Y5AAoJEBx+YmzsjxAgCTAP/iDE3cfG0nwwmWGz/lGUsC50
nPN46s63wiRV1iZQ/I+EH8BgG/x9Bnmd9OtjvDsLSpXHiHsSODx0wFQV7Uljic2x
g8XVgBaWxCNi/b8OrcmTAALLhXVEKOtpVNNGBwnyZWZWo0tR0CCxh5mzmU26cpGJ
RUc4Imac1Y3t5DQQwuLBnw9IGacOxhJdeDgtLtD/cRqSROJq7qRXPR/AGcdY3Hdh
h/o+FJ5mQbvriQMXKdhQNuGMQ2XCrVY6gSZo6pw05EkM3H0tV6arhK6vhlyJZ5mP
oaYexNtrGMgMajQvJ5d1Nh+O0cBC/32R47TxMELbJRiYjxagaoJzXjDhXa88/Bs5
oWnE/XwB/OtqsN3xQEAru6mN/VB0uUmkxh24zt0xsSG+Fcnw+NVvORkMfm1ytT3i
Zir+P3Mbse/t8un0LbMWqmwLgRMJMVM7w1rAiWezT4M46hRABx2hEbTCtzd2Y6Ew
uQ6pUmMYZxCNItPOFlx8J15Agvy8anpfb5pm1OLRc+hS//oiG9y8dQThUbMNEGVs
ViEqf6n3/SKrU70xjvc9+mRk89pOY9uYsoeaupsi4rLdIYjnOld7yPviIMUZ87h4
xDZ7AzgBFw+izpoyyPa6Ra/ZIi6Y4kOGNOmgPDUKkHq+E5147/OjFnVu9cTeex3T
+sYZcNQmC5XIrHN4RFDI
=3RQx
-----END PGP SIGNATURE-----

--lqy2yxkxvenv3klk--

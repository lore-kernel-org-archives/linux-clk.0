Return-Path: <moinejf@free.fr>
Date: Wed, 18 May 2016 18:23:02 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Vishnu Patekar
 <vishnupatekar0510@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 15/16] clk: sunxi-ng: Add H3 clocks
Message-Id: <20160518182302.e5b6b17062dade90af4829b9@free.fr>
In-Reply-To: <20160518140200.GN27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
	<1462737711-10017-16-git-send-email-maxime.ripard@free-electrons.com>
	<20160513114559.786221e415ce5956e161dd5b@free.fr>
	<20160518140200.GN27618@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Wed, 18 May 2016 16:02:00 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> On Fri, May 13, 2016 at 11:45:59AM +0200, Jean-Francois Moine wrote:
	[snip]
> > > +
> > > +static struct ccu_nm pll_audio_base_clk =3D {
> > > +	.enable		=3D BIT(31),
> > > +	.lock		=3D BIT(28),
> > > +
> > > +	.m		=3D SUNXI_CLK_FACTOR(0, 5),
> > > +	.n		=3D SUNXI_CLK_FACTOR(8, 7),
> > > +
> > > +	.common		=3D {
> > > +		.reg		=3D 0x008,
> > > +		.features	=3D CCU_FEATURE_GATE | CCU_FEATURE_LOCK,
> > > +		.hw.init	=3D SUNXI_HW_INIT("pll-audio-base",
> > > +						"osc24M",
> > > +						&ccu_nm_ops,
> > > +						0),
> > > +	},
> > > +};
> > > +
> > > +static SUNXI_CCU_M(pll_audio_clk, "pll-audio", "pll-audio-base",
> > > +		   0x008, 16, 4, 0);
> > > +
> > > +static SUNXI_CCU_FIXED_FACTOR(pll_audio_2x_clk, "pll-audio-2x",
> > > +			      "pll-audio-base", 2, 1, 0);
> > > +static SUNXI_CCU_FIXED_FACTOR(pll_audio_4x_clk, "pll-audio-4x",
> > > +			      "pll-audio-base", 1, 1, 0);
> > > +static SUNXI_CCU_FIXED_FACTOR(pll_audio_8x_clk, "pll-audio-8x",
> > > +			      "pll-audio-base", 1, 2, 0);
> >=20
> > Forcing the post divider 'p' to 4 would simplify this PLL.
>=20
> Yes and no. It would simplify the clock rate computation and
> propagation across the tree, but it would also add more code in there,
> and we would not be able to read the clock rate properly.
>=20
> Chaining clocks like that should also be supported and working, so I'd
> still be very much in favour of implementing it as it is supposed to
> be, and fixing whatever bug there might be in there.

See my next mail:

static SUNXI_CCU_FIXED_FACTOR(pll_audio, "pll-audio",
			      "pll-audio-base", 4, 1,
				CLK_SET_RATE_PARENT);

> > > +static struct ccu_nm pll_video_clk =3D {
> > > +	.enable		=3D BIT(31),
> > > +	.lock		=3D BIT(28),
> > > +
> > > +	.m		=3D SUNXI_CLK_FACTOR(0, 4),
> > > +	.n		=3D SUNXI_CLK_FACTOR(8, 7),
> > > +
> > > +	.common		=3D {
> > > +		.reg		=3D 0x010,
> > > +		.features	=3D CCU_FEATURE_GATE | CCU_FEATURE_LOCK,
> > > +		.hw.init	=3D SUNXI_HW_INIT("pll-video",
> > > +						"osc24M",
> > > +						&ccu_nm_ops,
> > > +						0),
> > > +	},
> > > +};
> >=20
> > The legacy u-boot I use (lichee) forces this PLL to 297MHz in
> > fractional mode (FRAC_CLK_OUT =3D 1 and PLL_MODE_SEL =3D 0).
> > As these bits are not managed, getting the rate is false and setting it
> > is not possible.
>=20
> Ah, interesting.
>=20
> I'll add support for fractional clocks in the next version then.
>=20
> Just out of curiosity, is there any particular reason for sticking
> with Allwinner's U-Boot over using mainline U-Boot?

Allwinner's U_Boot works fine enough for me, and with it, I am sure that th=
e hidden/unknown parts of the SoC (dram, prcm) are correctly initialized.

> > > +static struct ccu_nk pll_periph0_clk =3D {
> > > +	.enable		=3D BIT(31),
> > > +	.lock		=3D BIT(28),
> > > +
> > > +	.k		=3D SUNXI_CLK_FACTOR(4, 2),
> > > +	.n		=3D SUNXI_CLK_FACTOR(8, 5),
> > > +	.fixed_post_div	=3D 2,
> > > +
> > > +	.common		=3D {
> > > +		.reg		=3D 0x028,
> > > +		.features	=3D (CCU_FEATURE_GATE |
> > > +				   CCU_FEATURE_LOCK |
> > > +				   CCU_FEATURE_FIXED_POSTDIV),
> > > +		.hw.init	=3D SUNXI_HW_INIT("pll-periph0",
> > > +						"osc24M",
> > > +						&ccu_nk_ops,
> > > +						0),
> > > +	},
> > > +};
> >=20
> > As told previously, the H3 documentation says:
> >=20
> >  Note: The PLL Output should be fixed to 600MHz, it is not recommended =
to
> >  vary this value arbitrarily.
> >=20
> > So, is it useful to offer the possibility to change the rate of this PLL
> > (and same for pll-periph1)?
> > (I force the rate in the DT with assigned-clock-rates to avoid any prob=
lem)
>=20
> assigned-clock-rates will not change anything unfortunately. It sets a
> default rate at boot time, but it doesn't prevent the rate from being
> changed.
>=20
> Fortunately, that rate will never be modified, since none of the child
> clock have CLK_SET_RATE_PARENT.
>=20
> If that was to change, and when that time comes, we can always use the
> clk boundaries to deal with it nicely.
>=20
> > > +
> > > +static SUNXI_CCU_FIXED_FACTOR(pll_periph0_2x_clk, "pll-periph0-2x",
> > > +			      "pll-periph0", 1, 2, 0);
> > > +
> > 	[snip]
> > > +static const char * const nand_parents[] =3D { "osc24M", "pll-periph=
0",
> > > +					     "pll-periph1" };
> > > +static SUNXI_CCU_MP_WITH_MUX_GATE(nand_clk, "nand", nand_parents, 0x=
080,
> > > +				  0, 4,		/* M */
> > > +				  16, 2,	/* P */
> > > +				  24, 2,	/* mux */
> > > +				  BIT(31),	/* gate */
> > > +				  0);
> >=20
> > The mux width is 2, meaning there may be 4 parents. Then, there may be
> > an access out of the parent array (and same for mmcx and spix).
>=20
> The mux relies on the number of parents registered in the clock
> framework, which is 3 in this case, so that won't happen.
>=20
> Or am I missing what you're saying?
>=20
> > > +
> > > +static const char * const mmc0_parents[] =3D { "osc24M", "pll-periph=
0",
> > > +					     "pll-periph1" };
> >=20
> > The parent tables of nand, mmcx and spix are the same. One table should
> > be enough.
>=20
> Ack.
>=20
> > > +static SUNXI_CCU_MP_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc0_parents, 0x=
088,
> > > +				  0, 4,		/* M */
> > > +				  16, 2,	/* P */
> > > +				  24, 2,	/* mux */
> > > +				  BIT(31),	/* gate */
> > > +				  0);
> > > +
> > > +static SUNXI_CCU_PHASE(mmc0_sample_clk, "mmc0_sample", "mmc0",
> > > +		       0x088, 20, 3, 0);
> > > +static SUNXI_CCU_PHASE(mmc0_output_clk, "mmc0_output", "mmc0",
> > > +		       0x088, 8, 3, 0);
> > 	[snip]
> > > +static const char * const i2s0_parents[] =3D { "pll-audio-8x", "pll-=
audio-4x",
> > > +					     "pll-audio-2x" , "pll-audio" };
> > > +static SUNXI_CCU_MUX_WITH_GATE(i2s0_clk, "i2s0", i2s0_parents,
> > > +			       0x0b0, 16, 2, BIT(31), 0);
> > > +
> > > +static const char * const i2s1_parents[] =3D { "pll-audio-8x", "pll-=
audio-4x",
> > > +					     "pll-audio-2x" , "pll-audio" };
> > > +static SUNXI_CCU_MUX_WITH_GATE(i2s1_clk, "i2s1", i2s1_parents,
> > > +			       0x0b4, 16, 2, BIT(31), 0);
> > > +
> > > +static const char * const i2s2_parents[] =3D { "pll-audio-8x", "pll-=
audio-4x",
> > > +					     "pll-audio-2x" , "pll-audio" };
> > > +static SUNXI_CCU_MUX_WITH_GATE(i2s2_clk, "i2s2", i2s2_parents,
> > > +			       0x0b8, 16, 2, BIT(31), 0);
> > 	[snip]
> >=20
> > Same parent tables.
> > This occurs for other clocks.
>=20
> Ack.
>=20
> Thanks!
> Maxime
>=20
> --=20
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

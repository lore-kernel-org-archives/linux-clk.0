Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Chen-Yu Tsai" <wens@csie.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160607204154.31967-15-maxime.ripard@free-electrons.com>
Cc: linux-clk@vger.kernel.org, "Hans de Goede" <hdegoede@redhat.com>,
 "Andre Przywara" <andre.przywara@arm.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Vishnu Patekar" <vishnupatekar0510@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 "Jean-Francois Moine" <moinejf@free.fr>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-15-maxime.ripard@free-electrons.com>
Message-ID: <146681451703.35033.17009542256505173233@resonance>
Subject: Re: [PATCH v2 14/15] clk: sunxi-ng: Add H3 clocks
Date: Fri, 24 Jun 2016 17:28:37 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Nice series! Looks really great to me. :-)

Quoting Maxime Ripard (2016-06-07 13:41:53)
> +static SUNXI_CCU_NKMP_WITH_GATE_LOCK(pll_cpux_clk, "pll-cpux",
> +                                    "osc24M", 0x000,
> +                                    8, 5,      /* N */
> +                                    4, 2,      /* K */
> +                                    0, 2,      /* M */
> +                                    16, 2,     /* P */
> +                                    BIT(31),   /* gate */
> +                                    BIT(28),   /* lock */
> +                                    0);

I'm more of a fan of expanding the struct with designated initializers
versus macro use, but that's only personal preference.

> +static const char * const ahb2_parents[] =3D { "ahb1" , "pll-periph0" };
> +static struct ccu_mux ahb2_clk =3D {
> +       .mux            =3D {
> +               .shift  =3D 0,
> +               .width  =3D 1,
> +
> +               .fixed_prediv   =3D {
> +                       .index  =3D 1,
> +                       .div    =3D 2,
> +               },
> +       },
> +
> +       .common         =3D {
> +               .reg            =3D 0x05c,
> +               .features       =3D CCU_FEATURE_FIXED_PREDIV,
> +               .hw.init        =3D SUNXI_HW_INIT_PARENTS("ahb2",
> +                                                       ahb2_parents,

Note that it's possible to initialize the parent strings here if you
prefer:

	.hw.init =3D &(struct clk_init_data){
		   .parent_names =3D (const char *[]){ "ahb1",
		   				     "pll-periph0" };

Similar to the above, no big deal, just an observation.

> +static struct ccu_common *sun8i_h3_ccu_clks[] =3D {
> +       [CLK_PLL_CPUX]          =3D &pll_cpux_clk.common,
> +       [CLK_PLL_AUDIO_BASE]    =3D &pll_audio_base_clk.common,
> +       [CLK_PLL_AUDIO]         =3D &pll_audio_clk.common,

OK, it looks like you followed the qcom clk driver approach here, which
is a nice way to do things. However, as Stephen alluded to in his
response to the cover letter, the clk_hw_* api's are an even more
friendly interface for clock providers. For example, check out the gxbb
clk driver probe:

	static int gxbb_clkc_probe(struct platform_device *pdev)
	{
		void __iomem *clk_base;
		int ret, clkid, i;
		struct device *dev =3D &pdev->dev;
	=

		/*  Generic clocks and PLLs */
		clk_base =3D of_iomap(dev->of_node, 0);
		if (!clk_base) {
			pr_err("%s: Unable to map clk base\n", __func__);
			return -ENXIO;
		}
	=

		/* Populate base address for PLLs */
		for (i =3D 0; i < ARRAY_SIZE(gxbb_clk_plls); i++)
			gxbb_clk_plls[i]->base =3D clk_base;
	=

		/* Populate base address for MPLLs */
		for (i =3D 0; i < ARRAY_SIZE(gxbb_clk_mplls); i++)
			gxbb_clk_mplls[i]->base =3D clk_base;

		...

		/*
		 * register all clks
		 */
		for (clkid =3D 0; clkid < NR_CLKS; clkid++) {
			ret =3D devm_clk_hw_register(dev, gxbb_hw_onecell_data.hws[clkid]);
			if (ret)
				goto iounmap;
		}

The nice thing about struct ccu_common is that you don't have to walk
the list of clocks for each separate clock type like the above probe
function does. I'm still thinking of the best way to solve this
generically. Maybe add a .base member struct clk_hw? I dunno, and I've
resisted the urge to add stuff to struct clk_hw in the past... But I
really want to minimize this .probe as much as possible, and I do not
want every clock provider driver to be forced to invent something like
struct ccu_common every time. Anyways, that is not a blocker for your
implementation to be merged, but Stephen's question in patch #4 got me
thinking about this again...

The real nice part is the call to devm_clk_hw_register. That uses the
new clk_hw_* apis and struct clk_hw_onecell_data, which is initialized
statically like so:

	static struct clk_hw_onecell_data gxbb_hw_onecell_data =3D {
		.hws =3D {
			[CLKID_SYS_PLL]	     =3D &gxbb_sys_pll.hw,
			[CLKID_CPUCLK]	      =3D &gxbb_cpu_clk.hw,
			...
		},
		.num =3D NR_CLKS,
	};

Unfortunately I believe it impossible to replace NR_CLKS with some
ARRAY_SIZE stuff because C. As Stephen mentioned, please use this method
instead.

> diff --git a/include/dt-bindings/clock/sun8i-h3.h b/include/dt-bindings/c=
lock/sun8i-h3.h
> new file mode 100644
> index 000000000000..96eced56e7a2
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun8i-h3.h
> @@ -0,0 +1,162 @@
> +#ifndef _DT_BINDINGS_CLK_SUN8I_H3_H_
> +#define _DT_BINDINGS_CLK_SUN8I_H3_H_
> +
> +#define CLK_PLL_CPUX           0
> +#define CLK_PLL_AUDIO_BASE     1
> +#define CLK_PLL_AUDIO          2
> +#define CLK_PLL_AUDIO_2X       3
> +#define CLK_PLL_AUDIO_4X       4

Are you sure you want to expose all of these clocks as part of the ABI?
I exposed the bare minimum clocks for the gxbb driver in the DT shared
header (we can always add more later) and kept the rest internal to the
kernel source.

A side benefit of this is that NR_CLKS can live inside the kernel and
not be part of the binding.

Otherwise this series looks really great. Thanks for tackling such a
huge task!

Regards,
Mike

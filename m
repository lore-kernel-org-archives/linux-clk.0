Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 27 Mar 2017 09:54:38 +0200
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
Subject: Re: [PATCH v2 1/6] clk: sunxi-ng: Add sun4i/sun7i CCU driver
Message-ID: <20170327075438.cw3d6s7zyeemenwr@lukather>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <ac8c4dab4f160ec605d52120517774bf1de87c2e.1490545262.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gsmomqsq6zdsfons"
In-Reply-To: <ac8c4dab4f160ec605d52120517774bf1de87c2e.1490545262.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--gsmomqsq6zdsfons
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks a lot for working on this.

On Sun, Mar 26, 2017 at 08:20:16PM +0300, Priit Laes wrote:
> Introduce a clock controller driver for sun4i A10 and sun7i A20
> series SoCs.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/Kconfig                  |   13 +-
>  drivers/clk/sunxi-ng/Makefile                 |    1 +-
>  drivers/clk/sunxi-ng/ccu-sunxi-a10-a20.c      | 1532 ++++++++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sunxi-a10-a20.h      |   59 +-
>  include/dt-bindings/clock/sunxi-a10-a20-ccu.h |  208 ++-
>  include/dt-bindings/reset/sunxi-a10-a20-ccu.h |   66 +-

I'm not too fond of those sunxi-<all the SoCs supported>. We're not
doing that for any other driver, I don't really know why this has
became a trend lately.

You can call them ccu-sun4i-a10.h, and it will work just fine.

> +/* Not documented on A10 */
> +static SUNXI_CCU_GATE(pll_periph_sata_clk, "pll-periph-sata", "pll-perip=
h",
> +		      0x028, BIT(14), 0);

The rate doesn't come from pll-periph directly, does it?

> +#define SUN4I_AHB_REG		0x054
> +static struct ccu_mux cpu_clk =3D {
> +	.mux		=3D {
> +		.shift		=3D 16,
> +		.width		=3D 2,
> +		.fixed_predivs	=3D cpu_predivs,
> +		.n_predivs	=3D ARRAY_SIZE(cpu_predivs),
> +	},
> +	.common		=3D {
> +		.reg		=3D 0x054,

Why did you define this one, even though you don't seem to be using it
anywhere?

> +static const char *const ahb_parents[] =3D { "axi", "pll-periph",
> +					   "pll-periph-2x" };
> +static const struct ccu_mux_fixed_prediv ahb_predivs[] =3D {
> +	{ .index =3D 2, .div =3D 2, },
> +};

This seems to be only true for the A20, and not the A10.

Are you sure here? The pll-periph-2x seem to be only used in the MBUS
clock in our current code.

And then, using pll-periph-2x, and then dividing it by 2 just gives us
pll-periph, which is also our previous parent :)

> +/* Undocumented on A10 */
> +static SUNXI_CCU_PHASE(mmc0_output_clk, "mmc0_output", "mmc0",
> +		       0x088, 8, 3, 0);
> +/* Undocumented on A10 */
> +static SUNXI_CCU_PHASE(mmc0_sample_clk, "mmc0_sample", "mmc0",
> +		       0x088, 20, 3, 0);

The A10 doesn't have them.

> +/* TODO: Check whether A10 actually supports osc32k as 4th parent? */
> +static const char *const ir_parents_sun4i[] =3D { "hosc", "pll-periph",
> +						"pll-ddr-other" };

What does the BSP say about this?

> +/* Undocumented on A10 */
> +static SUNXI_CCU_MUX_WITH_GATE(spdif_clk, "spdif", audio_parents,
> +			       0x0c0, 16, 2, BIT(31), CLK_SET_RATE_PARENT);

This doesn't seem to exist at all on the A10

> +/*
> + * TODO: SATA clock also supports external clock as parent via BIT(24)
> + * The external clock is probably an optional crystal or oscillator
> + * that can be connected to the SATA-CLKM / SATA-CLKP pins.
> + */
> +static SUNXI_CCU_GATE(sata_clk, "sata", "pll-periph-sata",
> +		      0x0c8, BIT(31), 0);

The rate won't be good here either. This is supposed to be 100MHz.

> +static const char *const csi_isp_parents[] =3D { "pll-video0", "pll-ve",
> +					       "pll-ddr-other", "pll-sata" };
> +
> +static SUNXI_CCU_M_WITH_MUX_GATE(csi_isp_clk, "csi-isp",
> +				 csi_isp_parents,
> +				 0x120, 0, 4, 24, 2, BIT(31), 0);

We've been calling it sclk in the other SoC iirc. Any particular
reason to call it differently?

> +static const char *const out_parents[] =3D { "hosc", "osc32k", "hosc" };
> +static SUNXI_CCU_MP_WITH_MUX_GATE(out_a_clk, "out-a", out_parents,
> +				  0x1f0, 8, 5, 20, 2, 24, 2, BIT(31), 0);
> +static SUNXI_CCU_MP_WITH_MUX_GATE(out_b_clk, "out-b", out_parents,
> +				  0x1f4, 8, 5, 20, 2, 24, 2, BIT(31), 0);

There's a fixed pre-divider on the first hosc of 750.

> +static void init_clocks(void __iomem *reg)
> +{
> +	u32 val;
> +
> +	/* Force the PLL-Audio-1x divider to 4 */
> +	val =3D readl(reg + SUN4I_PLL_AUDIO_REG);
> +	val &=3D ~GENMASK(19, 16);
> +	writel(val | (3 << 16), reg + SUN4I_PLL_AUDIO_REG);
> +
> +	/* Use PLL6 as parent for AHB */
> +	val =3D readl(reg + SUN4I_AHB_REG);
> +	val &=3D ~GENMASK(7, 6);
> +	writel(val | (2 << 6), reg + SUN4I_AHB_REG);

Keeping some kind of comment similar to what was in the DT would be
great, otherwise we lose *why* we need to do so.

> +}
> +
> +static void __init sun4i_a10_ccu_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n",
> +		       of_node_full_name(node));
> +		return;
> +	}
> +
> +	init_clocks(reg);
> +
> +	sunxi_ccu_probe(node, reg, &sun4i_a10_ccu_desc);

Can't you move the request_and_map / probe in the common function?

> +#ifndef _DT_BINDINGS_CLK_SUNXI_A10_A20_H_
> +#define _DT_BINDINGS_CLK_SUNXI_A10_A20_H_
> +
> +#define CLK_HOSC		1
> +#define CLK_PLL_PERIPH_SATA	16

That one looks suspicious. I don't see why we would need the PLL,
while we have a perfectly functional SATA clock below. Have you tried
gating the bit31 of the register 0xc8 to see if it has any impact?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gsmomqsq6zdsfons
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY2MU5AAoJEBx+YmzsjxAgqb0QAKiR1+1eCWBWSrAKS5Ze43k+
bA2sGN/avTZvFUQHks3zTekgDwtwj2qS7k14bbRabR53samBJdS+iUU0WOFFd+YK
r1VxXvsTOhIQshCh6qfYqZq6pkMHLFoT+zM+pJyzHICYwOEkfQfJGGsW6Wf3N4qO
Eac12Q1Ou4IXYZJnoTSu4zb8VTBcL6zIwsSg6TYWKCyFoFFVuZHNecWL6GUeqFq5
MmrRsSQ8DcdQcM346VxWROYGl442ceynHKzouBMUN84OixoBcQdoF7sLHVbeBox2
DP17h71gyZet8oun9vk/RQlDVnxPKONwCB4E9sDc8ctbxcLfs86aIF43v0o9WUZT
z96+Iaou0U53Uvhf10PjxO0esTRLcbDdZGXu+H4j7gTG4MqMhbW3RDuNQAv212OY
xWlpUuGhOq0ZaegTE8Ukq1Xf0bj9w7oHkMjvdXLTI8AzBZex48mAlJMQYKJXjTSa
gt5kYJOIxjDTKG5JTfT4H+TAeonyt0XapHJtNjDkx7YC5JVC+VvvfWS5GD3uKU9k
Xaa0T22KELYv3rFeWrGgKbcjo2D7qyVBFIioMUOvktH5hQZuMQYYTfLrq0UKoxSL
BTXcNSPLiOdrU2wI8FsSkMpaiIAwWARF5PBkS4rHshpcp6+a5VUh9VzHHSQWrXiA
Mn1xNwPSUHWHJY+2OZwa
=aP+b
-----END PGP SIGNATURE-----

--gsmomqsq6zdsfons--

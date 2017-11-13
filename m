Return-Path: <andrew@aj.id.au>
Message-ID: <1510549454.4287.68.camel@aj.id.au>
Subject: Re: [PATCH v5 3/5] clk: aspeed: Add platform driver and register
 PLLs
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Mon, 13 Nov 2017 15:34:14 +1030
In-Reply-To: <20171030060250.701-4-joel@jms.id.au>
References: <20171030060250.701-1-joel@jms.id.au>
	 <20171030060250.701-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Lqd87Ny5nZmahybd5t5E"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-Lqd87Ny5nZmahybd5t5E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 16:32 +1030, Joel Stanley wrote:
> This registers a platform driver to set up all of the non-core
> clocks.
>=20
> The clocks that have configurable rates are now registered.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> --
> v5:
>  - Remove eclk configuration. We do not have enough information to
>  correctly implement the mux and divisor, so it will have to be
>  implemented in the future
> v4:
>  - Add eclk div table to fix ast2500 calculation
>  - Add defines to document the BIT() macros
>  - Pass dev where we can when registering clocks
>  - Check for errors when registering clk_hws
> v3:
>  - Fix bclk and eclk calculation
>  - Separate out ast2400 and ast25000 for pll calculation
> ---
>  drivers/clk/clk-aspeed.c | 130
> +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
>=20
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index a8da411326e9..8bf3f3767560 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -14,6 +14,8 @@
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -114,6 +116,18 @@ static const struct aspeed_gate_data
> aspeed_gates[] =3D {
>  	[ASPEED_CLK_GATE_LHCCLK] =3D	{ 28, -1, "lhclk-gate",=09
> 	"lhclk", 0 }, /* LPC master/LPC+ */
>  };
> =20
> +static const struct clk_div_table ast2500_mac_div_table[] =3D {
> +	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct
> */
> +	{ 0x1, 4 },
> +	{ 0x2, 6 },
> +	{ 0x3, 8 },
> +	{ 0x4, 10 },
> +	{ 0x5, 12 },
> +	{ 0x6, 14 },
> +	{ 0x7, 16 },
> +	{ 0 }
> +};
> +
>  static const struct clk_div_table ast2400_div_table[] =3D {
>  	{ 0x0, 2 },
>  	{ 0x1, 4 },
> @@ -179,6 +193,122 @@ static struct clk_hw
> *aspeed_ast2500_calc_pll(const char *name, u32 val)
>  			mult, div);
>  }
> =20
> +struct aspeed_clk_soc_data {
> +	const struct clk_div_table *div_table;
> +	const struct clk_div_table *mac_div_table;
> +	struct clk_hw *(*calc_pll)(const char *name, u32 val);
> +};
> +
> +static const struct aspeed_clk_soc_data ast2500_data =3D {
> +	.div_table =3D ast2500_div_table,
> +	.mac_div_table =3D ast2500_mac_div_table,
> +	.calc_pll =3D aspeed_ast2500_calc_pll,
> +};
> +
> +static const struct aspeed_clk_soc_data ast2400_data =3D {
> +	.div_table =3D ast2400_div_table,
> +	.mac_div_table =3D ast2400_div_table,
> +	.calc_pll =3D aspeed_ast2400_calc_pll,
> +};
> +
> +static int aspeed_clk_probe(struct platform_device *pdev)
> +{
> +	const struct aspeed_clk_soc_data *soc_data;
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *map;
> +	struct clk_hw *hw;
> +	u32 val, rate;
> +
> +	map =3D syscon_node_to_regmap(dev->of_node);
> +	if (IS_ERR(map)) {
> +		dev_err(dev, "no syscon regmap\n");
> +		return PTR_ERR(map);
> +	}
> +
> +	/* SoC generations share common layouts but have different
> divisors */
> +	soc_data =3D of_device_get_match_data(dev);
> +	if (!soc_data) {
> +		dev_err(dev, "no match data for platform\n");
> +		return -EINVAL;
> +	}
> +
> +	/* UART clock div13 setting */
> +	regmap_read(map, ASPEED_MISC_CTRL, &val);
> +	if (val & UART_DIV13_EN)
> +		rate =3D 24000000 / 13;
> +	else
> +		rate =3D 24000000;
> +	/* TODO: Find the parent data for the uart clock */
> +	hw =3D clk_hw_register_fixed_rate(dev, "uart", NULL, 0, rate);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_UART] =3D hw;
> +
> +	/*
> +	 * Memory controller (M-PLL) PLL. This clock is configured
> by the
> +	 * bootloader, and is exposed to Linux as a read-only clock
> rate.
> +	 */
> +	regmap_read(map, ASPEED_MPLL_PARAM, &val);
> +	hw =3D soc_data->calc_pll("mpll", val);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_MPLL] =3D	hw;
> +
> +	/* SD/SDIO clock divider (TODO: There's a gate too) */
> +	hw =3D clk_hw_register_divider_table(dev, "sdio", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 12, 3, 0,
> +			soc_data->div_table,
> +			&aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_SDIO] =3D hw;
> +
> +	/* MAC AHB bus clock divider */
> +	hw =3D clk_hw_register_divider_table(dev, "mac", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 16, 3, 0,
> +			soc_data->mac_div_table,
> +			&aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_MAC] =3D hw;
> +
> +	/* LPC Host (LHCLK) clock divider */
> +	hw =3D clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
> +			soc_data->div_table,
> +			&aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_LHCLK] =3D hw;
> +
> +	/* P-Bus (BCLK) clock divider */
> +	hw =3D clk_hw_register_divider_table(dev, "bclk", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION_2, 0, 2, 0,
> +			soc_data->div_table,
> +			&aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_BCLK] =3D hw;
> +
> +	return 0;
> +};
> +
> +static const struct of_device_id aspeed_clk_dt_ids[] =3D {
> +	{ .compatible =3D "aspeed,ast2400-scu", .data =3D &ast2400_data
> },
> +	{ .compatible =3D "aspeed,ast2500-scu", .data =3D &ast2500_data
> },
> +	{ }
> +};
> +
> +static struct platform_driver aspeed_clk_driver =3D {
> +	.probe  =3D aspeed_clk_probe,
> +	.driver =3D {
> +		.name =3D "aspeed-clk",
> +		.of_match_table =3D aspeed_clk_dt_ids,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +builtin_platform_driver(aspeed_clk_driver);
> +
>  static void __init aspeed_ast2400_cc(struct regmap *map)
>  {
>  	struct clk_hw *hw;
--=-Lqd87Ny5nZmahybd5t5E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaCSfOAAoJEJ0dnzgO5LT5tlMP/iKFWNzQ+N14LnlB/sQzjurx
9lJk1w0qjxqovTnb0828kr0/NZDoJFxPvkFQ47VIuZCwlgNK46T8y4P9+4tEe0/U
aa41zCBOTGFtzJfZsSvmS72T1Kg/Zzl3jbeVuUTUQN9qRkXJ7v2VFN56rLuKBZtN
KCesjREz+G1PYq2yxelv9rBrlIE2G/mAp/9KGrOv6eWG9LYJNTCN5/1APT0NuFOE
Gv+dDV1MinvByZ4uwhIxxagSBJRPdkyCZBwGgLfvYkmrsZ/6X1uEGj4SHmpn08ek
EfKuLagALLSIWwEsBH6XHEUeagM0oTEyMaOk96s7l/BqAqVVSwoEBLB3ofSMoktV
3uouRYDqI8sAo0/To0xCjt69WvMOX22JEDxeahSPTmBufJ/jtQ8T6HPhJbI/VOYy
LGXZWsuaop4gwm7UV3FOHUZr9OO+LZg9BOB1X797Cljf+lyYHghkeB3cM1MwEM4b
M0nHiWwip5Z2dSvBE9tKRY9bm1k2EuzHW/sm2o1uAtQPggE2u9VAqWbMlo14BNRZ
RBZjV1vEbTIVrCrrLBmUhc+6wYbIOK/wEcFM6/hT4Dt7WYKOMwB7P3ITyPFFfdSD
soWIvwpCY53OfQBMdfkSZ4AAN2WB28O7yMmxQEpvSpwGMq1XLAjdSStD9mkzo8DO
hyneWMb5xmH3KIoyfNxX
=j6JR
-----END PGP SIGNATURE-----

--=-Lqd87Ny5nZmahybd5t5E--

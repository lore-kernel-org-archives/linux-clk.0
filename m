Return-Path: <andrew@aj.id.au>
Message-ID: <1506343255.30138.29.camel@aj.id.au>
Subject: Re: [PATCH v2 3/5] clk: aspeed: Add platform driver and register
 PLLs
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Mon, 25 Sep 2017 22:10:55 +0930
In-Reply-To: <20170921042641.7326-4-joel@jms.id.au>
References: <20170921042641.7326-1-joel@jms.id.au>
	 <20170921042641.7326-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FN5vqUzJFMU4ROxU2mGm"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-FN5vqUzJFMU4ROxU2mGm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-21 at 13:56 +0930, Joel Stanley wrote:
> This registers a platform driver to set up all of the non-core clocks.
>=C2=A0
> The clocks that have configurable rates are now registered.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/clk/clk-aspeed.c | 129 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 129 insertions(+)
>=C2=A0
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index e614c61b82d2..19531798e040 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -14,6 +14,8 @@
> =C2=A0#include <linux/clk-provider.h>
> =C2=A0#include <linux/mfd/syscon.h>
> =C2=A0#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> =C2=A0#include <linux/regmap.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/spinlock.h>
> @@ -115,6 +117,20 @@ static const struct aspeed_gate_data aspeed_gates[] =
__initconst =3D {
> =C2=A0	/* 31: reserved */
> =C2=A0};
> =C2=A0
> +static const char * const eclk_parents[] =3D {"d1pll", "hpll", "mpll"};
> +
> +static const struct clk_div_table ast2500_mac_div_table[] =3D {
> +	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
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
> =C2=A0static const struct clk_div_table ast2400_div_table[] =3D {
> =C2=A0	{ 0x0, 2 },
> =C2=A0	{ 0x1, 4 },
> @@ -139,6 +155,21 @@ static const struct clk_div_table ast2500_div_table[=
] =3D {
> =C2=A0	{ 0 }
> =C2=A0};
> =C2=A0
> +struct aspeed_clk_soc_data {
> +	const struct clk_div_table *div_table;
> +	const struct clk_div_table *mac_div_table;
> +};
> +
> +static const struct aspeed_clk_soc_data ast2500_data =3D {
> +	.div_table =3D ast2500_div_table,
> +	.mac_div_table =3D ast2500_mac_div_table,
> +};
> +
> +static const struct aspeed_clk_soc_data ast2400_data =3D {
> +	.div_table =3D ast2400_div_table,
> +	.mac_div_table =3D ast2400_div_table,
> +};
> +
> =C2=A0static struct clk_hw *aspeed_calc_pll(const char *name, u32 val)
> =C2=A0{
> =C2=A0	unsigned int mult, div;
> @@ -160,6 +191,104 @@ static struct clk_hw *aspeed_calc_pll(const char *n=
ame, u32 val)
> =C2=A0			mult, div);
> =C2=A0}
> =C2=A0
> +static int __init aspeed_clk_probe(struct platform_device *pdev)
> +{
> +	const struct aspeed_clk_soc_data *soc_data;
> +	const struct clk_div_table *mac_div_table;
> +	const struct clk_div_table *div_table;
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
> +	/* SoC generations share common layouts but have different divisors */
> +	soc_data =3D of_device_get_match_data(&pdev->dev);
> +	div_table =3D soc_data->div_table;
> +	mac_div_table =3D soc_data->mac_div_table;
> +
> +	/* UART clock div13 setting */
> +	regmap_read(map, ASPEED_MISC_CTRL, &val);
> +	if (val & BIT(12))
> +		rate =3D 24000000 / 13;
> +	else
> +		rate =3D 24000000;
> +	/* TODO: Find the parent data for the uart clock */
> +	hw =3D clk_hw_register_fixed_rate(NULL, "uart", NULL, 0, rate);
> +	aspeed_clk_data->hws[ASPEED_CLK_UART] =3D hw;
> +
> +	/*
> +	=C2=A0* Memory controller (M-PLL) PLL. This clock is configured by the
> +	=C2=A0* bootloader, and is exposed to Linux as a read-only clock rate.
> +	=C2=A0*/
> +	regmap_read(map, ASPEED_MPLL_PARAM, &val);
> +	aspeed_clk_data->hws[ASPEED_CLK_MPLL] =3D	aspeed_calc_pll("mpll", val);

IIRC the calculation in aspeed_calc_pll() is appropriate for the AST2500, b=
ut
not the AST2400.

> +
> +	/* SD/SDIO clock divider (TODO: There's a gate too) */
> +	hw =3D clk_hw_register_divider_table(NULL, "sdio", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 12, 3, 0,
> +			div_table,
> +			&aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_SDIO] =3D hw;
> +
> +	/* MAC AHB bus clock divider */
> +	hw =3D clk_hw_register_divider_table(NULL, "mac", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 16, 3, 0,
> +			mac_div_table,
> +			&aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_MAC] =3D hw;
> +
> +	/* LPC Host (LHCLK) clock divider */
> +	hw =3D clk_hw_register_divider_table(NULL, "lhclk", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
> +			div_table,
> +			&aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_LHCLK] =3D hw;
> +
> +	/* Video Engine (ECLK) mux and clock divider */
> +	hw =3D clk_hw_register_mux(NULL, "eclk_mux",
> +			eclk_parents, ARRAY_SIZE(eclk_parents), 0,
> +			scu_base + ASPEED_CLK_SELECTION, 2, 2,
> +			0, &aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] =3D hw;
> +	hw =3D clk_hw_register_divider_table(NULL, "eclk", "eclk_mux", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,

On the AST2500 it looks like this should start at bit 28 for 3 bits, not bi=
t
20. Separately, I'm not sure how to interpret the AST2400 datasheet here -
maybe it's similar but with different wording ("clock slow down" rather tha=
n
"divisor"?).

> +			div_table,

This doesn't seem to be correct. There's the problem of 0b000 and 0b001 map=
ping
the same value of 2 for the AST2500, whose table then increments in steps o=
f 1.
The AST2400 mapping on the otherhand is multiples of 2 starting at 2, with =
no
inconsistency for 0b000 vs 0b001.

> +			&aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK] =3D hw;
> +
> +	/* P-Bus (BCLK) clock divider */
> +	hw =3D clk_hw_register_divider_table(NULL, "bclk", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 0, 2, 0,

Bit 0 in SCU08 is a 1-bit field "CPU/AHB clock dynamic slow down enable". B=
CLK
is actually in SCU*D*8, but (perhaps confusingly) documented immediately be=
low
SCU*0*8.

Cheers,

Andrew

> +			div_table,
> +			&aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_BCLK] =3D hw;
> +
> +	return 0;
> +};
> +
> +static const struct of_device_id aspeed_clk_dt_ids[] =3D {
> +	{ .compatible =3D "aspeed,ast2400-scu", .data =3D &ast2400_data },
> +	{ .compatible =3D "aspeed,ast2500-scu", .data =3D &ast2500_data },
> +	{ },
> +};
> +
> +static struct platform_driver aspeed_clk_driver =3D {
> +	.probe=C2=A0=C2=A0=3D aspeed_clk_probe,
> +	.driver =3D {
> +		.name =3D "aspeed-clk",
> +		.of_match_table =3D aspeed_clk_dt_ids,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +builtin_platform_driver(aspeed_clk_driver);
> +
> +
> =C2=A0static void __init aspeed_ast2400_cc(struct regmap *map)
> =C2=A0{
> =C2=A0	struct clk_hw *hw;
--=-FN5vqUzJFMU4ROxU2mGm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyPlXAAoJEJ0dnzgO5LT5tO8P/1S0mmd4TZcRJ2s70fO79Hdz
osGMBzX9GwP23A8zO1OA0fKNXZfAcUebo7Xdn1SA3ZSYTeo/qoCH67raIzM2yVqW
5Hs9I80kWgtaethizlSW594ZoWrrCVV9yHL5Tm8Yfzg5Xd0VRF3wqnQQRAyqaMo+
IT1oT2Y6ykOXH9w8ZuSltn/GEpg45zMSpDkUdJbBEgGlXeGd44YgNNip7ue1YE56
VIGgbjEh/WUUyAbn4Fv9F5O2WhG5KmmxN0/E4g7KAD4pzIdngREHFC7cZNX64RyL
CBau48/nd98iAda9QY1Ot3khec+6e/W2pPSieRUbkG3imn0UmUL3Ne1lcg6S70hh
XRT19dbz1S0ip3atjqZohUp02r6iJb5luQXgkqm9NDvx5FxmCWa3F2yxhhORL99r
lDMI04q9gZYTzNSt5wk+d8xqSQVuhmkR1OUg05/d0xvWjDcTrDnIPDLqco22ORW6
Wk6uDlNvxITtVDRUe7O3ygo7inZLvaS/SfaTcPhmUFK++eiHBSNCT3LQytm6FKkp
JBE/o20DF5TC0xZc+RcyVaBGILwBjIfsCfmPGkg3bKePPkTfTIJPeLq22I3seWpc
WaV9t0m7fSTM7ZHoeBacufSYfE4FOjcoSym2cCLcnjna6uDCxFj3K+pKrzoSbGHb
+4dGPBrn1RrJxLed1A6x
=kjmJ
-----END PGP SIGNATURE-----

--=-FN5vqUzJFMU4ROxU2mGm--

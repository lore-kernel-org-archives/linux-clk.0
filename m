Return-Path: <andrew@aj.id.au>
Message-ID: <1507188151.5452.65.camel@aj.id.au>
Subject: Re: [PATCH v4 3/5] clk: aspeed: Add platform driver and register
 PLLs
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Thu, 05 Oct 2017 17:52:31 +1030
In-Reply-To: <20171003065540.11722-4-joel@jms.id.au>
References: <20171003065540.11722-1-joel@jms.id.au>
	 <20171003065540.11722-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vDFNdW4RxmW6DVRxKCFX"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-vDFNdW4RxmW6DVRxKCFX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-03 at 17:25 +1030, Joel Stanley wrote:
> This registers a platform driver to set up all of the non-core clocks.
>=C2=A0
> The clocks that have configurable rates are now registered.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>
>=C2=A0
> --
> v4:
> =C2=A0- Add eclk div table to fix ast2500 calculation
> =C2=A0- Add defines to document the BIT() macros
> =C2=A0- Pass dev where we can when registering clocks
> =C2=A0- Check for errors when registering clk_hws
> v3:
> =C2=A0- Fix bclk and eclk calculation
> =C2=A0- Seperate out ast2400 and ast25000 for pll calculation
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/clk/clk-aspeed.c | 163 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 163 insertions(+)
>=C2=A0
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index d39cf51a5114..adb295292189 100644
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
> @@ -114,6 +116,32 @@ static const struct aspeed_gate_data aspeed_gates[] =
__initconst =3D {
> =C2=A0	[ASPEED_CLK_GATE_LHCCLK] =3D	{ 28, -1, "lhclk-gate",		"lhclk", 0 }=
, /* LPC master/LPC+ */
> =C2=A0};
> =C2=A0
> +static const char * const eclk_parents[] =3D {"d1pll", "hpll", "mpll"};

Hate to throw a spanner in the works, but I think we need some extra bits h=
ere
for handling the AST2400. ECLK with M-PLL as the parent divides the clock r=
ate
by 2, there are four cases to handle where the last two cases are inverted,=
 and
d1pll isn't a valid parent.

Also this table looks to be in reverse order to the field defined in the
datasheet.

> +
> +static const struct clk_div_table ast2500_eclk_div_table[] =3D {
> +	{ 0x0, 2 },
> +	{ 0x1, 2 },
> +	{ 0x2, 3 },
> +	{ 0x3, 4 },
> +	{ 0x4, 5 },
> +	{ 0x5, 6 },
> +	{ 0x6, 7 },
> +	{ 0x7, 8 },
> +	{ 0 }
> +};
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
> @@ -179,6 +207,141 @@ static struct clk_hw *aspeed_ast2500_calc_pll(const=
 char *name, u32 val)
> =C2=A0			mult, div);
> =C2=A0}
> =C2=A0
> +struct aspeed_clk_soc_data {
> +	const struct clk_div_table *div_table;
> +	const struct clk_div_table *mac_div_table;
> +	const struct clk_div_table *eclk_div_table;
> +	struct clk_hw *(*calc_pll)(const char *name, u32 val);

As a note, I just discovered the D-PLL (and D2-PLL where applicable) freque=
ncy
function is slightly different to M-PLL and H-PLL on both the AST2400 and
AST2500. I don't think that is significant yet, but it's something to watch=
 out
for. The point is this callback isn't a general-purpose "calculate a PLL
frequency" function, so the name might be inappropriate.

> +};
> +
> +static const struct aspeed_clk_soc_data ast2500_data =3D {
> +	.div_table =3D ast2500_div_table,
> +	.mac_div_table =3D ast2500_mac_div_table,
> +	.eclk_div_table =3D ast2500_eclk_div_table,
> +	.calc_pll =3D aspeed_ast2500_calc_pll,
> +};
> +
> +static const struct aspeed_clk_soc_data ast2400_data =3D {
> +	.div_table =3D ast2400_div_table,
> +	.mac_div_table =3D ast2400_div_table,
> +	.eclk_div_table =3D ast2400_div_table,
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
> +	/* SoC generations share common layouts but have different divisors */
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
> +	=C2=A0* Memory controller (M-PLL) PLL. This clock is configured by the
> +	=C2=A0* bootloader, and is exposed to Linux as a read-only clock rate.
> +	=C2=A0*/
> +	regmap_read(map, ASPEED_MPLL_PARAM, &val);
> +	hw =3D soc_data->calc_pll("mpll", val);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_MPLL] =3D	hw;
> +
> +	/* SD/SDIO clock divider (TODO: There's a gate too) */

That sneaky gate bit!

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
> +	/* Video Engine (ECLK) mux and clock divider */
> +	hw =3D clk_hw_register_mux(dev, "eclk_mux",
> +			eclk_parents, ARRAY_SIZE(eclk_parents), 0,
> +			scu_base + ASPEED_CLK_SELECTION, 2, 2,
> +			0, &aspeed_clk_lock);

See my comment on the eclk_parents table above.

> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] =3D hw;
> +	hw =3D clk_hw_register_divider_table(dev, "eclk", "eclk_mux", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 28, 3, 0,
> +			soc_data->eclk_div_table,
> +			&aspeed_clk_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	aspeed_clk_data->hws[ASPEED_CLK_ECLK] =3D hw;
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
> +	{ .compatible =3D "aspeed,ast2400-scu", .data =3D &ast2400_data },
> +	{ .compatible =3D "aspeed,ast2500-scu", .data =3D &ast2500_data },
> +	{ }
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
> =C2=A0static void __init aspeed_ast2400_cc(struct regmap *map)
> =C2=A0{
> =C2=A0	struct clk_hw *hw;

Cheers,

Andrew
--=-vDFNdW4RxmW6DVRxKCFX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1d23AAoJEJ0dnzgO5LT5p0MP/0hGb5GQnrI17GqEKpHRGzIN
t1VULYPPY6kIgxz4KtdXW2ItkPbCht67S4+VgbiVwiyFhmLh6OgFrpK6+bdpC5eD
8CCIgQelWo54zJK9wj0dAgXd+TcbqYx0hNNWCGPMtIpo10sPyvJ0Vxo3MNhd93/p
ohc26z/7UiQH92xpcfGRxeTrFNHWnrsj7JcN6gBDyr63sd+RfwzcTwYsCiumh8Vf
WSIeogUudpPc3uDOgREo/TK7PFkqJF1yqquYNL1+xpkKek+FJF1hiCpI49tqKYBP
/RKisZKy+7rbWrSAbM8gNp7evwO1gzVnuLFYKBENnSxyRyb3eQrChfof6pUZrl52
6t/mSit5ig19p4MnyrAbcRGvpCgCvj1L7pYmmv9qD5u74B4f9xZmFTCl1HbB9NUF
mnQAKEpvUGpeFrwK8N3zEcPUVOD+esecMICchyGFpluCOFVemnaUbQdFO1aJk+S2
8aSosYV6zfrIFCThfpq5BnaBeaR4iIsch5nOYhrMMcNJ2ogGfi5lob6j6uUHSM24
c74U8fcT9T76Ijf6L+RRN+vdkghTanAXUp66AIt5b2CFCtVqlFnP91O9pThQAxUa
U8pZ3BBzSCBBCPu8XyKQGeK2tkHGe3f4dHgpIP/Fd8w7QnFAalT2CA8nTmeIWtPk
2K1yWdfk6RV7ftCOEVIx
=Ri7g
-----END PGP SIGNATURE-----

--=-vDFNdW4RxmW6DVRxKCFX--

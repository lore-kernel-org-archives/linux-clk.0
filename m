Return-Path: <andrew@aj.id.au>
Message-ID: <1510549411.4287.67.camel@aj.id.au>
Subject: Re: [PATCH v5 2/5] clk: aspeed: Register core clocks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Mon, 13 Nov 2017 15:33:31 +1030
In-Reply-To: <20171030060250.701-3-joel@jms.id.au>
References: <20171030060250.701-1-joel@jms.id.au>
	 <20171030060250.701-3-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CcvDiNkraF6i34e4wton"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-CcvDiNkraF6i34e4wton
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 16:32 +1030, Joel Stanley wrote:
> This registers the core clocks; those which are required to calculate
> the rate of the timer peripheral so the system can load a clocksource
> driver.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
>=20
> ---
> v5:
>   - Add Andrew's Reviewed-by

Not quite it seems!

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> v4:
>   - Add defines to document the BIT() macros
> v3:
>   - Fix ast2400 ahb calculation
>   - Remove incorrect 'this is wrong' comment
>   - Separate out clkin calc to be per platform
>   - Support 48MHz clkin on ast2400
> ---
>  drivers/clk/clk-aspeed.c | 177
> +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>=20
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 388a98f4ca41..a8da411326e9 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -20,7 +20,23 @@
> =20
>  #include <dt-bindings/clock/aspeed-clock.h>
> =20
> +#define ASPEED_RESET_CTRL	0x04
> +#define ASPEED_CLK_SELECTION	0x08
> +#define ASPEED_CLK_STOP_CTRL	0x0c
> +#define ASPEED_MPLL_PARAM	0x20
> +#define ASPEED_HPLL_PARAM	0x24
> +#define  AST2500_HPLL_BYPASS_EN	BIT(20)
> +#define  AST2400_HPLL_STRAPPED	BIT(18)
> +#define  AST2400_HPLL_BYPASS_EN	BIT(17)
> +#define ASPEED_MISC_CTRL	0x2c
> +#define  UART_DIV13_EN		BIT(12)
>  #define ASPEED_STRAP		0x70
> +#define  CLKIN_25MHZ_EN		BIT(23)
> +#define  AST2400_CLK_SOURCE_SEL	BIT(18)
> +#define ASPEED_CLK_SELECTION_2	0xd8
> +
> +/* Globally visible clocks */
> +static DEFINE_SPINLOCK(aspeed_clk_lock);
> =20
>  /* Keeps track of all clocks */
>  static struct clk_hw_onecell_data *aspeed_clk_data;
> @@ -98,6 +114,160 @@ static const struct aspeed_gate_data
> aspeed_gates[] =3D {
>  	[ASPEED_CLK_GATE_LHCCLK] =3D	{ 28, -1, "lhclk-gate",=09
> 	"lhclk", 0 }, /* LPC master/LPC+ */
>  };
> =20
> +static const struct clk_div_table ast2400_div_table[] =3D {
> +	{ 0x0, 2 },
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
> +static const struct clk_div_table ast2500_div_table[] =3D {
> +	{ 0x0, 4 },
> +	{ 0x1, 8 },
> +	{ 0x2, 12 },
> +	{ 0x3, 16 },
> +	{ 0x4, 20 },
> +	{ 0x5, 24 },
> +	{ 0x6, 28 },
> +	{ 0x7, 32 },
> +	{ 0 }
> +};
> +
> +static struct clk_hw *aspeed_ast2400_calc_pll(const char *name, u32
> val)
> +{
> +	unsigned int mult, div;
> +
> +	if (val & AST2400_HPLL_BYPASS_EN) {
> +		/* Pass through mode */
> +		mult =3D div =3D 1;
> +	} else {
> +		/* F =3D 24Mhz * (2-OD) * [(N + 2) / (D + 1)] */
> +		u32 n =3D (val >> 5) & 0x3f;
> +		u32 od =3D (val >> 4) & 0x1;
> +		u32 d =3D val & 0xf;
> +
> +		mult =3D (2 - od) * (n + 2);
> +		div =3D d + 1;
> +	}
> +	return clk_hw_register_fixed_factor(NULL, name, "clkin", 0,
> +			mult, div);
> +};
> +
> +static struct clk_hw *aspeed_ast2500_calc_pll(const char *name, u32
> val)
> +{
> +	unsigned int mult, div;
> +
> +	if (val & AST2500_HPLL_BYPASS_EN) {
> +		/* Pass through mode */
> +		mult =3D div =3D 1;
> +	} else {
> +		/* F =3D clkin * [(M+1) / (N+1)] / (P + 1) */
> +		u32 p =3D (val >> 13) & 0x3f;
> +		u32 m =3D (val >> 5) & 0xff;
> +		u32 n =3D val & 0x1f;
> +
> +		mult =3D (m + 1) / (n + 1);
> +		div =3D p + 1;
> +	}
> +
> +	return clk_hw_register_fixed_factor(NULL, name, "clkin", 0,
> +			mult, div);
> +}
> +
> +static void __init aspeed_ast2400_cc(struct regmap *map)
> +{
> +	struct clk_hw *hw;
> +	u32 val, freq, div;
> +
> +	/*
> +	 * CLKIN is the crystal oscillator, 24, 48 or 25MHz selected
> by
> +	 * strapping
> +	 */
> +	regmap_read(map, ASPEED_STRAP, &val);
> +	if (val & CLKIN_25MHZ_EN)
> +		freq =3D 25000000;
> +	else if (val & AST2400_CLK_SOURCE_SEL)
> +		freq =3D 48000000;
> +	else
> +		freq =3D 24000000;
> +	hw =3D clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0,
> freq);
> +	pr_debug("clkin @%u MHz\n", freq / 1000000);
> +
> +	/*
> +	 * High-speed PLL clock derived from the crystal. This the
> CPU clock,
> +	 * and we assume that it is enabled
> +	 */
> +	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> +	WARN(val & AST2400_HPLL_STRAPPED, "hpll is strapped not
> configured");
> +	aspeed_clk_data->hws[ASPEED_CLK_HPLL] =3D
> aspeed_ast2400_calc_pll("hpll", val);
> +
> +	/*
> +	 * Strap bits 11:10 define the CPU/AHB clock frequency ratio
> (aka HCLK)
> +	 *   00: Select CPU:AHB =3D 1:1
> +	 *   01: Select CPU:AHB =3D 2:1
> +	 *   10: Select CPU:AHB =3D 4:1
> +	 *   11: Select CPU:AHB =3D 3:1
> +	 */
> +	regmap_read(map, ASPEED_STRAP, &val);
> +	val =3D (val >> 10) & 0x3;
> +	div =3D val + 1;
> +	if (div =3D=3D 3)
> +		div =3D 4;
> +	else if (div =3D=3D 4)
> +		div =3D 3;
> +	hw =3D clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1,
> div);
> +	aspeed_clk_data->hws[ASPEED_CLK_AHB] =3D hw;
> +
> +	/* APB clock clock selection register SCU08 (aka PCLK) */
> +	hw =3D clk_hw_register_divider_table(NULL, "apb", "hpll", 0,
> +			scu_base + ASPEED_CLK_SELECTION, 23, 3, 0,
> +			ast2400_div_table,
> +			&aspeed_clk_lock);
> +	aspeed_clk_data->hws[ASPEED_CLK_APB] =3D hw;
> +}
> +
> +static void __init aspeed_ast2500_cc(struct regmap *map)
> +{
> +	struct clk_hw *hw;
> +	u32 val, freq, div;
> +
> +	/* CLKIN is the crystal oscillator, 24 or 25MHz selected by
> strapping */
> +	regmap_read(map, ASPEED_STRAP, &val);
> +	if (val & CLKIN_25MHZ_EN)
> +		freq =3D 25000000;
> +	else
> +		freq =3D 24000000;
> +	hw =3D clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0,
> freq);
> +	pr_debug("clkin @%u MHz\n", freq / 1000000);
> +
> +	/*
> +	 * High-speed PLL clock derived from the crystal. This the
> CPU clock,
> +	 * and we assume that it is enabled
> +	 */
> +	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> +	aspeed_clk_data->hws[ASPEED_CLK_HPLL] =3D
> aspeed_ast2500_calc_pll("hpll", val);
> +
> +	/* Strap bits 11:9 define the AXI/AHB clock frequency ratio
> (aka HCLK)*/
> +	regmap_read(map, ASPEED_STRAP, &val);
> +	val =3D (val >> 9) & 0x7;
> +	WARN(val =3D=3D 0, "strapping is zero: cannot determine ahb
> clock");
> +	div =3D 2 * (val + 1);
> +	hw =3D clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1,
> div);
> +	aspeed_clk_data->hws[ASPEED_CLK_AHB] =3D hw;
> +
> +	/* APB clock clock selection register SCU08 (aka PCLK) */
> +	regmap_read(map, ASPEED_CLK_SELECTION, &val);
> +	val =3D (val >> 23) & 0x7;
> +	div =3D 4 * (val + 1);
> +	hw =3D clk_hw_register_fixed_factor(NULL, "apb", "hpll", 0, 1,
> div);
> +	aspeed_clk_data->hws[ASPEED_CLK_APB] =3D hw;
> +};
> +
>  static void __init aspeed_cc_init(struct device_node *np)
>  {
>  	struct regmap *map;
> @@ -139,6 +309,13 @@ static void __init aspeed_cc_init(struct
> device_node *np)
>  		return;
>  	}
> =20
> +	if (of_device_is_compatible(np, "aspeed,ast2400-scu"))
> +		aspeed_ast2400_cc(map);
> +	else if (of_device_is_compatible(np, "aspeed,ast2500-scu"))
> +		aspeed_ast2500_cc(map);
> +	else
> +		pr_err("unknown platform, failed to add clocks\n");
> +
>  	aspeed_clk_data->num =3D ASPEED_NUM_CLKS;
>  	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> aspeed_clk_data);
>  	if (ret)
--=-CcvDiNkraF6i34e4wton
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJaCSejAAoJEJ0dnzgO5LT5D9gQAIB8XhSepht7Yt+r24+H7v0S
/dcLdC1tBN28BvRWvlLAFTa4InNPLsoKZmwGJYFQH6RdUJIIkiSBFK/wutMazmEX
ln+bYfrkn6ToVmltb7PEa1FiyVrwFqNHqLk4uagtw32LxkLyWHxRhNgrQA9f5NMS
WzDEZT8gd4LAURWz1e7+N1kFw9VRwkePXogADjPChsLKiED/hxcG9bCH/aEjNmKd
YllHWxNC8f7nzZ/AzdBBFnhH0PLBcDbO0X2uN8V3s1aX016Jq/jRVcV/rRK3vvEe
r9jFVayYQ6cIC8q1PLqaP8Sa/RsbRXHNFB3QTdS3LHdy0c22ODVu0e7MCznZO7Is
buo56BlhfZOIE8yqCfuu7ugbBcyRlzMZ7ePOBoMQH76JXP+Rf3kDz6NdCaG5Hnyp
48sT9ixYFMq060C5AMBrwJVszmPNGJYSwrzOhkQdaQWse8Cy8igRldrX716/QEz6
D5C6sczKApLEX70Lx4GRD3oNIkkN2rid118Txc6p1QCFVk2qIrTSBWbEntbCQjj1
FWTQWhz4Ky9UnBNDKeYDhGsTD5TljTuMctmymJyF2Zg9lsejdOg8fgFRJtRRIQkR
QJzqk2d2iVQV/KVCz7oPEDTpfUy+djcO2a/yjqJUA2+h1VBkW6pq1xcYtHMLeKMH
gQbYlu3Kn79Erh1iDUOs
=cyhQ
-----END PGP SIGNATURE-----

--=-CcvDiNkraF6i34e4wton--

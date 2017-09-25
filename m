Return-Path: <andrew@aj.id.au>
Message-ID: <1506340924.30138.26.camel@aj.id.au>
Subject: Re: [PATCH v2 2/5] clk: aspeed: Register core clocks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
	 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
	 <arnd@arndb.de>
Date: Mon, 25 Sep 2017 21:32:04 +0930
In-Reply-To: <20170921042641.7326-3-joel@jms.id.au>
References: <20170921042641.7326-1-joel@jms.id.au>
	 <20170921042641.7326-3-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KCA94PhIo7j/1xdRFYi2"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-KCA94PhIo7j/1xdRFYi2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-21 at 13:56 +0930, Joel Stanley wrote:
> This registers the core clocks; those which are required to calculate
> the rate of the timer periperhal so the system can load a clocksource
> driver.
>=C2=A0
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/clk/clk-aspeed.c | 152 ++++++++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A01 file changed, 149 insertions(+), 3 deletions(-)
>=C2=A0
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 824c54767009..e614c61b82d2 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -11,12 +11,12 @@
> =C2=A0
> =C2=A0#define pr_fmt(fmt) "clk-aspeed: " fmt
> =C2=A0
> -#include <linux/slab.h>
> -#include <linux/of_address.h>
> =C2=A0#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_address.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/slab.h>
> =C2=A0#include <linux/spinlock.h>
> -#include <linux/mfd/syscon.h>
> =C2=A0
> =C2=A0#include <dt-bindings/clock/aspeed-clock.h>
> =C2=A0
> @@ -28,6 +28,9 @@
> =C2=A0#define ASPEED_MISC_CTRL	0x2c
> =C2=A0#define ASPEED_STRAP		0x70
> =C2=A0
> +/* Globally visible clocks */
> +static DEFINE_SPINLOCK(aspeed_clk_lock);
> +
> =C2=A0/* Keeps track of all clocks */
> =C2=A0static struct clk_hw_onecell_data *aspeed_clk_data;
> =C2=A0
> @@ -112,9 +115,137 @@ static const struct aspeed_gate_data aspeed_gates[]=
 __initconst =3D {
> =C2=A0	/* 31: reserved */
> =C2=A0};
> =C2=A0
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

ast2500_div_table is unused?

> +
> +static struct clk_hw *aspeed_calc_pll(const char *name, u32 val)
> +{
> +	unsigned int mult, div;
> +
> +	if (val & BIT(20)) {
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
> +	u32 val, div, mult;
> +
> +	/*
> +	=C2=A0* High-speed PLL clock derived from the crystal. This the CPU clo=
ck,
> +	=C2=A0* and we assume that it is enabled
> +	=C2=A0*/
> +	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> +	WARN(val & BIT(18), "clock is strapped not configured");

I don't quite understand the intent of the warning - are we just trying to =
say
that the defaults have been assumed and they may not match reality? It's
probably not a great idea to not strap the board properly, but you could ge=
t
away with it for a given configuration (Numerator =3D 20, H-PLL Output Divi=
der
set, H-PLL denominator =3D 1)

> +	if (val & BIT(17)) {
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
> +	hw =3D clk_hw_register_fixed_factor(NULL, "hpll", "clkin", 0, mult, div=
);
> +	aspeed_clk_data->hws[ASPEED_CLK_HPLL] =3D hw;
> +
> +	/*
> +	=C2=A0* Strap bits 11:10 define the CPU/AHB clock frequency ratio (aka =
HCLK)
> +	=C2=A0*=C2=A0=C2=A0=C2=A000: Select CPU:AHB =3D 1:1
> +	=C2=A0*=C2=A0=C2=A0=C2=A001: Select CPU:AHB =3D 2:1
> +	=C2=A0*=C2=A0=C2=A0=C2=A010: Select CPU:AHB =3D 4:1
> +	=C2=A0*=C2=A0=C2=A0=C2=A011: Select CPU:AHB =3D 3:1
> +	=C2=A0*/
> +	regmap_read(map, ASPEED_STRAP, &val);
> +	val =3D (val >> 10) & 0x3;

How do the calculations below line up with the comment above? I can't see t=
he
connection and I feel like I've missed something.

> +	div =3D val + 1;

This is only a valid mapping for 0b00 and 0b01?

> +	if (div =3D=3D 2)
> +		div =3D 3;

If (div =3D=3D 2) after adding 1, then the original value was 0b01, and so =
div
should remain 2?

> +	else if (div =3D=3D 3)
> +		div =3D 2;

If (div =3D=3D 3) after adding 1, then the original value was 0b10, and so =
div
should be 4?

> +	hw =3D clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, div);
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
> +	u32 val, div;
> +
> +	/*
> +	=C2=A0* High-speed PLL clock derived from the crystal. This the CPU clo=
ck,
> +	=C2=A0* and we assume that it is enabled
> +	=C2=A0*/
> +	regmap_read(map, ASPEED_HPLL_PARAM, &val);
> +	aspeed_clk_data->hws[ASPEED_CLK_HPLL] =3D aspeed_calc_pll("hpll", val);

Why did you extract the aspeed_calc_pll() implementation for the ast2500 bu=
t
not the ast2400?

> +
> +	/* Strap bits 11:9 define the AXI/AHB clock frequency ratio (aka HCLK)*=
/
> +	regmap_read(map, ASPEED_STRAP, &val);
> +	val =3D (val >> 9) & 0x7;
> +	WARN_ON(val =3D=3D 0);

Maybe WARN() would be better here to explain what's going wrong (zero is an
undefined value)?

> +	div =3D 2 * (val + 1);
> +	hw =3D clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, div);
> +	aspeed_clk_data->hws[ASPEED_CLK_AHB] =3D hw;
> +
> +	/* APB clock clock selection register SCU08 (aka PCLK) */
> +	/* TODO: this is wrong! */

Why is this wrong?

> +	regmap_read(map, ASPEED_CLK_SELECTION, &val);
> +	val =3D (val >> 23) & 0x7;
> +	div =3D 4 * (val + 1);
> +	hw =3D clk_hw_register_fixed_factor(NULL, "apb", "hpll", 0, 1, div);
> +	aspeed_clk_data->hws[ASPEED_CLK_APB] =3D hw;
> +};
> +
> +
> =C2=A0static void __init aspeed_cc_init(struct device_node *np)
> =C2=A0{
> =C2=A0	struct regmap *map;
> +	unsigned long freq;
> +	struct clk_hw *hw;
> =C2=A0	u32 val;
> =C2=A0	int ret;
> =C2=A0	int i;
> @@ -153,6 +284,21 @@ static void __init aspeed_cc_init(struct device_node=
 *np)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	/* CLKIN is the crystal oscillator, 24 or 25MHz selected by strapping *=
/
> +	if (val & BIT(23))
> +		freq =3D 25000000;
> +	else
> +		freq =3D 24000000;

This isn't true on the AST2400, where CLKIN could be 24 OR 48MHz when BIT(2=
3) is
clear. You need to test BIT(18) as well on the AST2400 to disambiguate.

> +	hw =3D clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
> +	pr_debug("clkin @%lu MHz\n", freq / 1000000);
> +
> +	if (of_device_is_compatible(np, "aspeed,ast2400-scu"))
> +		aspeed_ast2400_cc(map);
> +	else if (of_device_is_compatible(np, "aspeed,ast2500-scu"))
> +		aspeed_ast2500_cc(map);
> +	else
> +		pr_err("unknown platform, failed to add clocks\n");

I'm not confident that "borrowing" the SCU compatible like this is entirely=
 in
the spirit of its MFD nature, but maybe others can chime in.

Cheers,

Andrew

> +
> =C2=A0	aspeed_clk_data->num =3D ASPEED_NUM_CLKS;
> =C2=A0	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_c=
lk_data);
> =C2=A0	if (ret)
--=-KCA94PhIo7j/1xdRFYi2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyPA9AAoJEJ0dnzgO5LT5ik8P/jNFa6L1QLh7wT9Zgps1+OP8
2UlT7s9Or7ZP5oaB/dPlx1G5c1yU8WIo9qIWwD18MkQs99UwLmQy6NUuBnBqAr4N
PDv0oZG4yj9tT1BPfR5yDOyMsBUWB02l+Pc/weFcFkM18Q9zqG9yR91ez3xsRNhM
wZ7fwPowm1h4KgO2ZMe6KHKotA1+miOIlJM42n4XwjVUvT7a14Ye9nx9nGkL5vzl
NoR5z3+OH763K+xbKyq0ilbl001X9RTAjNW1/ahrU8/8Hk+G7AIcygAzFzWzXo2a
/WNEG8qZBKvSLjVsCd6OpUfbd6cHJcIZpzpIt8H1rn8wlP0ywmGBanB6aSIID4El
gYfPqu6bFKPdIr/rJweC8EsIjQYKSCP19cZH/Ilpe17pr9oGAjPBf5hKQsko3Nvj
xpGxa09IGa9qpJ7/kDeFILFYKK4Rjbmln5EVor9A+olZcBr34dVwxixz+TCWkprf
4NBulP3tInT/BelS3MhRcvTY/VtBf0oNQWSASJdI5PAYDwo+EWI3+2WVUIWcBEkR
PvrnB6u4A69lXSh/FXO4xpXuEga+/pJ17WLJAe+HwZJMc5W4d/MURZ0vYn8rKBdQ
7H88iGbXlqQR3F9XEFpGI2T6hnFYMHemV16Gv1NuIidn5U7Blqyh7Roe2OojXWxH
RLWFedeS3VsCjd90r0EC
=w1cY
-----END PGP SIGNATURE-----

--=-KCA94PhIo7j/1xdRFYi2--

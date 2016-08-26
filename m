Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Aug 2016 10:41:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 25/26] clk: boston: Add a driver for MIPS Boston board
 clocks
Message-ID: <20160826174144.GW19826@codeaurora.org>
References: <20160826153725.11629-1-paul.burton@imgtec.com>
 <20160826153725.11629-26-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160826153725.11629-26-paul.burton@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/26, Paul Burton wrote:
> 
>  drivers/clk/Kconfig      |   9 ++++
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-boston.c | 131 +++++++++++++++++++++++++++++++++++++++++++++++

Maybe a vendor subdirectory is appropriate? imgtec?

> +
> +struct clk_boston_state {
> +	struct clk *clk[BOSTON_CLK_COUNT];
> +	struct clk_boston clk_boston[BOSTON_CLK_COUNT];
> +	struct clk_onecell_data onecell_data[BOSTON_CLK_COUNT];
> +};
> +
> +static const char *clk_names[BOSTON_CLK_COUNT] = {

const char * const?

> +	[BOSTON_CLK_SYS] = "sys",
> +	[BOSTON_CLK_CPU] = "cpu",
> +};
> +
> +#define BOSTON_PLAT_MMCMDIV		0x30
> +# define BOSTON_PLAT_MMCMDIV_CLK0DIV	(0xff << 0)
> +# define BOSTON_PLAT_MMCMDIV_INPUT	(0xff << 8)
> +# define BOSTON_PLAT_MMCMDIV_MUL	(0xff << 16)
> +# define BOSTON_PLAT_MMCMDIV_CLK1DIV	(0xff << 24)
> +
> +static struct clk_boston *to_clk_boston(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct clk_boston, hw);
> +}
> +
> +static uint32_t ext_field(uint32_t val, uint32_t mask)

Please use u32 instead of uint32_t in drivers.

> +{
> +	return (val & mask) >> (ffs(mask) - 1);
> +}
> +
> +static unsigned long clk_boston_recalc_rate(struct clk_hw *hw,
> +					    unsigned long parent_rate)
> +{
> +	struct clk_boston *state = to_clk_boston(hw);
> +	uint32_t in_rate, mul, div;
> +	uint mmcmdiv;

unsigned int?

> +	int err;
> +
> +	err = regmap_read(state->regmap, BOSTON_PLAT_MMCMDIV, &mmcmdiv);
> +	if (err)
> +		return 0;
> +
> +	in_rate = ext_field(mmcmdiv, BOSTON_PLAT_MMCMDIV_INPUT);

This sounds like a parent rate? Should there be another clk
created for that so that parent_rate in this function is useful?

> +	mul = ext_field(mmcmdiv, BOSTON_PLAT_MMCMDIV_MUL);
> +
> +	switch (state->id) {
> +	case BOSTON_CLK_SYS:
> +		div = ext_field(mmcmdiv, BOSTON_PLAT_MMCMDIV_CLK0DIV);
> +		break;
> +	case BOSTON_CLK_CPU:
> +		div = ext_field(mmcmdiv, BOSTON_PLAT_MMCMDIV_CLK1DIV);

Why not put the CLK0DIV or CLK1DIV offset in state->id instead?
That way this function just read in_rate, mul, and div and then
does the math?

> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return (in_rate * mul * 1000000) / div;

Is this always fixed at boot? It may be easier to populate fixed
rate clks during probe with the rate calculated there. Then there
aren't any clk_ops to implement.

> +}
> +
> +static const struct clk_ops clk_boston_ops = {
> +	.recalc_rate = clk_boston_recalc_rate,
> +};
> +
> +static void __init clk_boston_setup(struct device_node *np)
> +{
> +	struct clk_boston_state *state;
> +	struct clk_init_data init;
> +	struct regmap *regmap;
> +	int i, err;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(np, "regmap");
> +	if (IS_ERR(regmap)) {
> +		pr_err("failed to find regmap\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < BOSTON_CLK_COUNT; i++) {
> +		memset(&init, 0, sizeof(init));
> +		init.flags = CLK_IS_BASIC;

Please drop this flag unless you really need it for something. As
far as I know CLK_IS_BASIC is just for OMAP code.

> +		init.name = clk_names[i];
> +		init.ops = &clk_boston_ops;
> +
> +		state->clk_boston[i].hw.init = &init;
> +		state->clk_boston[i].id = i;
> +		state->clk_boston[i].regmap = regmap;
> +
> +		state->clk[i] = clk_register(NULL, &state->clk_boston[i].hw);

Please use clk_hw_register() instead.

> +		if (IS_ERR(state->clk[i])) {
> +			pr_err("failed to register clock: %ld\n",
> +			       PTR_ERR(state->clk[i]));
> +			return;
> +		}
> +	}
> +
> +	state->onecell_data->clks = state->clk;
> +	state->onecell_data->clk_num = BOSTON_CLK_COUNT;
> +
> +	err = of_clk_add_provider(np, of_clk_src_onecell_get,
> +				  state->onecell_data);

Please use of_clk_add_hw_provider() instead.

> +	if (err)
> +		pr_err("failed to add DT provider: %d\n", err);
> +}
> +CLK_OF_DECLARE(clk_boston, "img,boston-clock", clk_boston_setup);

Please make this into a platform driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

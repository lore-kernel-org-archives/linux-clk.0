Return-Path: <sboyd@codeaurora.org>
Date: Wed, 28 Oct 2015 17:56:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH v3] clk: tango4: clkgen driver for Tango4 ARM platforms
Message-ID: <20151029005658.GA19782@codeaurora.org>
References: <562A5506.2070402@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <562A5506.2070402@sigmadesigns.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/23, Marc Gonzalez wrote:
> diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
> new file mode 100644
> index 000000000000..9fbee8ce4a95
> --- /dev/null
> +++ b/drivers/clk/clk-tango4.c
> @@ -0,0 +1,57 @@
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>

#include <linux/of.h> for of_property_read_string_index() ?

> +#include <linux/init.h>
> +#include <linux/io.h>
> +
> +static struct clk *out[2];
> +static struct clk_onecell_data clk_data = { out, 2 };
> +static void __iomem *clkgen_base;

This can be a local variable that's passed to the make_pll
function.

> +
> +#define sysclk_div (clkgen_base + 0x20)
> +#define cpuclk_div (clkgen_base + 0x24)

And these macros can be numbers only.

> +
> +#define PLL_N(val) ((val) >>  0 & 0x7f)
> +#define PLL_K(val) ((val) >> 13 & 0x07)
> +#define PLL_M(val) ((val) >> 16 & 0x07)
> +
> +#define DIV_INDEX ((readl_relaxed(clkgen_base + 0x3c) >> 8) & 15)

Don't do this. It's just confusing. I read the usage of this
macro below and thought this was a constant. 0x3c should be some
other #define and then DIV_INDEX should be:

	#define DIV_INDEX(val) (((val) >> 8) & 0x15)

> +
> +static void __init make_pll(const char *name, const char *parent, int offset)
> +{
> +	unsigned int val, mul, div;

val should be u32 type. mul and div can be unsigned int.

> +
> +	val = readl_relaxed(clkgen_base + offset);
> +	mul =  PLL_N(val) + 1;
> +	div = (PLL_M(val) + 1) << PLL_K(val);
> +	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
> +}
> +
> +static const u8 tab[16] __initconst = { 2, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4 };
> +
> +static void __init tango4_clkgen_setup(struct device_node *np)
> +{
> +	int ret, div;
> +	const char *name = NULL;
> +	const char *parent = of_clk_get_parent_name(np, 0);
> +
> +	clkgen_base = of_iomap(np, 0);
> +	if (clkgen_base == NULL)

if (!clkgen_base) is more common/desired.

> +		panic("%s: invalid address\n", np->full_name);
> +
> +	make_pll("pll0", parent, 0);
> +	make_pll("pll1", parent, 8);
> +
> +	of_property_read_string_index(np, "clock-output-names", 0, &name);

Do we even need to do this? The clock names can come from the
driver because this is tango4 specific code.

> +	out[0] = clk_register_divider(NULL, name, "pll0", 0,
> +			cpuclk_div, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);

I'd rather see clkgen_base + CPUCLK_DIV. Macro names are
typically uppercase.

> +
> +	div = readl_relaxed(sysclk_div) & BIT(23) ? tab[DIV_INDEX] : 4;
> +	of_property_read_string_index(np, "clock-output-names", 1, &name);
> +	out[1] = clk_register_fixed_factor(NULL, name, "pll1", 0, 1, div);
> +
> +	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +	if (IS_ERR(out[0]) || IS_ERR(out[1]) || ret < 0)
> +		panic("%s: clk registration failed\n", np->full_name);
> +}
> +
> +CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

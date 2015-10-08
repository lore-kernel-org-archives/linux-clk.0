Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Oct 2015 18:30:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	clk <linux-clk@vger.kernel.org>, Mans Rullgard <mans@mansr.com>,
	Mason <slash.tmp@free.fr>
Subject: Re: [PATCH v1] clk: Sigma Designs Tango4 cpuclk driver
Message-ID: <20151008013054.GC26883@codeaurora.org>
References: <5613DBA2.20708@sigmadesigns.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5613DBA2.20708@sigmadesigns.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/06, Marc Gonzalez wrote:
> Date: Tue, 6 Oct 2015 16:07:45 +0200
> Subject: [PATCH] clk: Sigma Designs Tango4 cpuclk driver

This part doesn't go here. Please fix your mailer. Also, please
add some commit text.

> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/clk/Makefile     |  1 +
>  drivers/clk/clk-tango4.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++

Is there a DT binding document somewhere?

>  2 files changed, 60 insertions(+)
>  create mode 100644 drivers/clk/clk-tango4.c
> 
> diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
> new file mode 100644
> index 000000000000..9c21e8c0b6e8
> --- /dev/null
> +++ b/drivers/clk/clk-tango4.c
> @@ -0,0 +1,59 @@
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>

We need a few more includes here for iomap, __init, readl().

> +
> +#define REG(name, ...) union name { struct { u32 __VA_ARGS__; }; u32 val; }
> +
> +REG(SYS_clkgen_pll, N:7, :6, K:3, M:3, :5, Isel:3, :3, T:1, B:1);

This is new to me. Using bitfields like this is not really a good
idea though. Please just use masks, shifts, etc. instead.

> +/*
> + * CG0, CG1, CG2, CG3 PLL Control:
> + * -------------------------------
> + *
> + * |    Byte 3     |    Byte 2     |    Byte 1     |    Byte 0     |
> + * |3 3 2 2 2 2 2 2|2 2 2 2 1 1 1 1|1 1 1 1 1 1    |               |
> + * |1 0 9 8 7 6 5 4|3 2 1 0 9 8 7 6|5 4 3 2 1 0 9 8|7 6 5 4 3 2 1 0|
> + * |-|-|-----|-----|---------|-----|-----|---------|-|-------------|
> + * |B|T|xxxxx|Isel |xxxxxxxxx|  M  |  K  |xxxxxxxxx|x|      N      |
> + * |-|-|-----|-----|---------|-----|-----|---------|-|-------------|
> + *
> + * These registers are used to configure the PLL parameters:
> + *
> + * Bits  6 to  0: N[6:0]. Default = 29
> + * Bits 15 to 13: K[2:0]. Default = 1
> + * Bit  18 to 16: M[2:0]. Default = 0
> + * Bits 26 to 24: Isel[2:0] (PLL Input Select). Default = 1
> + * Bits 30      : T (PLL Test). Default = 0
> + * Bits 31      : B (PLL Bypass). Default = 0
> + *
> + * PLL0 : Out = In * (N+1) / (M+1) / 2^K
> + * PLL1 : Same as PLL0
> + * PLL2 : Same as PLL0
> + * Default values : All PLLs configured to output 405MHz.
> + */
> +static void __init tango4_pll_setup(struct device_node *np)
> +{
> +	unsigned int mul, div;
> +	union SYS_clkgen_pll pll;
> +	const char *name = np->name;
> +	const char *parent = of_clk_get_parent_name(np, 0);
> +
> +	void __iomem *clkgen_pll = of_iomap(np, 0);

What if of_iomap() fails?

> +	pll.val = readl_relaxed(clkgen_pll);
> +	iounmap(clkgen_pll);
> +
> +	mul = (pll.N + 1);

Parenthesis are useless, please remove.

> +	div = (pll.M + 1) << pll.K;
> +	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
> +}
> +
> +static void __init tango4_div_setup(struct device_node *np)
> +{
> +	const char *name = np->name;
> +	const char *parent = of_clk_get_parent_name(np, 0);
> +	void __iomem *div_ctrl = of_iomap(np, 0);
> +
> +	clk_register_divider(NULL, name, parent, 0,
> +		div_ctrl, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
> +}
> +
> +CLK_OF_DECLARE(tango4_pll,    "sigma,tango4-pll",    tango4_pll_setup);
> +CLK_OF_DECLARE(tango4_cpuclk, "sigma,tango4-cpuclk", tango4_div_setup);

More discussion will come with the binding, but we're pushing
people towards making real platform drivers for their clock
controllers, instead of parsing everything out of DT and having
one node per clock. So if these are picking things out of some
larger clock controller block, please rewrite the binding to be a
real clock provider.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

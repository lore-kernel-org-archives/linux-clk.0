Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 14:08:04 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mason <slash.tmp@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Sebastian Frias <sf84@laposte.net>
Subject: Re: [PATCH RFC] tango4 clk rewrite
Message-ID: <20160225220803.GK4847@codeaurora.org>
References: <56BE0F25.2040909@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56BE0F25.2040909@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 02/12, Mason wrote:
> diff --git a/drivers/clk/clk-tango4.c b/drivers/clk/clk-tango4.c
> index 004ab7dfcfe3..f8fa3955f9ee 100644
> --- a/drivers/clk/clk-tango4.c
> +++ b/drivers/clk/clk-tango4.c
> @@ -4,17 +4,26 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  
> -static struct clk *out[2];
> -static struct clk_onecell_data clk_data = { out, 2 };
> +#define SYSCLK_DIV	0x20
> +#define CPUCLK_DIV	0x24
>  
> -#define SYSCLK_CTRL	0x20
> -#define CPUCLK_CTRL	0x24
> -#define LEGACY_DIV	0x3c
> +#define FATAL(cond) if (cond) panic("Unsupported clkgen setup!\n")

Please just use BUG_ON instead.

>  
> -#define PLL_N(val)	(((val) >>  0) & 0x7f)
> -#define PLL_K(val)	(((val) >> 13) & 0x7)
> -#define PLL_M(val)	(((val) >> 16) & 0x7)
> -#define DIV_INDEX(val)	(((val) >>  8) & 0xf)
> +#define CLK_COUNT 4 /* cpu_clk, sys_clk, usb_clk, sdio_clk */
> +static struct clk *out[CLK_COUNT];
> +static struct clk_onecell_data clk_data = { out, CLK_COUNT };
> +
> +#define EXTRACT(v,o,w) (((v) >> (o)) & ((1u << (w)) - 1))
> +
> +static inline u32 extract(u32 val, int offset, int width) {
> +	return (val >> offset) & ((1u << width) - 1);
> +}
> +
> +/*** CLKGEN_PLL ***/
> +#define PLL_N(v)	extract(v,  0, 7)
> +#define PLL_K(v)	extract(v, 13, 3)
> +#define PLL_M(v)	extract(v, 16, 3)
> +#define PLL_ISEL(v)	extract(v, 24, 3)

I would have left it like it is, but made it lower case to
signify "function" and not "constant".

#define pll_n(val)	((val) & 0x7f)
#define pll_k(val)	(((val) >> 13) & 0x7)
#define pll_m(val)	(((val) >> 16) & 0x7)
#define pll_isel(val)	(((val) >> 24) & 0x7)

Note how I didn't use _another_ macro to make writing the
shifting and anding logic common. That's because I'd like to know
what the pll_n "function" does without having to go through
another macro that does little but obscure the code.

And to make things even clearer, maybe calling them
extract_pll_n(), extract_pll_k(), etc. would make it clear from
the calls sites that we're extracting the pll n and pll k values
without having to look at the macro definitions.

>  
>  static void __init make_pll(int idx, const char *parent, void __iomem *base)
>  {
> @@ -26,36 +35,49 @@ static void __init make_pll(int idx, const char *parent, void __iomem *base)
>  	mul =  PLL_N(val) + 1;
>  	div = (PLL_M(val) + 1) << PLL_K(val);
>  	clk_register_fixed_factor(NULL, name, parent, 0, mul, div);
> +	FATAL(PLL_ISEL(val) != 1);
>  }
>  
> -static int __init get_div(void __iomem *base)
> +static void __init make_cd(int idx, void __iomem *base)
>  {
> -	u8 sysclk_tab[16] = { 2, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4 };
> -	int idx = DIV_INDEX(readl_relaxed(base + LEGACY_DIV));
> +	char name[8];
> +	u32 mul, div;
>  
> -	return sysclk_tab[idx];
> +	sprintf(name, "cd%d", idx);
> +	mul =  1 << 27;
> +	div = (1 << 28) + readl_relaxed(base + idx*8);

Please add spaces around '*'. Also, just do it on two lines.

	div = 1 << 28;
	div += readl_relaxed(base + idx * 8)

> +	clk_register_fixed_factor(NULL, name, "pll2", 0, mul, div);
>  }
>  
>  static void __init tango4_clkgen_setup(struct device_node *np)
>  {
> -	int div, ret;
> +	int i, err;
>  	void __iomem *base = of_iomap(np, 0);
>  	const char *parent = of_clk_get_parent_name(np, 0);
>  
>  	if (!base)
>  		panic("%s: invalid address\n", np->full_name);
>  
> +	FATAL(readl_relaxed(base + CPUCLK_DIV) & BIT(23));
> +	FATAL(readl_relaxed(base + SYSCLK_DIV) & BIT(23));

BUG_ON would read much better here. Plus a comment on what
BIT(23) means or a macro definition of it would make it clear
what we're testing for.

> +
>  	make_pll(0, parent, base);
>  	make_pll(1, parent, base);
> +	make_pll(2, parent, base);
> +	make_cd(2, base + 0x80);
> +	make_cd(6, base + 0x80);
> +
> +	out[0] = clk_register_divider(NULL, "cpu_clk", "pll0", 0,
> +			base + CPUCLK_DIV, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
> +	out[1] = clk_register_fixed_factor(NULL, "sys_clk", "pll1", 0, 1, 4);
> +	out[2] = clk_register_fixed_factor(NULL,  "usb_clk", "cd2", 0, 1, 2);
> +	out[3] = clk_register_fixed_factor(NULL, "sdio_clk", "cd6", 0, 1, 2);
>  
> -	out[0] = clk_register_divider(NULL, "cpuclk", "pll0", 0,
> -			base + CPUCLK_CTRL, 8, 8, CLK_DIVIDER_ONE_BASED, NULL);
> +	err = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
>  
> -	div = readl_relaxed(base + SYSCLK_CTRL) & BIT(23) ? get_div(base) : 4;
> -	out[1] = clk_register_fixed_factor(NULL, "sysclk", "pll1", 0, 1, div);
> +	for (i = 0; i < CLK_COUNT; ++i)
> +		if (IS_ERR(out[i])) err = 1;

Please format code properly.

	for (i = 0; i < CLK_COUNT; ++i)
		if (IS_ERR(out[i]))
			err = 1;

>  
> -	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> -	if (IS_ERR(out[0]) || IS_ERR(out[1]) || ret < 0)
> -		panic("%s: clk registration failed\n", np->full_name);
> +	if (err) panic("%s: clk registration failed\n", np->full_name);
>  }
>  CLK_OF_DECLARE(tango4_clkgen, "sigma,tango4-clkgen", tango4_clkgen_setup);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

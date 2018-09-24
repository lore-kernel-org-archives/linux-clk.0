Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180921152054.117774-1-chris.brandt@renesas.com> <20180921152054.117774-3-chris.brandt@renesas.com>
In-Reply-To: <20180921152054.117774-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 11:09:45 +0200
Message-ID: <CAMuHMdUbMJwgQ5-UQuHAMszHnQf+4m0sSws4pW-vA8di+L2RQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r7s9210: Convert some clocks to early
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Fri, Sep 21, 2018 at 5:21 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
> ostm module clocks to be registers early in boot.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -55,25 +55,25 @@ enum clk_ids {

I'd put the early core clocks here ...

>  static struct cpg_core_clk r7s9210_core_clks[] = {
>         /* External Clock Inputs */
> -       DEF_INPUT("extal",     CLK_EXTAL),
> +       /*        ".extal"  exists as early clock */
>
>         /* Internal Core Clocks */
> -       DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
> -       DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
> +       /*        ".main"   exists as early clock */
> +       /*        ".pll"    exists as early clock */

... so comments like the above are not needed.

>
>         /* Core Clock Outputs */
>         DEF_FIXED("i",      R7S9210_CLK_I,     CLK_PLL,          2, 1),
>         DEF_FIXED("g",      R7S9210_CLK_G,     CLK_PLL,          4, 1),
>         DEF_FIXED("b",      R7S9210_CLK_B,     CLK_PLL,          8, 1),
>         DEF_FIXED("p1",     R7S9210_CLK_P1,    CLK_PLL,         16, 1),
> -       DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
> +       /*        "p1c"     exists as early clock */
>         DEF_FIXED("p0",     R7S9210_CLK_P0,    CLK_PLL,         32, 1),
>  };
>

Same for early module clocks...

>  static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
> -       DEF_MOD_STB("ostm2",     34,    R7S9210_CLK_P1C),
> -       DEF_MOD_STB("ostm1",     35,    R7S9210_CLK_P1C),
> -       DEF_MOD_STB("ostm0",     36,    R7S9210_CLK_P1C),
> +       /*          "ostm2"      36     exists as early clock */
> +       /*          "ostm1"      35     exists as early clock */
> +       /*          "ostm0"      34     exists as early clock */

... and these comments.

>
>         DEF_MOD_STB("scif4",     43,    R7S9210_CLK_P1C),
>         DEF_MOD_STB("scif3",     44,    R7S9210_CLK_P1C),

> +/* The clock dividers in the table vary based on DT and register settings */
> +static void r7s9210_update_clk_table(struct clk *extal_clk, void __iomem *base)
> +{

[...]

> +}
> +
>  struct clk * __init rza2_cpg_clk_register(struct device *dev,
>         const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
>         struct clk **clks, void __iomem *base,
> @@ -99,9 +164,6 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
>         struct clk *parent;
>         unsigned int mult = 1;
>         unsigned int div = 1;
> -       u16 frqcr;
> -       u8 index;
> -       int i;
>
>         parent = clks[core->parent];
>         if (IS_ERR(parent))
> @@ -123,47 +185,8 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
>         }
>
>         /* Adjust the dividers based on the current FRQCR setting */
> -       if (core->id == CLK_MAIN) {

[...]

> -       }
> +       if (core->id == CLK_MAIN)
> +               r7s9210_update_clk_table(parent, base);

While factoring out this block into its own function is a good idea, it's not
related to this patch, is it? So I think it should be done in a separate patch.

> @@ -181,9 +204,25 @@ const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
>         .num_mod_clks = ARRAY_SIZE(r7s9210_mod_clks),
>         .num_hw_mod_clks = 11 * 32, /* includes STBCR0 which doesn't exist */
>
> +       /* Early Core Clocks */
> +       .early_core_clks = r7s9210_early_core_clks,
> +       .num_early_core_clks = ARRAY_SIZE(r7s9210_early_core_clks),
> +
> +       /* Early Module Clocks */
> +       .early_mod_clks = r7s9210_early_mod_clks,
> +       .num_early_mod_clks = ARRAY_SIZE(r7s9210_early_mod_clks),

All early clocks at the top?

> +
>         /* Callbacks */
>         .cpg_clk_register = rza2_cpg_clk_register,
>
>         /* RZ/A2 has Standby Control Registers */
>         .stbyctrl = true,
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

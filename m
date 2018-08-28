Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <d40960df-c7c4-630b-5f53-1a65b550ce8b@cogentembedded.com>
In-Reply-To: <d40960df-c7c4-630b-5f53-1a65b550ce8b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 10:58:02 +0200
Message-ID: <CAMuHMdXiD28FaE+nDUZ2Vp2=aZzmPR1aA+KXhH2QWtO0=FfVQA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77970: add SD0H/SD0 clocks for SDHI
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Tue, Aug 21, 2018 at 6:41 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On R-Car V3M (AKA R8A77970), the SD0CKCR is laid out differently than on
> the other R-Car gen3 SoCs. In fact, the layout is the same as on R-Car gen2
> SoCs, so we'll need to copy the divisor tables from the R-Car gen2 driver.
> We'll also need to support the SoC specific clock types, thus we're adding
> CLK_TYPE_GEN3_SOC_BASE at the end of 'enum rcar_gen3_clk_types', declare
> SD0H/SDH clocks in 'enum r8a77970_clk_types', and handle those clocks in
> the overridden cpg_clk_register() method; then, finally, add the SD-IF
> module clock (derived from the SD0 clock).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Looks good to me, but two minor nits below.

> --- renesas-drivers.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
> +++ renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c

> @@ -173,11 +198,46 @@ static int __init r8a77970_cpg_mssr_init
>         if (error)
>                 return error;
>
> +       spin_lock_init(&cpg_lock);
> +
>         cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
>
>         return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
>  }
>
> +struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
> +       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> +       struct clk **clks, void __iomem *base,
> +       struct raw_notifier_head *notifiers)

static

> +{
> +       const struct clk_div_table *table;
> +       const struct clk *parent;
> +       unsigned int shift;
> +
> +       switch (core->type) {
> +       case CLK_TYPE_R8A77970_SD0H:
> +               table = cpg_sd0h_div_table;
> +               shift = 8;
> +               break;
> +       case CLK_TYPE_R8A77970_SD0:
> +               table = cpg_sd0_div_table;
> +               shift = 4;
> +               break;
> +       default:
> +               return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
> +                                                 notifiers);
> +       }
> +
> +       parent = clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       return clk_register_divider_table(NULL, core->name,
> +                                         __clk_get_name(parent), 0,
> +                                         base + 0x74, shift, 4, 0, table,

CPG_SD0CKCR instead of hardcoded 0x74?


> +                                         &cpg_lock);
> +}
> +
>  const struct cpg_mssr_info r8a77970_cpg_mssr_info __initconst = {
>         /* Core Clocks */
>         .core_clks = r8a77970_core_clks,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

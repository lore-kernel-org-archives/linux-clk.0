Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170113150842.30250-1-linus.walleij@linaro.org>
References: <20170113150842.30250-1-linus.walleij@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Jan 2017 16:55:43 +0100
Message-ID: <CAPDyKFosic9UBb01dQ1kpHTSbt6ASeZ54ktkAwBZ2S=7WrajjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: ux500: Convert ABx500 clocks to use OF probing
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 13 January 2017 at 16:08, Linus Walleij <linus.walleij@linaro.org> wrote:
> These clocks have been broken for a long time unfortunately, a
> hurdle of misc problems made them stop working at some point
> breaking USB and audio on Ux500.
>
> The platform as such and all "regular" clocks are migrated to
> OF/device tree, so let's migrate also this driver.
>
> With this patch and the corresponding DTS fixes, and a bunch
> of probe deferral fixes, audio starts working again on Ux500.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Stephen, can pick this up once Rob acked the DT change?

Kind regards
Uffe


> ---
>  drivers/clk/ux500/abx500-clk.c         | 36 ++++++++++++++++++++++++----------
>  include/dt-bindings/clock/ste-ab8500.h | 11 +++++++++++
>  2 files changed, 37 insertions(+), 10 deletions(-)
>  create mode 100644 include/dt-bindings/clock/ste-ab8500.h
>
> diff --git a/drivers/clk/ux500/abx500-clk.c b/drivers/clk/ux500/abx500-clk.c
> index 0467fcae3b0e..2257d12ba988 100644
> --- a/drivers/clk/ux500/abx500-clk.c
> +++ b/drivers/clk/ux500/abx500-clk.c
> @@ -10,19 +10,26 @@
>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/abx500/ab8500.h>
>  #include <linux/mfd/abx500/ab8500-sysctrl.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
> +#include <dt-bindings/clock/ste-ab8500.h>
>  #include "clk.h"
>
> +#define AB8500_NUM_CLKS 6
> +
> +static struct clk *ab8500_clks[AB8500_NUM_CLKS];
> +static struct clk_onecell_data ab8500_clk_data;
> +
>  /* Clock definitions for ab8500 */
>  static int ab8500_reg_clks(struct device *dev)
>  {
>         int ret;
>         struct clk *clk;
> -
> +       struct device_node *np = dev->of_node;
>         const char *intclk_parents[] = {"ab8500_sysclk", "ulpclk"};
>         u16 intclk_reg_sel[] = {0 , AB8500_SYSULPCLKCTRL1};
>         u8 intclk_reg_mask[] = {0 , AB8500_SYSULPCLKCTRL1_SYSULPCLKINTSEL_MASK};
> @@ -31,8 +38,6 @@ static int ab8500_reg_clks(struct device *dev)
>                 (1 << AB8500_SYSULPCLKCTRL1_SYSULPCLKINTSEL_SHIFT)
>         };
>
> -       dev_info(dev, "register clocks for ab850x\n");
> -
>         /* Enable SWAT */
>         ret = ab8500_sysctrl_set(AB8500_SWATCTRL, AB8500_SWATCTRL_SWATENABLE);
>         if (ret)
> @@ -42,37 +47,43 @@ static int ab8500_reg_clks(struct device *dev)
>         clk = clk_reg_sysctrl_gate(dev , "ab8500_sysclk2", "ab8500_sysclk",
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_SYSCLKBUF2REQ,
>                 AB8500_SYSULPCLKCTRL1_SYSCLKBUF2REQ, 0, 0);
> -       clk_register_clkdev(clk, "sysclk", "0-0070");
> +       ab8500_clks[AB8500_SYSCLK_BUF2] = clk;
>
>         /* ab8500_sysclk3 */
>         clk = clk_reg_sysctrl_gate(dev , "ab8500_sysclk3", "ab8500_sysclk",
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_SYSCLKBUF3REQ,
>                 AB8500_SYSULPCLKCTRL1_SYSCLKBUF3REQ, 0, 0);
> -       clk_register_clkdev(clk, "sysclk", "cg1960_core.0");
> +       ab8500_clks[AB8500_SYSCLK_BUF3] = clk;
>
>         /* ab8500_sysclk4 */
>         clk = clk_reg_sysctrl_gate(dev , "ab8500_sysclk4", "ab8500_sysclk",
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_SYSCLKBUF4REQ,
>                 AB8500_SYSULPCLKCTRL1_SYSCLKBUF4REQ, 0, 0);
> +       ab8500_clks[AB8500_SYSCLK_BUF4] = clk;
>
>         /* ab_ulpclk */
>         clk = clk_reg_sysctrl_gate_fixed_rate(dev, "ulpclk", NULL,
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_ULPCLKREQ,
>                 AB8500_SYSULPCLKCTRL1_ULPCLKREQ,
>                 38400000, 9000, 0);
> -       clk_register_clkdev(clk, "ulpclk", "snd-soc-mop500.0");
> +       ab8500_clks[AB8500_SYSCLK_ULP] = clk;
>
>         /* ab8500_intclk */
>         clk = clk_reg_sysctrl_set_parent(dev , "intclk", intclk_parents, 2,
>                 intclk_reg_sel, intclk_reg_mask, intclk_reg_bits, 0);
> -       clk_register_clkdev(clk, "intclk", "snd-soc-mop500.0");
> -       clk_register_clkdev(clk, NULL, "ab8500-pwm.1");
> +       ab8500_clks[AB8500_SYSCLK_INT] = clk;
>
>         /* ab8500_audioclk */
>         clk = clk_reg_sysctrl_gate(dev , "audioclk", "intclk",
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_AUDIOCLKENA,
>                 AB8500_SYSULPCLKCTRL1_AUDIOCLKENA, 0, 0);
> -       clk_register_clkdev(clk, "audioclk", "ab8500-codec.0");
> +       ab8500_clks[AB8500_SYSCLK_AUDIO] = clk;
> +
> +       ab8500_clk_data.clks = ab8500_clks;
> +       ab8500_clk_data.clk_num = ARRAY_SIZE(ab8500_clks);
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &ab8500_clk_data);
> +
> +       dev_info(dev, "registered clocks for ab850x\n");
>
>         return 0;
>  }
> @@ -108,9 +119,15 @@ static int abx500_clk_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> +static const struct of_device_id abx500_clk_match[] = {
> +       { .compatible = "stericsson,ab8500-clk", },
> +       {}
> +};
> +
>  static struct platform_driver abx500_clk_driver = {
>         .driver = {
>                 .name = "abx500-clk",
> +               .of_match_table = abx500_clk_match,
>         },
>         .probe  = abx500_clk_probe,
>  };
> @@ -119,7 +136,6 @@ static int __init abx500_clk_init(void)
>  {
>         return platform_driver_register(&abx500_clk_driver);
>  }
> -
>  arch_initcall(abx500_clk_init);
>
>  MODULE_AUTHOR("Ulf Hansson <ulf.hansson@linaro.org");
> diff --git a/include/dt-bindings/clock/ste-ab8500.h b/include/dt-bindings/clock/ste-ab8500.h
> new file mode 100644
> index 000000000000..6731f1f00a84
> --- /dev/null
> +++ b/include/dt-bindings/clock/ste-ab8500.h
> @@ -0,0 +1,11 @@
> +#ifndef __STE_CLK_AB8500_H__
> +#define __STE_CLK_AB8500_H__
> +
> +#define AB8500_SYSCLK_BUF2     0
> +#define AB8500_SYSCLK_BUF3     1
> +#define AB8500_SYSCLK_BUF4     2
> +#define AB8500_SYSCLK_ULP      3
> +#define AB8500_SYSCLK_INT      4
> +#define AB8500_SYSCLK_AUDIO    5
> +
> +#endif
> --
> 2.9.3
>

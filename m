Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170113150747.30105-1-linus.walleij@linaro.org>
References: <20170113150747.30105-1-linus.walleij@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Jan 2017 15:08:25 +0100
Message-ID: <CAPDyKFp_32VjpLqfpoOtWBgtFS=4i_=xv6SN-X13O8mMesca7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: ux500: move AB8500 sysclk over to PRCMU clk driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 13 January 2017 at 16:07, Linus Walleij <linus.walleij@linaro.org> wrote:
> The AB8500 sysclk is just another PRCMU-controlled clock, there
> is no reason why it should be in the ABx500-controlled part of

Right, this change makes sense to me!

> the clock implementation. Doing this and the corresponding device
> tree changes makes USB work on the Ux500 again.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/clk/ux500/abx500-clk.c   | 8 --------
>  drivers/clk/ux500/u8500_of_clk.c | 3 +++
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/ux500/abx500-clk.c b/drivers/clk/ux500/abx500-clk.c
> index a07c31e6f26d..0467fcae3b0e 100644
> --- a/drivers/clk/ux500/abx500-clk.c
> +++ b/drivers/clk/ux500/abx500-clk.c
> @@ -15,7 +15,6 @@
>  #include <linux/mfd/abx500/ab8500-sysctrl.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
> -#include <linux/mfd/dbx500-prcmu.h>
>  #include "clk.h"
>
>  /* Clock definitions for ab8500 */
> @@ -39,13 +38,6 @@ static int ab8500_reg_clks(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       /* ab8500_sysclk */
> -       clk = clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
> -       clk_register_clkdev(clk, "sysclk", "ab8500-usb.0");
> -       clk_register_clkdev(clk, "sysclk", "ab-iddet.0");
> -       clk_register_clkdev(clk, "sysclk", "snd-soc-mop500.0");
> -       clk_register_clkdev(clk, "sysclk", "shrm_bus");

These lookups are removed in this change. Are there already existing
name lookups already defined in the DTS?

> -
>         /* ab8500_sysclk2 */
>         clk = clk_reg_sysctrl_gate(dev , "ab8500_sysclk2", "ab8500_sysclk",
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_SYSCLKBUF2REQ,
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index e960d686d9db..d5888591e1a9 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -206,6 +206,9 @@ static void u8500_clk_init(struct device_node *np)
>         clk = clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, 0);
>         prcmu_clk[PRCMU_TIMCLK] = clk;
>
> +       clk = clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
> +       prcmu_clk[PRCMU_SYSCLK] = clk;
> +
>         clk = clk_reg_prcmu_opp_volt_scalable("sdmmcclk", NULL, PRCMU_SDMMCCLK,
>                                         100000000, CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_SDMMCCLK] = clk;
> --
> 2.9.3
>

Kind regards
Uffe

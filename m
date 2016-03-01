Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1456858826-28541-20-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
	<1456858826-28541-20-git-send-email-sboyd@codeaurora.org>
Date: Tue, 1 Mar 2016 21:05:27 +0100
Message-ID: <CAPDyKFrVjjJ0_c-T1h8Cu8trAgnzyYyfvYC1spSrXznrK1BhHQ@mail.gmail.com>
Subject: Re: [PATCH 19/41] clk: ux500: Remove CLK_IS_ROOT
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 1 March 2016 at 20:00, Stephen Boyd <sboyd@codeaurora.org> wrote:
> This flag is a no-op now. Remove usage of the flag.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/ux500/abx500-clk.c   |  5 +--
>  drivers/clk/ux500/u8500_of_clk.c | 74 ++++++++++++++++++-------------------
>  drivers/clk/ux500/u8540_clk.c    | 80 +++++++++++++++++++---------------------
>  3 files changed, 75 insertions(+), 84 deletions(-)
>
> diff --git a/drivers/clk/ux500/abx500-clk.c b/drivers/clk/ux500/abx500-clk.c
> index 222425d08ab6..a07c31e6f26d 100644
> --- a/drivers/clk/ux500/abx500-clk.c
> +++ b/drivers/clk/ux500/abx500-clk.c
> @@ -40,8 +40,7 @@ static int ab8500_reg_clks(struct device *dev)
>                 return ret;
>
>         /* ab8500_sysclk */
> -       clk = clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
>         clk_register_clkdev(clk, "sysclk", "ab8500-usb.0");
>         clk_register_clkdev(clk, "sysclk", "ab-iddet.0");
>         clk_register_clkdev(clk, "sysclk", "snd-soc-mop500.0");
> @@ -68,7 +67,7 @@ static int ab8500_reg_clks(struct device *dev)
>         clk = clk_reg_sysctrl_gate_fixed_rate(dev, "ulpclk", NULL,
>                 AB8500_SYSULPCLKCTRL1, AB8500_SYSULPCLKCTRL1_ULPCLKREQ,
>                 AB8500_SYSULPCLKCTRL1_ULPCLKREQ,
> -               38400000, 9000, CLK_IS_ROOT);
> +               38400000, 9000, 0);
>         clk_register_clkdev(clk, "ulpclk", "snd-soc-mop500.0");
>
>         /* ab8500_intclk */
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index 271c09644652..9a736d939806 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -91,21 +91,21 @@ void u8500_clk_init(void)
>
>         /* Clock sources */
>         clk = clk_reg_prcmu_gate("soc0_pll", NULL, PRCMU_PLLSOC0,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               CLK_IGNORE_UNUSED);
>         prcmu_clk[PRCMU_PLLSOC0] = clk;
>
>         clk = clk_reg_prcmu_gate("soc1_pll", NULL, PRCMU_PLLSOC1,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               CLK_IGNORE_UNUSED);
>         prcmu_clk[PRCMU_PLLSOC1] = clk;
>
>         clk = clk_reg_prcmu_gate("ddr_pll", NULL, PRCMU_PLLDDR,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               CLK_IGNORE_UNUSED);
>         prcmu_clk[PRCMU_PLLDDR] = clk;
>
>         /* FIXME: Add sys, ulp and int clocks here. */
>
>         rtc_clk = clk_register_fixed_rate(NULL, "rtc32k", "NULL",
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED,
> +                               CLK_IGNORE_UNUSED,
>                                 32768);
>
>         /* PRCMU clocks */
> @@ -126,105 +126,101 @@ void u8500_clk_init(void)
>                 clk = clk_reg_prcmu_gate("sgclk", sgaclk_parent,
>                                         PRCMU_SGACLK, 0);
>         else
> -               clk = clk_reg_prcmu_gate("sgclk", NULL,
> -                                       PRCMU_SGACLK, CLK_IS_ROOT);
> +               clk = clk_reg_prcmu_gate("sgclk", NULL, PRCMU_SGACLK, 0);
>         prcmu_clk[PRCMU_SGACLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("uartclk", NULL, PRCMU_UARTCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("uartclk", NULL, PRCMU_UARTCLK, 0);
>         prcmu_clk[PRCMU_UARTCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("msp02clk", NULL, PRCMU_MSP02CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("msp02clk", NULL, PRCMU_MSP02CLK, 0);
>         prcmu_clk[PRCMU_MSP02CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("msp1clk", NULL, PRCMU_MSP1CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("msp1clk", NULL, PRCMU_MSP1CLK, 0);
>         prcmu_clk[PRCMU_MSP1CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("i2cclk", NULL, PRCMU_I2CCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("i2cclk", NULL, PRCMU_I2CCLK, 0);
>         prcmu_clk[PRCMU_I2CCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("slimclk", NULL, PRCMU_SLIMCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("slimclk", NULL, PRCMU_SLIMCLK, 0);
>         prcmu_clk[PRCMU_SLIMCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("per1clk", NULL, PRCMU_PER1CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per1clk", NULL, PRCMU_PER1CLK, 0);
>         prcmu_clk[PRCMU_PER1CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("per2clk", NULL, PRCMU_PER2CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per2clk", NULL, PRCMU_PER2CLK, 0);
>         prcmu_clk[PRCMU_PER2CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("per3clk", NULL, PRCMU_PER3CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per3clk", NULL, PRCMU_PER3CLK, 0);
>         prcmu_clk[PRCMU_PER3CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("per5clk", NULL, PRCMU_PER5CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per5clk", NULL, PRCMU_PER5CLK, 0);
>         prcmu_clk[PRCMU_PER5CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("per6clk", NULL, PRCMU_PER6CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per6clk", NULL, PRCMU_PER6CLK, 0);
>         prcmu_clk[PRCMU_PER6CLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("per7clk", NULL, PRCMU_PER7CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per7clk", NULL, PRCMU_PER7CLK, 0);
>         prcmu_clk[PRCMU_PER7CLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("lcdclk", NULL, PRCMU_LCDCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_LCDCLK] = clk;
>
> -       clk = clk_reg_prcmu_opp_gate("bmlclk", NULL, PRCMU_BMLCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_opp_gate("bmlclk", NULL, PRCMU_BMLCLK, 0);
>         prcmu_clk[PRCMU_BMLCLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("hsitxclk", NULL, PRCMU_HSITXCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_HSITXCLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("hsirxclk", NULL, PRCMU_HSIRXCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_HSIRXCLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("hdmiclk", NULL, PRCMU_HDMICLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_HDMICLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("apeatclk", NULL, PRCMU_APEATCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("apeatclk", NULL, PRCMU_APEATCLK, 0);
>         prcmu_clk[PRCMU_APEATCLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("apetraceclk", NULL, PRCMU_APETRACECLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_APETRACECLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("mcdeclk", NULL, PRCMU_MCDECLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("mcdeclk", NULL, PRCMU_MCDECLK, 0);
>         prcmu_clk[PRCMU_MCDECLK] = clk;
>
> -       clk = clk_reg_prcmu_opp_gate("ipi2cclk", NULL, PRCMU_IPI2CCLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_opp_gate("ipi2cclk", NULL, PRCMU_IPI2CCLK, 0);
>         prcmu_clk[PRCMU_IPI2CCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("dsialtclk", NULL, PRCMU_DSIALTCLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("dsialtclk", NULL, PRCMU_DSIALTCLK, 0);
>         prcmu_clk[PRCMU_DSIALTCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("dmaclk", NULL, PRCMU_DMACLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("dmaclk", NULL, PRCMU_DMACLK, 0);
>         prcmu_clk[PRCMU_DMACLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("b2r2clk", NULL, PRCMU_B2R2CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("b2r2clk", NULL, PRCMU_B2R2CLK, 0);
>         prcmu_clk[PRCMU_B2R2CLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("tvclk", NULL, PRCMU_TVCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_TVCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("sspclk", NULL, PRCMU_SSPCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("sspclk", NULL, PRCMU_SSPCLK, 0);
>         prcmu_clk[PRCMU_SSPCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("rngclk", NULL, PRCMU_RNGCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("rngclk", NULL, PRCMU_RNGCLK, 0);
>         prcmu_clk[PRCMU_RNGCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("uiccclk", NULL, PRCMU_UICCCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("uiccclk", NULL, PRCMU_UICCCLK, 0);
>         prcmu_clk[PRCMU_UICCCLK] = clk;
>
> -       clk = clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, 0);
>         prcmu_clk[PRCMU_TIMCLK] = clk;
>
>         clk = clk_reg_prcmu_opp_volt_scalable("sdmmcclk", NULL, PRCMU_SDMMCCLK,
> -                                       100000000,
> -                                       CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                       100000000, CLK_SET_RATE_GATE);
>         prcmu_clk[PRCMU_SDMMCCLK] = clk;
>
>         clk = clk_reg_prcmu_scalable("dsi_pll", "hdmiclk",
> @@ -252,7 +248,7 @@ void u8500_clk_init(void)
>         prcmu_clk[PRCMU_DSI2ESCCLK] = clk;
>
>         clk = clk_reg_prcmu_scalable_rate("armss", NULL,
> -                               PRCMU_ARMSS, 0, CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               PRCMU_ARMSS, 0, CLK_IGNORE_UNUSED);
>         prcmu_clk[PRCMU_ARMSS] = clk;
>
>         twd_clk = clk_register_fixed_factor(NULL, "smp_twd", "armss",
> diff --git a/drivers/clk/ux500/u8540_clk.c b/drivers/clk/ux500/u8540_clk.c
> index d7bcb7a86615..86549e59fb42 100644
> --- a/drivers/clk/ux500/u8540_clk.c
> +++ b/drivers/clk/ux500/u8540_clk.c
> @@ -56,28 +56,28 @@ void u8540_clk_init(void)
>         /* Clock sources. */
>         /* Fixed ClockGen */
>         clk = clk_reg_prcmu_gate("soc0_pll", NULL, PRCMU_PLLSOC0,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               CLK_IGNORE_UNUSED);
>         clk_register_clkdev(clk, "soc0_pll", NULL);
>
>         clk = clk_reg_prcmu_gate("soc1_pll", NULL, PRCMU_PLLSOC1,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               CLK_IGNORE_UNUSED);
>         clk_register_clkdev(clk, "soc1_pll", NULL);
>
>         clk = clk_reg_prcmu_gate("ddr_pll", NULL, PRCMU_PLLDDR,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               CLK_IGNORE_UNUSED);
>         clk_register_clkdev(clk, "ddr_pll", NULL);
>
>         clk = clk_register_fixed_rate(NULL, "rtc32k", NULL,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED,
> +                               CLK_IGNORE_UNUSED,
>                                 32768);
>         clk_register_clkdev(clk, "clk32k", NULL);
>         clk_register_clkdev(clk, "apb_pclk", "rtc-pl031");
>
>         clk = clk_register_fixed_rate(NULL, "ulp38m4", NULL,
> -                               CLK_IS_ROOT|CLK_IGNORE_UNUSED,
> +                               CLK_IGNORE_UNUSED,
>                                 38400000);
>
> -       clk = clk_reg_prcmu_gate("uartclk", NULL, PRCMU_UARTCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("uartclk", NULL, PRCMU_UARTCLK, 0);
>         clk_register_clkdev(clk, NULL, "UART");
>
>         /* msp02clk needs a abx500 clk as parent. Handle by abx500 clk driver */
> @@ -85,120 +85,116 @@ void u8540_clk_init(void)
>                         PRCMU_MSP02CLK, 0);
>         clk_register_clkdev(clk, NULL, "MSP02");
>
> -       clk = clk_reg_prcmu_gate("msp1clk", NULL, PRCMU_MSP1CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("msp1clk", NULL, PRCMU_MSP1CLK, 0);
>         clk_register_clkdev(clk, NULL, "MSP1");
>
> -       clk = clk_reg_prcmu_gate("i2cclk", NULL, PRCMU_I2CCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("i2cclk", NULL, PRCMU_I2CCLK, 0);
>         clk_register_clkdev(clk, NULL, "I2C");
>
> -       clk = clk_reg_prcmu_gate("slimclk", NULL, PRCMU_SLIMCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("slimclk", NULL, PRCMU_SLIMCLK, 0);
>         clk_register_clkdev(clk, NULL, "slim");
>
> -       clk = clk_reg_prcmu_gate("per1clk", NULL, PRCMU_PER1CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per1clk", NULL, PRCMU_PER1CLK, 0);
>         clk_register_clkdev(clk, NULL, "PERIPH1");
>
> -       clk = clk_reg_prcmu_gate("per2clk", NULL, PRCMU_PER2CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per2clk", NULL, PRCMU_PER2CLK, 0);
>         clk_register_clkdev(clk, NULL, "PERIPH2");
>
> -       clk = clk_reg_prcmu_gate("per3clk", NULL, PRCMU_PER3CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per3clk", NULL, PRCMU_PER3CLK, 0);
>         clk_register_clkdev(clk, NULL, "PERIPH3");
>
> -       clk = clk_reg_prcmu_gate("per5clk", NULL, PRCMU_PER5CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per5clk", NULL, PRCMU_PER5CLK, 0);
>         clk_register_clkdev(clk, NULL, "PERIPH5");
>
> -       clk = clk_reg_prcmu_gate("per6clk", NULL, PRCMU_PER6CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per6clk", NULL, PRCMU_PER6CLK, 0);
>         clk_register_clkdev(clk, NULL, "PERIPH6");
>
> -       clk = clk_reg_prcmu_gate("per7clk", NULL, PRCMU_PER7CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("per7clk", NULL, PRCMU_PER7CLK, 0);
>         clk_register_clkdev(clk, NULL, "PERIPH7");
>
>         clk = clk_reg_prcmu_scalable("lcdclk", NULL, PRCMU_LCDCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                               CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "lcd");
>         clk_register_clkdev(clk, "lcd", "mcde");
>
> -       clk = clk_reg_prcmu_opp_gate("bmlclk", NULL, PRCMU_BMLCLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_opp_gate("bmlclk", NULL, PRCMU_BMLCLK, 0);
>         clk_register_clkdev(clk, NULL, "bml");
>
>         clk = clk_reg_prcmu_scalable("hsitxclk", NULL, PRCMU_HSITXCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                    CLK_SET_RATE_GATE);
>
>         clk = clk_reg_prcmu_scalable("hsirxclk", NULL, PRCMU_HSIRXCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                    CLK_SET_RATE_GATE);
>
>         clk = clk_reg_prcmu_scalable("hdmiclk", NULL, PRCMU_HDMICLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                    CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "hdmi");
>         clk_register_clkdev(clk, "hdmi", "mcde");
>
> -       clk = clk_reg_prcmu_gate("apeatclk", NULL, PRCMU_APEATCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("apeatclk", NULL, PRCMU_APEATCLK, 0);
>         clk_register_clkdev(clk, NULL, "apeat");
>
> -       clk = clk_reg_prcmu_gate("apetraceclk", NULL, PRCMU_APETRACECLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("apetraceclk", NULL, PRCMU_APETRACECLK, 0);
>         clk_register_clkdev(clk, NULL, "apetrace");
>
> -       clk = clk_reg_prcmu_gate("mcdeclk", NULL, PRCMU_MCDECLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("mcdeclk", NULL, PRCMU_MCDECLK, 0);
>         clk_register_clkdev(clk, NULL, "mcde");
>         clk_register_clkdev(clk, "mcde", "mcde");
>         clk_register_clkdev(clk, NULL, "dsilink.0");
>         clk_register_clkdev(clk, NULL, "dsilink.1");
>         clk_register_clkdev(clk, NULL, "dsilink.2");
>
> -       clk = clk_reg_prcmu_opp_gate("ipi2cclk", NULL, PRCMU_IPI2CCLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_opp_gate("ipi2cclk", NULL, PRCMU_IPI2CCLK, 0);
>         clk_register_clkdev(clk, NULL, "ipi2");
>
> -       clk = clk_reg_prcmu_gate("dsialtclk", NULL, PRCMU_DSIALTCLK,
> -                               CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("dsialtclk", NULL, PRCMU_DSIALTCLK, 0);
>         clk_register_clkdev(clk, NULL, "dsialt");
>
> -       clk = clk_reg_prcmu_gate("dmaclk", NULL, PRCMU_DMACLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("dmaclk", NULL, PRCMU_DMACLK, 0);
>         clk_register_clkdev(clk, NULL, "dma40.0");
>
> -       clk = clk_reg_prcmu_gate("b2r2clk", NULL, PRCMU_B2R2CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("b2r2clk", NULL, PRCMU_B2R2CLK, 0);
>         clk_register_clkdev(clk, NULL, "b2r2");
>         clk_register_clkdev(clk, NULL, "b2r2_core");
>         clk_register_clkdev(clk, NULL, "U8500-B2R2.0");
>         clk_register_clkdev(clk, NULL, "b2r2_1_core");
>
>         clk = clk_reg_prcmu_scalable("tvclk", NULL, PRCMU_TVCLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                    CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "tv");
>         clk_register_clkdev(clk, "tv", "mcde");
>
> -       clk = clk_reg_prcmu_gate("sspclk", NULL, PRCMU_SSPCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("sspclk", NULL, PRCMU_SSPCLK, 0);
>         clk_register_clkdev(clk, NULL, "SSP");
>
> -       clk = clk_reg_prcmu_gate("rngclk", NULL, PRCMU_RNGCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("rngclk", NULL, PRCMU_RNGCLK, 0);
>         clk_register_clkdev(clk, NULL, "rngclk");
>
> -       clk = clk_reg_prcmu_gate("uiccclk", NULL, PRCMU_UICCCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("uiccclk", NULL, PRCMU_UICCCLK, 0);
>         clk_register_clkdev(clk, NULL, "uicc");
>
> -       clk = clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, 0);
>         clk_register_clkdev(clk, NULL, "mtu0");
>         clk_register_clkdev(clk, NULL, "mtu1");
>
>         clk = clk_reg_prcmu_opp_volt_scalable("sdmmcclk", NULL,
>                                         PRCMU_SDMMCCLK, 100000000,
> -                                       CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                       CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdmmc");
>
>         clk = clk_reg_prcmu_opp_volt_scalable("sdmmchclk", NULL,
>                                         PRCMU_SDMMCHCLK, 400000000,
> -                                       CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                       CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdmmchclk");
>
> -       clk = clk_reg_prcmu_gate("hvaclk", NULL, PRCMU_HVACLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("hvaclk", NULL, PRCMU_HVACLK, 0);
>         clk_register_clkdev(clk, NULL, "hva");
>
> -       clk = clk_reg_prcmu_gate("g1clk", NULL, PRCMU_G1CLK, CLK_IS_ROOT);
> +       clk = clk_reg_prcmu_gate("g1clk", NULL, PRCMU_G1CLK, 0);
>         clk_register_clkdev(clk, NULL, "g1");
>
>         clk = clk_reg_prcmu_scalable("spare1clk", NULL, PRCMU_SPARE1CLK, 0,
> -                               CLK_IS_ROOT|CLK_SET_RATE_GATE);
> +                                    CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, "dsilcd", "mcde");
>
>         clk = clk_reg_prcmu_scalable("dsi_pll", "hdmiclk",
> @@ -244,7 +240,7 @@ void u8540_clk_init(void)
>         clk_register_clkdev(clk, "dsilp2", "mcde");
>
>         clk = clk_reg_prcmu_scalable_rate("armss", NULL,
> -                               PRCMU_ARMSS, 0, CLK_IS_ROOT|CLK_IGNORE_UNUSED);
> +                               PRCMU_ARMSS, 0, CLK_IGNORE_UNUSED);
>         clk_register_clkdev(clk, "armss", NULL);
>
>         clk = clk_register_fixed_factor(NULL, "smp_twd", "armss",
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>

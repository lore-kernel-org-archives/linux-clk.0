Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@linaro.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Ulf Hansson" <ulf.hansson@linaro.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1438262365-29164-1-git-send-email-linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, "Linus Walleij" <linus.walleij@linaro.org>
References: <1438262365-29164-1-git-send-email-linus.walleij@linaro.org>
Message-ID: <20150811233506.31346.89133@quantum>
Subject: Re: [PATCH 2/3] clk/ARM: move Ux500 PRCC bases to the device tree
Date: Tue, 11 Aug 2015 16:35:06 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Linus Walleij (2015-07-30 06:19:25)
> The base addresses for the Ux500 PRCC controllers are hardcoded,
> let's move them to the clock node in the device tree and delete
> the constants.
> =

> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Michael Turquette <mturquette@baylibre.com>

Regards,
Mike

> ---
> Ulf/Mike: please ACK this so I can take it through ARM SoC.
> ---
>  arch/arm/boot/dts/ste-dbx5x0.dtsi       |   7 ++
>  arch/arm/mach-ux500/cpu.c               |  21 +---
>  drivers/clk/ux500/u8500_of_clk.c        | 163 ++++++++++++++------------
>  drivers/clk/ux500/u8540_clk.c           | 197 +++++++++++++++++++-------=
------
>  drivers/clk/ux500/u9540_clk.c           |   3 +-
>  include/linux/platform_data/clk-ux500.h |  10 +-
>  6 files changed, 225 insertions(+), 176 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-db=
x5x0.dtsi
> index 853684ad7773..a56bf890afaf 100644
> --- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
> @@ -219,6 +219,13 @@
>  =

>                 clocks {
>                         compatible =3D "stericsson,u8500-clks";
> +                       /*
> +                        * Registers for the CLKRST block on peripheral
> +                        * groups 1, 2, 3, 5, 6,
> +                        */
> +                       reg =3D <0x8012f000 0x1000>, <0x8011f000 0x1000>,
> +                           <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
> +                           <0xa03cf000 0x1000>;
>  =

>                         prcmu_clk: prcmu-clock {
>                                 #clock-cells =3D <1>;
> diff --git a/arch/arm/mach-ux500/cpu.c b/arch/arm/mach-ux500/cpu.c
> index e31d3d61c998..b316e18a76aa 100644
> --- a/arch/arm/mach-ux500/cpu.c
> +++ b/arch/arm/mach-ux500/cpu.c
> @@ -72,21 +72,12 @@ void __init ux500_init_irq(void)
>          * Init clocks here so that they are available for system timer
>          * initialization.
>          */
> -       if (cpu_is_u8500_family()) {
> -               u8500_of_clk_init(U8500_CLKRST1_BASE,
> -                                 U8500_CLKRST2_BASE,
> -                                 U8500_CLKRST3_BASE,
> -                                 U8500_CLKRST5_BASE,
> -                                 U8500_CLKRST6_BASE);
> -       } else if (cpu_is_u9540()) {
> -               u9540_clk_init(U8500_CLKRST1_BASE, U8500_CLKRST2_BASE,
> -                              U8500_CLKRST3_BASE, U8500_CLKRST5_BASE,
> -                              U8500_CLKRST6_BASE);
> -       } else if (cpu_is_u8540()) {
> -               u8540_clk_init(U8500_CLKRST1_BASE, U8500_CLKRST2_BASE,
> -                              U8500_CLKRST3_BASE, U8500_CLKRST5_BASE,
> -                              U8500_CLKRST6_BASE);
> -       }
> +       if (cpu_is_u8500_family())
> +               u8500_clk_init();
> +       else if (cpu_is_u9540())
> +               u9540_clk_init();
> +       else if (cpu_is_u8540())
> +               u8540_clk_init();
>  }
>  =

>  static const char * __init ux500_get_machine(void)
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_o=
f_clk.c
> index e319ef912dc6..33b8ab73faa6 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -8,6 +8,7 @@
>   */
>  =

>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
> @@ -54,14 +55,25 @@ static const struct of_device_id u8500_clk_of_match[]=
 =3D {
>         { },
>  };
>  =

> -void u8500_of_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_b=
ase,
> -                      u32 clkrst5_base, u32 clkrst6_base)
> +/* CLKRST4 is missing making it hard to index things */
> +enum clkrst_index {
> +       CLKRST1_INDEX =3D 0,
> +       CLKRST2_INDEX,
> +       CLKRST3_INDEX,
> +       CLKRST5_INDEX,
> +       CLKRST6_INDEX,
> +       CLKRST_MAX,
> +};
> +
> +void u8500_clk_init(void)
>  {
>         struct prcmu_fw_version *fw_version;
>         struct device_node *np =3D NULL;
>         struct device_node *child =3D NULL;
>         const char *sgaclk_parent =3D NULL;
>         struct clk *clk, *rtc_clk, *twd_clk;
> +       u32 bases[CLKRST_MAX];
> +       int i;
>  =

>         if (of_have_populated_dt())
>                 np =3D of_find_matching_node(NULL, u8500_clk_of_match);
> @@ -69,6 +81,15 @@ void u8500_of_clk_init(u32 clkrst1_base, u32 clkrst2_b=
ase, u32 clkrst3_base,
>                 pr_err("Either DT or U8500 Clock node not found\n");
>                 return;
>         }
> +       for (i =3D 0; i < ARRAY_SIZE(bases); i++) {
> +               struct resource r;
> +
> +               if (of_address_to_resource(np, i, &r))
> +                       /* Not much choice but to continue */
> +                       pr_err("failed to get CLKRST %d base address\n",
> +                              i + 1);
> +               bases[i] =3D r.start;
> +       }
>  =

>         /* Clock sources */
>         clk =3D clk_reg_prcmu_gate("soc0_pll", NULL, PRCMU_PLLSOC0,
> @@ -246,179 +267,179 @@ void u8500_of_clk_init(u32 clkrst1_base, u32 clkr=
st2_base, u32 clkrst3_base,
>          */
>  =

>         /* PRCC P-clocks */
> -       clk =3D clk_reg_prcc_pclk("p1_pclk0", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk0", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(0), 0);
>         PRCC_PCLK_STORE(clk, 1, 0);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk1", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk1", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(1), 0);
>         PRCC_PCLK_STORE(clk, 1, 1);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk2", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk2", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(2), 0);
>         PRCC_PCLK_STORE(clk, 1, 2);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk3", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk3", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(3), 0);
>         PRCC_PCLK_STORE(clk, 1, 3);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk4", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk4", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(4), 0);
>         PRCC_PCLK_STORE(clk, 1, 4);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk5", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk5", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(5), 0);
>         PRCC_PCLK_STORE(clk, 1, 5);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk6", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk6", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(6), 0);
>         PRCC_PCLK_STORE(clk, 1, 6);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk7", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk7", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(7), 0);
>         PRCC_PCLK_STORE(clk, 1, 7);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk8", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk8", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(8), 0);
>         PRCC_PCLK_STORE(clk, 1, 8);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk9", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk9", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(9), 0);
>         PRCC_PCLK_STORE(clk, 1, 9);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk10", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk10", "per1clk", bases[CLKRST1_I=
NDEX],
>                                 BIT(10), 0);
>         PRCC_PCLK_STORE(clk, 1, 10);
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk11", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk11", "per1clk", bases[CLKRST1_I=
NDEX],
>                                 BIT(11), 0);
>         PRCC_PCLK_STORE(clk, 1, 11);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk0", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk0", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(0), 0);
>         PRCC_PCLK_STORE(clk, 2, 0);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk1", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk1", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(1), 0);
>         PRCC_PCLK_STORE(clk, 2, 1);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk2", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk2", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(2), 0);
>         PRCC_PCLK_STORE(clk, 2, 2);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk3", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk3", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(3), 0);
>         PRCC_PCLK_STORE(clk, 2, 3);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk4", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk4", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(4), 0);
>         PRCC_PCLK_STORE(clk, 2, 4);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk5", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk5", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(5), 0);
>         PRCC_PCLK_STORE(clk, 2, 5);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk6", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk6", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(6), 0);
>         PRCC_PCLK_STORE(clk, 2, 6);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk7", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk7", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(7), 0);
>         PRCC_PCLK_STORE(clk, 2, 7);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk8", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk8", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(8), 0);
>         PRCC_PCLK_STORE(clk, 2, 8);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk9", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk9", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(9), 0);
>         PRCC_PCLK_STORE(clk, 2, 9);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk10", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk10", "per2clk", bases[CLKRST2_I=
NDEX],
>                                 BIT(10), 0);
>         PRCC_PCLK_STORE(clk, 2, 10);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk11", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk11", "per2clk", bases[CLKRST2_I=
NDEX],
>                                 BIT(11), 0);
>         PRCC_PCLK_STORE(clk, 2, 11);
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk12", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk12", "per2clk", bases[CLKRST2_I=
NDEX],
>                                 BIT(12), 0);
>         PRCC_PCLK_STORE(clk, 2, 12);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk0", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk0", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(0), 0);
>         PRCC_PCLK_STORE(clk, 3, 0);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk1", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk1", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(1), 0);
>         PRCC_PCLK_STORE(clk, 3, 1);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk2", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk2", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(2), 0);
>         PRCC_PCLK_STORE(clk, 3, 2);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk3", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk3", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(3), 0);
>         PRCC_PCLK_STORE(clk, 3, 3);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk4", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk4", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(4), 0);
>         PRCC_PCLK_STORE(clk, 3, 4);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk5", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk5", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(5), 0);
>         PRCC_PCLK_STORE(clk, 3, 5);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk6", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk6", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(6), 0);
>         PRCC_PCLK_STORE(clk, 3, 6);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk7", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk7", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(7), 0);
>         PRCC_PCLK_STORE(clk, 3, 7);
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk8", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk8", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(8), 0);
>         PRCC_PCLK_STORE(clk, 3, 8);
>  =

> -       clk =3D clk_reg_prcc_pclk("p5_pclk0", "per5clk", clkrst5_base,
> +       clk =3D clk_reg_prcc_pclk("p5_pclk0", "per5clk", bases[CLKRST5_IN=
DEX],
>                                 BIT(0), 0);
>         PRCC_PCLK_STORE(clk, 5, 0);
>  =

> -       clk =3D clk_reg_prcc_pclk("p5_pclk1", "per5clk", clkrst5_base,
> +       clk =3D clk_reg_prcc_pclk("p5_pclk1", "per5clk", bases[CLKRST5_IN=
DEX],
>                                 BIT(1), 0);
>         PRCC_PCLK_STORE(clk, 5, 1);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk0", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk0", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(0), 0);
>         PRCC_PCLK_STORE(clk, 6, 0);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk1", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk1", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(1), 0);
>         PRCC_PCLK_STORE(clk, 6, 1);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk2", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk2", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(2), 0);
>         PRCC_PCLK_STORE(clk, 6, 2);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk3", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk3", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(3), 0);
>         PRCC_PCLK_STORE(clk, 6, 3);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk4", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk4", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(4), 0);
>         PRCC_PCLK_STORE(clk, 6, 4);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk5", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk5", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(5), 0);
>         PRCC_PCLK_STORE(clk, 6, 5);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk6", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk6", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(6), 0);
>         PRCC_PCLK_STORE(clk, 6, 6);
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk7", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk7", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(7), 0);
>         PRCC_PCLK_STORE(clk, 6, 7);
>  =

> @@ -432,109 +453,109 @@ void u8500_of_clk_init(u32 clkrst1_base, u32 clkr=
st2_base, u32 clkrst3_base,
>  =

>         /* Periph1 */
>         clk =3D clk_reg_prcc_kclk("p1_uart0_kclk", "uartclk",
> -                       clkrst1_base, BIT(0), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(0), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 0);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_uart1_kclk", "uartclk",
> -                       clkrst1_base, BIT(1), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(1), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 1);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_i2c1_kclk", "i2cclk",
> -                       clkrst1_base, BIT(2), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(2), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 2);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_msp0_kclk", "msp02clk",
> -                       clkrst1_base, BIT(3), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(3), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 3);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_msp1_kclk", "msp1clk",
> -                       clkrst1_base, BIT(4), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(4), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 4);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_sdi0_kclk", "sdmmcclk",
> -                       clkrst1_base, BIT(5), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(5), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 5);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_i2c2_kclk", "i2cclk",
> -                       clkrst1_base, BIT(6), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(6), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 6);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_slimbus0_kclk", "slimclk",
> -                       clkrst1_base, BIT(8), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(8), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 8);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_i2c4_kclk", "i2cclk",
> -                       clkrst1_base, BIT(9), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(9), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 9);
>  =

>         clk =3D clk_reg_prcc_kclk("p1_msp3_kclk", "msp1clk",
> -                       clkrst1_base, BIT(10), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(10), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 1, 10);
>  =

>         /* Periph2 */
>         clk =3D clk_reg_prcc_kclk("p2_i2c3_kclk", "i2cclk",
> -                       clkrst2_base, BIT(0), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(0), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 2, 0);
>  =

>         clk =3D clk_reg_prcc_kclk("p2_sdi4_kclk", "sdmmcclk",
> -                       clkrst2_base, BIT(2), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(2), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 2, 2);
>  =

>         clk =3D clk_reg_prcc_kclk("p2_msp2_kclk", "msp02clk",
> -                       clkrst2_base, BIT(3), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(3), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 2, 3);
>  =

>         clk =3D clk_reg_prcc_kclk("p2_sdi1_kclk", "sdmmcclk",
> -                       clkrst2_base, BIT(4), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(4), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 2, 4);
>  =

>         clk =3D clk_reg_prcc_kclk("p2_sdi3_kclk", "sdmmcclk",
> -                       clkrst2_base, BIT(5), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(5), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 2, 5);
>  =

>         /* Note that rate is received from parent. */
>         clk =3D clk_reg_prcc_kclk("p2_ssirx_kclk", "hsirxclk",
> -                       clkrst2_base, BIT(6),
> +                       bases[CLKRST2_INDEX], BIT(6),
>                         CLK_SET_RATE_GATE|CLK_SET_RATE_PARENT);
>         PRCC_KCLK_STORE(clk, 2, 6);
>  =

>         clk =3D clk_reg_prcc_kclk("p2_ssitx_kclk", "hsitxclk",
> -                       clkrst2_base, BIT(7),
> +                       bases[CLKRST2_INDEX], BIT(7),
>                         CLK_SET_RATE_GATE|CLK_SET_RATE_PARENT);
>         PRCC_KCLK_STORE(clk, 2, 7);
>  =

>         /* Periph3 */
>         clk =3D clk_reg_prcc_kclk("p3_ssp0_kclk", "sspclk",
> -                       clkrst3_base, BIT(1), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(1), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 1);
>  =

>         clk =3D clk_reg_prcc_kclk("p3_ssp1_kclk", "sspclk",
> -                       clkrst3_base, BIT(2), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(2), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 2);
>  =

>         clk =3D clk_reg_prcc_kclk("p3_i2c0_kclk", "i2cclk",
> -                       clkrst3_base, BIT(3), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(3), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 3);
>  =

>         clk =3D clk_reg_prcc_kclk("p3_sdi2_kclk", "sdmmcclk",
> -                       clkrst3_base, BIT(4), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(4), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 4);
>  =

>         clk =3D clk_reg_prcc_kclk("p3_ske_kclk", "rtc32k",
> -                       clkrst3_base, BIT(5), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(5), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 5);
>  =

>         clk =3D clk_reg_prcc_kclk("p3_uart2_kclk", "uartclk",
> -                       clkrst3_base, BIT(6), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(6), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 6);
>  =

>         clk =3D clk_reg_prcc_kclk("p3_sdi5_kclk", "sdmmcclk",
> -                       clkrst3_base, BIT(7), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(7), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 3, 7);
>  =

>         /* Periph6 */
>         clk =3D clk_reg_prcc_kclk("p3_rng_kclk", "rngclk",
> -                       clkrst6_base, BIT(0), CLK_SET_RATE_GATE);
> +                       bases[CLKRST6_INDEX], BIT(0), CLK_SET_RATE_GATE);
>         PRCC_KCLK_STORE(clk, 6, 0);
>  =

>         for_each_child_of_node(np, child) {
> diff --git a/drivers/clk/ux500/u8540_clk.c b/drivers/clk/ux500/u8540_clk.c
> index 20c8add90d11..8f988f2126ba 100644
> --- a/drivers/clk/ux500/u8540_clk.c
> +++ b/drivers/clk/ux500/u8540_clk.c
> @@ -7,6 +7,8 @@
>   * License terms: GNU General Public License (GPL) version 2
>   */
>  =

> +#include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/clk.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
> @@ -14,10 +16,43 @@
>  #include <linux/platform_data/clk-ux500.h>
>  #include "clk.h"
>  =

> -void u8540_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_base,
> -                   u32 clkrst5_base, u32 clkrst6_base)
> +static const struct of_device_id u8540_clk_of_match[] =3D {
> +       { .compatible =3D "stericsson,u8540-clks", },
> +       { },
> +};
> +
> +/* CLKRST4 is missing making it hard to index things */
> +enum clkrst_index {
> +       CLKRST1_INDEX =3D 0,
> +       CLKRST2_INDEX,
> +       CLKRST3_INDEX,
> +       CLKRST5_INDEX,
> +       CLKRST6_INDEX,
> +       CLKRST_MAX,
> +};
> +
> +void u8540_clk_init(void)
>  {
>         struct clk *clk;
> +       struct device_node *np =3D NULL;
> +       u32 bases[CLKRST_MAX];
> +       int i;
> +
> +       if (of_have_populated_dt())
> +               np =3D of_find_matching_node(NULL, u8540_clk_of_match);
> +       if (!np) {
> +               pr_err("Either DT or U8540 Clock node not found\n");
> +               return;
> +       }
> +       for (i =3D 0; i < ARRAY_SIZE(bases); i++) {
> +               struct resource r;
> +
> +               if (of_address_to_resource(np, i, &r))
> +                       /* Not much choice but to continue */
> +                       pr_err("failed to get CLKRST %d base address\n",
> +                              i + 1);
> +               bases[i] =3D r.start;
> +       }
>  =

>         /* Clock sources. */
>         /* Fixed ClockGen */
> @@ -219,151 +254,151 @@ void u8540_clk_init(u32 clkrst1_base, u32 clkrst2=
_base, u32 clkrst3_base,
>  =

>         /* PRCC P-clocks */
>         /* Peripheral 1 : PRCC P-clocks */
> -       clk =3D clk_reg_prcc_pclk("p1_pclk0", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk0", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(0), 0);
>         clk_register_clkdev(clk, "apb_pclk", "uart0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk1", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk1", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(1), 0);
>         clk_register_clkdev(clk, "apb_pclk", "uart1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk2", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk2", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(2), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk3", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk3", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(3), 0);
>         clk_register_clkdev(clk, "apb_pclk", "msp0");
>         clk_register_clkdev(clk, "apb_pclk", "dbx5x0-msp-i2s.0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk4", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk4", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(4), 0);
>         clk_register_clkdev(clk, "apb_pclk", "msp1");
>         clk_register_clkdev(clk, "apb_pclk", "dbx5x0-msp-i2s.1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk5", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk5", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(5), 0);
>         clk_register_clkdev(clk, "apb_pclk", "sdi0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk6", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk6", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(6), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.2");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk7", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk7", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(7), 0);
>         clk_register_clkdev(clk, NULL, "spi3");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk8", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk8", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(8), 0);
>         clk_register_clkdev(clk, "apb_pclk", "slimbus0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk9", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk9", "per1clk", bases[CLKRST1_IN=
DEX],
>                                 BIT(9), 0);
>         clk_register_clkdev(clk, NULL, "gpio.0");
>         clk_register_clkdev(clk, NULL, "gpio.1");
>         clk_register_clkdev(clk, NULL, "gpioblock0");
>         clk_register_clkdev(clk, "apb_pclk", "ab85xx-codec.0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk10", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk10", "per1clk", bases[CLKRST1_I=
NDEX],
>                                 BIT(10), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.4");
>  =

> -       clk =3D clk_reg_prcc_pclk("p1_pclk11", "per1clk", clkrst1_base,
> +       clk =3D clk_reg_prcc_pclk("p1_pclk11", "per1clk", bases[CLKRST1_I=
NDEX],
>                                 BIT(11), 0);
>         clk_register_clkdev(clk, "apb_pclk", "msp3");
>         clk_register_clkdev(clk, "apb_pclk", "dbx5x0-msp-i2s.3");
>  =

>         /* Peripheral 2 : PRCC P-clocks */
> -       clk =3D clk_reg_prcc_pclk("p2_pclk0", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk0", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(0), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.3");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk1", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk1", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(1), 0);
>         clk_register_clkdev(clk, NULL, "spi2");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk2", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk2", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(2), 0);
>         clk_register_clkdev(clk, NULL, "spi1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk3", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk3", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(3), 0);
>         clk_register_clkdev(clk, NULL, "pwl");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk4", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk4", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(4), 0);
>         clk_register_clkdev(clk, "apb_pclk", "sdi4");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk5", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk5", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(5), 0);
>         clk_register_clkdev(clk, "apb_pclk", "msp2");
>         clk_register_clkdev(clk, "apb_pclk", "dbx5x0-msp-i2s.2");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk6", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk6", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(6), 0);
>         clk_register_clkdev(clk, "apb_pclk", "sdi1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk7", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk7", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(7), 0);
>         clk_register_clkdev(clk, "apb_pclk", "sdi3");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk8", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk8", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(8), 0);
>         clk_register_clkdev(clk, NULL, "spi0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk9", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk9", "per2clk", bases[CLKRST2_IN=
DEX],
>                                 BIT(9), 0);
>         clk_register_clkdev(clk, "hsir_hclk", "ste_hsi.0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk10", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk10", "per2clk", bases[CLKRST2_I=
NDEX],
>                                 BIT(10), 0);
>         clk_register_clkdev(clk, "hsit_hclk", "ste_hsi.0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk11", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk11", "per2clk", bases[CLKRST2_I=
NDEX],
>                                 BIT(11), 0);
>         clk_register_clkdev(clk, NULL, "gpio.6");
>         clk_register_clkdev(clk, NULL, "gpio.7");
>         clk_register_clkdev(clk, NULL, "gpioblock1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p2_pclk12", "per2clk", clkrst2_base,
> +       clk =3D clk_reg_prcc_pclk("p2_pclk12", "per2clk", bases[CLKRST2_I=
NDEX],
>                                 BIT(12), 0);
>         clk_register_clkdev(clk, "msp4-pclk", "ab85xx-codec.0");
>  =

>         /* Peripheral 3 : PRCC P-clocks */
> -       clk =3D clk_reg_prcc_pclk("p3_pclk0", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk0", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(0), 0);
>         clk_register_clkdev(clk, NULL, "fsmc");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk1", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk1", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(1), 0);
>         clk_register_clkdev(clk, "apb_pclk", "ssp0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk2", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk2", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(2), 0);
>         clk_register_clkdev(clk, "apb_pclk", "ssp1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk3", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk3", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(3), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk4", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk4", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(4), 0);
>         clk_register_clkdev(clk, "apb_pclk", "sdi2");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk5", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk5", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(5), 0);
>         clk_register_clkdev(clk, "apb_pclk", "ske");
>         clk_register_clkdev(clk, "apb_pclk", "nmk-ske-keypad");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk6", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk6", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(6), 0);
>         clk_register_clkdev(clk, "apb_pclk", "uart2");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk7", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk7", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(7), 0);
>         clk_register_clkdev(clk, "apb_pclk", "sdi5");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk8", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk8", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(8), 0);
>         clk_register_clkdev(clk, NULL, "gpio.2");
>         clk_register_clkdev(clk, NULL, "gpio.3");
> @@ -371,64 +406,64 @@ void u8540_clk_init(u32 clkrst1_base, u32 clkrst2_b=
ase, u32 clkrst3_base,
>         clk_register_clkdev(clk, NULL, "gpio.5");
>         clk_register_clkdev(clk, NULL, "gpioblock2");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk9", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk9", "per3clk", bases[CLKRST3_IN=
DEX],
>                                 BIT(9), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.5");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk10", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk10", "per3clk", bases[CLKRST3_I=
NDEX],
>                                 BIT(10), 0);
>         clk_register_clkdev(clk, "apb_pclk", "nmk-i2c.6");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk11", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk11", "per3clk", bases[CLKRST3_I=
NDEX],
>                                 BIT(11), 0);
>         clk_register_clkdev(clk, "apb_pclk", "uart3");
>  =

> -       clk =3D clk_reg_prcc_pclk("p3_pclk12", "per3clk", clkrst3_base,
> +       clk =3D clk_reg_prcc_pclk("p3_pclk12", "per3clk", bases[CLKRST3_I=
NDEX],
>                                 BIT(12), 0);
>         clk_register_clkdev(clk, "apb_pclk", "uart4");
>  =

>         /* Peripheral 5 : PRCC P-clocks */
> -       clk =3D clk_reg_prcc_pclk("p5_pclk0", "per5clk", clkrst5_base,
> +       clk =3D clk_reg_prcc_pclk("p5_pclk0", "per5clk", bases[CLKRST5_IN=
DEX],
>                                 BIT(0), 0);
>         clk_register_clkdev(clk, "usb", "musb-ux500.0");
>         clk_register_clkdev(clk, "usbclk", "ab-iddet.0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p5_pclk1", "per5clk", clkrst5_base,
> +       clk =3D clk_reg_prcc_pclk("p5_pclk1", "per5clk", bases[CLKRST5_IN=
DEX],
>                                 BIT(1), 0);
>         clk_register_clkdev(clk, NULL, "gpio.8");
>         clk_register_clkdev(clk, NULL, "gpioblock3");
>  =

>         /* Peripheral 6 : PRCC P-clocks */
> -       clk =3D clk_reg_prcc_pclk("p6_pclk0", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk0", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(0), 0);
>         clk_register_clkdev(clk, "apb_pclk", "rng");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk1", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk1", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(1), 0);
>         clk_register_clkdev(clk, NULL, "cryp0");
>         clk_register_clkdev(clk, NULL, "cryp1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk2", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk2", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(2), 0);
>         clk_register_clkdev(clk, NULL, "hash0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk3", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk3", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(3), 0);
>         clk_register_clkdev(clk, NULL, "pka");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk4", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk4", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(4), 0);
>         clk_register_clkdev(clk, NULL, "db8540-hash1");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk5", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk5", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(5), 0);
>         clk_register_clkdev(clk, NULL, "cfgreg");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk6", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk6", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(6), 0);
>         clk_register_clkdev(clk, "apb_pclk", "mtu0");
>  =

> -       clk =3D clk_reg_prcc_pclk("p6_pclk7", "per6clk", clkrst6_base,
> +       clk =3D clk_reg_prcc_pclk("p6_pclk7", "per6clk", bases[CLKRST6_IN=
DEX],
>                                 BIT(7), 0);
>         clk_register_clkdev(clk, "apb_pclk", "mtu1");
>  =

> @@ -442,138 +477,138 @@ void u8540_clk_init(u32 clkrst1_base, u32 clkrst2=
_base, u32 clkrst3_base,
>  =

>         /* Peripheral 1 : PRCC K-clocks */
>         clk =3D clk_reg_prcc_kclk("p1_uart0_kclk", "uartclk",
> -                       clkrst1_base, BIT(0), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(0), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "uart0");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_uart1_kclk", "uartclk",
> -                       clkrst1_base, BIT(1), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(1), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "uart1");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_i2c1_kclk", "i2cclk",
> -                       clkrst1_base, BIT(2), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(2), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.1");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_msp0_kclk", "msp02clk",
> -                       clkrst1_base, BIT(3), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(3), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "msp0");
>         clk_register_clkdev(clk, NULL, "dbx5x0-msp-i2s.0");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_msp1_kclk", "msp1clk",
> -                       clkrst1_base, BIT(4), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(4), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "msp1");
>         clk_register_clkdev(clk, NULL, "dbx5x0-msp-i2s.1");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_sdi0_kclk", "sdmmchclk",
> -                       clkrst1_base, BIT(5), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(5), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdi0");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_i2c2_kclk", "i2cclk",
> -                       clkrst1_base, BIT(6), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(6), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.2");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_slimbus0_kclk", "slimclk",
> -                       clkrst1_base, BIT(8), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(8), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "slimbus0");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_i2c4_kclk", "i2cclk",
> -                       clkrst1_base, BIT(9), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(9), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.4");
>  =

>         clk =3D clk_reg_prcc_kclk("p1_msp3_kclk", "msp1clk",
> -                       clkrst1_base, BIT(10), CLK_SET_RATE_GATE);
> +                       bases[CLKRST1_INDEX], BIT(10), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "msp3");
>         clk_register_clkdev(clk, NULL, "dbx5x0-msp-i2s.3");
>  =

>         /* Peripheral 2 : PRCC K-clocks */
>         clk =3D clk_reg_prcc_kclk("p2_i2c3_kclk", "i2cclk",
> -                       clkrst2_base, BIT(0), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(0), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.3");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_pwl_kclk", "rtc32k",
> -                       clkrst2_base, BIT(1), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(1), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "pwl");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_sdi4_kclk", "sdmmchclk",
> -                       clkrst2_base, BIT(2), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(2), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdi4");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_msp2_kclk", "msp02clk",
> -                       clkrst2_base, BIT(3), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(3), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "msp2");
>         clk_register_clkdev(clk, NULL, "dbx5x0-msp-i2s.2");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_sdi1_kclk", "sdmmchclk",
> -                       clkrst2_base, BIT(4), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(4), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdi1");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_sdi3_kclk", "sdmmcclk",
> -                       clkrst2_base, BIT(5), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(5), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdi3");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_ssirx_kclk", "hsirxclk",
> -                       clkrst2_base, BIT(6),
> +                       bases[CLKRST2_INDEX], BIT(6),
>                         CLK_SET_RATE_GATE|CLK_SET_RATE_PARENT);
>         clk_register_clkdev(clk, "hsir_hsirxclk", "ste_hsi.0");
>  =

>         clk =3D clk_reg_prcc_kclk("p2_ssitx_kclk", "hsitxclk",
> -                       clkrst2_base, BIT(7),
> +                       bases[CLKRST2_INDEX], BIT(7),
>                         CLK_SET_RATE_GATE|CLK_SET_RATE_PARENT);
>         clk_register_clkdev(clk, "hsit_hsitxclk", "ste_hsi.0");
>  =

>         /* Should only be 9540, but might be added for 85xx as well */
>         clk =3D clk_reg_prcc_kclk("p2_msp4_kclk", "msp02clk",
> -                       clkrst2_base, BIT(9), CLK_SET_RATE_GATE);
> +                       bases[CLKRST2_INDEX], BIT(9), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "msp4");
>         clk_register_clkdev(clk, "msp4", "ab85xx-codec.0");
>  =

>         /* Peripheral 3 : PRCC K-clocks */
>         clk =3D clk_reg_prcc_kclk("p3_ssp0_kclk", "sspclk",
> -                       clkrst3_base, BIT(1), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(1), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "ssp0");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_ssp1_kclk", "sspclk",
> -                       clkrst3_base, BIT(2), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(2), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "ssp1");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_i2c0_kclk", "i2cclk",
> -                       clkrst3_base, BIT(3), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(3), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.0");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_sdi2_kclk", "sdmmchclk",
> -                       clkrst3_base, BIT(4), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(4), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdi2");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_ske_kclk", "rtc32k",
> -                       clkrst3_base, BIT(5), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(5), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "ske");
>         clk_register_clkdev(clk, NULL, "nmk-ske-keypad");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_uart2_kclk", "uartclk",
> -                       clkrst3_base, BIT(6), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(6), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "uart2");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_sdi5_kclk", "sdmmcclk",
> -                       clkrst3_base, BIT(7), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(7), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "sdi5");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_i2c5_kclk", "i2cclk",
> -                       clkrst3_base, BIT(8), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(8), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.5");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_i2c6_kclk", "i2cclk",
> -                       clkrst3_base, BIT(9), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(9), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "nmk-i2c.6");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_uart3_kclk", "uartclk",
> -                       clkrst3_base, BIT(10), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(10), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "uart3");
>  =

>         clk =3D clk_reg_prcc_kclk("p3_uart4_kclk", "uartclk",
> -                       clkrst3_base, BIT(11), CLK_SET_RATE_GATE);
> +                       bases[CLKRST3_INDEX], BIT(11), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "uart4");
>  =

>         /* Peripheral 6 : PRCC K-clocks */
>         clk =3D clk_reg_prcc_kclk("p6_rng_kclk", "rngclk",
> -                       clkrst6_base, BIT(0), CLK_SET_RATE_GATE);
> +                       bases[CLKRST6_INDEX], BIT(0), CLK_SET_RATE_GATE);
>         clk_register_clkdev(clk, NULL, "rng");
>  }
> diff --git a/drivers/clk/ux500/u9540_clk.c b/drivers/clk/ux500/u9540_clk.c
> index 44794782e7e0..2e1225676cc6 100644
> --- a/drivers/clk/ux500/u9540_clk.c
> +++ b/drivers/clk/ux500/u9540_clk.c
> @@ -14,8 +14,7 @@
>  #include <linux/platform_data/clk-ux500.h>
>  #include "clk.h"
>  =

> -void u9540_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_base,
> -                   u32 clkrst5_base, u32 clkrst6_base)
> +void u9540_clk_init(void)
>  {
>         /* register clocks here */
>  }
> diff --git a/include/linux/platform_data/clk-ux500.h b/include/linux/plat=
form_data/clk-ux500.h
> index 0058edb24391..3af0da1f3be5 100644
> --- a/include/linux/platform_data/clk-ux500.h
> +++ b/include/linux/platform_data/clk-ux500.h
> @@ -10,12 +10,8 @@
>  #ifndef __CLK_UX500_H
>  #define __CLK_UX500_H
>  =

> -void u8500_of_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_b=
ase,
> -                      u32 clkrst5_base, u32 clkrst6_base);
> -
> -void u9540_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_base,
> -                   u32 clkrst5_base, u32 clkrst6_base);
> -void u8540_clk_init(u32 clkrst1_base, u32 clkrst2_base, u32 clkrst3_base,
> -                   u32 clkrst5_base, u32 clkrst6_base);
> +void u8500_clk_init(void);
> +void u9540_clk_init(void);
> +void u8540_clk_init(void);
>  =

>  #endif /* __CLK_UX500_H */
> -- =

> 2.4.3
>=20

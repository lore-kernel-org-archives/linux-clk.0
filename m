Return-Path: <tali.perry1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFd5g445Ae-uBO52sn1WH67tMgc0n_sbi6cS-SuKLhR__D98kg@mail.gmail.com>
References: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
 <1517818975-11427-3-git-send-email-tmaimon77@gmail.com> <CAFd5g445Ae-uBO52sn1WH67tMgc0n_sbi6cS-SuKLhR__D98kg@mail.gmail.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 6 Feb 2018 10:10:34 +0200
Message-ID: <CAHb3i=un-LjnV+DWBMkEcDKNFyEi63wh0RR0dHWsHpv2K9erTw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: npcm: add NPCM7xx clock driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-clk@vger.kernel.org,
	devicetree <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="94eb2c1cdf4aaa81c2056486b6db"
List-ID: <linux-clk.vger.kernel.org>

--94eb2c1cdf4aaa81c2056486b6db
Content-Type: text/plain; charset="UTF-8"

 On Mon, Feb 5, 2018 at 12:22 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Add Nuvoton BMC NPCM7xx clock driver.
>
> Nuvoton BMC NPCM7xx contain integrated clock controller which
> generates and supplies clock to all modules within the NPCM7xx BMC.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/clk/Makefile      |   1 +
>  drivers/clk/clk-npcm7xx.c | 751 ++++++++++++++++++++++++++++++
++++++++++++++++
>  2 files changed, 752 insertions(+)
>  create mode 100644 drivers/clk/clk-npcm7xx.c
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f7f761b02bed..89289abe0cc1 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -21,6 +21,7 @@ endif
>  obj-$(CONFIG_MACH_ASM9260)             += clk-asm9260.o
>  obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)    += clk-axi-clkgen.o
>  obj-$(CONFIG_ARCH_AXXIA)               += clk-axm5516.o
> +obj-$(CONFIG_ARCH_NPCM7XX)             += clk-npcm7xx.o
>  obj-$(CONFIG_COMMON_CLK_CDCE706)       += clk-cdce706.o
>  obj-$(CONFIG_COMMON_CLK_CDCE925)       += clk-cdce925.o
>  obj-$(CONFIG_ARCH_CLPS711X)            += clk-clps711x.o
> diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> new file mode 100644
> index 000000000000..21aeca4b0cc3
> --- /dev/null
> +++ b/drivers/clk/clk-npcm7xx.c
> @@ -0,0 +1,751 @@
> +/*
> + * Nuvoton NPCM7xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver
allow only
> + * reading of current settings directly from the hardware.
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + * Released under the GPLv2 only.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/rational.h>
> +#include <linux/bitfield.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +
> +#include <asm/cp15.h>
> +
> +
> +struct npcm7xx_clk_pll {
> +       struct clk_hw   hw;
> +       void __iomem    *pllcon;
> +       u8              flags;
> +};
> +
> +#define to_npcm7xx_clk_pll(_hw) container_of(_hw, struct
npcm7xx_clk_pll, hw)
> +
> +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const char
*name,
> +       const char *parent_name, unsigned long flags);
> +
> +#define PLLCON_LOKI    BIT(31)
> +#define PLLCON_LOKS    BIT(30)
> +#define PLLCON_FBDV    GENMASK(27, 16)
> +#define PLLCON_OTDV2   GENMASK(15, 13)
> +#define PLLCON_PWDEN   BIT(12)
> +#define PLLCON_OTDV1   GENMASK(10, 8)
> +#define PLLCON_INDV    GENMASK(5, 0)
> +
> +static unsigned long npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
> +                                                unsigned long
parent_rate)
> +{
> +       struct npcm7xx_clk_pll *pll = to_npcm7xx_clk_pll(hw);
> +       unsigned long fbdv, indv, otdv1, otdv2;
> +       unsigned int val;
> +       u64 ret;
> +
> +       if (parent_rate == 0) {
> +               pr_err("%s: parent rate is zero. reg=%x\n", __func__,
> +                       (u32)(pll->pllcon));
> +               return 0;
> +       }
> +
> +       val = readl_relaxed(pll->pllcon);
> +
> +       indv = FIELD_GET(PLLCON_INDV, val);
> +       fbdv = FIELD_GET(PLLCON_FBDV, val);
> +       otdv1 = FIELD_GET(PLLCON_OTDV1, val);
> +       otdv2 = FIELD_GET(PLLCON_OTDV2, val);
> +
> +       ret = (u64)parent_rate * fbdv;
> +       do_div(ret, indv * otdv1 * otdv2);
> +
> +       return ret;
> +}
> +
> +const struct clk_ops npcm7xx_clk_pll_ops = {
> +       .recalc_rate = npcm7xx_clk_pll_recalc_rate,
> +};
> +
> +
> +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const char
*name,
> +       const char *parent_name, unsigned long flags)
> +{
> +       struct npcm7xx_clk_pll *pll;
> +       struct clk_init_data init;
> +       struct clk_hw *hw;
> +       int ret;
> +
> +       pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pr_debug("\tnpcm7xx_clk_register_pll reg, reg=0x%x, name=%s,
p=%s\n",
> +               (unsigned int)pllcon, name, parent_name);
> +
> +       init.name = name;
> +       init.ops = &npcm7xx_clk_pll_ops;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +       init.flags = flags;
> +
> +       pll->pllcon = pllcon;
> +       pll->hw.init = &init;
> +
> +       hw = &pll->hw;
> +
> +       ret = clk_hw_register(NULL, hw);
> +       if (ret) {
> +               kfree(pll);
> +               hw = ERR_PTR(ret);
> +       }
> +
> +       return hw;
> +}
> +
> +
> +#define NPCM7XX_CLKEN1          (0x00)
> +#define NPCM7XX_CLKEN2          (0x28)
> +#define NPCM7XX_CLKEN3          (0x30)
> +#define NPCM7XX_CLKSEL          (0x04)
> +#define NPCM7XX_CLKDIV1         (0x08)
> +#define NPCM7XX_CLKDIV2         (0x2C)
> +#define NPCM7XX_CLKDIV3         (0x58)
> +#define NPCM7XX_PLLCON0         (0x0C)
> +#define NPCM7XX_PLLCON1         (0x10)
> +#define NPCM7XX_PLLCON2         (0x54)
> +#define NPCM7XX_SWRSTR          (0x14)
> +#define NPCM7XX_IRQWAKECON      (0x18)
> +#define NPCM7XX_IRQWAKEFLAG     (0x1C)
> +#define NPCM7XX_IPSRST1         (0x20)
> +#define NPCM7XX_IPSRST2         (0x24)
> +#define NPCM7XX_IPSRST3         (0x34)
> +#define NPCM7XX_WD0RCR          (0x38)
> +#define NPCM7XX_WD1RCR          (0x3C)
> +#define NPCM7XX_WD2RCR          (0x40)
> +#define NPCM7XX_SWRSTC1         (0x44)
> +#define NPCM7XX_SWRSTC2         (0x48)
> +#define NPCM7XX_SWRSTC3         (0x4C)
> +#define NPCM7XX_SWRSTC4         (0x50)
> +#define NPCM7XX_CORSTC          (0x5C)
> +#define NPCM7XX_PLLCONG         (0x60)
> +#define NPCM7XX_AHBCKFI         (0x64)
> +#define NPCM7XX_SECCNT          (0x68)
> +#define NPCM7XX_CNTR25M         (0x6C)
> +
> +
> +struct npcm7xx_clk_gate_data {
> +       u32 reg;
> +       u8 bit_idx;
> +       const char *name;
> +       const char *parent_name;
> +       unsigned long flags;
> +       /*
> +        * If this clock is exported via DT, set onecell_idx to constant
> +        * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h
for
> +        * this specific clock.  Otherwise, set to -1.
> +        */
> +       int onecell_idx;
> +};
> +
> +struct npcm7xx_clk_mux_data {
> +       u8 shift;
> +       u8 mask;
> +       u32 *table;
> +       const char *name;
> +       const char * const *parent_names;
> +       u8 num_parents;
> +       unsigned long flags;
> +       /*
> +        * If this clock is exported via DT, set onecell_idx to constant
> +        * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h
for
> +        * this specific clock.  Otherwise, set to -1.
> +        */
> +       int onecell_idx;
> +
> +};
> +
> +struct npcm7xx_clk_div_fixed_data {
> +       u8 mult;
> +       u8 div;
> +       const char *name;
> +       const char *parent_name;
> +       u8 clk_divider_flags;
> +       /*
> +        * If this clock is exported via DT, set onecell_idx to constant
> +        * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h
for
> +        * this specific clock.  Otherwise, set to -1.
> +        */
> +       int onecell_idx;
> +};
> +
> +
> +struct npcm7xx_clk_div_data {
> +       u32 reg;
> +       u8 shift;
> +       u8 width;
> +       const char *name;
> +       const char *parent_name;
> +       u8 clk_divider_flags;
> +       unsigned long flags;
> +       /*
> +        * If this clock is exported via DT, set onecell_idx to constant
> +        * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h
for
> +        * this specific clock.  Otherwise, set to -1.
> +        */
> +       int onecell_idx;
> +};
> +
> +struct npcm7xx_clk_pll_data {
> +       u32 reg;
> +       const char *name;
> +       const char *parent_name;
> +       unsigned long flags;
> +       /*
> +        * If this clock is exported via DT, set onecell_idx to constant
> +        * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h
for
> +        * this specific clock.  Otherwise, set to -1.
> +        */
> +       int onecell_idx;
> +};
> +
> +
> +/*
> + * Single copy of strings used to refer to clocks within this driver
indexed by
> + * above enum.
> + */
> +#define NPCM7XX_CLK_S_REFCLK      "refclk"
> +#define NPCM7XX_CLK_S_SYSBYPCK    "sysbypck"
> +#define NPCM7XX_CLK_S_MCBYPCK     "mcbypck"
> +#define NPCM7XX_CLK_S_GFXBYPCK    "gfxbypck"
> +#define NPCM7XX_CLK_S_PLL0        "pll0"
> +#define NPCM7XX_CLK_S_PLL1        "pll1"
> +#define NPCM7XX_CLK_S_PLL1_DIV2   "pll1_div2"
> +#define NPCM7XX_CLK_S_PLL2        "pll2"
> +#define NPCM7XX_CLK_S_PLL_GFX     "pll_gfx"
> +#define NPCM7XX_CLK_S_PLL2_DIV2   "pll2_div2"
> +#define NPCM7XX_CLK_S_PIX_MUX     "gfx_pixel"
> +#define NPCM7XX_CLK_S_GPRFSEL_MUX "gprfsel_mux"
> +#define NPCM7XX_CLK_S_MC_MUX      "mc_phy"
> +#define NPCM7XX_CLK_S_CPU_MUX     "cpu"  /*AKA system clock.*/
> +#define NPCM7XX_CLK_S_MC          "mc"
> +#define NPCM7XX_CLK_S_AXI         "axi"  /*AKA CLK2*/
> +#define NPCM7XX_CLK_S_AHB         "ahb"  /*AKA CLK4*/
> +#define NPCM7XX_CLK_S_CLKOUT_MUX  "clkout_mux"
> +#define NPCM7XX_CLK_S_UART_MUX    "uart_mux"
> +#define NPCM7XX_CLK_S_TIM_MUX     "timer_mux"
> +#define NPCM7XX_CLK_S_SD_MUX      "sd_mux"
> +#define NPCM7XX_CLK_S_GFXM_MUX    "gfxm_mux"
> +#define NPCM7XX_CLK_S_SU_MUX      "serial_usb_mux"
> +#define NPCM7XX_CLK_S_DVC_MUX     "dvc_mux"
> +#define NPCM7XX_CLK_S_GFX_MUX     "gfx_mux"
> +#define NPCM7XX_CLK_S_GFX_PIXEL   "gfx_pixel"
> +#define NPCM7XX_CLK_S_SPI0        "spi0"
> +#define NPCM7XX_CLK_S_SPI3        "spi3"
> +#define NPCM7XX_CLK_S_SPIX        "spix"
> +#define NPCM7XX_CLK_S_APB1        "apb1"
> +#define NPCM7XX_CLK_S_APB2        "apb2"
> +#define NPCM7XX_CLK_S_APB3        "apb3"
> +#define NPCM7XX_CLK_S_APB4        "apb4"
> +#define NPCM7XX_CLK_S_APB5        "apb5"
> +#define NPCM7XX_CLK_S_TOCK        "tock"
> +#define NPCM7XX_CLK_S_CLKOUT      "clkout"
> +#define NPCM7XX_CLK_S_UART        "uart"
> +#define NPCM7XX_CLK_S_TIMER       "timer"
> +#define NPCM7XX_CLK_S_MMC         "mmc"
> +#define NPCM7XX_CLK_S_SDHC        "sdhc"
> +#define NPCM7XX_CLK_S_ADC         "adc"
> +#define NPCM7XX_CLK_S_GFX         "gfx0_gfx1_mem"
> +#define NPCM7XX_CLK_S_USBIF       "serial_usbif"
> +#define NPCM7XX_CLK_S_USB_HOST    "usb_host"
> +#define NPCM7XX_CLK_S_USB_BRIDGE  "usb_bridge"
> +#define NPCM7XX_CLK_S_PCI         "pci"
> +
> +
> +static u32 pll_mux_table[] = {0, 1, 2, 3};
> +static const char * const pll_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_PLL0,
> +       NPCM7XX_CLK_S_PLL1_DIV2,
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_PLL2_DIV2,
> +};
> +
> +static u32 cpuck_mux_table[] = {0, 1, 2, 3};
> +static const char * const cpuck_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_PLL0,
> +       NPCM7XX_CLK_S_PLL1_DIV2,
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_SYSBYPCK,
> +};
> +
> +static u32 pixcksel_mux_table[] = {0, 2};
> +static const char * const pixcksel_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_PLL_GFX,
> +       NPCM7XX_CLK_S_REFCLK,
> +};
> +
> +static u32 sucksel_mux_table[] = {2, 3};
> +static const char * const sucksel_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_PLL2_DIV2,
> +};
> +
> +static u32 mccksel_mux_table[] = {0, 2, 3};
> +static const char * const mccksel_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_PLL1_DIV2,
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_MCBYPCK,
> +};
> +
> +static u32 clkoutsel_mux_table[] = {0, 1, 2, 3, 4};
> +static const char * const clkoutsel_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_PLL0,
> +       NPCM7XX_CLK_S_PLL1_DIV2,
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_PLL_GFX, // divided by 2
> +       NPCM7XX_CLK_S_PLL2_DIV2,
> +};
> +
> +static u32 gfxmsel_mux_table[] = {2, 3};
> +static const char * const gfxmsel_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_PLL2_DIV2,
> +};
> +
> +static u32 dvcssel_mux_table[] = {2, 3};
> +static const char * const dvcssel_mux_parents[] __initconst = {
> +       NPCM7XX_CLK_S_REFCLK,
> +       NPCM7XX_CLK_S_PLL2,
> +};
> +
> +
> +static const struct npcm7xx_clk_pll_data npcm7xx_plls[] __initconst = {
> +       {NPCM7XX_PLLCON0, NPCM7XX_CLK_S_PLL0, NPCM7XX_CLK_S_REFCLK, 0,
-1},
> +
> +       {NPCM7XX_PLLCON1, NPCM7XX_CLK_S_PLL1,
> +       NPCM7XX_CLK_S_REFCLK, 0, -1},
> +
> +       {NPCM7XX_PLLCON2, NPCM7XX_CLK_S_PLL2,
> +       NPCM7XX_CLK_S_REFCLK, 0, -1},
> +
> +       {NPCM7XX_PLLCONG, NPCM7XX_CLK_S_PLL_GFX,
> +       NPCM7XX_CLK_S_REFCLK, 0, -1},
> +};
> +
> +
> +static const struct npcm7xx_clk_mux_data npcm7xx_muxes[] __initconst = {
> +       {0, GENMASK(1, 0), cpuck_mux_table, NPCM7XX_CLK_S_CPU_MUX,
> +       cpuck_mux_parents, ARRAY_SIZE(cpuck_mux_parents), CLK_IS_CRITICAL,
> +       NPCM7XX_CLK_CPU},
> +
> +       {4, GENMASK(1, 0), pixcksel_mux_table, NPCM7XX_CLK_S_PIX_MUX,
> +       pixcksel_mux_parents, ARRAY_SIZE(pixcksel_mux_parents), 0,
> +       NPCM7XX_CLK_GFX_PIXEL},
> +
> +       {6, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_SD_MUX,
> +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> +
> +       {8, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_UART_MUX,
> +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> +
> +       {10, GENMASK(1, 0), sucksel_mux_table, NPCM7XX_CLK_S_SU_MUX,
> +       sucksel_mux_parents, ARRAY_SIZE(sucksel_mux_parents), 0, -1},
> +
> +       {12, GENMASK(1, 0), mccksel_mux_table, NPCM7XX_CLK_S_MC_MUX,
> +       mccksel_mux_parents, ARRAY_SIZE(mccksel_mux_parents), 0, -1},
> +
> +       {14, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_TIM_MUX,
> +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> +
> +       {16, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_GFX_MUX,
> +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> +
> +       {18, GENMASK(2, 0), clkoutsel_mux_table, NPCM7XX_CLK_S_CLKOUT_MUX,
> +       clkoutsel_mux_parents, ARRAY_SIZE(clkoutsel_mux_parents), 0, -1},
> +
> +       {21, GENMASK(1, 0), gfxmsel_mux_table, NPCM7XX_CLK_S_GFXM_MUX,
> +       gfxmsel_mux_parents, ARRAY_SIZE(gfxmsel_mux_parents), 0, -1},
> +
> +       {23, GENMASK(1, 0), dvcssel_mux_table, NPCM7XX_CLK_S_DVC_MUX,
> +       dvcssel_mux_parents, ARRAY_SIZE(dvcssel_mux_parents), 0, -1},
> +};
> +
> +/* fixed ratio dividers (no register): */
> +static const struct npcm7xx_clk_div_fixed_data npcm7xx_divs_fx[]
__initconst = {
> +       { 1, 2, NPCM7XX_CLK_S_MC, NPCM7XX_CLK_S_MC_MUX, 0,
NPCM7XX_CLK_MC},
> +       { 1, 2, NPCM7XX_CLK_S_PLL1_DIV2, NPCM7XX_CLK_S_PLL1, 0, -1},
> +       { 1, 2, NPCM7XX_CLK_S_PLL2_DIV2, NPCM7XX_CLK_S_PLL2, 0, -1},
> +};
> +
> +
> +/* configurable dividers: */
> +static const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst = {
> +       {NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC,
> +       NPCM7XX_CLK_S_TIMER, CLK_DIVIDER_POWER_OF_TWO, 0,
NPCM7XX_CLK_ADC},
> +       /*30-28 ADCCKDIV*/
> +       {NPCM7XX_CLKDIV1, 26, 2, NPCM7XX_CLK_S_AHB,
> +       NPCM7XX_CLK_S_AXI, 0, CLK_IS_CRITICAL, NPCM7XX_CLK_AHB},
> +       /*27-26 CLK4DIV*/
> +       {NPCM7XX_CLKDIV1, 21, 5, NPCM7XX_CLK_S_TIMER,
> +       NPCM7XX_CLK_S_TIM_MUX, 0, 0, NPCM7XX_CLK_TIMER},
> +       /*25-21 TIMCKDIV*/
> +       {NPCM7XX_CLKDIV1, 16, 5, NPCM7XX_CLK_S_UART,
> +       NPCM7XX_CLK_S_UART_MUX, 0, 0, NPCM7XX_CLK_UART},
> +       /*20-16 UARTDIV*/
> +       {NPCM7XX_CLKDIV1, 11, 5, NPCM7XX_CLK_S_MMC,
> +       NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_MMC},
> +       /*15-11 MMCCKDIV*/
> +       {NPCM7XX_CLKDIV1, 6, 5, NPCM7XX_CLK_S_SPI3,
> +       NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI3},
> +       /*10-6 AHB3CKDIV*/
> +       {NPCM7XX_CLKDIV1, 2, 4, NPCM7XX_CLK_S_PCI,
> +       NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_PCI},
> +       /*5-2 PCICKDIV*/
> +       {NPCM7XX_CLKDIV1, 0, 1, NPCM7XX_CLK_S_AXI,
> +       NPCM7XX_CLK_S_CPU_MUX, CLK_DIVIDER_POWER_OF_TWO, CLK_IS_CRITICAL,
> +       NPCM7XX_CLK_AXI},/*0 CLK2DIV*/
> +
> +       {NPCM7XX_CLKDIV2, 30, 2, NPCM7XX_CLK_S_APB4,
> +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB4},
> +       /*31-30 APB4CKDIV*/
> +       {NPCM7XX_CLKDIV2, 28, 2, NPCM7XX_CLK_S_APB3,
> +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB3},
> +       /*29-28 APB3CKDIV*/
> +       {NPCM7XX_CLKDIV2, 26, 2, NPCM7XX_CLK_S_APB2,
> +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB2},
> +       /*27-26 APB2CKDIV*/
> +       {NPCM7XX_CLKDIV2, 24, 2, NPCM7XX_CLK_S_APB1,
> +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB1},
> +       /*25-24 APB1CKDIV*/
> +       {NPCM7XX_CLKDIV2, 22, 2, NPCM7XX_CLK_S_APB5,
> +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB5},
> +       /*23-22 APB5CKDIV*/
> +       {NPCM7XX_CLKDIV2, 16, 5, NPCM7XX_CLK_S_CLKOUT,
> +       NPCM7XX_CLK_S_CLKOUT_MUX, 0, 0, NPCM7XX_CLK_CLKOUT},
> +       /*20-16 CLKOUTDIV*/
> +       {NPCM7XX_CLKDIV2, 13, 3, NPCM7XX_CLK_S_GFX,
> +       NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_GFX},
> +       /*15-13 GFXCKDIV*/
> +       {NPCM7XX_CLKDIV2, 8, 5, NPCM7XX_CLK_S_USB_BRIDGE,
> +       NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU},
> +       /*12-8 SUCKDIV*/
> +       {NPCM7XX_CLKDIV2, 4, 4, NPCM7XX_CLK_S_USB_HOST,
> +       NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU48},
> +       /*7-4 SU48CKDIV*/
> +       {NPCM7XX_CLKDIV2, 0, 4, NPCM7XX_CLK_S_SDHC,
> +       NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_SDHC}
> +       ,/*3-0 SD1CKDIV*/
> +
> +       {NPCM7XX_CLKDIV3, 6, 5, NPCM7XX_CLK_S_SPI0,
> +       NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI0},
> +       /*10-6 SPI0CKDV*/
> +       {NPCM7XX_CLKDIV3, 1, 5, NPCM7XX_CLK_S_SPIX,
> +       NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPIX},
> +       /*5-1 SPIXCKDV*/
> +
> +};
> +
> +
> +static const struct npcm7xx_clk_gate_data npcm7xx_gates[] __initconst = {
> +       {NPCM7XX_CLKEN1, 31, "smb1-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 30, "smb0-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 29, "smb7-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 28, "smb6-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 27, "adc-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN1, 26, "wdt-gate", NPCM7XX_CLK_S_TIMER, 0},
> +       {NPCM7XX_CLKEN1, 25, "usbdev3-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 24, "usbdev6-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 23, "usbdev5-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 22, "usbdev4-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 21, "emc2-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 20, "timer5_9-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN1, 19, "timer0_4-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN1, 18, "pwmm0-gate", NPCM7XX_CLK_S_APB3, 0},
> +       {NPCM7XX_CLKEN1, 17, "huart-gate", NPCM7XX_CLK_S_UART, 0},
> +       {NPCM7XX_CLKEN1, 16, "smb5-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 15, "smb4-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 14, "smb3-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 13, "smb2-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN1, 12, "mc-gate", NPCM7XX_CLK_S_MC, 0},
> +       {NPCM7XX_CLKEN1, 11, "uart01-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN1, 10, "aes-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 9, "peci-gate", NPCM7XX_CLK_S_APB3, 0},
> +       {NPCM7XX_CLKEN1, 8, "usbdev2-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 7, "uart23-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN1, 6, "emc1-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 5, "usbdev1-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 4, "shm-gate", NPCM7XX_CLK_S_AHB, 0},
> +       /* bit 3 is reserved */
> +       {NPCM7XX_CLKEN1, 2, "kcs-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN1, 1, "spi3-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN1, 0, "spi0-gate", NPCM7XX_CLK_S_AHB, 0},
> +
> +       {NPCM7XX_CLKEN2, 31, "cp-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 30, "tock-gate", NPCM7XX_CLK_S_TOCK, 0},
> +       /* bit 29 is reserved */
> +       {NPCM7XX_CLKEN2, 28, "gmac1-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 27, "usbif-gate", NPCM7XX_CLK_S_USBIF, 0},
> +       {NPCM7XX_CLKEN2, 26, "usbhost-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 25, "gmac2-gate", NPCM7XX_CLK_S_AHB, 0},
> +       /* bit 24 is reserved */
> +       {NPCM7XX_CLKEN2, 23, "pspi2-gate", NPCM7XX_CLK_S_APB5, 0},
> +       {NPCM7XX_CLKEN2, 22, "pspi1-gate", NPCM7XX_CLK_S_APB5, 0},
> +       {NPCM7XX_CLKEN2, 21, "3des-gate", NPCM7XX_CLK_S_AHB, 0},
> +       /* bit 20 is reserved */
> +       {NPCM7XX_CLKEN2, 19, "siox2-gate", NPCM7XX_CLK_S_APB3, 0},
> +       {NPCM7XX_CLKEN2, 18, "siox1-gate", NPCM7XX_CLK_S_APB3, 0},
> +       /* bit 17 is reserved */
> +       {NPCM7XX_CLKEN2, 16, "fuse-gate", NPCM7XX_CLK_S_APB4, 0},
> +       /*  bit 15 is reserved */
> +       {NPCM7XX_CLKEN2, 14, "vcd-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 13, "ece-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 12, "vdma-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 11, "ahbpcibrg-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 10, "gfxsys-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN2, 9, "sdhc-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 8, "mmc-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN2, 7, "mft7-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 6, "mft6-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 5, "mft5-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 4, "mft4-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 3, "mft3-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 2, "mft2-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 1, "mft1-gate", NPCM7XX_CLK_S_APB4, 0},
> +       {NPCM7XX_CLKEN2, 0, "mft0-gate", NPCM7XX_CLK_S_APB4, 0},
> +
> +       {NPCM7XX_CLKEN3, 31, "gpiom7-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 30, "gpiom6-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 29, "gpiom5-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 28, "gpiom4-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 27, "gpiom3-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 26, "gpiom2-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 25, "gpiom1-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 24, "gpiom0-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 23, "espi-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 22, "smb11-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 21, "smb10-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 20, "smb9-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 19, "smb8-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 18, "smb15-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 17, "rng-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 16, "timer10_14-gate", NPCM7XX_CLK_S_APB1, 0},
> +       {NPCM7XX_CLKEN3, 15, "pcirc-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 14, "sececc-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 13, "sha-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 12, "smb14-gate", NPCM7XX_CLK_S_APB2, 0},
> +       /* bit 11 is reserved */
> +       /* bit 10 is reserved */
> +       {NPCM7XX_CLKEN3, 9, "pcimbx-gate", NPCM7XX_CLK_S_AHB, 0},
> +       /* bit 8 is reserved */
> +       {NPCM7XX_CLKEN3, 7, "usbdev9-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 6, "usbdev8-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 5, "usbdev7-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 4, "usbdev0-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 3, "smb13-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 2, "spix-gate", NPCM7XX_CLK_S_AHB, 0},
> +       {NPCM7XX_CLKEN3, 1, "smb12-gate", NPCM7XX_CLK_S_APB2, 0},
> +       {NPCM7XX_CLKEN3, 0, "pwmm1-gate", NPCM7XX_CLK_S_APB3, 0},
> +};
> +
> +
> +static struct clk_hw_onecell_data *npcm7xx_clk_data;
> +static void __iomem *clk_base;
> +static DEFINE_SPINLOCK(lock);
> +
> +
> +static const struct of_device_id npcm7xx_clk_match_table[] = {
> +                               { .compatible = "nuvoton,npcm750-clk"},
> +                               {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, npcm7xx_clk_match_table);
> +
> +
> +static void __init npcm750clk_init(struct device_node *clk_np)
> +{
> +
> +       struct resource res;
> +       struct clk_hw *hw;
> +       struct clk *clk;
> +       int ret;
> +       int i;
> +
> +       pr_debug("NPCM750: clock init: ");
> +
> +       clk_base = NULL;
> +
> +       ret = of_address_to_resource(clk_np, 0, &res);
> +       if (ret) {
> +               pr_err("\t%s: failed to get resource, ret %d\n",
clk_np->name,
> +                       ret);
> +               return;
> +       }
> +
> +
> +       clk_base = ioremap(res.start, resource_size(&res));
> +       if (IS_ERR(clk_base)) {
> +               pr_err("\tnpcm750clk_init: resource error\n");
> +               goto npcm7xx_init_error;
> +       }
> +
> +
> +       npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
> +               NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data),
GFP_KERNEL);
> +
> +       npcm7xx_clk_data->num = 0;
> +
> +       if (!npcm7xx_clk_data->hws) {
> +               pr_err("Can't alloc npcm7xx_clk_data\n");
> +               goto npcm7xx_init_np_err;
> +       }
> +
> +       npcm7xx_clk_data->num = NPCM7XX_NUM_CLOCKS;
> +
> +
> +       /*
> +        * This way all clock fetched before the platform device probes,
> +        * except those we assign here for early use, will be deferred.
> +        */
> +       pr_debug("\tclk init hws\n");
> +       for (i = 0; i < NPCM7XX_NUM_CLOCKS; i++)
> +               npcm7xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> +
> +       /* Define fixed clocks.
> +        * Notice: the following clocks are fixed value on NPCM7XX and
should
> +        * not be changed.
> +        * therefor they are not exposed to the dev tree .

I am not convinced. The top level .dtsi is usually SoC specific.

- CLKREF should be fixed on 25MHz. I didn't want to put it in DT since it
might appear as something that is changeable.
 on npcm750 all clocks are set in ROM +BB (several possible settings) , so
this entire driver is only used for reading the current clock settings. All
clocks are read only and derived from CLKREF. CLKREF is fixed so no point
in putting it in DT and exposing it outside of this driver.

> +        */
> +       pr_debug("\tclk register fixed clocks\n");
> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_REFCLK,
> +               NULL, 0, 25000000);
> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_SYSBYPCK,
> +               NULL, 0, 800000000); // rarely used. mostly testing. TBD:
remove
> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_MCBYPCK,
> +               NULL, 0, 800000000); // rarely used.  mostly testing.
TBD:remove
> +
> +
> +       /* Register plls */
> +       pr_debug("\tclk register pll\n");
> +       for (i = 0; i < ARRAY_SIZE(npcm7xx_plls); i++) {
> +               const struct npcm7xx_clk_pll_data *pll_data =
&npcm7xx_plls[i];
> +
> +               pr_debug("\tclk reg pll%d, reg=0x%x, name=%s, p=%s\n", i,
> +               (unsigned int)pll_data->reg, pll_data->name,
> +               pll_data->parent_name);
> +
> +               hw = npcm7xx_clk_register_pll(clk_base + pll_data->reg,
> +                       pll_data->name, pll_data->parent_name,
pll_data->flags);
> +               if (IS_ERR(hw)) {
> +                       pr_err("npcm7xx_clk: Can't register pll\n");
> +                       goto npcm7xx_init_fail;
> +               }
> +
> +               if (pll_data->onecell_idx >= 0)
> +                       npcm7xx_clk_data->hws[pll_data->onecell_idx] = hw;
> +       }
> +
> +       /* Register fixed dividers */
> +       pr_debug("\tclk register fixed divs\n");
> +       clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL1_DIV2,
> +                       NPCM7XX_CLK_S_PLL1, 0, 1, 2);
> +       if (IS_ERR(clk)) {
> +               pr_err("npcm7xx_clk: Can't register fixed div\n");
> +               goto npcm7xx_init_fail;
> +       }
> +
> +
> +       clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL2_DIV2,
> +                       NPCM7XX_CLK_S_PLL2, 0, 1, 2);
> +
> +       if (IS_ERR(clk)) {
> +               pr_err("npcm7xx_clk: Can't register div2\n");
> +               goto npcm7xx_init_fail;
> +       }
> +
> +       /* Register muxes */
> +       for (i = 0; i < ARRAY_SIZE(npcm7xx_muxes); i++) {
> +               const struct npcm7xx_clk_mux_data *mux_data =
&npcm7xx_muxes[i];
> +
> +               pr_debug("\tadd mux%d reg=0x%x name=%s p=%s num_p=%d\n",
> +                   i, ((u32)clk_base + (u32)NPCM7XX_CLKSEL),
mux_data->name,
> +                       mux_data->parent_names[0], mux_data->num_parents);
> +
> +               hw = clk_hw_register_mux_table(NULL,
> +                       mux_data->name,
> +                       mux_data->parent_names, mux_data->num_parents,
> +                       mux_data->flags, clk_base + NPCM7XX_CLKSEL,
> +                       mux_data->shift, mux_data->mask, 0,
> +                       mux_data->table, &lock);
> +
> +               if (IS_ERR(hw)) {
> +                       pr_err("npcm7xx_clk: Can't register mux\n");
> +                       goto npcm7xx_init_fail;
> +               }
> +
> +               if (mux_data->onecell_idx >= 0)
> +                       npcm7xx_clk_data->hws[mux_data->onecell_idx] = hw;
> +       }
> +
> +       /* Register clock dividers specified in npcm7xx_divs. */
> +       pr_debug("\tclk register divs\n");
> +       for (i = 0; i < ARRAY_SIZE(npcm7xx_divs); i++) {
> +               const struct npcm7xx_clk_div_data *div_data =
&npcm7xx_divs[i];
> +
> +               pr_debug("\tadd div%d reg=0x%x name=%s, parent=%s\n",
> +                               i, (unsigned int)div_data->reg,
> +                               div_data->name, div_data->parent_name);
> +
> +               hw = clk_hw_register_divider(NULL, div_data->name,
> +                               div_data->parent_name,
> +                               div_data->flags,
> +                               clk_base + div_data->reg,
> +                               div_data->shift, div_data->width,
> +                               div_data->clk_divider_flags, &lock);
> +               if (IS_ERR(hw)) {
> +                       pr_err("npcm7xx_clk: Can't register div table\n");
> +                       goto npcm7xx_init_fail;
> +               }
> +
> +               if (div_data->onecell_idx >= 0)
> +                       npcm7xx_clk_data->hws[div_data->onecell_idx] = hw;
> +       }
> +
> +       ret = of_clk_add_hw_provider(clk_np, of_clk_hw_onecell_get,
> +                                       npcm7xx_clk_data);
> +       if (ret)
> +               pr_err("failed to add DT provider: %d\n", ret);
> +
> +       pr_info("npcm7xx clk: %d dividers, %d muxes and %d plls
registered.\n",
> +               ARRAY_SIZE(npcm7xx_divs), ARRAY_SIZE(npcm7xx_muxes),
> +               ARRAY_SIZE(npcm7xx_plls));
> +
> +       of_node_put(clk_np);
> +
> +       return;
> +
> +npcm7xx_init_fail:
> +       pr_debug("\tclk setup fail\n");
> +       if (npcm7xx_clk_data->num)
> +               kfree(npcm7xx_clk_data->hws);
> +npcm7xx_init_np_err:
> +       if (clk_base != NULL)
> +               iounmap(clk_base);
> +npcm7xx_init_error:
> +       of_node_put(clk_np);
> +}
> +
> +CLK_OF_DECLARE(npcm750clk_init, "nuvoton,npcm750-clk", npcm750clk_init);
> +
> +
> --
> 2.14.1
>

One minor issue, other than that, it looks pretty good.
- Thanks


On Mon, Feb 5, 2018 at 9:37 PM, Brendan Higgins <brendanhiggins@google.com>
wrote:

> On Mon, Feb 5, 2018 at 12:22 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> > Add Nuvoton BMC NPCM7xx clock driver.
> >
> > Nuvoton BMC NPCM7xx contain integrated clock controller which
> > generates and supplies clock to all modules within the NPCM7xx BMC.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/clk/Makefile      |   1 +
> >  drivers/clk/clk-npcm7xx.c | 751 ++++++++++++++++++++++++++++++
> ++++++++++++++++
> >  2 files changed, 752 insertions(+)
> >  create mode 100644 drivers/clk/clk-npcm7xx.c
> >
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index f7f761b02bed..89289abe0cc1 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -21,6 +21,7 @@ endif
> >  obj-$(CONFIG_MACH_ASM9260)             += clk-asm9260.o
> >  obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)    += clk-axi-clkgen.o
> >  obj-$(CONFIG_ARCH_AXXIA)               += clk-axm5516.o
> > +obj-$(CONFIG_ARCH_NPCM7XX)             += clk-npcm7xx.o
> >  obj-$(CONFIG_COMMON_CLK_CDCE706)       += clk-cdce706.o
> >  obj-$(CONFIG_COMMON_CLK_CDCE925)       += clk-cdce925.o
> >  obj-$(CONFIG_ARCH_CLPS711X)            += clk-clps711x.o
> > diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> > new file mode 100644
> > index 000000000000..21aeca4b0cc3
> > --- /dev/null
> > +++ b/drivers/clk/clk-npcm7xx.c
> > @@ -0,0 +1,751 @@
> > +/*
> > + * Nuvoton NPCM7xx Clock Generator
> > + * All the clocks are initialized by the bootloader, so this driver
> allow only
> > + * reading of current settings directly from the hardware.
> > + *
> > + * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
> > + *
> > + * SPDX-License-Identifier: GPL-2.0
> > + * Released under the GPLv2 only.
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/err.h>
> > +#include <linux/rational.h>
> > +#include <linux/bitfield.h>
> > +#include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> > +
> > +#include <asm/cp15.h>
> > +
> > +
> > +struct npcm7xx_clk_pll {
> > +       struct clk_hw   hw;
> > +       void __iomem    *pllcon;
> > +       u8              flags;
> > +};
> > +
> > +#define to_npcm7xx_clk_pll(_hw) container_of(_hw, struct
> npcm7xx_clk_pll, hw)
> > +
> > +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const
> char *name,
> > +       const char *parent_name, unsigned long flags);
> > +
> > +#define PLLCON_LOKI    BIT(31)
> > +#define PLLCON_LOKS    BIT(30)
> > +#define PLLCON_FBDV    GENMASK(27, 16)
> > +#define PLLCON_OTDV2   GENMASK(15, 13)
> > +#define PLLCON_PWDEN   BIT(12)
> > +#define PLLCON_OTDV1   GENMASK(10, 8)
> > +#define PLLCON_INDV    GENMASK(5, 0)
> > +
> > +static unsigned long npcm7xx_clk_pll_recalc_rate(struct clk_hw *hw,
> > +                                                unsigned long
> parent_rate)
> > +{
> > +       struct npcm7xx_clk_pll *pll = to_npcm7xx_clk_pll(hw);
> > +       unsigned long fbdv, indv, otdv1, otdv2;
> > +       unsigned int val;
> > +       u64 ret;
> > +
> > +       if (parent_rate == 0) {
> > +               pr_err("%s: parent rate is zero. reg=%x\n", __func__,
> > +                       (u32)(pll->pllcon));
> > +               return 0;
> > +       }
> > +
> > +       val = readl_relaxed(pll->pllcon);
> > +
> > +       indv = FIELD_GET(PLLCON_INDV, val);
> > +       fbdv = FIELD_GET(PLLCON_FBDV, val);
> > +       otdv1 = FIELD_GET(PLLCON_OTDV1, val);
> > +       otdv2 = FIELD_GET(PLLCON_OTDV2, val);
> > +
> > +       ret = (u64)parent_rate * fbdv;
> > +       do_div(ret, indv * otdv1 * otdv2);
> > +
> > +       return ret;
> > +}
> > +
> > +const struct clk_ops npcm7xx_clk_pll_ops = {
> > +       .recalc_rate = npcm7xx_clk_pll_recalc_rate,
> > +};
> > +
> > +
> > +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const
> char *name,
> > +       const char *parent_name, unsigned long flags)
> > +{
> > +       struct npcm7xx_clk_pll *pll;
> > +       struct clk_init_data init;
> > +       struct clk_hw *hw;
> > +       int ret;
> > +
> > +       pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> > +       if (!pll)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       pr_debug("\tnpcm7xx_clk_register_pll reg, reg=0x%x, name=%s,
> p=%s\n",
> > +               (unsigned int)pllcon, name, parent_name);
> > +
> > +       init.name = name;
> > +       init.ops = &npcm7xx_clk_pll_ops;
> > +       init.parent_names = &parent_name;
> > +       init.num_parents = 1;
> > +       init.flags = flags;
> > +
> > +       pll->pllcon = pllcon;
> > +       pll->hw.init = &init;
> > +
> > +       hw = &pll->hw;
> > +
> > +       ret = clk_hw_register(NULL, hw);
> > +       if (ret) {
> > +               kfree(pll);
> > +               hw = ERR_PTR(ret);
> > +       }
> > +
> > +       return hw;
> > +}
> > +
> > +
> > +#define NPCM7XX_CLKEN1          (0x00)
> > +#define NPCM7XX_CLKEN2          (0x28)
> > +#define NPCM7XX_CLKEN3          (0x30)
> > +#define NPCM7XX_CLKSEL          (0x04)
> > +#define NPCM7XX_CLKDIV1         (0x08)
> > +#define NPCM7XX_CLKDIV2         (0x2C)
> > +#define NPCM7XX_CLKDIV3         (0x58)
> > +#define NPCM7XX_PLLCON0         (0x0C)
> > +#define NPCM7XX_PLLCON1         (0x10)
> > +#define NPCM7XX_PLLCON2         (0x54)
> > +#define NPCM7XX_SWRSTR          (0x14)
> > +#define NPCM7XX_IRQWAKECON      (0x18)
> > +#define NPCM7XX_IRQWAKEFLAG     (0x1C)
> > +#define NPCM7XX_IPSRST1         (0x20)
> > +#define NPCM7XX_IPSRST2         (0x24)
> > +#define NPCM7XX_IPSRST3         (0x34)
> > +#define NPCM7XX_WD0RCR          (0x38)
> > +#define NPCM7XX_WD1RCR          (0x3C)
> > +#define NPCM7XX_WD2RCR          (0x40)
> > +#define NPCM7XX_SWRSTC1         (0x44)
> > +#define NPCM7XX_SWRSTC2         (0x48)
> > +#define NPCM7XX_SWRSTC3         (0x4C)
> > +#define NPCM7XX_SWRSTC4         (0x50)
> > +#define NPCM7XX_CORSTC          (0x5C)
> > +#define NPCM7XX_PLLCONG         (0x60)
> > +#define NPCM7XX_AHBCKFI         (0x64)
> > +#define NPCM7XX_SECCNT          (0x68)
> > +#define NPCM7XX_CNTR25M         (0x6C)
> > +
> > +
> > +struct npcm7xx_clk_gate_data {
> > +       u32 reg;
> > +       u8 bit_idx;
> > +       const char *name;
> > +       const char *parent_name;
> > +       unsigned long flags;
> > +       /*
> > +        * If this clock is exported via DT, set onecell_idx to constant
> > +        * defined in include/dt-bindings/clock/nuvoton,
> NPCM7XX-clock.h for
> > +        * this specific clock.  Otherwise, set to -1.
> > +        */
> > +       int onecell_idx;
> > +};
> > +
> > +struct npcm7xx_clk_mux_data {
> > +       u8 shift;
> > +       u8 mask;
> > +       u32 *table;
> > +       const char *name;
> > +       const char * const *parent_names;
> > +       u8 num_parents;
> > +       unsigned long flags;
> > +       /*
> > +        * If this clock is exported via DT, set onecell_idx to constant
> > +        * defined in include/dt-bindings/clock/nuvoton,
> NPCM7XX-clock.h for
> > +        * this specific clock.  Otherwise, set to -1.
> > +        */
> > +       int onecell_idx;
> > +
> > +};
> > +
> > +struct npcm7xx_clk_div_fixed_data {
> > +       u8 mult;
> > +       u8 div;
> > +       const char *name;
> > +       const char *parent_name;
> > +       u8 clk_divider_flags;
> > +       /*
> > +        * If this clock is exported via DT, set onecell_idx to constant
> > +        * defined in include/dt-bindings/clock/nuvoton,
> NPCM7XX-clock.h for
> > +        * this specific clock.  Otherwise, set to -1.
> > +        */
> > +       int onecell_idx;
> > +};
> > +
> > +
> > +struct npcm7xx_clk_div_data {
> > +       u32 reg;
> > +       u8 shift;
> > +       u8 width;
> > +       const char *name;
> > +       const char *parent_name;
> > +       u8 clk_divider_flags;
> > +       unsigned long flags;
> > +       /*
> > +        * If this clock is exported via DT, set onecell_idx to constant
> > +        * defined in include/dt-bindings/clock/nuvoton,
> NPCM7XX-clock.h for
> > +        * this specific clock.  Otherwise, set to -1.
> > +        */
> > +       int onecell_idx;
> > +};
> > +
> > +struct npcm7xx_clk_pll_data {
> > +       u32 reg;
> > +       const char *name;
> > +       const char *parent_name;
> > +       unsigned long flags;
> > +       /*
> > +        * If this clock is exported via DT, set onecell_idx to constant
> > +        * defined in include/dt-bindings/clock/nuvoton,
> NPCM7XX-clock.h for
> > +        * this specific clock.  Otherwise, set to -1.
> > +        */
> > +       int onecell_idx;
> > +};
> > +
> > +
> > +/*
> > + * Single copy of strings used to refer to clocks within this driver
> indexed by
> > + * above enum.
> > + */
> > +#define NPCM7XX_CLK_S_REFCLK      "refclk"
> > +#define NPCM7XX_CLK_S_SYSBYPCK    "sysbypck"
> > +#define NPCM7XX_CLK_S_MCBYPCK     "mcbypck"
> > +#define NPCM7XX_CLK_S_GFXBYPCK    "gfxbypck"
> > +#define NPCM7XX_CLK_S_PLL0        "pll0"
> > +#define NPCM7XX_CLK_S_PLL1        "pll1"
> > +#define NPCM7XX_CLK_S_PLL1_DIV2   "pll1_div2"
> > +#define NPCM7XX_CLK_S_PLL2        "pll2"
> > +#define NPCM7XX_CLK_S_PLL_GFX     "pll_gfx"
> > +#define NPCM7XX_CLK_S_PLL2_DIV2   "pll2_div2"
> > +#define NPCM7XX_CLK_S_PIX_MUX     "gfx_pixel"
> > +#define NPCM7XX_CLK_S_GPRFSEL_MUX "gprfsel_mux"
> > +#define NPCM7XX_CLK_S_MC_MUX      "mc_phy"
> > +#define NPCM7XX_CLK_S_CPU_MUX     "cpu"  /*AKA system clock.*/
> > +#define NPCM7XX_CLK_S_MC          "mc"
> > +#define NPCM7XX_CLK_S_AXI         "axi"  /*AKA CLK2*/
> > +#define NPCM7XX_CLK_S_AHB         "ahb"  /*AKA CLK4*/
> > +#define NPCM7XX_CLK_S_CLKOUT_MUX  "clkout_mux"
> > +#define NPCM7XX_CLK_S_UART_MUX    "uart_mux"
> > +#define NPCM7XX_CLK_S_TIM_MUX     "timer_mux"
> > +#define NPCM7XX_CLK_S_SD_MUX      "sd_mux"
> > +#define NPCM7XX_CLK_S_GFXM_MUX    "gfxm_mux"
> > +#define NPCM7XX_CLK_S_SU_MUX      "serial_usb_mux"
> > +#define NPCM7XX_CLK_S_DVC_MUX     "dvc_mux"
> > +#define NPCM7XX_CLK_S_GFX_MUX     "gfx_mux"
> > +#define NPCM7XX_CLK_S_GFX_PIXEL   "gfx_pixel"
> > +#define NPCM7XX_CLK_S_SPI0        "spi0"
> > +#define NPCM7XX_CLK_S_SPI3        "spi3"
> > +#define NPCM7XX_CLK_S_SPIX        "spix"
> > +#define NPCM7XX_CLK_S_APB1        "apb1"
> > +#define NPCM7XX_CLK_S_APB2        "apb2"
> > +#define NPCM7XX_CLK_S_APB3        "apb3"
> > +#define NPCM7XX_CLK_S_APB4        "apb4"
> > +#define NPCM7XX_CLK_S_APB5        "apb5"
> > +#define NPCM7XX_CLK_S_TOCK        "tock"
> > +#define NPCM7XX_CLK_S_CLKOUT      "clkout"
> > +#define NPCM7XX_CLK_S_UART        "uart"
> > +#define NPCM7XX_CLK_S_TIMER       "timer"
> > +#define NPCM7XX_CLK_S_MMC         "mmc"
> > +#define NPCM7XX_CLK_S_SDHC        "sdhc"
> > +#define NPCM7XX_CLK_S_ADC         "adc"
> > +#define NPCM7XX_CLK_S_GFX         "gfx0_gfx1_mem"
> > +#define NPCM7XX_CLK_S_USBIF       "serial_usbif"
> > +#define NPCM7XX_CLK_S_USB_HOST    "usb_host"
> > +#define NPCM7XX_CLK_S_USB_BRIDGE  "usb_bridge"
> > +#define NPCM7XX_CLK_S_PCI         "pci"
> > +
> > +
> > +static u32 pll_mux_table[] = {0, 1, 2, 3};
> > +static const char * const pll_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_PLL0,
> > +       NPCM7XX_CLK_S_PLL1_DIV2,
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_PLL2_DIV2,
> > +};
> > +
> > +static u32 cpuck_mux_table[] = {0, 1, 2, 3};
> > +static const char * const cpuck_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_PLL0,
> > +       NPCM7XX_CLK_S_PLL1_DIV2,
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_SYSBYPCK,
> > +};
> > +
> > +static u32 pixcksel_mux_table[] = {0, 2};
> > +static const char * const pixcksel_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_PLL_GFX,
> > +       NPCM7XX_CLK_S_REFCLK,
> > +};
> > +
> > +static u32 sucksel_mux_table[] = {2, 3};
> > +static const char * const sucksel_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_PLL2_DIV2,
> > +};
> > +
> > +static u32 mccksel_mux_table[] = {0, 2, 3};
> > +static const char * const mccksel_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_PLL1_DIV2,
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_MCBYPCK,
> > +};
> > +
> > +static u32 clkoutsel_mux_table[] = {0, 1, 2, 3, 4};
> > +static const char * const clkoutsel_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_PLL0,
> > +       NPCM7XX_CLK_S_PLL1_DIV2,
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_PLL_GFX, // divided by 2
> > +       NPCM7XX_CLK_S_PLL2_DIV2,
> > +};
> > +
> > +static u32 gfxmsel_mux_table[] = {2, 3};
> > +static const char * const gfxmsel_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_PLL2_DIV2,
> > +};
> > +
> > +static u32 dvcssel_mux_table[] = {2, 3};
> > +static const char * const dvcssel_mux_parents[] __initconst = {
> > +       NPCM7XX_CLK_S_REFCLK,
> > +       NPCM7XX_CLK_S_PLL2,
> > +};
> > +
> > +
> > +static const struct npcm7xx_clk_pll_data npcm7xx_plls[] __initconst = {
> > +       {NPCM7XX_PLLCON0, NPCM7XX_CLK_S_PLL0, NPCM7XX_CLK_S_REFCLK, 0,
> -1},
> > +
> > +       {NPCM7XX_PLLCON1, NPCM7XX_CLK_S_PLL1,
> > +       NPCM7XX_CLK_S_REFCLK, 0, -1},
> > +
> > +       {NPCM7XX_PLLCON2, NPCM7XX_CLK_S_PLL2,
> > +       NPCM7XX_CLK_S_REFCLK, 0, -1},
> > +
> > +       {NPCM7XX_PLLCONG, NPCM7XX_CLK_S_PLL_GFX,
> > +       NPCM7XX_CLK_S_REFCLK, 0, -1},
> > +};
> > +
> > +
> > +static const struct npcm7xx_clk_mux_data npcm7xx_muxes[] __initconst = {
> > +       {0, GENMASK(1, 0), cpuck_mux_table, NPCM7XX_CLK_S_CPU_MUX,
> > +       cpuck_mux_parents, ARRAY_SIZE(cpuck_mux_parents),
> CLK_IS_CRITICAL,
> > +       NPCM7XX_CLK_CPU},
> > +
> > +       {4, GENMASK(1, 0), pixcksel_mux_table, NPCM7XX_CLK_S_PIX_MUX,
> > +       pixcksel_mux_parents, ARRAY_SIZE(pixcksel_mux_parents), 0,
> > +       NPCM7XX_CLK_GFX_PIXEL},
> > +
> > +       {6, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_SD_MUX,
> > +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> > +
> > +       {8, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_UART_MUX,
> > +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> > +
> > +       {10, GENMASK(1, 0), sucksel_mux_table, NPCM7XX_CLK_S_SU_MUX,
> > +       sucksel_mux_parents, ARRAY_SIZE(sucksel_mux_parents), 0, -1},
> > +
> > +       {12, GENMASK(1, 0), mccksel_mux_table, NPCM7XX_CLK_S_MC_MUX,
> > +       mccksel_mux_parents, ARRAY_SIZE(mccksel_mux_parents), 0, -1},
> > +
> > +       {14, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_TIM_MUX,
> > +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> > +
> > +       {16, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_GFX_MUX,
> > +       pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},
> > +
> > +       {18, GENMASK(2, 0), clkoutsel_mux_table,
> NPCM7XX_CLK_S_CLKOUT_MUX,
> > +       clkoutsel_mux_parents, ARRAY_SIZE(clkoutsel_mux_parents), 0,
> -1},
> > +
> > +       {21, GENMASK(1, 0), gfxmsel_mux_table, NPCM7XX_CLK_S_GFXM_MUX,
> > +       gfxmsel_mux_parents, ARRAY_SIZE(gfxmsel_mux_parents), 0, -1},
> > +
> > +       {23, GENMASK(1, 0), dvcssel_mux_table, NPCM7XX_CLK_S_DVC_MUX,
> > +       dvcssel_mux_parents, ARRAY_SIZE(dvcssel_mux_parents), 0, -1},
> > +};
> > +
> > +/* fixed ratio dividers (no register): */
> > +static const struct npcm7xx_clk_div_fixed_data npcm7xx_divs_fx[]
> __initconst = {
> > +       { 1, 2, NPCM7XX_CLK_S_MC, NPCM7XX_CLK_S_MC_MUX, 0,
> NPCM7XX_CLK_MC},
> > +       { 1, 2, NPCM7XX_CLK_S_PLL1_DIV2, NPCM7XX_CLK_S_PLL1, 0, -1},
> > +       { 1, 2, NPCM7XX_CLK_S_PLL2_DIV2, NPCM7XX_CLK_S_PLL2, 0, -1},
> > +};
> > +
> > +
> > +/* configurable dividers: */
> > +static const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst = {
> > +       {NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC,
> > +       NPCM7XX_CLK_S_TIMER, CLK_DIVIDER_POWER_OF_TWO, 0,
> NPCM7XX_CLK_ADC},
> > +       /*30-28 ADCCKDIV*/
> > +       {NPCM7XX_CLKDIV1, 26, 2, NPCM7XX_CLK_S_AHB,
> > +       NPCM7XX_CLK_S_AXI, 0, CLK_IS_CRITICAL, NPCM7XX_CLK_AHB},
> > +       /*27-26 CLK4DIV*/
> > +       {NPCM7XX_CLKDIV1, 21, 5, NPCM7XX_CLK_S_TIMER,
> > +       NPCM7XX_CLK_S_TIM_MUX, 0, 0, NPCM7XX_CLK_TIMER},
> > +       /*25-21 TIMCKDIV*/
> > +       {NPCM7XX_CLKDIV1, 16, 5, NPCM7XX_CLK_S_UART,
> > +       NPCM7XX_CLK_S_UART_MUX, 0, 0, NPCM7XX_CLK_UART},
> > +       /*20-16 UARTDIV*/
> > +       {NPCM7XX_CLKDIV1, 11, 5, NPCM7XX_CLK_S_MMC,
> > +       NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_MMC},
> > +       /*15-11 MMCCKDIV*/
> > +       {NPCM7XX_CLKDIV1, 6, 5, NPCM7XX_CLK_S_SPI3,
> > +       NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI3},
> > +       /*10-6 AHB3CKDIV*/
> > +       {NPCM7XX_CLKDIV1, 2, 4, NPCM7XX_CLK_S_PCI,
> > +       NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_PCI},
> > +       /*5-2 PCICKDIV*/
> > +       {NPCM7XX_CLKDIV1, 0, 1, NPCM7XX_CLK_S_AXI,
> > +       NPCM7XX_CLK_S_CPU_MUX, CLK_DIVIDER_POWER_OF_TWO, CLK_IS_CRITICAL,
> > +       NPCM7XX_CLK_AXI},/*0 CLK2DIV*/
> > +
> > +       {NPCM7XX_CLKDIV2, 30, 2, NPCM7XX_CLK_S_APB4,
> > +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0,
> NPCM7XX_CLK_APB4},
> > +       /*31-30 APB4CKDIV*/
> > +       {NPCM7XX_CLKDIV2, 28, 2, NPCM7XX_CLK_S_APB3,
> > +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0,
> NPCM7XX_CLK_APB3},
> > +       /*29-28 APB3CKDIV*/
> > +       {NPCM7XX_CLKDIV2, 26, 2, NPCM7XX_CLK_S_APB2,
> > +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0,
> NPCM7XX_CLK_APB2},
> > +       /*27-26 APB2CKDIV*/
> > +       {NPCM7XX_CLKDIV2, 24, 2, NPCM7XX_CLK_S_APB1,
> > +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0,
> NPCM7XX_CLK_APB1},
> > +       /*25-24 APB1CKDIV*/
> > +       {NPCM7XX_CLKDIV2, 22, 2, NPCM7XX_CLK_S_APB5,
> > +       NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0,
> NPCM7XX_CLK_APB5},
> > +       /*23-22 APB5CKDIV*/
> > +       {NPCM7XX_CLKDIV2, 16, 5, NPCM7XX_CLK_S_CLKOUT,
> > +       NPCM7XX_CLK_S_CLKOUT_MUX, 0, 0, NPCM7XX_CLK_CLKOUT},
> > +       /*20-16 CLKOUTDIV*/
> > +       {NPCM7XX_CLKDIV2, 13, 3, NPCM7XX_CLK_S_GFX,
> > +       NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_GFX},
> > +       /*15-13 GFXCKDIV*/
> > +       {NPCM7XX_CLKDIV2, 8, 5, NPCM7XX_CLK_S_USB_BRIDGE,
> > +       NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU},
> > +       /*12-8 SUCKDIV*/
> > +       {NPCM7XX_CLKDIV2, 4, 4, NPCM7XX_CLK_S_USB_HOST,
> > +       NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU48},
> > +       /*7-4 SU48CKDIV*/
> > +       {NPCM7XX_CLKDIV2, 0, 4, NPCM7XX_CLK_S_SDHC,
> > +       NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_SDHC}
> > +       ,/*3-0 SD1CKDIV*/
> > +
> > +       {NPCM7XX_CLKDIV3, 6, 5, NPCM7XX_CLK_S_SPI0,
> > +       NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI0},
> > +       /*10-6 SPI0CKDV*/
> > +       {NPCM7XX_CLKDIV3, 1, 5, NPCM7XX_CLK_S_SPIX,
> > +       NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPIX},
> > +       /*5-1 SPIXCKDV*/
> > +
> > +};
> > +
> > +
> > +static const struct npcm7xx_clk_gate_data npcm7xx_gates[] __initconst =
> {
> > +       {NPCM7XX_CLKEN1, 31, "smb1-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 30, "smb0-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 29, "smb7-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 28, "smb6-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 27, "adc-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN1, 26, "wdt-gate", NPCM7XX_CLK_S_TIMER, 0},
> > +       {NPCM7XX_CLKEN1, 25, "usbdev3-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 24, "usbdev6-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 23, "usbdev5-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 22, "usbdev4-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 21, "emc2-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 20, "timer5_9-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN1, 19, "timer0_4-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN1, 18, "pwmm0-gate", NPCM7XX_CLK_S_APB3, 0},
> > +       {NPCM7XX_CLKEN1, 17, "huart-gate", NPCM7XX_CLK_S_UART, 0},
> > +       {NPCM7XX_CLKEN1, 16, "smb5-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 15, "smb4-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 14, "smb3-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 13, "smb2-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN1, 12, "mc-gate", NPCM7XX_CLK_S_MC, 0},
> > +       {NPCM7XX_CLKEN1, 11, "uart01-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN1, 10, "aes-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 9, "peci-gate", NPCM7XX_CLK_S_APB3, 0},
> > +       {NPCM7XX_CLKEN1, 8, "usbdev2-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 7, "uart23-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN1, 6, "emc1-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 5, "usbdev1-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 4, "shm-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       /* bit 3 is reserved */
> > +       {NPCM7XX_CLKEN1, 2, "kcs-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN1, 1, "spi3-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN1, 0, "spi0-gate", NPCM7XX_CLK_S_AHB, 0},
> > +
> > +       {NPCM7XX_CLKEN2, 31, "cp-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 30, "tock-gate", NPCM7XX_CLK_S_TOCK, 0},
> > +       /* bit 29 is reserved */
> > +       {NPCM7XX_CLKEN2, 28, "gmac1-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 27, "usbif-gate", NPCM7XX_CLK_S_USBIF, 0},
> > +       {NPCM7XX_CLKEN2, 26, "usbhost-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 25, "gmac2-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       /* bit 24 is reserved */
> > +       {NPCM7XX_CLKEN2, 23, "pspi2-gate", NPCM7XX_CLK_S_APB5, 0},
> > +       {NPCM7XX_CLKEN2, 22, "pspi1-gate", NPCM7XX_CLK_S_APB5, 0},
> > +       {NPCM7XX_CLKEN2, 21, "3des-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       /* bit 20 is reserved */
> > +       {NPCM7XX_CLKEN2, 19, "siox2-gate", NPCM7XX_CLK_S_APB3, 0},
> > +       {NPCM7XX_CLKEN2, 18, "siox1-gate", NPCM7XX_CLK_S_APB3, 0},
> > +       /* bit 17 is reserved */
> > +       {NPCM7XX_CLKEN2, 16, "fuse-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       /*  bit 15 is reserved */
> > +       {NPCM7XX_CLKEN2, 14, "vcd-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 13, "ece-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 12, "vdma-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 11, "ahbpcibrg-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 10, "gfxsys-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN2, 9, "sdhc-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 8, "mmc-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN2, 7, "mft7-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 6, "mft6-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 5, "mft5-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 4, "mft4-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 3, "mft3-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 2, "mft2-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 1, "mft1-gate", NPCM7XX_CLK_S_APB4, 0},
> > +       {NPCM7XX_CLKEN2, 0, "mft0-gate", NPCM7XX_CLK_S_APB4, 0},
> > +
> > +       {NPCM7XX_CLKEN3, 31, "gpiom7-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 30, "gpiom6-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 29, "gpiom5-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 28, "gpiom4-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 27, "gpiom3-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 26, "gpiom2-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 25, "gpiom1-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 24, "gpiom0-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 23, "espi-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 22, "smb11-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 21, "smb10-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 20, "smb9-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 19, "smb8-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 18, "smb15-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 17, "rng-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 16, "timer10_14-gate", NPCM7XX_CLK_S_APB1, 0},
> > +       {NPCM7XX_CLKEN3, 15, "pcirc-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 14, "sececc-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 13, "sha-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 12, "smb14-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       /* bit 11 is reserved */
> > +       /* bit 10 is reserved */
> > +       {NPCM7XX_CLKEN3, 9, "pcimbx-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       /* bit 8 is reserved */
> > +       {NPCM7XX_CLKEN3, 7, "usbdev9-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 6, "usbdev8-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 5, "usbdev7-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 4, "usbdev0-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 3, "smb13-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 2, "spix-gate", NPCM7XX_CLK_S_AHB, 0},
> > +       {NPCM7XX_CLKEN3, 1, "smb12-gate", NPCM7XX_CLK_S_APB2, 0},
> > +       {NPCM7XX_CLKEN3, 0, "pwmm1-gate", NPCM7XX_CLK_S_APB3, 0},
> > +};
> > +
> > +
> > +static struct clk_hw_onecell_data *npcm7xx_clk_data;
> > +static void __iomem *clk_base;
> > +static DEFINE_SPINLOCK(lock);
> > +
> > +
> > +static const struct of_device_id npcm7xx_clk_match_table[] = {
> > +                               { .compatible = "nuvoton,npcm750-clk"},
> > +                               {},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, npcm7xx_clk_match_table);
> > +
> > +
> > +static void __init npcm750clk_init(struct device_node *clk_np)
> > +{
> > +
> > +       struct resource res;
> > +       struct clk_hw *hw;
> > +       struct clk *clk;
> > +       int ret;
> > +       int i;
> > +
> > +       pr_debug("NPCM750: clock init: ");
> > +
> > +       clk_base = NULL;
> > +
> > +       ret = of_address_to_resource(clk_np, 0, &res);
> > +       if (ret) {
> > +               pr_err("\t%s: failed to get resource, ret %d\n",
> clk_np->name,
> > +                       ret);
> > +               return;
> > +       }
> > +
> > +
> > +       clk_base = ioremap(res.start, resource_size(&res));
> > +       if (IS_ERR(clk_base)) {
> > +               pr_err("\tnpcm750clk_init: resource error\n");
> > +               goto npcm7xx_init_error;
> > +       }
> > +
> > +
> > +       npcm7xx_clk_data = kzalloc(sizeof(*npcm7xx_clk_data->hws) *
> > +               NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data),
> GFP_KERNEL);
> > +
> > +       npcm7xx_clk_data->num = 0;
> > +
> > +       if (!npcm7xx_clk_data->hws) {
> > +               pr_err("Can't alloc npcm7xx_clk_data\n");
> > +               goto npcm7xx_init_np_err;
> > +       }
> > +
> > +       npcm7xx_clk_data->num = NPCM7XX_NUM_CLOCKS;
> > +
> > +
> > +       /*
> > +        * This way all clock fetched before the platform device probes,
> > +        * except those we assign here for early use, will be deferred.
> > +        */
> > +       pr_debug("\tclk init hws\n");
> > +       for (i = 0; i < NPCM7XX_NUM_CLOCKS; i++)
> > +               npcm7xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> > +
> > +       /* Define fixed clocks.
> > +        * Notice: the following clocks are fixed value on NPCM7XX and
> should
> > +        * not be changed.
> > +        * therefor they are not exposed to the dev tree .
>
> I am not convinced. The top level .dtsi is usually SoC specific.
>
> > +        */
> > +       pr_debug("\tclk register fixed clocks\n");
> > +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_REFCLK,
> > +               NULL, 0, 25000000);
> > +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_SYSBYPCK,
> > +               NULL, 0, 800000000); // rarely used. mostly testing.
> TBD: remove
> > +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_MCBYPCK,
> > +               NULL, 0, 800000000); // rarely used.  mostly testing.
> TBD:remove
> > +
> > +
> > +       /* Register plls */
> > +       pr_debug("\tclk register pll\n");
> > +       for (i = 0; i < ARRAY_SIZE(npcm7xx_plls); i++) {
> > +               const struct npcm7xx_clk_pll_data *pll_data =
> &npcm7xx_plls[i];
> > +
> > +               pr_debug("\tclk reg pll%d, reg=0x%x, name=%s, p=%s\n", i,
> > +               (unsigned int)pll_data->reg, pll_data->name,
> > +               pll_data->parent_name);
> > +
> > +               hw = npcm7xx_clk_register_pll(clk_base + pll_data->reg,
> > +                       pll_data->name, pll_data->parent_name,
> pll_data->flags);
> > +               if (IS_ERR(hw)) {
> > +                       pr_err("npcm7xx_clk: Can't register pll\n");
> > +                       goto npcm7xx_init_fail;
> > +               }
> > +
> > +               if (pll_data->onecell_idx >= 0)
> > +                       npcm7xx_clk_data->hws[pll_data->onecell_idx] =
> hw;
> > +       }
> > +
> > +       /* Register fixed dividers */
> > +       pr_debug("\tclk register fixed divs\n");
> > +       clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL1_DIV2,
> > +                       NPCM7XX_CLK_S_PLL1, 0, 1, 2);
> > +       if (IS_ERR(clk)) {
> > +               pr_err("npcm7xx_clk: Can't register fixed div\n");
> > +               goto npcm7xx_init_fail;
> > +       }
> > +
> > +
> > +       clk = clk_register_fixed_factor(NULL, NPCM7XX_CLK_S_PLL2_DIV2,
> > +                       NPCM7XX_CLK_S_PLL2, 0, 1, 2);
> > +
> > +       if (IS_ERR(clk)) {
> > +               pr_err("npcm7xx_clk: Can't register div2\n");
> > +               goto npcm7xx_init_fail;
> > +       }
> > +
> > +       /* Register muxes */
> > +       for (i = 0; i < ARRAY_SIZE(npcm7xx_muxes); i++) {
> > +               const struct npcm7xx_clk_mux_data *mux_data =
> &npcm7xx_muxes[i];
> > +
> > +               pr_debug("\tadd mux%d reg=0x%x name=%s p=%s num_p=%d\n",
> > +                   i, ((u32)clk_base + (u32)NPCM7XX_CLKSEL),
> mux_data->name,
> > +                       mux_data->parent_names[0],
> mux_data->num_parents);
> > +
> > +               hw = clk_hw_register_mux_table(NULL,
> > +                       mux_data->name,
> > +                       mux_data->parent_names, mux_data->num_parents,
> > +                       mux_data->flags, clk_base + NPCM7XX_CLKSEL,
> > +                       mux_data->shift, mux_data->mask, 0,
> > +                       mux_data->table, &lock);
> > +
> > +               if (IS_ERR(hw)) {
> > +                       pr_err("npcm7xx_clk: Can't register mux\n");
> > +                       goto npcm7xx_init_fail;
> > +               }
> > +
> > +               if (mux_data->onecell_idx >= 0)
> > +                       npcm7xx_clk_data->hws[mux_data->onecell_idx] =
> hw;
> > +       }
> > +
> > +       /* Register clock dividers specified in npcm7xx_divs. */
> > +       pr_debug("\tclk register divs\n");
> > +       for (i = 0; i < ARRAY_SIZE(npcm7xx_divs); i++) {
> > +               const struct npcm7xx_clk_div_data *div_data =
> &npcm7xx_divs[i];
> > +
> > +               pr_debug("\tadd div%d reg=0x%x name=%s, parent=%s\n",
> > +                               i, (unsigned int)div_data->reg,
> > +                               div_data->name, div_data->parent_name);
> > +
> > +               hw = clk_hw_register_divider(NULL, div_data->name,
> > +                               div_data->parent_name,
> > +                               div_data->flags,
> > +                               clk_base + div_data->reg,
> > +                               div_data->shift, div_data->width,
> > +                               div_data->clk_divider_flags, &lock);
> > +               if (IS_ERR(hw)) {
> > +                       pr_err("npcm7xx_clk: Can't register div
> table\n");
> > +                       goto npcm7xx_init_fail;
> > +               }
> > +
> > +               if (div_data->onecell_idx >= 0)
> > +                       npcm7xx_clk_data->hws[div_data->onecell_idx] =
> hw;
> > +       }
> > +
> > +       ret = of_clk_add_hw_provider(clk_np, of_clk_hw_onecell_get,
> > +                                       npcm7xx_clk_data);
> > +       if (ret)
> > +               pr_err("failed to add DT provider: %d\n", ret);
> > +
> > +       pr_info("npcm7xx clk: %d dividers, %d muxes and %d plls
> registered.\n",
> > +               ARRAY_SIZE(npcm7xx_divs), ARRAY_SIZE(npcm7xx_muxes),
> > +               ARRAY_SIZE(npcm7xx_plls));
> > +
> > +       of_node_put(clk_np);
> > +
> > +       return;
> > +
> > +npcm7xx_init_fail:
> > +       pr_debug("\tclk setup fail\n");
> > +       if (npcm7xx_clk_data->num)
> > +               kfree(npcm7xx_clk_data->hws);
> > +npcm7xx_init_np_err:
> > +       if (clk_base != NULL)
> > +               iounmap(clk_base);
> > +npcm7xx_init_error:
> > +       of_node_put(clk_np);
> > +}
> > +
> > +CLK_OF_DECLARE(npcm750clk_init, "nuvoton,npcm750-clk",
> npcm750clk_init);
> > +
> > +
> > --
> > 2.14.1
> >
>
> One minor issue, other than that, it looks pretty good.
>

--94eb2c1cdf4aaa81c2056486b6db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">On Mon, Feb 5, 2018 at 12:22 AM, Tomer Maimon &l=
t;</span><a href=3D"mailto:tmaimon77@gmail.com" style=3D"color:rgb(17,85,20=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255)">tmaimon77@gmail.=
com</a><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; wrote:</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; Add Nuvoton BMC NPCM7xx clock driver.</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; Nuvoton BMC NPCM7xx contain in=
tegrated clock controller which</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; genera=
tes and supplies clock to all modules within the NPCM7xx BMC.</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt;</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; Signed-off-by:=
 Tomer Maimon &lt;</span><a href=3D"mailto:tmaimon77@gmail.com" style=3D"co=
lor:rgb(17,85,204);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)">=
tmaimon77@gmail.com</a><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt;</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; ---</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt;=C2=A0 drivers/clk=
/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt;=C2=A0 drivers/clk/clk-npcm7xx.c | 751 +++++++++++++++++++++++++++=
+++</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">++++++++++++++++</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt;=C2=A0 2 files changed, 752 insertions(+)</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt;=C2=A0 create mode 100644 drivers/clk/clk-npcm7xx.c</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt;</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; diff=
 --git a/drivers/clk/Makefile b/drivers/clk/Makefile</span><br style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">&gt; index f7f761b02bed..89289abe0cc1 100644</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; --- a/drivers/clk/Makefile</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +++ b/drivers/clk/Makefile</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; @@ -2=
1,6 +21,7 @@ endif</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt;=C2=A0 obj-$(CONFIG_=
MACH_ASM9260)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clk-asm92=
60.o</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt;=C2=A0 obj-$(CONFIG_COMMON_CLK_AXI=
_</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">CLKGEN)=C2=A0 =C2=A0 +=3D clk-axi-clkgen=
.o</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt;=C2=A0 obj-$(CONFIG_ARCH_AXXIA)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clk-axm5516.o</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +obj-$(CONFIG_ARCH_NPCM7XX)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clk-npcm7xx.o</span><br style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">&gt;=C2=A0 obj-$(CONFIG_COMMON_CLK_</span><wbr style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">CDCE706)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clk-cdce706.o</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt;=C2=A0 obj-$(CONFIG_COMMON_CLK_</span><wbr style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">CDCE925)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clk-cdce925.o</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt;=C2=A0 obj-$(CONFIG_ARCH_CLPS711X)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D clk-clps711x.o</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.=
c</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; new file mode 100644</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; index 000000000000..21aeca4b0cc3</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; --- /dev/null</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +++ b/d=
rivers/clk/clk-npcm7xx.c</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; @@ -0,0 +1,75=
1 @@</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +/*</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; + * Nuvoton NPCM7xx Clock Generator</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; + * All the clocks are initialized by the bootloader, so this driver =
allow only</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; + * reading of current sett=
ings directly from the hardware.</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; + *</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; + * Copyright (C) 2018 Nuvoton Technolo=
gies<span>=C2=A0</span></span><a href=3D"mailto:tali.perry@nuvoton.com" sty=
le=3D"color:rgb(17,85,204);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255)">tali.perry@nuvoton.com</a><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; + *</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; + * SPDX-License-Identifier: GPL-2.0</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; + * Released under the GPLv2 only.</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; + */</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +#include &lt;linux/module.h&gt;</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +#include &lt;linux/clk.h&gt;</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +#include &lt;linux/clk-provider.h&gt;</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +#include &lt;linux/device.h&gt;</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +#include &lt;linux/io.h&gt;</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +#include &lt;linux/kernel.h&gt;</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +#include &lt;linux/of.h&gt;</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +#inc=
lude &lt;linux/of_device.h&gt;</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +#inclu=
de &lt;linux/of_platform.h&gt;</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +#inclu=
de &lt;linux/of_address.h&gt;</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +#includ=
e &lt;linux/platform_device.h&gt;</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +#in=
clude &lt;linux/slab.h&gt;</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +#include &=
lt;linux/err.h&gt;</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; +#include &lt;linux=
/rational.h&gt;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +#include &lt;linux/bi=
tfield.h&gt;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +#include &lt;dt-bindings=
/clock/nuvoton,</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">npcm7xx-clock.h&gt;</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +#inc=
lude &lt;asm/cp15.h&gt;</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +struct npc=
m7xx_clk_pll {</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct clk_hw=C2=A0 =C2=A0hw;</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 *pllcon;</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags;</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +};=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +#define to_npcm7xx_clk_pll(_hw) container_of(_hw, struct npcm7xx_clk_pll=
, hw)</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const=
 char *name,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0const char *parent_name, unsigned long flags);</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +#define PLLCON_LOKI=C2=
=A0 =C2=A0 BIT(31)</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; +#define PLLCON_LOK=
S=C2=A0 =C2=A0 BIT(30)</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +#define PLLCON=
_FBDV=C2=A0 =C2=A0 GENMASK(27, 16)</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +#d=
efine PLLCON_OTDV2=C2=A0 =C2=A0GENMASK(15, 13)</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +#define PLLCON_PWDEN=C2=A0 =C2=A0BIT(12)</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +#define PLLCON_OTDV1=C2=A0 =C2=A0GENMASK(10, 8)</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +#define PLLCON_INDV=C2=A0 =C2=A0 GENMASK(5, 0)</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +s=
tatic unsigned long npcm7xx_clk_pll_recalc_rate(</span><wbr style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">struct clk_hw *hw,</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned long parent_rate)</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+{</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct =
npcm7xx_clk_pll *pll =3D to_npcm7xx_clk_pll(hw);</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long fbdv, indv, otdv1, otd=
v2;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsign=
ed int val;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0u64 ret;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent_rate =3D=3D 0) {</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pr_err(&quot;%s: parent rate is zero. reg=3D%x\n&quot;, __func=
__,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u32)(pll-&gt;pllcon));=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return 0;</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0}</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pl=
l-&gt;pllcon);</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0indv =3D FIELD_GET(PLLCON_INDV,=
 val);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fbd=
v =3D FIELD_GET(PLLCON_FBDV, val);</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0otdv1 =3D FIELD_GET(PLLCON_OTDV1, val);</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0otdv2 =3D FIELD_GE=
T(PLLCON_OTDV2, val);</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D (u64)parent_rate=
 * fbdv;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d=
o_div(ret, indv * otdv1 * otdv2);</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +}</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +const struct clk_ops npcm7xx_clk_=
pll_ops =3D {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0.recalc_rate =3D npcm7xx_clk_pll_recalc_rate,</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +struct clk_hw =
*npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_=
name, unsigned long flags)</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +{</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_clk=
_pll *pll;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct clk_init_data init;</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll =3D =
kzalloc(sizeof(*pll), GFP_KERNEL);</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pll)</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOM=
EM);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tnpcm7xx_clk_</span><wbr =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">register_pll reg, reg=3D0x%x, name=3D%s, p=3D%s\n&quo=
t;,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(unsigned int)pllcon, name, parent_name);</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0</span><a href=3D"http://init.name/" rel=3D"noreferrer"=
 target=3D"_blank" style=3D"color:rgb(17,85,204);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255)">init.name</a><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline"><span=
>=C2=A0</span>=3D name;</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0init.ops =3D &amp;npcm7xx_clk_pll_ops;</span><br style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init.parent_names =3D &amp;paren=
t_name;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0in=
it.num_parents =3D 1;</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0init.flags =3D flags;</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;pll=
con =3D pllcon;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0pll-&gt;hw.init =3D &amp;init;</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D &a=
mp;pll-&gt;hw;</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_hw_register(NULL, h=
w);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (re=
t) {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kfree(pll);</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D ERR_PTR(ret);=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0return hw;</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +}<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +#define NPCM7XX_CLKEN1=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (0x00)</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +#defi=
ne NPCM7XX_CLKEN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x28)</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +#define NPCM7XX_CLKEN3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (0x30)</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLKSEL=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x04)</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +#define NPCM7XX_CLKDIV1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x08)</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +#define NPCM7XX_CLKDIV2=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x2C)</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_=
CLKDIV3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x58)</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +#define NPCM7XX_PLLCON0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x0C)<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +#define NPCM7XX_PLLCON1=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x10)</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +#define NP=
CM7XX_PLLCON2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x54)</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +#define NPCM7XX_SWRSTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
0x14)</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +#define NPCM7XX_IRQWAKECON=C2=
=A0 =C2=A0 =C2=A0 (0x18)</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM=
7XX_IRQWAKEFLAG=C2=A0 =C2=A0 =C2=A0(0x1C)</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +#define NPCM7XX_IPSRST1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x20)</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +#define NPCM7XX_IPSRST2=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x24)</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_=
IPSRST3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x34)</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +#define NPCM7XX_WD0RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x38)<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +#define NPCM7XX_WD1RCR=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x3C)</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +#define N=
PCM7XX_WD2RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x40)</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +#define NPCM7XX_SWRSTC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(0x44)</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +#define NPCM7XX_SWRSTC2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x48)</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +#de=
fine NPCM7XX_SWRSTC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x4C)</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +#define NPCM7XX_SWRSTC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(0x50)</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CORSTC=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x5C)</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +#define NPCM7XX_PLLCONG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x60)</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +#define NPCM7XX_AHBCKFI=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x64)</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_=
SECCNT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x68)</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +#define NPCM7XX_CNTR25M=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x6C)<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +struct npcm7xx_clk_gate_data {</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bit_idx;</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *=
name;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t char *parent_name;</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0unsigned long flags;</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0/*</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell_idx to co=
nstant</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * =
defined in include/dt-bindings/clock/</span><wbr style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">nuvo=
ton, NPCM7XX-clock.h for</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to -1.</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +struct npcm7xx_clk_mux_data {</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 shift;</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mask;</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *table;</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const ch=
ar * const *parent_names;</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0u8 num_parents;</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecel=
l_idx to constant</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * defined in include/dt-bindings/clock/</span><wbr style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">nuvoton, NPCM7XX-clock.h for</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to=
 -1.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell=
_idx;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +struct npcm7xx_clk_div_fixed_data {</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mult;</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 div;</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name;</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 clk_divider_f=
lags;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this =
clock is exported via DT, set onecell_idx to constant</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindin=
gs/clock/</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">nuvoton, NPCM7XX-clock.h for</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this speci=
fic clock.=C2=A0 Otherwise, set to -1.</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +struct npcm7xx_clk_div_data=
 {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 shift=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 width=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const ch=
ar *name;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
const char *parent_name;</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0u8 clk_divider_flags;</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set o=
necell_idx to constant</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 * defined in include/dt-bindings/clock/</span><wbr style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">nuvoton, NPCM7XX-clock.h for</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set=
 to -1.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=
/</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onec=
ell_idx;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">&gt; +};</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +struct npcm7xx_clk_pll_=
data {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=
 reg;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t char *name;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0const char *parent_name;</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0unsigned long flags;</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell=
_idx to constant</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * defined in include/dt-bindings/clock/</span><wbr style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">nuvoton, NPCM7XX-clock.h for</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to =
-1.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_=
idx;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +};</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +/*</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; + * Single copy of stri=
ngs used to refer to clocks within this driver indexed by</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; + * above enum.</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+ */</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_REFCLK=C2=
=A0 =C2=A0 =C2=A0 &quot;refclk&quot;</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
#define NPCM7XX_CLK_S_SYSBYPCK=C2=A0 =C2=A0 &quot;sysbypck&quot;</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +#define NPCM7XX_CLK_S_MCBYPCK=C2=A0 =C2=A0 =C2=
=A0&quot;mcbypck&quot;</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7X=
X_CLK_S_GFXBYPCK=C2=A0 =C2=A0 &quot;gfxbypck&quot;</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +#define NPCM7XX_CLK_S_PLL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;p=
ll0&quot;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_PLL1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll1&quot;</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +#define NPCM7XX_CLK_S_PLL1_DIV2=C2=A0 =C2=A0&quot;pll1_div2&quot;</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_PLL2=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;pll2&quot;</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +#d=
efine NPCM7XX_CLK_S_PLL_GFX=C2=A0 =C2=A0 =C2=A0&quot;pll_gfx&quot;</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +#define NPCM7XX_CLK_S_PLL2_DIV2=C2=A0 =C2=A0&=
quot;pll2_div2&quot;</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_=
CLK_S_PIX_MUX=C2=A0 =C2=A0 =C2=A0&quot;gfx_pixel&quot;</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +#define NPCM7XX_CLK_S_GPRFSEL_MUX &quot;gprfsel_mux&quot;=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_MC_MUX=C2=A0 =
=C2=A0 =C2=A0 &quot;mc_phy&quot;</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +#def=
ine NPCM7XX_CLK_S_CPU_MUX=C2=A0 =C2=A0 =C2=A0&quot;cpu&quot;=C2=A0 /*AKA sy=
stem clock.*/</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_M=
C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mc&quot;</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +#define NPCM7XX_CLK_S_AXI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;axi&quot;=C2=A0 /*AKA CLK2*/</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +#def=
ine NPCM7XX_CLK_S_AHB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ahb&quot;=C2=
=A0 /*AKA CLK4*/</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_=
S_CLKOUT_MUX=C2=A0 &quot;clkout_mux&quot;</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +#define NPCM7XX_CLK_S_UART_MUX=C2=A0 =C2=A0 &quot;uart_mux&quot;</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_TIM_MUX=C2=A0 =C2=A0=
 =C2=A0&quot;timer_mux&quot;</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +#define =
NPCM7XX_CLK_S_SD_MUX=C2=A0 =C2=A0 =C2=A0 &quot;sd_mux&quot;</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +#define NPCM7XX_CLK_S_GFXM_MUX=C2=A0 =C2=A0 &quot;gf=
xm_mux&quot;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_SU=
_MUX=C2=A0 =C2=A0 =C2=A0 &quot;serial_usb_mux&quot;</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +#define NPCM7XX_CLK_S_DVC_MUX=C2=A0 =C2=A0 =C2=A0&quot;dvc_m=
ux&quot;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_GFX_MU=
X=C2=A0 =C2=A0 =C2=A0&quot;gfx_mux&quot;</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +#define NPCM7XX_CLK_S_GFX_PIXEL=C2=A0 =C2=A0&quot;gfx_pixel&quot;</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_SPI0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;spi0&quot;</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +#defin=
e NPCM7XX_CLK_S_SPI3=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;spi3&quot;</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +#define NPCM7XX_CLK_S_SPIX=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;spix&quot;</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7=
XX_CLK_S_APB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb1&quot;</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +#define NPCM7XX_CLK_S_APB2=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;apb2&quot;</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_=
CLK_S_APB3=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb3&quot;</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +#define NPCM7XX_CLK_S_APB4=C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;apb4&quot;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_A=
PB5=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb5&quot;</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +#define NPCM7XX_CLK_S_TOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tock=
&quot;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_CLKOUT=
=C2=A0 =C2=A0 =C2=A0 &quot;clkout&quot;</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +#define NPCM7XX_CLK_S_UART=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uart&quot;</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_TIMER=C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;timer&quot;</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +#d=
efine NPCM7XX_CLK_S_MMC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mmc&quot;</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_SDHC=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;sdhc&quot;</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +#defi=
ne NPCM7XX_CLK_S_ADC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;adc&quot;</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_GFX=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;gfx0_gfx1_mem&quot;</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +#define NPCM7XX_CLK_S_USBIF=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;serial_us=
bif&quot;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +#define NPCM7XX_CLK_S_USB_H=
OST=C2=A0 =C2=A0 &quot;usb_host&quot;</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+#define NPCM7XX_CLK_S_USB_BRIDGE=C2=A0 &quot;usb_bridge&quot;</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +#define NPCM7XX_CLK_S_PCI=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;pci&quot;</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +static u=
32 pll_mux_table[] =3D {0, 1, 2, 3};</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
static const char * const pll_mux_parents[] __initconst =3D {</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL0,</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S=
_PLL1_DIV2,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +static u32 cpuck_mux_table[] =3D {0, 1, 2, 3};</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +static const char * const cpuck_mux_parents[] __initc=
onst =3D {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0NPCM7XX_CLK_S_PLL0,</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SYSBYPCK,</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +static u32 pixcksel_mux_table[] =3D {0, 2};=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +static const char * const pixcksel_m=
ux_parents[] __initconst =3D {</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL_GFX,</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +static u32 sucksel_mux_table[] =3D {2, 3};</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +static const char * const sucksel_mux_parents=
[] __initconst =3D {</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +static u32 mccksel_mux_table[] =3D {0, 2, 3};</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +static const char * const mccksel_mux_parent=
s[] __initconst =3D {</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_MCBYPCK,</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +static u32 clkoutsel_mux_table[] =3D {0, 1, =
2, 3, 4};</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +static const char * const c=
lkoutsel_mux_parents[] __initconst =3D {</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL0,</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCL=
K,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX=
_CLK_S_PLL_GFX, // divided by 2</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +static u32 gfxmsel_mux_table[] =3D {2, 3};</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +static const char * const gfxmsel_mux_parents[] __in=
itconst =3D {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +};</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +static u32 dvcssel_mux_table[] =3D {2, 3};</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +static const char * const dvcssel_mux_parents[] __initco=
nst =3D {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2,</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +};</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +static const struct npcm7xx_clk_pll=
_data npcm7xx_plls[] __initconst =3D {</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_PLLCON0, NPCM7XX_CLK_S_PLL0, NPCM7XX_=
CLK_S_REFCLK, 0, -1},</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_PLLCON1, NPCM7X=
X_CLK_S_PLL1,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0NPCM7XX_CLK_S_REFCLK, 0, -1},</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_P=
LLCON2, NPCM7XX_CLK_S_PLL2,</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK, 0, -1},</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_PLLCONG, NPCM7XX_CLK_S_PLL_GFX,</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK, 0, -1},</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +s=
tatic const struct npcm7xx_clk_mux_data npcm7xx_muxes[] __initconst =3D {</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, GENMASK=
(1, 0), cpuck_mux_table, NPCM7XX_CLK_S_CPU_MUX,</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cpuck_mux_parents, ARRAY_SIZE(cpuck_m=
ux_parents), CLK_IS_CRITICAL,</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_CPU},</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{4, GENM=
ASK(1, 0), pixcksel_mux_table, NPCM7XX_CLK_S_PIX_MUX,</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pixcksel_mux_parents, ARRAY_SIZ=
E(pixcksel_mux_</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">parents), 0,</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_GFX_PIXEL},=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{6, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK=
_S_SD_MUX,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0{8, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_S_UART_MUX,</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll_mux_parent=
s, ARRAY_SIZE(pll_mux_parents), 0, -1},</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{10, G=
ENMASK(1, 0), sucksel_mux_table, NPCM7XX_CLK_S_SU_MUX,</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sucksel_mux_parents, ARRAY_SIZ=
E(sucksel_mux_</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">parents), 0, -1},</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0{12, GENMASK(1, 0), mccksel_mux_table, NPCM7XX_CLK_S_MC=
_MUX,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mcck=
sel_mux_parents, ARRAY_SIZE(mccksel_mux_</span><wbr style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">p=
arents), 0, -1},</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{14, GENMASK(1, 0), pll_mux_t=
able, NPCM7XX_CLK_S_TIM_MUX,</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{16, GENMASK(1, 0), pll_mux_table, NPCM7XX_CLK_=
S_GFX_MUX,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1},</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0{18, GENMASK(2, 0), clkoutsel_mux_table, NPCM7XX_CLK_S_CLKOUT_=
MUX,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clkou=
tsel_mux_parents, ARRAY_SIZE(clkoutsel_mux_</span><wbr style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">parents), 0, -1},</span><br style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">&gt; +</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{21, GENMASK(1, 0), gfxms=
el_mux_table, NPCM7XX_CLK_S_GFXM_MUX,</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gfxmsel_mux_parents, ARRAY_SIZE(gfxmsel_mux_</s=
pan><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">parents), 0, -1},</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0{23, GENMASK(1, 0), dvcssel_mux_table, NPCM7XX_CLK_S_DVC_MUX,</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dvcssel_mux_parents,=
 ARRAY_SIZE(dvcssel_mux_</span><wbr style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">parents), 0, -1},=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +};</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +/* fixed ratio dividers (no reg=
ister): */</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +static const struct npcm7x=
x_clk_div_fixed_data npcm7xx_divs_fx[] __initconst =3D {</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_MC, =
NPCM7XX_CLK_S_MC_MUX, 0, NPCM7XX_CLK_MC},</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_PLL1_DIV2, NPCM7XX_CL=
K_S_PLL1, 0, -1},</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_PLL2_DIV2, NPCM7XX_CLK_S_PLL2, 0, -1},</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +};</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +/* configurable dividers: */</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +stati=
c const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst =3D {</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1=
, 28, 3, NPCM7XX_CLK_S_ADC,</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_TIMER, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7=
XX_CLK_ADC},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0/*30-28 ADCCKDIV*/</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 26, 2, NPCM7XX_CLK_S_AHB,</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AXI, 0, CLK_=
IS_CRITICAL, NPCM7XX_CLK_AHB},</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0/*27-26 CLK4DIV*/</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 21, 5, NPCM7XX_CLK_S_TIMER,<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CL=
K_S_TIM_MUX, 0, 0, NPCM7XX_CLK_TIMER},</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*25-21 TIMCKDIV*/</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 16, 5, NPCM7XX_CLK_=
S_UART,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NP=
CM7XX_CLK_S_UART_MUX, 0, 0, NPCM7XX_CLK_UART},</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*20-16 UARTDIV*/</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 11, 5, NPCM7=
XX_CLK_S_MMC,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_MMC},</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*15-11 MMCCKDIV*/</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 6, 5, =
NPCM7XX_CLK_S_SPI3,</span><br style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI3},</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*10-6 AHB3CKDIV*/</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 2, 4=
, NPCM7XX_CLK_S_PCI,</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_PCI},</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*5-2 PCICKDIV*/</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, =
0, 1, NPCM7XX_CLK_S_AXI,</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_CPU_MUX, CLK_DIVIDER_POWER_OF_TWO, CLK_IS_CR=
ITICAL,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NP=
CM7XX_CLK_AXI},/*0 CLK2DIV*/</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2,=
 30, 2, NPCM7XX_CLK_S_APB4,</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX=
_CLK_APB4},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0/*31-30 APB4CKDIV*/</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 28, 2, NPCM7XX_CLK_S_APB3,</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DI=
VIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB3},</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*29-28 APB3CKDIV*/</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 26, 2, NPCM7XX_=
CLK_S_APB2,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB2},</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*27-26 APB2CKD=
IV*/</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM=
7XX_CLKDIV2, 24, 2, NPCM7XX_CLK_S_APB1,</span><br style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline">&gt=
; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, =
0, NPCM7XX_CLK_APB1},</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0/*25-24 APB1CKDIV*/</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 22, 2, NPCM7XX_CLK_S_APB5,</span>=
<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AH=
B, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB5},</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*23-22 APB5CKDIV*/</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 16, 5,=
 NPCM7XX_CLK_S_CLKOUT,</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_CLKOUT_MUX, 0, 0, NPCM7XX_CLK_CLKOUT},</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*20-16 CLKOUTDIV*/=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_=
CLKDIV2, 13, 3, NPCM7XX_CLK_S_GFX,</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_GFX},</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*15-13 GFX=
CKDIV*/</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{N=
PCM7XX_CLKDIV2, 8, 5, NPCM7XX_CLK_S_USB_BRIDGE,</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_C=
LK_SU},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
12-8 SUCKDIV*/</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKDIV2, 4, 4, NPCM7XX_CLK_S_USB_HOST,</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SU_MUX, 0, 0, NPC=
M7XX_CLK_SU48},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0/*7-4 SU48CKDIV*/</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 0, 4, NPCM7XX_CLK_S_SDHC,</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SD_MUX, 0, =
0, NPCM7XX_CLK_SDHC}</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0,/*3-0 SD1CKDIV*/</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV=
3, 6, 5, NPCM7XX_CLK_S_SPI0,</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI0},</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*10-6 SPI0CKDV*/</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKD=
IV3, 1, 5, NPCM7XX_CLK_S_SPIX,</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPIX},</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*5-1 SPIXCKDV*/</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +}=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +static const struct npcm7xx_clk_=
gate_data npcm7xx_gates[] __initconst =3D {</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 31, &quot;smb1-gate&quot=
;, NPCM7XX_CLK_S_APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 30, &quot;smb0-gate&quot;, NPCM7XX_CLK_S_=
APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
{NPCM7XX_CLKEN1, 29, &quot;smb7-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, =
28, &quot;smb6-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 27, &quot;adc-gat=
e&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 26, &quot;wdt-gate&quot;, NPCM7XX_=
CLK_S_TIMER, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0{NPCM7XX_CLKEN1, 25, &quot;usbdev3-gate&quot;, NPCM7XX_CLK_S_AHB, 0}=
,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX=
_CLKEN1, 24, &quot;usbdev6-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 23, &q=
uot;usbdev5-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 22, &quot;usbdev4-gat=
e&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 21, &quot;emc2-gate&quot;, NPCM7XX=
_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN1, 20, &quot;timer5_9-gate&quot;, NPCM7XX_CLK_S_APB1, 0=
},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7X=
X_CLKEN1, 19, &quot;timer0_4-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 18,=
 &quot;pwmm0-gate&quot;, NPCM7XX_CLK_S_APB3, 0},</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 17, &quot;huart-gat=
e&quot;, NPCM7XX_CLK_S_UART, 0},</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 16, &quot;smb5-gate&quot;, NPCM7XX=
_CLK_S_APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0{NPCM7XX_CLKEN1, 15, &quot;smb4-gate&quot;, NPCM7XX_CLK_S_APB2, 0},<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_C=
LKEN1, 14, &quot;smb3-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 13, &quo=
t;smb2-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 12, &quot;mc-gate&quot;, =
NPCM7XX_CLK_S_MC, 0},</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0{NPCM7XX_CLKEN1, 11, &quot;uart01-gate&quot;, NPCM7XX_CLK_S_AP=
B1, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{N=
PCM7XX_CLKEN1, 10, &quot;aes-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 9, &=
quot;peci-gate&quot;, NPCM7XX_CLK_S_APB3, 0},</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 8, &quot;usbdev2-gate&=
quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 7, &quot;uart23-gate&quot;, NPCM7XX_CL=
K_S_APB1, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN1, 6, &quot;emc1-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKE=
N1, 5, &quot;usbdev1-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 4, &quot;shm=
-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 3 is reserved */</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 2, &quot;kcs-gate=
&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 1, &quot;spi3-gate&quot;, NPCM7XX_=
CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN1, 0, &quot;spi0-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 31, &quot;cp-gate&quot;, NPCM7X=
X_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0{NPCM7XX_CLKEN2, 30, &quot;tock-gate&quot;, NPCM7XX_CLK_S_TOCK, 0},<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 29 =
is reserved */</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN2, 28, &quot;gmac1-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CL=
KEN2, 27, &quot;usbif-gate&quot;, NPCM7XX_CLK_S_USBIF, 0},</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 26, &quo=
t;usbhost-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 25, &quot;gmac2-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* bit 24 is reserved */</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 23, &quot;pspi2-gate&qu=
ot;, NPCM7XX_CLK_S_APB5, 0},</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 22, &quot;pspi1-gate&quot;, NPCM7XX_CL=
K_S_APB5, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN2, 21, &quot;3des-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 20 is=
 reserved */</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0{NPCM7XX_CLKEN2, 19, &quot;siox2-gate&quot;, NPCM7XX_CLK_S_APB3, 0},</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKE=
N2, 18, &quot;siox1-gate&quot;, NPCM7XX_CLK_S_APB3, 0},</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 17 is reserved */</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN=
2, 16, &quot;fuse-gate&quot;, NPCM7XX_CLK_S_APB4, 0},</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 bit 15 is reserved */<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_C=
LKEN2, 14, &quot;vcd-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 13, &quot;ec=
e-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 12, &quot;vdma-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0{NPCM7XX_CLKEN2, 11, &quot;ahbpcibrg-gate&quot;, NPCM7XX_CLK_S_AH=
B, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NP=
CM7XX_CLKEN2, 10, &quot;gfxsys-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 9=
, &quot;sdhc-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 8, &quot;mmc-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 7, &quot;mft7-gate&quot;, NPCM7XX_CLK_=
S_APB4, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0{NPCM7XX_CLKEN2, 6, &quot;mft6-gate&quot;, NPCM7XX_CLK_S_APB4, 0},</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2=
, 5, &quot;mft5-gate&quot;, NPCM7XX_CLK_S_APB4, 0},</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 4, &quot;mft4-ga=
te&quot;, NPCM7XX_CLK_S_APB4, 0},</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 3, &quot;mft3-gate&quot;, NPCM7XX_=
CLK_S_APB4, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN2, 2, &quot;mft2-gate&quot;, NPCM7XX_CLK_S_APB4, 0},</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLK=
EN2, 1, &quot;mft1-gate&quot;, NPCM7XX_CLK_S_APB4, 0},</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 0, &quot;mft0=
-gate&quot;, NPCM7XX_CLK_S_APB4, 0},</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_=
CLKEN3, 31, &quot;gpiom7-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 30, &qu=
ot;gpiom6-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 29, &quot;gpiom5-gate&=
quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 28, &quot;gpiom4-gate&quot;, NPCM7XX_=
CLK_S_APB1, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN3, 27, &quot;gpiom3-gate&quot;, NPCM7XX_CLK_S_APB1, 0},=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_=
CLKEN3, 26, &quot;gpiom2-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 25, &qu=
ot;gpiom1-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 24, &quot;gpiom0-gate&=
quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 23, &quot;espi-gate&quot;, NPCM7XX_CL=
K_S_APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN3, 22, &quot;smb11-gate&quot;, NPCM7XX_CLK_S_APB2, 0},<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_C=
LKEN3, 21, &quot;smb10-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 20, &quo=
t;smb9-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 19, &quot;smb8-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 18, &quot;smb15-gate&quot;, NPCM7XX_CLK_S=
_APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0{NPCM7XX_CLKEN3, 17, &quot;rng-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3=
, 16, &quot;timer10_14-gate&quot;, NPCM7XX_CLK_S_APB1, 0},</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 15, &quo=
t;pcirc-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 14, &quot;sececc-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 13, &quot;sha-gate&quot;, NPCM7XX_CLK_S_A=
HB, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{N=
PCM7XX_CLKEN3, 12, &quot;smb14-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 11 is reser=
ved */</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
bit 10 is reserved */</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0{NPCM7XX_CLKEN3, 9, &quot;pcimbx-gate&quot;, NPCM7XX_CLK_S_AHB=
, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* b=
it 8 is reserved */</span><br style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0{NPCM7XX_CLKEN3, 7, &quot;usbdev9-gate&quot;, NPCM7XX_CLK_S_AHB, =
0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7=
XX_CLKEN3, 6, &quot;usbdev8-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 5, &q=
uot;usbdev7-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 4, &quot;usbdev0-gate=
&quot;, NPCM7XX_CLK_S_AHB, 0},</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 3, &quot;smb13-gate&quot;, NPCM7XX_CL=
K_S_APB2, 0},</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0{NPCM7XX_CLKEN3, 2, &quot;spix-gate&quot;, NPCM7XX_CLK_S_AHB, 0},</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKE=
N3, 1, &quot;smb12-gate&quot;, NPCM7XX_CLK_S_APB2, 0},</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 0, &quot;pwmm=
1-gate&quot;, NPCM7XX_CLK_S_APB3, 0},</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+};</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +static struct clk_hw_onecell_d=
ata *npcm7xx_clk_data;</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +static void __=
iomem *clk_base;</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +static DEFINE_SPINLO=
CK(lock);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +static const struct of_d=
evice_id npcm7xx_clk_match_table[] =3D {</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,np=
cm750-clk&quot;},</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{},</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +};</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +MODULE_D=
EVICE_TABLE(of, npcm7xx_clk_match_table);</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +static void __init npcm750clk_init(struct device_node *clk_np)</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +{</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct res=
ource res;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct clk_hw *hw;</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct clk *clk;</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0int ret;</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0int i;</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;NPCM=
750: clock init: &quot;);</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_base =3D NULL;</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_address_to_resource(clk_np, 0, &amp;=
res);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
ret) {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;\t%s: failed to get resource, ret %=
d\n&quot;, clk_np-&gt;name,</span><br style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return;</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +</span><=
br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0clk_base =3D ioremap(res.start, resource_size(&amp;=
res));</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(IS_ERR(clk_base)) {</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;\tnpcm750clk_init: re=
source error\n&quot;);</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_init_error;</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data =3D k=
zalloc(sizeof(*npcm7xx_clk_</span><wbr style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">data-&gt;hws) =
*</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0NPCM7XX_NUM_CLOCKS + sizeof(npcm7xx_clk_data), GFP_KERN=
EL);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;num =3D 0;</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (!npcm7xx_clk_data-&gt;hws) {</span><br style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_e=
rr(&quot;Can&#39;t alloc npcm7xx_clk_data\n&quot;);</span><br style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial"><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto =
npcm7xx_init_np_err;</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0}</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt; +</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;num =3D NP=
CM7XX_NUM_CLOCKS;</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0/*</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * This way all clock fetched before the platform device probes,</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * except thos=
e we assign here for early use, will be deferred.</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk init hws\n&quot;);</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D =
0; i &lt; NPCM7XX_NUM_CLOCKS; i++)</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt=
;hws[i] =3D ERR_PTR(-EPROBE_DEFER);</span><br style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt; +<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Define =
fixed clocks.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 * Notice: the following clocks are fixed value on NPCM7XX and should=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be=
 changed.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * therefor they are not exposed to the dev tree .</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">I am not convinced. The top level .dtsi is usually SoC specific.</sp=
an></div><div class=3D"gmail_default"><br></div><div class=3D"gmail_default=
">- CLKREF should be fixed on 25MHz. I didn&#39;t want to put it in DT sinc=
e it might appear as something that is changeable.</div><div class=3D"gmail=
_default">=C2=A0on npcm750 all clocks are set in ROM +BB (several possible =
settings) , so this entire driver is only used for reading the current cloc=
k settings. All clocks are read only and derived from CLKREF. CLKREF is fix=
ed so no point in putting it in DT and exposing it outside of this driver.=
=C2=A0<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-st=
yle:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weig=
ht:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transfor=
m:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255=
);text-decoration-style:initial;text-decoration-color:initial"><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */</span><br style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk register fi=
xed clocks\n&quot;);</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0hw =3D clk_hw_register_fixed_rate(</span><wbr style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">NULL, NPCM7XX_CLK_S_REFCLK,</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, 25000000);</sp=
an><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw=
_register_fixed_rate(</span><wbr style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">NULL, NPCM7XX_CLK_S_=
SYSBYPCK,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, 800000000); // rarely used. mostly tes=
ting. TBD: remove</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0hw =3D clk_hw_register_fixed_rate(</span><wbr style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">NULL, NPCM7XX_CLK_S_MCBYPCK,</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, 800000000); //=
 rarely used.=C2=A0 mostly testing. TBD:remove</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register plls */</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk regi=
ster pll\n&quot;);</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7xx_plls); i++) {</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const struct npcm7xx_clk_pll_data *pll_data =3D &amp;npcm7xx_plls[i]=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\=
tclk reg pll%d, reg=3D0x%x, name=3D%s, p=3D%s\n&quot;, i,</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(unsigned int)pll_data-&gt;reg, pll_data-&gt;name,</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll=
_data-&gt;parent_name);</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0hw =3D npcm7xx_clk_register_pll(clk_</span><wbr style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>base + pll_data-&gt;reg,</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl=
l_data-&gt;name, pll_data-&gt;parent_name, pll_data-&gt;flags);</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (IS_ERR(hw)) {</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
_err(&quot;npcm7xx_clk: Can&#39;t register pll\n&quot;);</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_init_fail;</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
/span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">&gt;=
 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pll_data-&gt;o=
necell_idx &gt;=3D 0)</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7x=
x_clk_data-&gt;hws[pll_</span><wbr style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">data-&gt;onecell_i=
dx] =3D hw;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0}</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register fixed dividers */</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk =
register fixed divs\n&quot;);</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(</span><wbr style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">NULL, NPCM7XX_CLK_S_PLL1_DIV2,</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1, 0, 1, 2);</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=
r_err(&quot;npcm7xx_clk: Can&#39;t register fixed div\n&quot;);</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto npcm7xx_init_fail;</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0}</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">&gt; +</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(</span><wbr style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">NULL, NPCM7XX_CLK_S_PLL2_DIV2,</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2, 0, 1, 2);</span><br style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(IS_ERR(clk)) {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm7xx_clk: Can&#39;t regis=
ter div2\n&quot;);</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_init_fail;</span><br sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Register muxes */</span><br style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7xx_muxes); i++) {=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const struct npcm7xx_clk_mux_data *mux_data =3D &amp;np=
cm7xx_muxes[i];</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
_debug(&quot;\tadd mux%d reg=3D0x%x name=3D%s p=3D%s num_p=3D%d\n&quot;,</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, ((u32)clk_base + (u32)NPCM7XX_CLKSEL), mu=
x_data-&gt;name,</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mux_data-&gt=
;parent_names[0], mux_data-&gt;num_parents);</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_mux_table(</span><wbr sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial"><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">NULL,</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mu=
x_data-&gt;name,</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mux_data-&gt=
;parent_names, mux_data-&gt;num_parents,</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mux_data-&gt;flags, clk_base + NPCM7XX_CLKSEL,</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mux_data-&gt;shift, mux_data-&gt;mask, 0,</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mux_data-&gt;table, &amp;lock)=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) =
{</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm7xx_clk: C=
an&#39;t register mux\n&quot;);</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto npcm7xx_init_fail;</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mux_data-&gt;onecell_idx &gt;=3D 0)</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;hws[mux_<=
/span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">data-&gt;onecell_idx] =3D hw;</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Register clock dividers specified in npcm7xx_divs. */</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tc=
lk register divs\n&quot;);</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7xx_divs); i++) {</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0const struct npcm7xx_clk_div_data *div_data =3D &amp;npcm7xx_=
divs[i];</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">&gt; +</span><br style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(=
&quot;\tadd div%d reg=3D0x%x name=3D%s, parent=3D%s\n&quot;,</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, (unsigned =
int)div_data-&gt;reg,</span><br style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;name, div_data-&gt;parent_name);</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_=
divider(NULL, div_data-&gt;name,</span><br style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;parent_name,</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;fla=
gs,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0clk_base + div_data-&gt;reg,</span><br style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;shift, div_data-&gt;widt=
h,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0div_data-&gt;clk_divider_flags, &amp;lock);</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR=
(hw)) {</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm7xx=
_clk: Can&#39;t register div table\n&quot;);</span><br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto npcm7xx_init_fail;</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (div_data-&gt;onecell_idx &=
gt;=3D 0)</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&g=
t;hws[div_</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">data-&gt;onecell_idx] =3D hw;</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D of_clk_add_hw_provider(clk_np, of_clk_hw_onecel=
l_get,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data);</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pr_err(&quot;failed to add DT provider: %d\n&quot;, ret);</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0pr_info(&quot;npcm7xx clk: %d dividers, %d muxes and %d pl=
ls registered.\n&quot;,</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(npcm7xx_divs), ARRAY_S=
IZE(npcm7xx_muxes),</span><br style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(npcm7xx_plls));</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0of_node_put(clk_np);</span><br style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">&g=
t; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">&gt; +</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt; +npcm7xx_init_fail:</span><br style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_debug(&quot;\tclk setup fail\n&quot;);</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (npcm7xx_clk_data-&gt;num)=
</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0kfree(npcm7xx_clk_data-&gt;hws);</span><br style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">&gt; +npcm7xx_init_np_err:</span><br style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (clk_base !=3D NULL)</span><br style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial"><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounma=
p(clk_base);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt; +npcm7xx_init_error:</spa=
n><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial"=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(cl=
k_np);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline">&gt; +}</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-deco=
ration-style:initial;text-decoration-color:initial"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">&gt; +CLK_OF_DECLARE(npcm750clk_=
</span><wbr style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">init, &quot;nuvoton,npcm750-clk&quot;, np=
cm750clk_init);</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">&gt; +</span><br style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">&gt; +</span><br style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">&gt; --</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; 2.14.1</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">&gt;</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">One minor issue, other than that, it looks pretty goo=
d.</span><div class=3D"gmail-yj6qo" style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial"></div>- Thanks<br class=3D"gmail-Apple-inter=
change-newline">

<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Mon, Feb 5, 2018 at 9:37 PM, Brendan Higgins <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:brendanhiggins@google.com" target=3D"_blank">brendanhiggins@goo=
gle.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Feb=
 5, 2018 at 12:22 AM, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.co=
m">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; Add Nuvoton BMC NPCM7xx clock driver.<br>
&gt;<br>
&gt; Nuvoton BMC NPCM7xx contain integrated clock controller which<br>
&gt; generates and supplies clock to all modules within the NPCM7xx BMC.<br=
>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/clk/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/clk/clk-npcm7xx.c | 751 ++++++++++++++++++++++++++++++<w=
br>++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 752 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/clk/clk-npcm7xx.c<br>
&gt;<br>
&gt; diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile<br>
&gt; index f7f761b02bed..89289abe0cc1 100644<br>
&gt; --- a/drivers/clk/Makefile<br>
&gt; +++ b/drivers/clk/Makefile<br>
&gt; @@ -21,6 +21,7 @@ endif<br>
&gt;=C2=A0 obj-$(CONFIG_MACH_ASM9260)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+=3D clk-asm9260.o<br>
&gt;=C2=A0 obj-$(CONFIG_COMMON_CLK_AXI_<wbr>CLKGEN)=C2=A0 =C2=A0 +=3D clk-a=
xi-clkgen.o<br>
&gt;=C2=A0 obj-$(CONFIG_ARCH_AXXIA)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D clk-axm5516.o<br>
&gt; +obj-$(CONFIG_ARCH_NPCM7XX)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D clk-npcm7xx.o<br>
&gt;=C2=A0 obj-$(CONFIG_COMMON_CLK_<wbr>CDCE706)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
+=3D clk-cdce706.o<br>
&gt;=C2=A0 obj-$(CONFIG_COMMON_CLK_<wbr>CDCE925)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
+=3D clk-cdce925.o<br>
&gt;=C2=A0 obj-$(CONFIG_ARCH_CLPS711X)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 +=3D clk-clps711x.o<br>
&gt; diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..21aeca4b0cc3<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/clk/clk-npcm7xx.c<br>
&gt; @@ -0,0 +1,751 @@<br>
&gt; +/*<br>
&gt; + * Nuvoton NPCM7xx Clock Generator<br>
&gt; + * All the clocks are initialized by the bootloader, so this driver a=
llow only<br>
&gt; + * reading of current settings directly from the hardware.<br>
&gt; + *<br>
&gt; + * Copyright (C) 2018 Nuvoton Technologies <a href=3D"mailto:tali.per=
ry@nuvoton.com">tali.perry@nuvoton.com</a><br>
&gt; + *<br>
&gt; + * SPDX-License-Identifier: GPL-2.0<br>
&gt; + * Released under the GPLv2 only.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/clk-provider.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/rational.h&gt;<br>
&gt; +#include &lt;linux/bitfield.h&gt;<br>
&gt; +#include &lt;dt-bindings/clock/nuvoton,<wbr>npcm7xx-clock.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;asm/cp15.h&gt;<br>
&gt; +<br>
&gt; +<br>
&gt; +struct npcm7xx_clk_pll {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_hw=C2=A0 =C2=A0hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 *pllcon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 flags;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define to_npcm7xx_clk_pll(_hw) container_of(_hw, struct npcm7xx_clk_=
pll, hw)<br>
&gt; +<br>
&gt; +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const c=
har *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name, unsigned long fla=
gs);<br>
&gt; +<br>
&gt; +#define PLLCON_LOKI=C2=A0 =C2=A0 BIT(31)<br>
&gt; +#define PLLCON_LOKS=C2=A0 =C2=A0 BIT(30)<br>
&gt; +#define PLLCON_FBDV=C2=A0 =C2=A0 GENMASK(27, 16)<br>
&gt; +#define PLLCON_OTDV2=C2=A0 =C2=A0GENMASK(15, 13)<br>
&gt; +#define PLLCON_PWDEN=C2=A0 =C2=A0BIT(12)<br>
&gt; +#define PLLCON_OTDV1=C2=A0 =C2=A0GENMASK(10, 8)<br>
&gt; +#define PLLCON_INDV=C2=A0 =C2=A0 GENMASK(5, 0)<br>
&gt; +<br>
&gt; +static unsigned long npcm7xx_clk_pll_recalc_rate(<wbr>struct clk_hw *=
hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long parent_rate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_clk_pll *pll =3D to_npcm7xx=
_clk_pll(hw);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long fbdv, indv, otdv1, otdv2;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (parent_rate =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%=
s: parent rate is zero. reg=3D%x\n&quot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(u32)(pll-&gt;pllcon));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pll-&gt;pllcon);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0indv =3D FIELD_GET(PLLCON_INDV, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fbdv =3D FIELD_GET(PLLCON_FBDV, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0otdv1 =3D FIELD_GET(PLLCON_OTDV1, val);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0otdv2 =3D FIELD_GET(PLLCON_OTDV2, val);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D (u64)parent_rate * fbdv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do_div(ret, indv * otdv1 * otdv2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +const struct clk_ops npcm7xx_clk_pll_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.recalc_rate =3D npcm7xx_clk_pll_recalc_ra=
te,<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +struct clk_hw *npcm7xx_clk_register_pll(void __iomem *pllcon, const c=
har *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name, unsigned long fla=
gs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_clk_pll *pll;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_init_data init;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pll)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR=
(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tnpcm7xx_clk_<wbr>register=
_pll reg, reg=3D0x%x, name=3D%s, p=3D%s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned int)=
pllcon, name, parent_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://init.name" rel=3D"norefe=
rrer" target=3D"_blank">init.name</a> =3D name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init.ops =3D &amp;npcm7xx_clk_pll_ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init.parent_names =3D &amp;parent_name;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init.num_parents =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init.flags =3D flags;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;pllcon =3D pllcon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll-&gt;hw.init =3D &amp;init;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D &amp;pll-&gt;hw;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_hw_register(NULL, hw);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pll);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D ERR_PTR=
(ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return hw;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +#define NPCM7XX_CLKEN1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x00)<br>
&gt; +#define NPCM7XX_CLKEN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x28)<br>
&gt; +#define NPCM7XX_CLKEN3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x30)<br>
&gt; +#define NPCM7XX_CLKSEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x04)<br>
&gt; +#define NPCM7XX_CLKDIV1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x08)<br>
&gt; +#define NPCM7XX_CLKDIV2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x2C)<br>
&gt; +#define NPCM7XX_CLKDIV3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x58)<br>
&gt; +#define NPCM7XX_PLLCON0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x0C)<br>
&gt; +#define NPCM7XX_PLLCON1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x10)<br>
&gt; +#define NPCM7XX_PLLCON2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x54)<br>
&gt; +#define NPCM7XX_SWRSTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x14)<br>
&gt; +#define NPCM7XX_IRQWAKECON=C2=A0 =C2=A0 =C2=A0 (0x18)<br>
&gt; +#define NPCM7XX_IRQWAKEFLAG=C2=A0 =C2=A0 =C2=A0(0x1C)<br>
&gt; +#define NPCM7XX_IPSRST1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x20)<br>
&gt; +#define NPCM7XX_IPSRST2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x24)<br>
&gt; +#define NPCM7XX_IPSRST3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x34)<br>
&gt; +#define NPCM7XX_WD0RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x38)<br>
&gt; +#define NPCM7XX_WD1RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x3C)<br>
&gt; +#define NPCM7XX_WD2RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x40)<br>
&gt; +#define NPCM7XX_SWRSTC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x44)<br>
&gt; +#define NPCM7XX_SWRSTC2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x48)<br>
&gt; +#define NPCM7XX_SWRSTC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x4C)<br>
&gt; +#define NPCM7XX_SWRSTC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x50)<br>
&gt; +#define NPCM7XX_CORSTC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x5C)<br>
&gt; +#define NPCM7XX_PLLCONG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x60)<br>
&gt; +#define NPCM7XX_AHBCKFI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x64)<br>
&gt; +#define NPCM7XX_SECCNT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x68)<br>
&gt; +#define NPCM7XX_CNTR25M=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x6C)<br>
&gt; +<br>
&gt; +<br>
&gt; +struct npcm7xx_clk_gate_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bit_idx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set o=
necell_idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/<w=
br>nuvoton, NPCM7XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, s=
et to -1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm7xx_clk_mux_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *table;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char * const *parent_names;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 num_parents;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set o=
necell_idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/<w=
br>nuvoton, NPCM7XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, s=
et to -1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm7xx_clk_div_fixed_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mult;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 clk_divider_flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set o=
necell_idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/<w=
br>nuvoton, NPCM7XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, s=
et to -1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +struct npcm7xx_clk_div_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 clk_divider_flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set o=
necell_idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/<w=
br>nuvoton, NPCM7XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, s=
et to -1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm7xx_clk_pll_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set o=
necell_idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/<w=
br>nuvoton, NPCM7XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, s=
et to -1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Single copy of strings used to refer to clocks within this driver =
indexed by<br>
&gt; + * above enum.<br>
&gt; + */<br>
&gt; +#define NPCM7XX_CLK_S_REFCLK=C2=A0 =C2=A0 =C2=A0 &quot;refclk&quot;<b=
r>
&gt; +#define NPCM7XX_CLK_S_SYSBYPCK=C2=A0 =C2=A0 &quot;sysbypck&quot;<br>
&gt; +#define NPCM7XX_CLK_S_MCBYPCK=C2=A0 =C2=A0 =C2=A0&quot;mcbypck&quot;<=
br>
&gt; +#define NPCM7XX_CLK_S_GFXBYPCK=C2=A0 =C2=A0 &quot;gfxbypck&quot;<br>
&gt; +#define NPCM7XX_CLK_S_PLL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll0&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_PLL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll1&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_PLL1_DIV2=C2=A0 =C2=A0&quot;pll1_div2&quot;<br>
&gt; +#define NPCM7XX_CLK_S_PLL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll2&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_PLL_GFX=C2=A0 =C2=A0 =C2=A0&quot;pll_gfx&quot;<=
br>
&gt; +#define NPCM7XX_CLK_S_PLL2_DIV2=C2=A0 =C2=A0&quot;pll2_div2&quot;<br>
&gt; +#define NPCM7XX_CLK_S_PIX_MUX=C2=A0 =C2=A0 =C2=A0&quot;gfx_pixel&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_GPRFSEL_MUX &quot;gprfsel_mux&quot;<br>
&gt; +#define NPCM7XX_CLK_S_MC_MUX=C2=A0 =C2=A0 =C2=A0 &quot;mc_phy&quot;<b=
r>
&gt; +#define NPCM7XX_CLK_S_CPU_MUX=C2=A0 =C2=A0 =C2=A0&quot;cpu&quot;=C2=
=A0 /*AKA system clock.*/<br>
&gt; +#define NPCM7XX_CLK_S_MC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mc&q=
uot;<br>
&gt; +#define NPCM7XX_CLK_S_AXI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;axi&=
quot;=C2=A0 /*AKA CLK2*/<br>
&gt; +#define NPCM7XX_CLK_S_AHB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ahb&=
quot;=C2=A0 /*AKA CLK4*/<br>
&gt; +#define NPCM7XX_CLK_S_CLKOUT_MUX=C2=A0 &quot;clkout_mux&quot;<br>
&gt; +#define NPCM7XX_CLK_S_UART_MUX=C2=A0 =C2=A0 &quot;uart_mux&quot;<br>
&gt; +#define NPCM7XX_CLK_S_TIM_MUX=C2=A0 =C2=A0 =C2=A0&quot;timer_mux&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_SD_MUX=C2=A0 =C2=A0 =C2=A0 &quot;sd_mux&quot;<b=
r>
&gt; +#define NPCM7XX_CLK_S_GFXM_MUX=C2=A0 =C2=A0 &quot;gfxm_mux&quot;<br>
&gt; +#define NPCM7XX_CLK_S_SU_MUX=C2=A0 =C2=A0 =C2=A0 &quot;serial_usb_mux=
&quot;<br>
&gt; +#define NPCM7XX_CLK_S_DVC_MUX=C2=A0 =C2=A0 =C2=A0&quot;dvc_mux&quot;<=
br>
&gt; +#define NPCM7XX_CLK_S_GFX_MUX=C2=A0 =C2=A0 =C2=A0&quot;gfx_mux&quot;<=
br>
&gt; +#define NPCM7XX_CLK_S_GFX_PIXEL=C2=A0 =C2=A0&quot;gfx_pixel&quot;<br>
&gt; +#define NPCM7XX_CLK_S_SPI0=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;spi0&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_SPI3=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;spi3&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_SPIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;spix&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_APB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb1&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_APB2=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb2&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_APB3=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb3&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_APB4=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb4&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_APB5=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;apb5&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_TOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tock&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_CLKOUT=C2=A0 =C2=A0 =C2=A0 &quot;clkout&quot;<b=
r>
&gt; +#define NPCM7XX_CLK_S_UART=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uart&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_TIMER=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;timer&quo=
t;<br>
&gt; +#define NPCM7XX_CLK_S_MMC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mmc&=
quot;<br>
&gt; +#define NPCM7XX_CLK_S_SDHC=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sdhc&quot=
;<br>
&gt; +#define NPCM7XX_CLK_S_ADC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;adc&=
quot;<br>
&gt; +#define NPCM7XX_CLK_S_GFX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;gfx0=
_gfx1_mem&quot;<br>
&gt; +#define NPCM7XX_CLK_S_USBIF=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;serial_us=
bif&quot;<br>
&gt; +#define NPCM7XX_CLK_S_USB_HOST=C2=A0 =C2=A0 &quot;usb_host&quot;<br>
&gt; +#define NPCM7XX_CLK_S_USB_BRIDGE=C2=A0 &quot;usb_bridge&quot;<br>
&gt; +#define NPCM7XX_CLK_S_PCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pci&=
quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +static u32 pll_mux_table[] =3D {0, 1, 2, 3};<br>
&gt; +static const char * const pll_mux_parents[] __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 cpuck_mux_table[] =3D {0, 1, 2, 3};<br>
&gt; +static const char * const cpuck_mux_parents[] __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SYSBYPCK,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 pixcksel_mux_table[] =3D {0, 2};<br>
&gt; +static const char * const pixcksel_mux_parents[] __initconst =3D {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL_GFX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 sucksel_mux_table[] =3D {2, 3};<br>
&gt; +static const char * const sucksel_mux_parents[] __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 mccksel_mux_table[] =3D {0, 2, 3};<br>
&gt; +static const char * const mccksel_mux_parents[] __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_MCBYPCK,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 clkoutsel_mux_table[] =3D {0, 1, 2, 3, 4};<br>
&gt; +static const char * const clkoutsel_mux_parents[] __initconst =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL_GFX, // divided by 2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 gfxmsel_mux_table[] =3D {2, 3};<br>
&gt; +static const char * const gfxmsel_mux_parents[] __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2_DIV2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 dvcssel_mux_table[] =3D {2, 3};<br>
&gt; +static const char * const dvcssel_mux_parents[] __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +static const struct npcm7xx_clk_pll_data npcm7xx_plls[] __initconst =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_PLLCON0, NPCM7XX_CLK_S_PLL0, NPCM=
7XX_CLK_S_REFCLK, 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_PLLCON1, NPCM7XX_CLK_S_PLL1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK, 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_PLLCON2, NPCM7XX_CLK_S_PLL2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK, 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_PLLCONG, NPCM7XX_CLK_S_PLL_GFX,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_REFCLK, 0, -1},<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +static const struct npcm7xx_clk_mux_data npcm7xx_muxes[] __initconst =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{0, GENMASK(1, 0), cpuck_mux_table, NPCM7X=
X_CLK_S_CPU_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cpuck_mux_parents, ARRAY_SIZE(cpuck_mux_pa=
rents), CLK_IS_CRITICAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_CPU},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{4, GENMASK(1, 0), pixcksel_mux_table, NPC=
M7XX_CLK_S_PIX_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pixcksel_mux_parents, ARRAY_SIZE(pixcksel_=
mux_<wbr>parents), 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_GFX_PIXEL},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{6, GENMASK(1, 0), pll_mux_table, NPCM7XX_=
CLK_S_SD_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parent=
s), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{8, GENMASK(1, 0), pll_mux_table, NPCM7XX_=
CLK_S_UART_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parent=
s), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{10, GENMASK(1, 0), sucksel_mux_table, NPC=
M7XX_CLK_S_SU_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sucksel_mux_parents, ARRAY_SIZE(sucksel_mu=
x_<wbr>parents), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{12, GENMASK(1, 0), mccksel_mux_table, NPC=
M7XX_CLK_S_MC_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mccksel_mux_parents, ARRAY_SIZE(mccksel_mu=
x_<wbr>parents), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{14, GENMASK(1, 0), pll_mux_table, NPCM7XX=
_CLK_S_TIM_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parent=
s), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{16, GENMASK(1, 0), pll_mux_table, NPCM7XX=
_CLK_S_GFX_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pll_mux_parents, ARRAY_SIZE(pll_mux_parent=
s), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{18, GENMASK(2, 0), clkoutsel_mux_table, N=
PCM7XX_CLK_S_CLKOUT_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clkoutsel_mux_parents, ARRAY_SIZE(clkoutse=
l_mux_<wbr>parents), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{21, GENMASK(1, 0), gfxmsel_mux_table, NPC=
M7XX_CLK_S_GFXM_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gfxmsel_mux_parents, ARRAY_SIZE(gfxmsel_mu=
x_<wbr>parents), 0, -1},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{23, GENMASK(1, 0), dvcssel_mux_table, NPC=
M7XX_CLK_S_DVC_MUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dvcssel_mux_parents, ARRAY_SIZE(dvcssel_mu=
x_<wbr>parents), 0, -1},<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* fixed ratio dividers (no register): */<br>
&gt; +static const struct npcm7xx_clk_div_fixed_data npcm7xx_divs_fx[] __in=
itconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_MC, NPCM7XX_CLK_S_MC=
_MUX, 0, NPCM7XX_CLK_MC},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_PLL1_DIV2, NPCM7XX_C=
LK_S_PLL1, 0, -1},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_PLL2_DIV2, NPCM7XX_C=
LK_S_PLL2, 0, -1},<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +/* configurable dividers: */<br>
&gt; +static const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_TIMER, CLK_DIVIDER_POWER_OF_=
TWO, 0, NPCM7XX_CLK_ADC},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*30-28 ADCCKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 26, 2, NPCM7XX_CLK_S_AHB=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AXI, 0, CLK_IS_CRITICAL, NPC=
M7XX_CLK_AHB},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*27-26 CLK4DIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 21, 5, NPCM7XX_CLK_S_TIM=
ER,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_TIM_MUX, 0, 0, NPCM7XX_CLK_T=
IMER},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*25-21 TIMCKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 16, 5, NPCM7XX_CLK_S_UAR=
T,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_UART_MUX, 0, 0, NPCM7XX_CLK_=
UART},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*20-16 UARTDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 11, 5, NPCM7XX_CLK_S_MMC=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_MM=
C},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*15-11 MMCCKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 6, 5, NPCM7XX_CLK_S_SPI3=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI3}=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*10-6 AHB3CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 2, 4, NPCM7XX_CLK_S_PCI,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_P=
CI},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*5-2 PCICKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV1, 0, 1, NPCM7XX_CLK_S_AXI,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_CPU_MUX, CLK_DIVIDER_POWER_O=
F_TWO, CLK_IS_CRITICAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_AXI},/*0 CLK2DIV*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 30, 2, NPCM7XX_CLK_S_APB=
4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TW=
O, 0, NPCM7XX_CLK_APB4},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*31-30 APB4CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 28, 2, NPCM7XX_CLK_S_APB=
3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TW=
O, 0, NPCM7XX_CLK_APB3},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*29-28 APB3CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 26, 2, NPCM7XX_CLK_S_APB=
2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TW=
O, 0, NPCM7XX_CLK_APB2},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*27-26 APB2CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 24, 2, NPCM7XX_CLK_S_APB=
1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TW=
O, 0, NPCM7XX_CLK_APB1},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*25-24 APB1CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 22, 2, NPCM7XX_CLK_S_APB=
5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TW=
O, 0, NPCM7XX_CLK_APB5},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*23-22 APB5CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 16, 5, NPCM7XX_CLK_S_CLK=
OUT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_CLKOUT_MUX, 0, 0, NPCM7XX_CL=
K_CLKOUT},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*20-16 CLKOUTDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 13, 3, NPCM7XX_CLK_S_GFX=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_G=
FX},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*15-13 GFXCKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 8, 5, NPCM7XX_CLK_S_USB_=
BRIDGE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU=
},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*12-8 SUCKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 4, 4, NPCM7XX_CLK_S_USB_=
HOST,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU=
48},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*7-4 SU48CKDIV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV2, 0, 4, NPCM7XX_CLK_S_SDHC=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_SD=
HC}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0,/*3-0 SD1CKDIV*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV3, 6, 5, NPCM7XX_CLK_S_SPI0=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI0}=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*10-6 SPI0CKDV*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKDIV3, 1, 5, NPCM7XX_CLK_S_SPIX=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPIX}=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*5-1 SPIXCKDV*/<br>
&gt; +<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +static const struct npcm7xx_clk_gate_data npcm7xx_gates[] __initconst=
 =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 31, &quot;smb1-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 30, &quot;smb0-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 29, &quot;smb7-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 28, &quot;smb6-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 27, &quot;adc-gate&quot;,=
 NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 26, &quot;wdt-gate&quot;,=
 NPCM7XX_CLK_S_TIMER, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 25, &quot;usbdev3-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 24, &quot;usbdev6-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 23, &quot;usbdev5-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 22, &quot;usbdev4-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 21, &quot;emc2-gate&quot;=
, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 20, &quot;timer5_9-gate&q=
uot;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 19, &quot;timer0_4-gate&q=
uot;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 18, &quot;pwmm0-gate&quot=
;, NPCM7XX_CLK_S_APB3, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 17, &quot;huart-gate&quot=
;, NPCM7XX_CLK_S_UART, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 16, &quot;smb5-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 15, &quot;smb4-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 14, &quot;smb3-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 13, &quot;smb2-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 12, &quot;mc-gate&quot;, =
NPCM7XX_CLK_S_MC, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 11, &quot;uart01-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 10, &quot;aes-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 9, &quot;peci-gate&quot;,=
 NPCM7XX_CLK_S_APB3, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 8, &quot;usbdev2-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 7, &quot;uart23-gate&quot=
;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 6, &quot;emc1-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 5, &quot;usbdev1-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 4, &quot;shm-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 3 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 2, &quot;kcs-gate&quot;, =
NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 1, &quot;spi3-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 0, &quot;spi0-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 31, &quot;cp-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 30, &quot;tock-gate&quot;=
, NPCM7XX_CLK_S_TOCK, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 29 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 28, &quot;gmac1-gate&quot=
;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 27, &quot;usbif-gate&quot=
;, NPCM7XX_CLK_S_USBIF, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 26, &quot;usbhost-gate&qu=
ot;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 25, &quot;gmac2-gate&quot=
;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 24 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 23, &quot;pspi2-gate&quot=
;, NPCM7XX_CLK_S_APB5, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 22, &quot;pspi1-gate&quot=
;, NPCM7XX_CLK_S_APB5, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 21, &quot;3des-gate&quot;=
, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 20 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 19, &quot;siox2-gate&quot=
;, NPCM7XX_CLK_S_APB3, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 18, &quot;siox1-gate&quot=
;, NPCM7XX_CLK_S_APB3, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 17 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 16, &quot;fuse-gate&quot;=
, NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 bit 15 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 14, &quot;vcd-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 13, &quot;ece-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 12, &quot;vdma-gate&quot;=
, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 11, &quot;ahbpcibrg-gate&=
quot;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 10, &quot;gfxsys-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 9, &quot;sdhc-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 8, &quot;mmc-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 7, &quot;mft7-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 6, &quot;mft6-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 5, &quot;mft5-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 4, &quot;mft4-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 3, &quot;mft3-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 2, &quot;mft2-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 1, &quot;mft1-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 0, &quot;mft0-gate&quot;,=
 NPCM7XX_CLK_S_APB4, 0},<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 31, &quot;gpiom7-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 30, &quot;gpiom6-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 29, &quot;gpiom5-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 28, &quot;gpiom4-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 27, &quot;gpiom3-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 26, &quot;gpiom2-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 25, &quot;gpiom1-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 24, &quot;gpiom0-gate&quo=
t;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 23, &quot;espi-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 22, &quot;smb11-gate&quot=
;, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 21, &quot;smb10-gate&quot=
;, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 20, &quot;smb9-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 19, &quot;smb8-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 18, &quot;smb15-gate&quot=
;, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 17, &quot;rng-gate&quot;,=
 NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 16, &quot;timer10_14-gate=
&quot;, NPCM7XX_CLK_S_APB1, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 15, &quot;pcirc-gate&quot=
;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 14, &quot;sececc-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 13, &quot;sha-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 12, &quot;smb14-gate&quot=
;, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 11 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 10 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 9, &quot;pcimbx-gate&quot=
;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 8 is reserved */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 7, &quot;usbdev9-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 6, &quot;usbdev8-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 5, &quot;usbdev7-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 4, &quot;usbdev0-gate&quo=
t;, NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 3, &quot;smb13-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 2, &quot;spix-gate&quot;,=
 NPCM7XX_CLK_S_AHB, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 1, &quot;smb12-gate&quot;=
, NPCM7XX_CLK_S_APB2, 0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 0, &quot;pwmm1-gate&quot;=
, NPCM7XX_CLK_S_APB3, 0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +static struct clk_hw_onecell_data *npcm7xx_clk_data;<br>
&gt; +static void __iomem *clk_base;<br>
&gt; +static DEFINE_SPINLOCK(lock);<br>
&gt; +<br>
&gt; +<br>
&gt; +static const struct of_device_id npcm7xx_clk_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,n=
pcm750-clk&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +<br>
&gt; +MODULE_DEVICE_TABLE(of, npcm7xx_clk_match_table);<br>
&gt; +<br>
&gt; +<br>
&gt; +static void __init npcm750clk_init(struct device_node *clk_np)<br>
&gt; +{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;NPCM750: clock init: &quot;=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_base =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_address_to_resource(clk_np, 0, =
&amp;res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;\=
t%s: failed to get resource, ret %d\n&quot;, clk_np-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_base =3D ioremap(res.start, resource_s=
ize(&amp;res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk_base)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;\=
tnpcm750clk_init: resource error\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data =3D kzalloc(sizeof(*npcm7=
xx_clk_<wbr>data-&gt;hws) *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_NUM_CL=
OCKS + sizeof(npcm7xx_clk_data), GFP_KERNEL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;num =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!npcm7xx_clk_data-&gt;hws) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;C=
an&#39;t alloc npcm7xx_clk_data\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_np_err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;num =3D NPCM7XX_NUM_C=
LOCKS;<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This way all clock fetched before the p=
latform device probes,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * except those we assign here for early u=
se, will be deferred.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk init hws\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NPCM7XX_NUM_CLOCKS; i=
++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_clk_da=
ta-&gt;hws[i] =3D ERR_PTR(-EPROBE_DEFER);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Define fixed clocks.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Notice: the following clocks are fixed =
value on NPCM7XX and should<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be changed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * therefor they are not exposed to the de=
v tree .<br>
<br>
I am not convinced. The top level .dtsi is usually SoC specific.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk register fixed clocks=
\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_rate(<wbr>NUL=
L, NPCM7XX_CLK_S_REFCLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, 25000=
000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_rate(<wbr>NUL=
L, NPCM7XX_CLK_S_SYSBYPCK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, 80000=
0000); // rarely used. mostly testing. TBD: remove<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_rate(<wbr>NUL=
L, NPCM7XX_CLK_S_MCBYPCK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, 80000=
0000); // rarely used.=C2=A0 mostly testing. TBD:remove<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register plls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk register pll\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7xx_pl=
ls); i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct n=
pcm7xx_clk_pll_data *pll_data =3D &amp;npcm7xx_plls[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot=
;\tclk reg pll%d, reg=3D0x%x, name=3D%s, p=3D%s\n&quot;, i,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned int)=
pll_data-&gt;reg, pll_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_data-&gt;p=
arent_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D npcm7xx=
_clk_register_pll(clk_<wbr>base + pll_data-&gt;reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pll_data-&gt;name, pll_data-&gt;parent_name, pll_data-&gt;fla=
gs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_err(&quot;npcm7xx_clk: Can&#39;t register pll\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto npcm7xx_init_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pll_data-&=
gt;onecell_idx &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;hws[pll_<wbr>data-&gt;onecell_idx] =3D h=
w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register fixed dividers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk register fixed divs\n=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NUL=
L, NPCM7XX_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL1, 0, 1, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;n=
pcm7xx_clk: Can&#39;t register fixed div\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NUL=
L, NPCM7XX_CLK_S_PLL2_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0NPCM7XX_CLK_S_PLL2, 0, 1, 2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;n=
pcm7xx_clk: Can&#39;t register div2\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm7xx_i=
nit_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register muxes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7xx_mu=
xes); i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct n=
pcm7xx_clk_mux_data *mux_data =3D &amp;npcm7xx_muxes[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot=
;\tadd mux%d reg=3D0x%x name=3D%s p=3D%s num_p=3D%d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
i, ((u32)clk_base + (u32)NPCM7XX_CLKSEL), mux_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mux_data-&gt;parent_names[0], mux_data-&gt;num_parents);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_=
register_mux_table(<wbr>NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mux_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mux_data-&gt;parent_names, mux_data-&gt;num_parents,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mux_data-&gt;flags, clk_base + NPCM7XX_CLKSEL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mux_data-&gt;shift, mux_data-&gt;mask, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0mux_data-&gt;table, &amp;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_err(&quot;npcm7xx_clk: Can&#39;t register mux\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto npcm7xx_init_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mux_data-&=
gt;onecell_idx &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;hws[mux_<wbr>data-&gt;onecell_idx] =3D h=
w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register clock dividers specified in np=
cm7xx_divs. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk register divs\n&quot;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm7xx_di=
vs); i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct n=
pcm7xx_clk_div_data *div_data =3D &amp;npcm7xx_divs[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot=
;\tadd div%d reg=3D0x%x name=3D%s, parent=3D%s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, (unsigned int)div_data-&gt;reg=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;name, div_data-&gt;p=
arent_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_=
register_divider(NULL, div_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;parent_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;flags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_base + div_data-&gt;reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;shift, div_data-&gt;=
width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div_data-&gt;clk_divider_flags, &=
amp;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_err(&quot;npcm7xx_clk: Can&#39;t register div table\n&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto npcm7xx_init_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (div_data-&=
gt;onecell_idx &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0npcm7xx_clk_data-&gt;hws[div_<wbr>data-&gt;onecell_idx] =3D h=
w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_clk_add_hw_provider(clk_np, of_=
clk_hw_onecell_get,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7=
xx_clk_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;f=
ailed to add DT provider: %d\n&quot;, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;npcm7xx clk: %d dividers, %d=
 muxes and %d plls registered.\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(npc=
m7xx_divs), ARRAY_SIZE(npcm7xx_muxes),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(npc=
m7xx_plls));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(clk_np);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +npcm7xx_init_fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;\tclk setup fail\n&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (npcm7xx_clk_data-&gt;num)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(npcm7xx_=
clk_data-&gt;hws);<br>
&gt; +npcm7xx_init_np_err:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (clk_base !=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(clk_ba=
se);<br>
&gt; +npcm7xx_init_error:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(clk_np);<br>
&gt; +}<br>
&gt; +<br>
&gt; +CLK_OF_DECLARE(npcm750clk_<wbr>init, &quot;nuvoton,npcm750-clk&quot;,=
 npcm750clk_init);<br>
&gt; +<br>
&gt; +<br>
&gt; --<br>
&gt; 2.14.1<br>
&gt;<br>
<br>
One minor issue, other than that, it looks pretty good.<br>
</blockquote></div><br></div>

--94eb2c1cdf4aaa81c2056486b6db--

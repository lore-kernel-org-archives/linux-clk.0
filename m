Return-Path: <pozega.tomislav@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170508201221.31684-1-linus.walleij@linaro.org>
References: <20170508201221.31684-1-linus.walleij@linaro.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Mon, 8 May 2017 23:16:48 +0200
Message-ID: <CAKR_QV+7rSv5j9rD_AGca5n3wjABL9QLadqCE9ipse9-W-13QA@mail.gmail.com>
Subject: Re: [OpenWrt-Devel] [PATCH 2/2 v2] clk: Add Gemini SoC clock controller
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, openwrt-devel@openwrt.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>, Janos Laube <janos.dev@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Content-Type: multipart/alternative; boundary=001a1134e182d4e104054f09c13c
List-ID: <linux-clk.vger.kernel.org>

--001a1134e182d4e104054f09c13c
Content-Type: text/plain; charset=UTF-8

Is it ever going to be added so this endless spam can end?


On 8 May 2017 at 22:12, Linus Walleij <linus.walleij@linaro.org> wrote:

> The Cortina Systems Gemini (SL3516/CS3516) has an on-chip clock
> controller that derive all clocks from a single crystal, using some
> documented and some undocumented PLLs, half dividers, counters and
> gates. This is a best attempt to construct a clock driver for the
> clocks so at least we can gate off unused hardware and driver the
> PCI bus clock.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Move the clock controller to be part of the syscon node. No
>   need for a separate child node for this.
> ---
>  drivers/clk/Kconfig      |   7 +
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-gemini.c | 358 ++++++++++++++++++++++++++++++
> +++++++++++++++++
>  3 files changed, 366 insertions(+)
>  create mode 100644 drivers/clk/clk-gemini.c
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 9356ab4b7d76..9e7619f9bf0e 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -118,6 +118,13 @@ config COMMON_CLK_CS2000_CP
>         help
>           If you say yes here you get support for the CS2000 clock
> multiplier.
>
> +config COMMON_CLK_GEMINI
> +       bool "Clock driver for Cortina Systems Gemini SoC"
> +       select MFD_SYSCON
> +       ---help---
> +         This driver supports the SoC clocks on the Cortina Systems Gemini
> +         platform, also known as SL3516 or CS3516.
> +
>  config COMMON_CLK_S2MPS11
>         tristate "Clock driver for S2MPS1X/S5M8767 MFD"
>         depends on MFD_SEC_CORE || COMPILE_TEST
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 92c12b86c2e8..e100d911a554 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE925)      += clk-cdce925.o
>  obj-$(CONFIG_ARCH_CLPS711X)            += clk-clps711x.o
>  obj-$(CONFIG_COMMON_CLK_CS2000_CP)     += clk-cs2000-cp.o
>  obj-$(CONFIG_ARCH_EFM32)               += clk-efm32gg.o
> +obj-$(CONFIG_COMMON_CLK_GEMINI)                += clk-gemini.o
>  obj-$(CONFIG_ARCH_HIGHBANK)            += clk-highbank.o
>  obj-$(CONFIG_COMMON_CLK_MAX77686)      += clk-max77686.o
>  obj-$(CONFIG_ARCH_MB86S7X)             += clk-mb86s7x.o
> diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
> new file mode 100644
> index 000000000000..340c2570f24e
> --- /dev/null
> +++ b/drivers/clk/clk-gemini.c
> @@ -0,0 +1,358 @@
> +/*
> + * Cortina Gemini Clock Controller driver
> + * Copyright (c) 2017 Linus Walleij <linus.walleij@linaro.org>
> + */
> +
> +#define pr_fmt(fmt) "clk-gemini: " fmt
> +
> +#include <linux/clkdev.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <dt-bindings/clock/cortina,gemini-clock.h>
> +
> +/* Globally visible clocks */
> +static DEFINE_SPINLOCK(gemini_clk_lock);
> +static struct clk *gemini_clks[GEMINI_NUM_CLKS];
> +static struct clk_onecell_data gemini_clk_data;
> +
> +#define GEMINI_GLOBAL_STATUS 0x04
> +#define PLL_OSC_SEL BIT(30)
> +#define AHBSPEED_SHIFT (15)
> +#define AHBSPEED_MASK 0x07
> +#define CPU_AHB_RATIO_SHIFT (18)
> +#define CPU_AHB_RATIO_MASK 0x03
> +
> +#define GEMINI_GLOBAL_PLL_CONTROL 0x08
> +
> +#define GEMINI_GLOBAL_MISC_CONTROL 0x30
> +#define PCI_CLK_66MHZ BIT(18)
> +#define PCI_CLK_OE BIT(17)
> +
> +#define GEMINI_GLOBAL_CLOCK_CONTROL 0x34
> +#define PCI_CLKRUN_EN BIT(16)
> +#define TVC_HALFDIV_SHIFT (24)
> +#define TVC_HALFDIV_MASK 0x1f
> +#define SECURITY_CLK_SEL BIT(29)
> +
> +#define GEMINI_GLOBAL_PCI_DLL_CONTROL 0x44
> +#define PCI_DLL_BYPASS BIT(31)
> +#define PCI_DLL_TAP_SEL_MASK 0x1f
> +
> +struct gemini_gate_data {
> +       u8 bit_idx;
> +       const char *name;
> +       const char *parent_name;
> +       unsigned long flags;
> +};
> +
> +/**
> + * struct clk_gemini_pci - Gemini PCI clock
> + * @hw: corresponding clock hardware entry
> + * @map: regmap to access the registers
> + * @rate: current rate
> + */
> +struct clk_gemini_pci {
> +       struct clk_hw hw;
> +       struct regmap *map;
> +       unsigned long rate;
> +};
> +
> +/*
> + * FIXME: some clocks are marked as CLK_IGNORE_UNUSED: this is
> + * because their kernel drivers lack proper clock handling so we
> + * need to avoid them being gated off by default. Remove this as
> + * the drivers get fixed to handle clocks properly.
> + *
> + * The DDR controller may never have a driver, but certainly must
> + * not be gated off.
> + */
> +static const struct gemini_gate_data gemini_gates[] __initconst = {
> +       { 1, "security-gate", "secdiv", 0 },
> +       { 2, "gmac0-gate", "ahb", 0 },
> +       { 3, "gmac1-gate", "ahb", 0 },
> +       { 4, "sata0-gate", "ahb", 0 },
> +       { 5, "sata1-gate", "ahb", 0 },
> +       { 6, "usb0-gate", "ahb", 0 },
> +       { 7, "usb1-gate", "ahb", 0 },
> +       { 8, "ide-gate", "ahb", 0 },
> +       { 9, "pci-gate", "ahb", 0 },
> +       { 10, "ddr-gate", "ahb", CLK_IGNORE_UNUSED },
> +       { 11, "flash-gate", "ahb", CLK_IGNORE_UNUSED },
> +       { 12, "tvc-gate", "ahb", 0 },
> +       { 13, "boot-gate", "apb", 0 },
> +};
> +
> +#define to_pciclk(_hw) container_of(_hw, struct clk_gemini_pci, hw)
> +
> +static unsigned long gemini_pci_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{
> +       struct clk_gemini_pci *pciclk = to_pciclk(hw);
> +       u32 val;
> +       int ret;
> +
> +       ret = regmap_read(pciclk->map, GEMINI_GLOBAL_MISC_CONTROL, &val);
> +       if (ret)
> +               return ret;
> +       if (val & PCI_CLK_66MHZ)
> +               return 66000000;
> +       return 33000000;
> +}
> +
> +static long gemini_pci_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                 unsigned long *prate)
> +{
> +       /* We support 33 and 66 MHz */
> +       if (rate < 48000000)
> +               return 33000000;
> +       return 66000000;
> +}
> +
> +static int gemini_pci_set_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       struct clk_gemini_pci *pciclk = to_pciclk(hw);
> +
> +       if (rate == 33000000)
> +               return regmap_update_bits(pciclk->map,
> +                                         GEMINI_GLOBAL_MISC_CONTROL,
> +                                         PCI_CLK_66MHZ, 0);
> +       if (rate == 66000000)
> +               return regmap_update_bits(pciclk->map,
> +                                         GEMINI_GLOBAL_MISC_CONTROL,
> +                                         0, PCI_CLK_66MHZ);
> +       return -EINVAL;
> +}
> +
> +static int gemini_pci_enable(struct clk_hw *hw)
> +{
> +       struct clk_gemini_pci *pciclk = to_pciclk(hw);
> +
> +       regmap_update_bits(pciclk->map, GEMINI_GLOBAL_CLOCK_CONTROL,
> +                          0, PCI_CLKRUN_EN);
> +       regmap_update_bits(pciclk->map,
> +                          GEMINI_GLOBAL_MISC_CONTROL,
> +                          0, PCI_CLK_OE);
> +       return 0;
> +}
> +
> +static void gemini_pci_disable(struct clk_hw *hw)
> +{
> +       struct clk_gemini_pci *pciclk = to_pciclk(hw);
> +
> +       regmap_update_bits(pciclk->map,
> +                          GEMINI_GLOBAL_MISC_CONTROL,
> +                          PCI_CLK_OE, 0);
> +       regmap_update_bits(pciclk->map, GEMINI_GLOBAL_CLOCK_CONTROL,
> +                          PCI_CLKRUN_EN, 0);
> +}
> +
> +static int gemini_pci_is_enabled(struct clk_hw *hw)
> +{
> +       struct clk_gemini_pci *pciclk = to_pciclk(hw);
> +       int ret;
> +       unsigned int val;
> +
> +       ret = regmap_read(pciclk->map, GEMINI_GLOBAL_CLOCK_CONTROL, &val);
> +       if (ret)
> +               return ret;
> +
> +       return !!(val & PCI_CLKRUN_EN);
> +}
> +
> +static const struct clk_ops gemini_pci_clk_ops = {
> +       .recalc_rate = gemini_pci_recalc_rate,
> +       .round_rate = gemini_pci_round_rate,
> +       .set_rate = gemini_pci_set_rate,
> +       .enable = gemini_pci_enable,
> +       .disable = gemini_pci_disable,
> +       .is_enabled = gemini_pci_is_enabled,
> +};
> +
> +static struct clk *gemini_pci_clk_setup(const char *name,
> +                                       const char *parent_name,
> +                                       struct regmap *map)
> +{
> +       struct clk_gemini_pci *pciclk;
> +       struct clk_init_data init;
> +       struct clk *clk;
> +
> +       pciclk = kzalloc(sizeof(*pciclk), GFP_KERNEL);
> +       if (!pciclk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = name;
> +       init.ops = &gemini_pci_clk_ops;
> +       init.flags = 0;
> +       init.parent_names = (parent_name ? &parent_name : NULL);
> +       init.num_parents = (parent_name ? 1 : 0);
> +       pciclk->map = map;
> +       pciclk->hw.init = &init;
> +
> +       clk = clk_register(NULL, &pciclk->hw);
> +       if (IS_ERR(clk))
> +               kfree(pciclk);
> +
> +       return clk;
> +}
> +
> +static void __init gemini_cc_init(struct device_node *np)
> +{
> +       void __iomem *base;
> +       struct regmap *map;
> +       struct clk *clk;
> +       unsigned int mult, div;
> +       unsigned long freq;
> +       u32 val;
> +       int ret;
> +       int i;
> +
> +       /* Remap the system controller for the exclusive register */
> +       base = of_iomap(np, 0);
> +       if (!base) {
> +               pr_err("no memory base\n");
> +               return;
> +       }
> +       map = syscon_node_to_regmap(np);
> +       if (IS_ERR(map)) {
> +               pr_err("no syscon regmap\n");
> +               return;
> +       }
> +
> +       /* RTC clock 32768 Hz */
> +       clk = clk_register_fixed_rate(NULL, "rtc", NULL, CLK_IGNORE_UNUSED,
> +                                     32768);
> +       gemini_clks[GEMINI_CLK_RTC] = clk;
> +
> +       ret = regmap_read(map, GEMINI_GLOBAL_STATUS, &val);
> +       if (ret) {
> +               pr_err("failed to read global status register\n");
> +               return;
> +       }
> +
> +       /*
> +        * XTAL is the crystal oscillator, 60 or 30 MHz selected from
> +        * strap pin E6
> +        */
> +       if (val & PLL_OSC_SEL)
> +               freq = 30000000;
> +       else
> +               freq = 60000000;
> +       clk = clk_register_fixed_rate(NULL, "xtal", NULL,
> CLK_IGNORE_UNUSED,
> +                                     freq);
> +       pr_info("main crystal @%lu MHz\n", (freq/1000000));
> +
> +       /* VCO clock derived from the crystal */
> +       mult = 13 + ((val >> AHBSPEED_SHIFT) & AHBSPEED_MASK);
> +       div = 2;
> +       /* If we run on 30 Mhz crystal we have to multiply with two */
> +       if (val & PLL_OSC_SEL)
> +               mult *= 2;
> +       clk = clk_register_fixed_factor(NULL, "vco", "xtal",
> CLK_IGNORE_UNUSED,
> +                                       mult, div);
> +
> +       /* The AHB clock is always 1/3 of the VCO */
> +       clk = clk_register_fixed_factor(NULL, "ahb", "vco",
> +                                       CLK_IGNORE_UNUSED, 1, 3);
> +       gemini_clks[GEMINI_CLK_AHB] = clk;
> +
> +       /* The APB clock is always 1/6 of the AHB */
> +       clk = clk_register_fixed_factor(NULL, "apb", "ahb",
> +                                       CLK_IGNORE_UNUSED, 1, 6);
> +       gemini_clks[GEMINI_CLK_APB] = clk;
> +
> +       /* CPU clock derived as a fixed ratio from the AHB clock */
> +       switch ((val >> CPU_AHB_RATIO_SHIFT) & CPU_AHB_RATIO_MASK) {
> +       case 0x0:
> +               /* 1x */
> +               mult = 1;
> +               div = 1;
> +               break;
> +       case 0x1:
> +               /* 1.5x */
> +               mult = 3;
> +               div = 2;
> +               break;
> +       case 0x2:
> +               /* 1.85x */
> +               mult = 24;
> +               div = 13;
> +               break;
> +       case 0x3:
> +               /* 2x */
> +               mult = 2;
> +               div = 1;
> +               break;
> +       }
> +       clk = clk_register_fixed_factor(NULL, "cpu", "ahb",
> +                                       CLK_IGNORE_UNUSED, mult, div);
> +       gemini_clks[GEMINI_CLK_CPU] = clk;
> +
> +       /* Security clock is 1:1 or 0.75 of APB */
> +       ret = regmap_read(map, GEMINI_GLOBAL_CLOCK_CONTROL, &val);
> +       if (ret) {
> +               pr_err("failed to read global clock control register\n");
> +               return;
> +       }
> +       if (val & SECURITY_CLK_SEL) {
> +               mult = 1;
> +               div = 1;
> +       } else {
> +               mult = 3;
> +               div = 4;
> +       }
> +       clk = clk_register_fixed_factor(NULL, "secdiv", "ahb",
> +                                       0, mult, div);
> +
> +       /*
> +        * These are the leaf gates, at boot no clocks are gated.
> +        */
> +       for (i = 0; i < ARRAY_SIZE(gemini_gates); i++) {
> +               const struct gemini_gate_data *gd;
> +
> +               gd = &gemini_gates[i];
> +               gemini_clks[GEMINI_CLK_GATES + i] =
> +                       clk_register_gate(NULL, gd->name,
> +                                         gd->parent_name,
> +                                         gd->flags,
> +                                         base +
> GEMINI_GLOBAL_CLOCK_CONTROL,
> +                                         gd->bit_idx,
> +                                         CLK_GATE_SET_TO_DISABLE,
> +                                         &gemini_clk_lock);
> +       }
> +
> +       /*
> +        * The TV Interface Controller has a 5-bit half divider register.
> +        * This clock is supposed to be 27MHz as this is an exact multiple
> +        * of PAL and NTSC frequencies. The register is undocumented :(
> +        * FIXME: figure out the parent and how the divider works.
> +        */
> +       mult = 1;
> +       div = ((val >> TVC_HALFDIV_SHIFT) & TVC_HALFDIV_MASK);
> +       pr_debug("TVC half divider value = %d\n", div);
> +       div += 1;
> +       clk = clk_register_fixed_rate(NULL, "tvcdiv", "xtal", 0, 27000000);
> +       gemini_clks[GEMINI_CLK_TVC] = clk;
> +
> +       /* FIXME: very unclear what the parent is */
> +       clk = gemini_pci_clk_setup("PCI", "xtal", map);
> +       gemini_clks[GEMINI_CLK_PCI] = clk;
> +
> +       /* FIXME: very unclear what the parent is */
> +       clk = clk_register_fixed_rate(NULL, "uart", "xtal",
> CLK_IGNORE_UNUSED,
> +                                     48000000);
> +       gemini_clks[GEMINI_CLK_UART] = clk;
> +
> +       /* Register the clocks to be accessed by the device tree */
> +       gemini_clk_data.clks = gemini_clks;
> +        gemini_clk_data.clk_num = ARRAY_SIZE(gemini_clks);
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &gemini_clk_data);
> +}
> +CLK_OF_DECLARE_DRIVER(gemini_cc, "cortina,gemini-clock-controller",
> +                     gemini_cc_init);
> --
> 2.9.3
> _______________________________________________
> openwrt-devel mailing list
> openwrt-devel@lists.openwrt.org
> https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel
>

--001a1134e182d4e104054f09c13c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it ever going to be added so this endless spam can end?=
<br><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 8 May 2017 at 22:12, Linus Walleij <span dir=3D"ltr">&lt;<a href=
=3D"mailto:linus.walleij@linaro.org" target=3D"_blank">linus.walleij@linaro=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Cortina Sy=
stems Gemini (SL3516/CS3516) has an on-chip clock<br>
controller that derive all clocks from a single crystal, using some<br>
documented and some undocumented PLLs, half dividers, counters and<br>
gates. This is a best attempt to construct a clock driver for the<br>
clocks so at least we can gate off unused hardware and driver the<br>
PCI bus clock.<br>
<br>
Signed-off-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org=
">linus.walleij@linaro.org</a>&gt;<br>
---<br>
ChangeLog v1-&gt;v2:<br>
- Move the clock controller to be part of the syscon node. No<br>
=C2=A0 need for a separate child node for this.<br>
---<br>
=C2=A0drivers/clk/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0drivers/clk/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/clk/clk-gemini.c | 358 ++++++++++++++++++++++++++++++<wbr>+++=
++++++++++++++<br>
=C2=A03 files changed, 366 insertions(+)<br>
=C2=A0create mode 100644 drivers/clk/clk-gemini.c<br>
<br>
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig<br>
index 9356ab4b7d76..9e7619f9bf0e 100644<br>
--- a/drivers/clk/Kconfig<br>
+++ b/drivers/clk/Kconfig<br>
@@ -118,6 +118,13 @@ config COMMON_CLK_CS2000_CP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you say yes here you get support for =
the CS2000 clock multiplier.<br>
<br>
+config COMMON_CLK_GEMINI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Clock driver for Cortina Systems Gem=
ini SoC&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select MFD_SYSCON<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver supports the SoC clocks on t=
he Cortina Systems Gemini<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform, also known as SL3516 or CS3516=
.<br>
+<br>
=C2=A0config COMMON_CLK_S2MPS11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;Clock driver for S2MPS1X/S5M8767=
 MFD&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on MFD_SEC_CORE || COMPILE_TEST<br>
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile<br>
index 92c12b86c2e8..e100d911a554 100644<br>
--- a/drivers/clk/Makefile<br>
+++ b/drivers/clk/Makefile<br>
@@ -25,6 +25,7 @@ obj-$(CONFIG_COMMON_CLK_<wbr>CDCE925)=C2=A0 =C2=A0 =C2=A0=
 +=3D clk-cdce925.o<br>
=C2=A0obj-$(CONFIG_ARCH_CLPS711X)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D clk-clps711x.o<br>
=C2=A0obj-$(CONFIG_COMMON_CLK_<wbr>CS2000_CP)=C2=A0 =C2=A0 =C2=A0+=3D clk-c=
s2000-cp.o<br>
=C2=A0obj-$(CONFIG_ARCH_EFM32)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+=3D clk-efm32gg.o<br>
+obj-$(CONFIG_COMMON_CLK_<wbr>GEMINI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +=3D clk-gemini.o<br>
=C2=A0obj-$(CONFIG_ARCH_HIGHBANK)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D clk-highbank.o<br>
=C2=A0obj-$(CONFIG_COMMON_CLK_<wbr>MAX77686)=C2=A0 =C2=A0 =C2=A0 +=3D clk-m=
ax77686.o<br>
=C2=A0obj-$(CONFIG_ARCH_MB86S7X)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D clk-mb86s7x.o<br>
diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c<br>
new file mode 100644<br>
index 000000000000..340c2570f24e<br>
--- /dev/null<br>
+++ b/drivers/clk/clk-gemini.c<br>
@@ -0,0 +1,358 @@<br>
+/*<br>
+ * Cortina Gemini Clock Controller driver<br>
+ * Copyright (c) 2017 Linus Walleij &lt;<a href=3D"mailto:linus.walleij@li=
naro.org">linus.walleij@linaro.org</a>&gt;<br>
+ */<br>
+<br>
+#define pr_fmt(fmt) &quot;clk-gemini: &quot; fmt<br>
+<br>
+#include &lt;linux/clkdev.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+#include &lt;linux/clk-provider.h&gt;<br>
+#include &lt;linux/of.h&gt;<br>
+#include &lt;linux/of_address.h&gt;<br>
+#include &lt;linux/mfd/syscon.h&gt;<br>
+#include &lt;linux/regmap.h&gt;<br>
+#include &lt;dt-bindings/clock/cortina,<wbr>gemini-clock.h&gt;<br>
+<br>
+/* Globally visible clocks */<br>
+static DEFINE_SPINLOCK(gemini_clk_<wbr>lock);<br>
+static struct clk *gemini_clks[GEMINI_NUM_CLKS];<br>
+static struct clk_onecell_data gemini_clk_data;<br>
+<br>
+#define GEMINI_GLOBAL_STATUS 0x04<br>
+#define PLL_OSC_SEL BIT(30)<br>
+#define AHBSPEED_SHIFT (15)<br>
+#define AHBSPEED_MASK 0x07<br>
+#define CPU_AHB_RATIO_SHIFT (18)<br>
+#define CPU_AHB_RATIO_MASK 0x03<br>
+<br>
+#define GEMINI_GLOBAL_PLL_CONTROL 0x08<br>
+<br>
+#define GEMINI_GLOBAL_MISC_CONTROL 0x30<br>
+#define PCI_CLK_66MHZ BIT(18)<br>
+#define PCI_CLK_OE BIT(17)<br>
+<br>
+#define GEMINI_GLOBAL_CLOCK_CONTROL 0x34<br>
+#define PCI_CLKRUN_EN BIT(16)<br>
+#define TVC_HALFDIV_SHIFT (24)<br>
+#define TVC_HALFDIV_MASK 0x1f<br>
+#define SECURITY_CLK_SEL BIT(29)<br>
+<br>
+#define GEMINI_GLOBAL_PCI_DLL_CONTROL 0x44<br>
+#define PCI_DLL_BYPASS BIT(31)<br>
+#define PCI_DLL_TAP_SEL_MASK 0x1f<br>
+<br>
+struct gemini_gate_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 bit_idx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+};<br>
+<br>
+/**<br>
+ * struct clk_gemini_pci - Gemini PCI clock<br>
+ * @hw: corresponding clock hardware entry<br>
+ * @map: regmap to access the registers<br>
+ * @rate: current rate<br>
+ */<br>
+struct clk_gemini_pci {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_hw hw;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *map;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long rate;<br>
+};<br>
+<br>
+/*<br>
+ * FIXME: some clocks are marked as CLK_IGNORE_UNUSED: this is<br>
+ * because their kernel drivers lack proper clock handling so we<br>
+ * need to avoid them being gated off by default. Remove this as<br>
+ * the drivers get fixed to handle clocks properly.<br>
+ *<br>
+ * The DDR controller may never have a driver, but certainly must<br>
+ * not be gated off.<br>
+ */<br>
+static const struct gemini_gate_data gemini_gates[] __initconst =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, &quot;security-gate&quot;, &quot;secdiv&qu=
ot;, 0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 2, &quot;gmac0-gate&quot;, &quot;ahb&quot;, 0=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 3, &quot;gmac1-gate&quot;, &quot;ahb&quot;, 0=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 4, &quot;sata0-gate&quot;, &quot;ahb&quot;, 0=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 5, &quot;sata1-gate&quot;, &quot;ahb&quot;, 0=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 6, &quot;usb0-gate&quot;, &quot;ahb&quot;, 0 =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 7, &quot;usb1-gate&quot;, &quot;ahb&quot;, 0 =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 8, &quot;ide-gate&quot;, &quot;ahb&quot;, 0 }=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 9, &quot;pci-gate&quot;, &quot;ahb&quot;, 0 }=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 10, &quot;ddr-gate&quot;, &quot;ahb&quot;, CL=
K_IGNORE_UNUSED },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 11, &quot;flash-gate&quot;, &quot;ahb&quot;, =
CLK_IGNORE_UNUSED },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 12, &quot;tvc-gate&quot;, &quot;ahb&quot;, 0 =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 13, &quot;boot-gate&quot;, &quot;apb&quot;, 0=
 },<br>
+};<br>
+<br>
+#define to_pciclk(_hw) container_of(_hw, struct clk_gemini_pci, hw)<br>
+<br>
+static unsigned long gemini_pci_recalc_rate(struct clk_hw *hw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0unsigned long parent_rate)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_gemini_pci *pciclk =3D to_pciclk(hw)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(pciclk-&gt;map, GEMINI_GLOB=
AL_MISC_CONTROL, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; PCI_CLK_66MHZ)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 66000000;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 33000000;<br>
+}<br>
+<br>
+static long gemini_pci_round_rate(struct clk_hw *hw, unsigned long rate,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long *prate)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We support 33 and 66 MHz */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rate &lt; 48000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 33000000;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 66000000;<br>
+}<br>
+<br>
+static int gemini_pci_set_rate(struct clk_hw *hw, unsigned long rate,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long parent_rate)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_gemini_pci *pciclk =3D to_pciclk(hw)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rate =3D=3D 33000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return regmap_updat=
e_bits(pciclk-&gt;<wbr>map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GE=
MINI_GLOBAL_MISC_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PC=
I_CLK_66MHZ, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rate =3D=3D 66000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return regmap_updat=
e_bits(pciclk-&gt;<wbr>map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GE=
MINI_GLOBAL_MISC_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
 PCI_CLK_66MHZ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+}<br>
+<br>
+static int gemini_pci_enable(struct clk_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_gemini_pci *pciclk =3D to_pciclk(hw)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(pciclk-&gt;<wbr>map, GEMINI_=
GLOBAL_CLOCK_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0, PCI_CLKRUN_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(pciclk-&gt;<wbr>map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GEMINI_GLOBAL_MISC_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0, PCI_CLK_OE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static void gemini_pci_disable(struct clk_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_gemini_pci *pciclk =3D to_pciclk(hw)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(pciclk-&gt;<wbr>map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GEMINI_GLOBAL_MISC_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PCI_CLK_OE, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(pciclk-&gt;<wbr>map, GEMINI_=
GLOBAL_CLOCK_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PCI_CLKRUN_EN, 0);<br>
+}<br>
+<br>
+static int gemini_pci_is_enabled(struct clk_hw *hw)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_gemini_pci *pciclk =3D to_pciclk(hw)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(pciclk-&gt;map, GEMINI_GLOB=
AL_CLOCK_CONTROL, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return !!(val &amp; PCI_CLKRUN_EN);<br>
+}<br>
+<br>
+static const struct clk_ops gemini_pci_clk_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.recalc_rate =3D gemini_pci_recalc_rate,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.round_rate =3D gemini_pci_round_rate,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_rate =3D gemini_pci_set_rate,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable =3D gemini_pci_enable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable =3D gemini_pci_disable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.is_enabled =3D gemini_pci_is_enabled,<br>
+};<br>
+<br>
+static struct clk *gemini_pci_clk_setup(const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const cha=
r *parent_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct re=
gmap *map)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_gemini_pci *pciclk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_init_data init;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pciclk =3D kzalloc(sizeof(*pciclk), GFP_KERNEL)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pciclk)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENO=
MEM);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://init.name" rel=3D"noreferrer"=
 target=3D"_blank">init.name</a> =3D name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init.ops =3D &amp;gemini_pci_clk_ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init.flags =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init.parent_names =3D (parent_name ? &amp;paren=
t_name : NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init.num_parents =3D (parent_name ? 1 : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pciclk-&gt;map =3D map;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pciclk-&gt;hw.init =3D &amp;init;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register(NULL, &amp;pciclk-&gt;hw);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pciclk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return clk;<br>
+}<br>
+<br>
+static void __init gemini_cc_init(struct device_node *np)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *map;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int mult, div;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long freq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Remap the system controller for the exclusiv=
e register */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D of_iomap(np, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!base) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;no mem=
ory base\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0map =3D syscon_node_to_regmap(np);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(map)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;no sys=
con regmap\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* RTC clock 32768 Hz */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_rate(NULL, &quot;rtc=
&quot;, NULL, CLK_IGNORE_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032768);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_RTC] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(map, GEMINI_GLOBAL_STATUS, =
&amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;failed=
 to read global status register\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * XTAL is the crystal oscillator, 60 or 30 MHz=
 selected from<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * strap pin E6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; PLL_OSC_SEL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freq =3D 30000000;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freq =3D 60000000;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_rate(NULL, &quot;xta=
l&quot;, NULL, CLK_IGNORE_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;main crystal @%lu MHz\n&quot;, (f=
req/1000000));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* VCO clock derived from the crystal */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 13 + ((val &gt;&gt; AHBSPEED_SHIFT) &a=
mp; AHBSPEED_MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we run on 30 Mhz crystal we have to multi=
ply with two */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; PLL_OSC_SEL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult *=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NULL, &q=
uot;vco&quot;, &quot;xtal&quot;, CLK_IGNORE_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult, div=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The AHB clock is always 1/3 of the VCO */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NULL, &q=
uot;ahb&quot;, &quot;vco&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_IGNOR=
E_UNUSED, 1, 3);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_AHB] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The APB clock is always 1/6 of the AHB */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NULL, &q=
uot;apb&quot;, &quot;ahb&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_IGNOR=
E_UNUSED, 1, 6);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_APB] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU clock derived as a fixed ratio from the =
AHB clock */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((val &gt;&gt; CPU_AHB_RATIO_SHIFT) &amp=
; CPU_AHB_RATIO_MASK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1x */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1.5x */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1.85x */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 24;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 13;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2x */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NULL, &q=
uot;cpu&quot;, &quot;ahb&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_IGNOR=
E_UNUSED, mult, div);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_CPU] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Security clock is 1:1 or 0.75 of APB */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read(map, GEMINI_GLOBAL_CLOCK_CO=
NTROL, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;failed=
 to read global clock control register\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; SECURITY_CLK_SEL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(<wbr>NULL, &q=
uot;secdiv&quot;, &quot;ahb&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, mult, =
div);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * These are the leaf gates, at boot no clocks =
are gated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(gemini_gates); =
i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct gemini=
_gate_data *gd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd =3D &amp;gemini_=
gates[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_=
CLK_GATES + i] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clk_register_gate(NULL, gd-&gt;name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd=
-&gt;parent_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd=
-&gt;flags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se + GEMINI_GLOBAL_CLOCK_CONTROL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gd=
-&gt;bit_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CL=
K_GATE_SET_TO_DISABLE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;gemini_clk_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The TV Interface Controller has a 5-bit half=
 divider register.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This clock is supposed to be 27MHz as this i=
s an exact multiple<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * of PAL and NTSC frequencies. The register is=
 undocumented :(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME: figure out the parent and how the div=
ider works.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mult =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D ((val &gt;&gt; TVC_HALFDIV_SHIFT) &amp;=
 TVC_HALFDIV_MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;TVC half divider value =3D %d\n&=
quot;, div);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0div +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_rate(NULL, &quot;tvc=
div&quot;, &quot;xtal&quot;, 0, 27000000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_TVC] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: very unclear what the parent is */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D gemini_pci_clk_setup(&quot;PCI&quot;, &=
quot;xtal&quot;, map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_PCI] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME: very unclear what the parent is */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_rate(NULL, &quot;uar=
t&quot;, &quot;xtal&quot;, CLK_IGNORE_UNUSED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A048000000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clks[GEMINI_CLK_UART] =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register the clocks to be accessed by the de=
vice tree */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gemini_clk_data.clks =3D gemini_clks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gemini_clk_data.clk_num =3D ARRAY_SIZE(gemini_=
clks);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_clk_add_provider(np, of_clk_src_onecell_get,=
 &amp;gemini_clk_data);<br>
+}<br>
+CLK_OF_DECLARE_DRIVER(gemini_<wbr>cc, &quot;cortina,gemini-clock-<wbr>cont=
roller&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gemini_cc_init);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
______________________________<wbr>_________________<br>
openwrt-devel mailing list<br>
<a href=3D"mailto:openwrt-devel@lists.openwrt.org">openwrt-devel@lists.open=
wrt.<wbr>org</a><br>
<a href=3D"https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel=
" rel=3D"noreferrer" target=3D"_blank">https://lists.openwrt.org/cgi-<wbr>b=
in/mailman/listinfo/openwrt-<wbr>devel</a><br>
</font></span></blockquote></div><br></div>

--001a1134e182d4e104054f09c13c--

Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161228000045.4540-1-marek.vasut@gmail.com>
References: <20161228000045.4540-1-marek.vasut@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jan 2017 14:46:29 +0100
Message-ID: <CAMuHMdXjTMpqXc-XRNhQ=052W9fTbGF0XwOWmpZvBuNa-JL0Yw@mail.gmail.com>
Subject: Re: [PATCH] clk: vc5: Add support for IDT VersaClock 5P49V5923B
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

CC linux-renesas-soc, as this driver is used for a device on the
Renesas Salvator-X board.

On Wed, Dec 28, 2016 at 1:00 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add driver for IDT VersaClock 5 5P49V5923B chip. This chip has two
> clock inputs, XTAL or CLK, which are muxed into single PLL/VCO input.
> The PLL feeds two fractional dividers. Each fractional divider feeds
> output mux, which allows selecting between clock from the fractional
> divider itself or from output mux on output N-1. In case of output
> mux 0, the output N-1 is instead connected to the output from the mux
> feeding the PLL.
>
> The driver thus far supports only the 5P49V5923B, while it should be
> easily extensible to the whole 5P49V59xx family of chips as they are
> all pretty similar.
>
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.txt  |  41 ++
>  drivers/clk/Kconfig                                |  10 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-versaclock5.c                      | 696 +++++++++++++++++++++
>  4 files changed, 748 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/idt,versaclock5.txt
>  create mode 100644 drivers/clk/clk-versaclock5.c
>
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> new file mode 100644
> index 0000000..cbe5bc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
> @@ -0,0 +1,41 @@
> +Binding for IDT VersaClock5 programmable i2c clock generator.
> +
> +The IDT VersaClock5 are programmable i2c clock generators providing
> +from 3 to 12 output clocks.
> +
> +==I2C device node==
> +
> +Required properties:
> +- compatible:  shall be one of "idt,5p49v5923b".
> +- reg:         i2c device address, shall be 0x68 or 0x6a.
> +- #clock-cells:        from common clock binding; shall be set to 1.
> +- clocks:      from common clock binding; list of parent clock handles,
> +               shall be XTAL or CLKIN reference clock. Corresponding
> +               clock input names are "xin" and "clkin" respectively.
> +- #address-cells: shall be set to 1.
> +- #size-cells: shall be set to 0.
> +
> +==Example==
> +
> +/* 25MHz reference crystal */
> +ref25: ref25m {
> +       compatible = "fixed-clock";
> +       #clock-cells = <0>;
> +       clock-frequency = <25000000>;
> +};
> +
> +i2c-master-node {
> +
> +       /* IDT 5P49V5923B i2c clock generator */
> +       vc5: clock-generator@6a {
> +               compatible = "idt,5p49v5923b";
> +               reg = <0x6a>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #clock-cells = <1>;
> +
> +               /* Connect XIN input to 25MHz reference */
> +               clocks = <&ref25m>;
> +               clock-names = "xin";
> +       };
> +};
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6a8ac04..9160e67 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -198,6 +198,16 @@ config COMMON_CLK_OXNAS
>         ---help---
>           Support for the OXNAS SoC Family clocks.
>
> +config COMMON_CLK_VC5
> +       tristate "Clock driver for IDT VersaClock5 devices"
> +       depends on I2C
> +       depends on OF
> +       select REGMAP_I2C
> +       help
> +       ---help---
> +         This driver supports the IDT VersaClock5 programmable clock
> +         generator.
> +
>  source "drivers/clk/bcm/Kconfig"
>  source "drivers/clk/hisilicon/Kconfig"
>  source "drivers/clk/mediatek/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 925081e..e0754d9 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_ARCH_TANGO)              += clk-tango4.o
>  obj-$(CONFIG_CLK_TWL6040)              += clk-twl6040.o
>  obj-$(CONFIG_ARCH_U300)                        += clk-u300.o
>  obj-$(CONFIG_ARCH_VT8500)              += clk-vt8500.o
> +obj-$(CONFIG_COMMON_CLK_VC5)           += clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)                += clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)         += clk-xgene.o
>
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
> new file mode 100644
> index 0000000..286689d
> --- /dev/null
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -0,0 +1,696 @@
> +/*
> + * Driver for IDT Versaclock 5
> + *
> + * Copyright (C) 2016 Marek Vasut <marek.vasut@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/*
> + * Possible optimizations:
> + * - Support other chips but 5P49V5923B
> + * - Use spread spectrum
> + * - Use integer divider in FOD if applicable
> + * - register OUT0_SEL_I2CB
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/rational.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +/* VersaClock5 registers */
> +#define VC5_OTP_CONTROL                                0x00
> +
> +/* Factory-reserved register block */
> +#define VC5_RSVD_DEVICE_ID                     0x01
> +#define VC5_RSVD_ADC_GAIN_7_0                  0x02
> +#define VC5_RSVD_ADC_GAIN_15_8                 0x03
> +#define VC5_RSVD_ADC_OFFSET_7_0                        0x04
> +#define VC5_RSVD_ADC_OFFSET_15_8               0x05
> +#define VC5_RSVD_TEMPY                         0x06
> +#define VC5_RSVD_OFFSET_TBIN                   0x07
> +#define VC5_RSVD_GAIN                          0x08
> +#define VC5_RSVD_TEST_NP                       0x09
> +#define VC5_RSVD_UNUSED                                0x0a
> +#define VC5_RSVD_BANDGAP_TRIM_UP               0x0b
> +#define VC5_RSVD_BANDGAP_TRIM_DN               0x0c
> +#define VC5_RSVD_CLK_R_12_CLK_AMP_4            0x0d
> +#define VC5_RSVD_CLK_R_34_CLK_AMP_4            0x0e
> +#define VC5_RSVD_CLK_AMP_123                   0x0f
> +
> +/* Configuration register block */
> +#define VC5_PRIM_SRC_SHDN                      0x10
> +#define VC5_PRIM_SRC_SHDN_EN_XTAL              BIT(7)
> +#define VC5_PRIM_SRC_SHDN_EN_CLKIN             BIT(6)
> +#define VC5_PRIM_SRC_SHDN_SP                   BIT(1)
> +#define VC5_PRIM_SRC_SHDN_EN_GBL_SHDN          BIT(0)
> +
> +#define VC5_VCO_BAND                           0x11
> +#define VC5_XTAL_X1_LOAD_CAP                   0x12
> +#define VC5_XTAL_X2_LOAD_CAP                   0x13
> +#define VC5_REF_DIVIDER                                0x15
> +#define VC5_REF_DIVIDER_SEL_PREDIV2            BIT(7)
> +#define VC5_REF_DIVIDER_REF_DIV(n)             ((n) & 0x3f)
> +
> +#define VC5_VCO_CTRL_AND_PREDIV                        0x16
> +#define VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV  BIT(7)
> +
> +#define VC5_FEEDBACK_INT_DIV                   0x17
> +#define VC5_FEEDBACK_INT_DIV_BITS              0x18
> +#define VC5_FEEDBACK_FRAC_DIV(n)               (0x19 + (n))
> +#define VC5_RC_CONTROL0                                0x1e
> +#define VC5_RC_CONTROL1                                0x1f
> +/* Register 0x20 is factory reserved */
> +
> +/* Output divider control for divider 1,2,3,4 */
> +#define VC5_OUT_DIV_CONTROL(idx)       (0x21 + ((idx) * 0x10))
> +#define VC5_OUT_DIV_CONTROL_RESET      BIT(7)
> +#define VC5_OUT_DIV_CONTROL_SELB_NORM  BIT(3)
> +#define VC5_OUT_DIV_CONTROL_SEL_EXT    BIT(2)
> +#define VC5_OUT_DIV_CONTROL_INT_MODE   BIT(1)
> +#define VC5_OUT_DIV_CONTROL_EN_FOD     BIT(0)
> +
> +#define VC5_OUT_DIV_FRAC(idx, n)       (0x22 + ((idx) * 0x10) + (n))
> +#define VC5_OUT_DIV_FRAC4_OD_SCEE      BIT(1)
> +
> +#define VC5_OUT_DIV_STEP_SPREAD(idx, n)        (0x26 + ((idx) * 0x10) + (n))
> +#define VC5_OUT_DIV_SPREAD_MOD(idx, n) (0x29 + ((idx) * 0x10) + (n))
> +#define VC5_OUT_DIV_SKEW_INT(idx, n)   (0x2b + ((idx) * 0x10) + (n))
> +#define VC5_OUT_DIV_INT(idx, n)                (0x2d + ((idx) * 0x10) + (n))
> +#define VC5_OUT_DIV_SKEW_FRAC(idx)     (0x2f + ((idx) * 0x10))
> +/* Register 0x30, 0x40, 0x50 is factory reserved */
> +
> +/* Clock control register for clock 1,2 */
> +#define VC5_CLK_OUTPUT_CFG(idx, n)     (0x60 + ((idx) * 0x2) + (n))
> +#define VC5_CLK_OUTPUT_CFG1_EN_CLKBUF  BIT(0)
> +
> +#define VC5_CLK_OE_SHDN                                0x68
> +#define VC5_CLK_OS_SHDN                                0x69
> +
> +/* PLL/VCO runs between 2.5 GHz and 3.0 GHz */
> +#define VC5_PLL_VCO_MIN                                2500000000
> +#define VC5_PLL_VCO_MAX                                3000000000
> +
> +struct vc5_driver_data;
> +
> +struct vc5_hw_data {
> +       struct clk_hw           hw;
> +       struct vc5_driver_data  *vc5;
> +       unsigned long           div_int;
> +       unsigned long           div_frc;
> +       unsigned char           num;
> +};
> +
> +struct vc5_driver_data {
> +       struct i2c_client       *client;
> +       struct regmap           *regmap;
> +
> +       struct clk              *pin_xin;
> +       const char              *pin_xin_name;
> +       struct clk_hw           clk_xin;
> +       struct clk              *pin_clkin;
> +       const char              *pin_clkin_name;
> +       struct clk_hw           clk_clkin;
> +       unsigned char           clk_mux_ins;
> +       struct clk_hw           clk_mux;
> +       struct vc5_hw_data      clk_pll;
> +       struct vc5_hw_data      clk_fod[2];
> +       struct vc5_hw_data      clk_out[3];
> +};
> +
> +static const char * const vc5_input_names[] = {
> +       "xin", "clkin"
> +};
> +
> +static const char * const vc5_pll_names[] = {
> +       "pll"
> +};
> +
> +static const char * const vc5_mux_names[] = {
> +       "mux"
> +};
> +
> +static const char * const vc5_fod_names[] = {
> +       "fod0", "fod1"
> +};
> +
> +static const char * const vc5_clk_out_names[] = {
> +       "out0_sel_i2cb", "out1", "out2"
> +};
> +
> +/*
> + * VersaClock5 i2c regmap
> + */
> +static bool vc5_regmap_is_writeable(struct device *dev, unsigned int reg)
> +{
> +       /* Factory reserved regs, make them read-only */
> +       if (reg >= 0 && reg <= 0xf)
> +               return false;
> +
> +       /* Factory reserved regs, make them read-only */
> +       if (reg == 0x14 || reg == 0x1c || reg == 0x1d)
> +               return false;
> +
> +       return true;
> +}
> +
> +static const struct regmap_config vc5_regmap_config = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +       .cache_type = REGCACHE_RBTREE,
> +       .max_register = 0x69,
> +       .writeable_reg = vc5_regmap_is_writeable,
> +};
> +
> +/*
> + * VersaClock5 input multiplexer between XTAL and CLKIN divider
> + */
> +static unsigned char vc5_mux_get_parent(struct clk_hw *hw)
> +{
> +       struct vc5_driver_data *vc5 =
> +               container_of(hw, struct vc5_driver_data, clk_mux);
> +       const u8 mask = VC5_PRIM_SRC_SHDN_EN_XTAL | VC5_PRIM_SRC_SHDN_EN_CLKIN;
> +       unsigned int src;
> +
> +       regmap_read(vc5->regmap, VC5_PRIM_SRC_SHDN, &src);
> +       src &= mask;
> +
> +       if (src == VC5_PRIM_SRC_SHDN_EN_XTAL)
> +               return 0;
> +
> +       if (src == VC5_PRIM_SRC_SHDN_EN_CLKIN)
> +               return 1;
> +
> +       dev_warn(&vc5->client->dev,
> +                "Invalid clock input configuration (%02x)\n", src);
> +       return 0;
> +}
> +
> +static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct vc5_driver_data *vc5 =
> +               container_of(hw, struct vc5_driver_data, clk_mux);
> +       const u8 mask = VC5_PRIM_SRC_SHDN_EN_XTAL | VC5_PRIM_SRC_SHDN_EN_CLKIN;
> +       u8 src;
> +
> +       if ((index > 1) || !vc5->clk_mux_ins)
> +               return -EINVAL;
> +
> +       if (vc5->clk_mux_ins == (BIT(0) | BIT(1))) {
> +               if (index == 0)
> +                       src = VC5_PRIM_SRC_SHDN_EN_XTAL;
> +               if (index == 1)
> +                       src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
> +       } else {
> +               if (index != 0)
> +                       return -EINVAL;
> +
> +               if (vc5->clk_mux_ins == BIT(0))
> +                       src = VC5_PRIM_SRC_SHDN_EN_XTAL;
> +               if (vc5->clk_mux_ins == BIT(1))
> +                       src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
> +       }
> +
> +       return regmap_update_bits(vc5->regmap, VC5_PRIM_SRC_SHDN, mask, src);
> +}
> +
> +static unsigned long vc5_mux_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       struct vc5_driver_data *vc5 =
> +               container_of(hw, struct vc5_driver_data, clk_mux);
> +       unsigned long idiv;
> +       u8 div;
> +
> +       /* FIXME: Needs locking ? */
> +
> +       /* CLKIN within range of PLL input, feed directly to PLL. */
> +       if (parent_rate <= 50000000) {
> +               regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
> +                                  VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV,
> +                                  VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV);
> +               regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, 0x00);
> +               return parent_rate;
> +       }
> +
> +       idiv = DIV_ROUND_UP(parent_rate, 50000000);
> +       if (idiv > 127)
> +               return -EINVAL;
> +
> +       /* We have dedicated div-2 predivider. */
> +       if (idiv == 2)
> +               div = VC5_REF_DIVIDER_SEL_PREDIV2;
> +       else
> +               div = VC5_REF_DIVIDER_REF_DIV(idiv);
> +
> +       regmap_update_bits(vc5->regmap, VC5_REF_DIVIDER, 0xff, div);
> +       regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
> +                          VC5_VCO_CTRL_AND_PREDIV_BYPASS_PREDIV, 0);
> +
> +       return parent_rate / idiv;
> +}
> +
> +static const struct clk_ops vc5_mux_ops = {
> +       .set_parent     = vc5_mux_set_parent,
> +       .get_parent     = vc5_mux_get_parent,
> +       .recalc_rate    = vc5_mux_recalc_rate,
> +};
> +
> +/*
> + * VersaClock5 PLL/VCO
> + */
> +static unsigned long vc5_pll_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +       u32 div_int, div_frc;
> +       u8 fb[5];
> +
> +       regmap_bulk_read(vc5->regmap, VC5_FEEDBACK_INT_DIV, fb, 5);
> +
> +       div_int = (fb[0] << 4) | (fb[1] >> 4);
> +       div_frc = (fb[2] << 16) | (fb[3] << 8) | fb[4];
> +
> +       /* The PLL divider has 12 integer bits and 24 fractional bits */
> +       return (parent_rate * div_int) + ((parent_rate * div_frc) >> 24);
> +}
> +
> +static long vc5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long *parent_rate)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       unsigned long div_int;
> +       unsigned long long div_frc;
> +
> +       if (rate < VC5_PLL_VCO_MIN)
> +               rate = VC5_PLL_VCO_MIN;
> +       if (rate > VC5_PLL_VCO_MAX)
> +               rate = VC5_PLL_VCO_MAX;
> +
> +       /* Determine integer part, which is 12 bit wide */
> +       div_int = rate / *parent_rate;
> +       if (div_int > 0xfff)
> +               rate = *parent_rate * 0xfff;
> +
> +       /* Determine best fractional part, which is 24 bit wide */
> +       div_frc = rate % *parent_rate;
> +       div_frc *= BIT(24) - 1;
> +       do_div(div_frc, *parent_rate);
> +
> +       hwdata->div_int = div_int;
> +       hwdata->div_frc = (unsigned long)div_frc;
> +
> +       return (*parent_rate * div_int) + ((*parent_rate * div_frc) >> 24);
> +}
> +
> +static int vc5_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +                           unsigned long parent_rate)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +       u8 fb[5];
> +
> +       fb[0] = hwdata->div_int >> 4;
> +       fb[1] = hwdata->div_int << 4;
> +       fb[2] = hwdata->div_frc >> 16;
> +       fb[3] = hwdata->div_frc >> 8;
> +       fb[4] = hwdata->div_frc;
> +
> +       return regmap_bulk_write(vc5->regmap, VC5_FEEDBACK_INT_DIV, fb, 5);
> +}
> +
> +static const struct clk_ops vc5_pll_ops = {
> +       .recalc_rate    = vc5_pll_recalc_rate,
> +       .round_rate     = vc5_pll_round_rate,
> +       .set_rate       = vc5_pll_set_rate,
> +};
> +
> +static unsigned long vc5_fod_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +       /* VCO frequency is divided by two before entering FOD */
> +       u64 f_in = parent_rate / 2;
> +       u64 div_int, div_frc;
> +       u8 od_int[2];
> +       u8 od_frc[4];
> +
> +       regmap_bulk_read(vc5->regmap, VC5_OUT_DIV_INT(hwdata->num, 0),
> +                        od_int, 2);
> +       regmap_bulk_read(vc5->regmap, VC5_OUT_DIV_FRAC(hwdata->num, 0),
> +                        od_frc, 4);
> +
> +       div_int = (od_int[0] << 4) | (od_int[1] >> 4);
> +       div_frc = (od_frc[0] << 22) | (od_frc[1] << 14) |
> +                 (od_frc[2] << 6) | (od_frc[3] >> 2);
> +
> +       /* The PLL divider has 12 integer bits and 30 fractional bits */
> +       return div64_u64(f_in << 30ULL, (div_int << 30ULL) + div_frc);
> +}
> +
> +static long vc5_fod_round_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long *parent_rate)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       /* VCO frequency is divided by two before entering FOD */
> +       unsigned long long f_in = *parent_rate / 2;
> +       unsigned long div_int;
> +       unsigned long long div_frc;
> +
> +       /* Determine integer part, which is 12 bit wide */
> +       div_int = f_in / rate;
> +       /*
> +        * WARNING: The clock chip does not output signal if the integer part
> +        *          of the divider is 0xfff and fractional part is non-zero.
> +        *          Clamp the divider at 0xffe to keep the code simple.
> +        */
> +       if (div_int > 0xffe) {
> +               div_int = 0xffe;
> +               rate = f_in / div_int;
> +       }
> +
> +       /* Determine best fractional part, which is 30 bit wide */
> +       div_frc = f_in % rate;
> +       div_frc *= BIT(30) - 1;
> +       do_div(div_frc, rate);
> +
> +       hwdata->div_int = div_int;
> +       hwdata->div_frc = (unsigned long)div_frc;
> +
> +       return div64_u64(f_in << 30ULL, (div_int << 30ULL) + div_frc);
> +}
> +
> +static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
> +                           unsigned long parent_rate)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +       u8 od_int[2];
> +       u8 od_frc[4];
> +
> +       od_int[0] = hwdata->div_int >> 4;
> +       od_int[1] = hwdata->div_int << 4;
> +       od_frc[0] = hwdata->div_frc >> 22;
> +       od_frc[1] = hwdata->div_frc >> 14;
> +       od_frc[2] = hwdata->div_frc >> 6;
> +       od_frc[3] = hwdata->div_frc << 2;
> +
> +       regmap_bulk_write(vc5->regmap, VC5_OUT_DIV_INT(hwdata->num, 0),
> +                         od_int, 2);
> +       regmap_bulk_write(vc5->regmap, VC5_OUT_DIV_FRAC(hwdata->num, 0),
> +                         od_frc, 4);
> +       return 0;
> +}
> +
> +static const struct clk_ops vc5_fod_ops = {
> +       .recalc_rate    = vc5_fod_recalc_rate,
> +       .round_rate     = vc5_fod_round_rate,
> +       .set_rate       = vc5_fod_set_rate,
> +};
> +
> +static int vc5_clk_out_prepare(struct clk_hw *hw)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +
> +       /* Enable the clock buffer */
> +       regmap_update_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
> +                          VC5_CLK_OUTPUT_CFG1_EN_CLKBUF,
> +                          VC5_CLK_OUTPUT_CFG1_EN_CLKBUF);
> +       return 0;
> +}
> +
> +static void vc5_clk_out_unprepare(struct clk_hw *hw)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +
> +       /* Enable the clock buffer */
> +       regmap_update_bits(vc5->regmap, VC5_CLK_OUTPUT_CFG(hwdata->num, 1),
> +                          VC5_CLK_OUTPUT_CFG1_EN_CLKBUF, 0);
> +}
> +
> +static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +       const u8 mask = VC5_OUT_DIV_CONTROL_SELB_NORM |
> +                       VC5_OUT_DIV_CONTROL_SEL_EXT |
> +                       VC5_OUT_DIV_CONTROL_EN_FOD;
> +       const u8 fodclkmask = VC5_OUT_DIV_CONTROL_SELB_NORM |
> +                             VC5_OUT_DIV_CONTROL_EN_FOD;
> +       const u8 extclk = VC5_OUT_DIV_CONTROL_SELB_NORM |
> +                         VC5_OUT_DIV_CONTROL_SEL_EXT;
> +       unsigned int src;
> +
> +       regmap_read(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num), &src);
> +       src &= mask;
> +
> +       if ((src & fodclkmask) == VC5_OUT_DIV_CONTROL_EN_FOD)
> +               return 0;
> +
> +       if (src == extclk)
> +               return 1;
> +
> +       dev_warn(&vc5->client->dev,
> +                "Invalid clock output configuration (%02x)\n", src);
> +       return 0;
> +}
> +
> +static int vc5_clk_out_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct vc5_hw_data *hwdata = container_of(hw, struct vc5_hw_data, hw);
> +       struct vc5_driver_data *vc5 = hwdata->vc5;
> +       const u8 mask = VC5_OUT_DIV_CONTROL_RESET |
> +                       VC5_OUT_DIV_CONTROL_SELB_NORM |
> +                       VC5_OUT_DIV_CONTROL_SEL_EXT |
> +                       VC5_OUT_DIV_CONTROL_EN_FOD;
> +       const u8 extclk = VC5_OUT_DIV_CONTROL_SELB_NORM |
> +                         VC5_OUT_DIV_CONTROL_SEL_EXT;
> +       u8 src = VC5_OUT_DIV_CONTROL_RESET;
> +
> +       if (index == 0)
> +               src |= VC5_OUT_DIV_CONTROL_EN_FOD;
> +       else if (index == 1)
> +               src |= extclk;
> +       else
> +               return -EINVAL;
> +
> +       return regmap_update_bits(vc5->regmap, VC5_OUT_DIV_CONTROL(hwdata->num),
> +                                 mask, src);
> +}
> +
> +static const struct clk_ops vc5_clk_out_ops = {
> +       .prepare        = vc5_clk_out_prepare,
> +       .unprepare      = vc5_clk_out_unprepare,
> +       .set_parent     = vc5_clk_out_set_parent,
> +       .get_parent     = vc5_clk_out_get_parent,
> +};
> +
> +static struct clk_hw *
> +vc5_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct vc5_driver_data *vc5 = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx >= 2) {
> +               pr_err("%s: invalid index %u\n", __func__, idx);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return &vc5->clk_out[idx].hw;
> +}
> +
> +static int vc5_probe(struct i2c_client *client,
> +                           const struct i2c_device_id *id)
> +{
> +       struct vc5_driver_data *vc5;
> +       struct clk_init_data init;
> +       const char *parent_names[2];
> +       int ret, n;
> +
> +       vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
> +       if (vc5 == NULL)
> +               return -ENOMEM;
> +
> +       i2c_set_clientdata(client, vc5);
> +       vc5->client = client;
> +
> +       vc5->pin_xin = devm_clk_get(&client->dev, "xin");
> +       if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +
> +       vc5->pin_clkin = devm_clk_get(&client->dev, "clkin");
> +       if (PTR_ERR(vc5->pin_clkin) == -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +
> +       vc5->regmap = devm_regmap_init_i2c(client, &vc5_regmap_config);
> +       if (IS_ERR(vc5->regmap)) {
> +               dev_err(&client->dev, "failed to allocate register map\n");
> +               return PTR_ERR(vc5->regmap);
> +       }
> +
> +       if (!IS_ERR(vc5->pin_xin)) {
> +               clk_prepare_enable(vc5->pin_xin);
> +               vc5->pin_xin_name = __clk_get_name(vc5->pin_xin);
> +               vc5->clk_mux_ins |= BIT(0);
> +       }
> +
> +       if (!IS_ERR(vc5->pin_clkin)) {
> +               clk_prepare_enable(vc5->pin_clkin);
> +               vc5->pin_clkin_name = __clk_get_name(vc5->pin_clkin);
> +               vc5->clk_mux_ins |= BIT(1);
> +       }
> +
> +       if (!vc5->clk_mux_ins) {
> +               dev_err(&client->dev, "no input clock specified!\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Register clock input mux */
> +       memset(&init, 0, sizeof(init));
> +       if (vc5->clk_mux_ins == (BIT(0) | BIT(1))) {
> +               parent_names[0] = vc5->pin_xin_name;
> +               parent_names[1] = vc5->pin_clkin_name;
> +               init.num_parents = 2;
> +       } else if (vc5->clk_mux_ins == BIT(0)) {
> +               parent_names[0] = vc5->pin_xin_name;
> +               init.num_parents = 1;
> +       } else {
> +               parent_names[0] = vc5->pin_clkin_name;
> +               init.num_parents = 1;
> +       }
> +       init.name = vc5_mux_names[0];
> +       init.ops = &vc5_mux_ops;
> +       init.flags = 0;
> +       init.parent_names = parent_names;
> +       vc5->clk_mux.init = &init;
> +       ret = devm_clk_hw_register(&client->dev, &vc5->clk_mux);
> +       if (ret) {
> +               dev_err(&client->dev, "unable to register %s\n", init.name);
> +               goto err_clk;
> +       }
> +
> +       /* Register PLL */
> +       memset(&init, 0, sizeof(init));
> +       init.name = vc5_pll_names[0];
> +       init.ops = &vc5_pll_ops;
> +       init.flags = CLK_SET_RATE_PARENT;
> +       init.parent_names = vc5_mux_names;
> +       init.num_parents = 1;
> +       vc5->clk_pll.num = 0;
> +       vc5->clk_pll.vc5 = vc5;
> +       vc5->clk_pll.hw.init = &init;
> +       ret = devm_clk_hw_register(&client->dev, &vc5->clk_pll.hw);
> +       if (ret) {
> +               dev_err(&client->dev, "unable to register %s\n", init.name);
> +               goto err_clk;
> +       }
> +
> +       /* Register FODs */
> +       for (n = 0; n < 2; n++) {
> +               memset(&init, 0, sizeof(init));
> +               init.name = vc5_fod_names[n];
> +               init.ops = &vc5_fod_ops;
> +               init.flags = CLK_SET_RATE_PARENT;
> +               init.parent_names = vc5_pll_names;
> +               init.num_parents = 1;
> +               vc5->clk_fod[n].num = n;
> +               vc5->clk_fod[n].vc5 = vc5;
> +               vc5->clk_fod[n].hw.init = &init;
> +               ret = devm_clk_hw_register(&client->dev, &vc5->clk_fod[n].hw);
> +               if (ret) {
> +                       dev_err(&client->dev, "unable to register %s\n",
> +                               init.name);
> +                       goto err_clk;
> +               }
> +       }
> +
> +       /* Register OUT1 and OUT2 */
> +       for (n = 0; n < 2; n++) {
> +               parent_names[0] = vc5_fod_names[n];
> +               if (n == 0)
> +                       parent_names[1] = vc5_mux_names[0];
> +               else
> +                       parent_names[1] = vc5_clk_out_names[n];
> +
> +               memset(&init, 0, sizeof(init));
> +               init.name = vc5_clk_out_names[n + 1];
> +               init.ops = &vc5_clk_out_ops;
> +               init.flags = CLK_SET_RATE_PARENT;
> +               init.parent_names = parent_names;
> +               init.num_parents = 2;
> +               vc5->clk_out[n].num = n;
> +               vc5->clk_out[n].vc5 = vc5;
> +               vc5->clk_out[n].hw.init = &init;
> +               ret = devm_clk_hw_register(&client->dev,
> +                                          &vc5->clk_out[n].hw);
> +               if (ret) {
> +                       dev_err(&client->dev, "unable to register %s\n",
> +                               init.name);
> +                       goto err_clk;
> +               }
> +       }
> +
> +       ret = of_clk_add_hw_provider(client->dev.of_node, vc5_of_clk_get, vc5);
> +       if (ret) {
> +               dev_err(&client->dev, "unable to add clk provider\n");
> +               goto err_clk;
> +       }
> +
> +       return 0;
> +
> +err_clk:
> +       if (!IS_ERR(vc5->pin_xin))
> +               clk_disable_unprepare(vc5->pin_xin);
> +       if (!IS_ERR(vc5->pin_clkin))
> +               clk_disable_unprepare(vc5->pin_clkin);
> +       return ret;
> +}
> +
> +
> +static const struct i2c_device_id vc5_id[] = {
> +       { "5p49v5923b", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, vc5_id);
> +
> +static const struct of_device_id clk_vc5_of_match[] = {
> +       { .compatible = "idt,5p49v5923b" },
> +       { },
> +};
> +
> +MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
> +
> +static struct i2c_driver vc5_driver = {
> +       .driver = {
> +               .name = "vc5",
> +               .of_match_table = clk_vc5_of_match,
> +       },
> +       .probe          = vc5_probe,
> +       .id_table       = vc5_id,
> +};
> +
> +module_i2c_driver(vc5_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marek.vasut@gmail.com>");
> +MODULE_DESCRIPTION("IDT VersaClock 5 driver");
> +MODULE_LICENSE("GPL");
> --
> 2.10.2

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

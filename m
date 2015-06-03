Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Paul Burton <paul.burton@imgtec.com>,  linux-mips@linux-mips.org
From: Michael Turquette <mturquette@linaro.org>
In-Reply-To: <1432480307-23789-31-git-send-email-paul.burton@imgtec.com>
Cc: "Paul Burton" <paul.burton@imgtec.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Ralf Baechle" <ralf@linux-mips.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
 <1432480307-23789-31-git-send-email-paul.burton@imgtec.com>
Message-ID: <20150603233200.6017.91687@quantum>
Subject: Re: [PATCH v5 30/37] clk: ingenic: add JZ4780 CGU support
Date: Wed, 03 Jun 2015 16:32:00 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Burton (2015-05-24 08:11:40)
> Add support for the clocks provided by the CGU in the Ingenic JZ4780
> SoC, making use of the SoC-agnostic CGU code to do the heavy lifting.
> =

> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Co-authored-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-mips@linux-mips.org

For patches 24-30:

Acked-by: Michael Turquette <mturquette@linaro.org>

Are you wanting to take this all through the same tree, or are you happy
for the clock patches to get picked into clk-next?

Regards,
Mike

> ---
> =

> Changes in v5:
> - Declare jz4780_otg_phy_ops static.
> - Drop setting the parent of the UHC clock during probe - USB isn't
>   supported as of this patchset anyway, so it can be dealt with in
>   whatever's deemed the best way later.
> =

> Changes in v4:
> - Return on ingenic_cgu_new or ingenic_cgu_register_clocks failure.
> - Initialise all unused clock parent fields to -1. Zero initialisation
>   works out so long as the common clock framework only ever attempts
>   to set a parent clock that was specified in the parent array (which
>   is OK), and so long as the hardware state is always valid according
>   to the clock description (which is hopefully OK). Initialising to -1
>   makes sense for resilience should the latter ever not be the case,
>   and to avoid that bit of implicit magic knowledge.
> =

> Changes in v3:
> - Rebase.
> =

> Changes in v2:
> - Remove FSF address per checkpatch (ZubairLK).
> =

>  drivers/clk/ingenic/Makefile     |   1 +
>  drivers/clk/ingenic/jz4780-cgu.c | 733 +++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 734 insertions(+)
>  create mode 100644 drivers/clk/ingenic/jz4780-cgu.c
> =

> diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
> index e6db7da..cd47b06 100644
> --- a/drivers/clk/ingenic/Makefile
> +++ b/drivers/clk/ingenic/Makefile
> @@ -1,2 +1,3 @@
>  obj-y                          +=3D cgu.o
>  obj-$(CONFIG_MACH_JZ4740)      +=3D jz4740-cgu.o
> +obj-$(CONFIG_MACH_JZ4780)      +=3D jz4780-cgu.o
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz478=
0-cgu.c
> new file mode 100644
> index 0000000..431f962
> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -0,0 +1,733 @@
> +/*
> + * Ingenic JZ4780 SoC CGU driver
> + *
> + * Copyright (c) 2013-2015 Imagination Technologies
> + * Author: Paul Burton <paul.burton@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <dt-bindings/clock/jz4780-cgu.h>
> +#include "cgu.h"
> +
> +/* CGU register offsets */
> +#define CGU_REG_CLOCKCONTROL   0x00
> +#define CGU_REG_PLLCONTROL     0x0c
> +#define CGU_REG_APLL           0x10
> +#define CGU_REG_MPLL           0x14
> +#define CGU_REG_EPLL           0x18
> +#define CGU_REG_VPLL           0x1c
> +#define CGU_REG_CLKGR0         0x20
> +#define CGU_REG_OPCR           0x24
> +#define CGU_REG_CLKGR1         0x28
> +#define CGU_REG_DDRCDR         0x2c
> +#define CGU_REG_VPUCDR         0x30
> +#define CGU_REG_USBPCR         0x3c
> +#define CGU_REG_USBRDT         0x40
> +#define CGU_REG_USBVBFIL       0x44
> +#define CGU_REG_USBPCR1                0x48
> +#define CGU_REG_LP0CDR         0x54
> +#define CGU_REG_I2SCDR         0x60
> +#define CGU_REG_LP1CDR         0x64
> +#define CGU_REG_MSC0CDR                0x68
> +#define CGU_REG_UHCCDR         0x6c
> +#define CGU_REG_SSICDR         0x74
> +#define CGU_REG_CIMCDR         0x7c
> +#define CGU_REG_PCMCDR         0x84
> +#define CGU_REG_GPUCDR         0x88
> +#define CGU_REG_HDMICDR                0x8c
> +#define CGU_REG_MSC1CDR                0xa4
> +#define CGU_REG_MSC2CDR                0xa8
> +#define CGU_REG_BCHCDR         0xac
> +#define CGU_REG_CLOCKSTATUS    0xd4
> +
> +/* bits within the OPCR register */
> +#define OPCR_SPENDN0           (1 << 7)
> +#define OPCR_SPENDN1           (1 << 6)
> +
> +/* bits within the USBPCR register */
> +#define USBPCR_USB_MODE                BIT(31)
> +#define USBPCR_IDPULLUP_MASK   (0x3 << 28)
> +#define USBPCR_COMMONONN       BIT(25)
> +#define USBPCR_VBUSVLDEXT      BIT(24)
> +#define USBPCR_VBUSVLDEXTSEL   BIT(23)
> +#define USBPCR_POR             BIT(22)
> +#define USBPCR_OTG_DISABLE     BIT(20)
> +#define USBPCR_COMPDISTUNE_MASK        (0x7 << 17)
> +#define USBPCR_OTGTUNE_MASK    (0x7 << 14)
> +#define USBPCR_SQRXTUNE_MASK   (0x7 << 11)
> +#define USBPCR_TXFSLSTUNE_MASK (0xf << 7)
> +#define USBPCR_TXPREEMPHTUNE   BIT(6)
> +#define USBPCR_TXHSXVTUNE_MASK (0x3 << 4)
> +#define USBPCR_TXVREFTUNE_MASK 0xf
> +
> +/* bits within the USBPCR1 register */
> +#define USBPCR1_REFCLKSEL_SHIFT        26
> +#define USBPCR1_REFCLKSEL_MASK (0x3 << USBPCR1_REFCLKSEL_SHIFT)
> +#define USBPCR1_REFCLKSEL_CORE (0x2 << USBPCR1_REFCLKSEL_SHIFT)
> +#define USBPCR1_REFCLKDIV_SHIFT        24
> +#define USBPCR1_REFCLKDIV_MASK (0x3 << USBPCR1_REFCLKDIV_SHIFT)
> +#define USBPCR1_REFCLKDIV_19_2 (0x3 << USBPCR1_REFCLKDIV_SHIFT)
> +#define USBPCR1_REFCLKDIV_48   (0x2 << USBPCR1_REFCLKDIV_SHIFT)
> +#define USBPCR1_REFCLKDIV_24   (0x1 << USBPCR1_REFCLKDIV_SHIFT)
> +#define USBPCR1_REFCLKDIV_12   (0x0 << USBPCR1_REFCLKDIV_SHIFT)
> +#define USBPCR1_USB_SEL                BIT(28)
> +#define USBPCR1_WORD_IF0       BIT(19)
> +#define USBPCR1_WORD_IF1       BIT(18)
> +
> +/* bits within the USBRDT register */
> +#define USBRDT_VBFIL_LD_EN     BIT(25)
> +#define USBRDT_USBRDT_MASK     0x7fffff
> +
> +/* bits within the USBVBFIL register */
> +#define USBVBFIL_IDDIGFIL_SHIFT        16
> +#define USBVBFIL_IDDIGFIL_MASK (0xffff << USBVBFIL_IDDIGFIL_SHIFT)
> +#define USBVBFIL_USBVBFIL_MASK (0xffff)
> +
> +static struct ingenic_cgu *cgu;
> +
> +static u8 jz4780_otg_phy_get_parent(struct clk_hw *hw)
> +{
> +       /* we only use CLKCORE, revisit if that ever changes */
> +       return 0;
> +}
> +
> +static int jz4780_otg_phy_set_parent(struct clk_hw *hw, u8 idx)
> +{
> +       unsigned long flags;
> +       u32 usbpcr1;
> +
> +       if (idx > 0)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&cgu->lock, flags);
> +
> +       usbpcr1 =3D readl(cgu->base + CGU_REG_USBPCR1);
> +       usbpcr1 &=3D ~USBPCR1_REFCLKSEL_MASK;
> +       /* we only use CLKCORE */
> +       usbpcr1 |=3D USBPCR1_REFCLKSEL_CORE;
> +       writel(usbpcr1, cgu->base + CGU_REG_USBPCR1);
> +
> +       spin_unlock_irqrestore(&cgu->lock, flags);
> +       return 0;
> +}
> +
> +static unsigned long jz4780_otg_phy_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       u32 usbpcr1;
> +       unsigned refclk_div;
> +
> +       usbpcr1 =3D readl(cgu->base + CGU_REG_USBPCR1);
> +       refclk_div =3D usbpcr1 & USBPCR1_REFCLKDIV_MASK;
> +
> +       switch (refclk_div) {
> +       case USBPCR1_REFCLKDIV_12:
> +               return 12000000;
> +
> +       case USBPCR1_REFCLKDIV_24:
> +               return 24000000;
> +
> +       case USBPCR1_REFCLKDIV_48:
> +               return 48000000;
> +
> +       case USBPCR1_REFCLKDIV_19_2:
> +               return 19200000;
> +       }
> +
> +       BUG();
> +       return parent_rate;
> +}
> +
> +static long jz4780_otg_phy_round_rate(struct clk_hw *hw, unsigned long r=
eq_rate,
> +                                     unsigned long *parent_rate)
> +{
> +       if (req_rate < 15600000)
> +               return 12000000;
> +
> +       if (req_rate < 21600000)
> +               return 19200000;
> +
> +       if (req_rate < 36000000)
> +               return 24000000;
> +
> +       return 48000000;
> +}
> +
> +static int jz4780_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_=
rate,
> +                                  unsigned long parent_rate)
> +{
> +       unsigned long flags;
> +       u32 usbpcr1, div_bits;
> +
> +       switch (req_rate) {
> +       case 12000000:
> +               div_bits =3D USBPCR1_REFCLKDIV_12;
> +               break;
> +
> +       case 19200000:
> +               div_bits =3D USBPCR1_REFCLKDIV_19_2;
> +               break;
> +
> +       case 24000000:
> +               div_bits =3D USBPCR1_REFCLKDIV_24;
> +               break;
> +
> +       case 48000000:
> +               div_bits =3D USBPCR1_REFCLKDIV_48;
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       spin_lock_irqsave(&cgu->lock, flags);
> +
> +       usbpcr1 =3D readl(cgu->base + CGU_REG_USBPCR1);
> +       usbpcr1 &=3D ~USBPCR1_REFCLKDIV_MASK;
> +       usbpcr1 |=3D div_bits;
> +       writel(usbpcr1, cgu->base + CGU_REG_USBPCR1);
> +
> +       spin_unlock_irqrestore(&cgu->lock, flags);
> +       return 0;
> +}
> +
> +static struct clk_ops jz4780_otg_phy_ops =3D {
> +       .get_parent =3D jz4780_otg_phy_get_parent,
> +       .set_parent =3D jz4780_otg_phy_set_parent,
> +
> +       .recalc_rate =3D jz4780_otg_phy_recalc_rate,
> +       .round_rate =3D jz4780_otg_phy_round_rate,
> +       .set_rate =3D jz4780_otg_phy_set_rate,
> +};
> +
> +static const s8 pll_od_encoding[16] =3D {
> +       0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7,
> +       0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
> +};
> +
> +static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] =3D {
> +
> +       /* External clocks */
> +
> +       [JZ4780_CLK_EXCLK] =3D { "ext", CGU_CLK_EXT },
> +       [JZ4780_CLK_RTCLK] =3D { "rtc", CGU_CLK_EXT },
> +
> +       /* PLLs */
> +
> +#define DEF_PLL(name) { \
> +       .reg =3D CGU_REG_ ## name, \
> +       .m_shift =3D 19, \
> +       .m_bits =3D 13, \
> +       .m_offset =3D 1, \
> +       .n_shift =3D 13, \
> +       .n_bits =3D 6, \
> +       .n_offset =3D 1, \
> +       .od_shift =3D 9, \
> +       .od_bits =3D 4, \
> +       .od_max =3D 16, \
> +       .od_encoding =3D pll_od_encoding, \
> +       .stable_bit =3D 6, \
> +       .bypass_bit =3D 1, \
> +       .enable_bit =3D 0, \
> +}
> +
> +       [JZ4780_CLK_APLL] =3D {
> +               "apll", CGU_CLK_PLL,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .pll =3D DEF_PLL(APLL),
> +       },
> +
> +       [JZ4780_CLK_MPLL] =3D {
> +               "mpll", CGU_CLK_PLL,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .pll =3D DEF_PLL(MPLL),
> +       },
> +
> +       [JZ4780_CLK_EPLL] =3D {
> +               "epll", CGU_CLK_PLL,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .pll =3D DEF_PLL(EPLL),
> +       },
> +
> +       [JZ4780_CLK_VPLL] =3D {
> +               "vpll", CGU_CLK_PLL,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .pll =3D DEF_PLL(VPLL),
> +       },
> +
> +#undef DEF_PLL
> +
> +       /* Custom (SoC-specific) OTG PHY */
> +
> +       [JZ4780_CLK_OTGPHY] =3D {
> +               "otg_phy", CGU_CLK_CUSTOM,
> +               .parents =3D { -1, -1, JZ4780_CLK_EXCLK, -1 },
> +               .custom =3D { &jz4780_otg_phy_ops },
> +       },
> +
> +       /* Muxes & dividers */
> +
> +       [JZ4780_CLK_SCLKA] =3D {
> +               "sclk_a", CGU_CLK_MUX,
> +               .parents =3D { -1, JZ4780_CLK_APLL, JZ4780_CLK_EXCLK,
> +                            JZ4780_CLK_RTCLK },
> +               .mux =3D { CGU_REG_CLOCKCONTROL, 30, 2 },
> +       },
> +
> +       [JZ4780_CLK_CPUMUX] =3D {
> +               "cpumux", CGU_CLK_MUX,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL },
> +               .mux =3D { CGU_REG_CLOCKCONTROL, 28, 2 },
> +       },
> +
> +       [JZ4780_CLK_CPU] =3D {
> +               "cpu", CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_CPUMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_CLOCKCONTROL, 0, 4, 22, -1, -1 },
> +       },
> +
> +       [JZ4780_CLK_L2CACHE] =3D {
> +               "l2cache", CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_CPUMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_CLOCKCONTROL, 4, 4, -1, -1, -1 },
> +       },
> +
> +       [JZ4780_CLK_AHB0] =3D {
> +               "ahb0", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL },
> +               .mux =3D { CGU_REG_CLOCKCONTROL, 26, 2 },
> +               .div =3D { CGU_REG_CLOCKCONTROL, 8, 4, 21, -1, -1 },
> +       },
> +
> +       [JZ4780_CLK_AHB2PMUX] =3D {
> +               "ahb2_apb_mux", CGU_CLK_MUX,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_RTCLK },
> +               .mux =3D { CGU_REG_CLOCKCONTROL, 24, 2 },
> +       },
> +
> +       [JZ4780_CLK_AHB2] =3D {
> +               "ahb2", CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_AHB2PMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_CLOCKCONTROL, 12, 4, 20, -1, -1 },
> +       },
> +
> +       [JZ4780_CLK_PCLK] =3D {
> +               "pclk", CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_AHB2PMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_CLOCKCONTROL, 16, 4, 20, -1, -1 },
> +       },
> +
> +       [JZ4780_CLK_DDR] =3D {
> +               "ddr", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1 =
},
> +               .mux =3D { CGU_REG_DDRCDR, 30, 2 },
> +               .div =3D { CGU_REG_DDRCDR, 0, 4, 29, 28, 27 },
> +       },
> +
> +       [JZ4780_CLK_VPU] =3D {
> +               "vpu", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL, -1 },
> +               .mux =3D { CGU_REG_VPUCDR, 30, 2 },
> +               .div =3D { CGU_REG_VPUCDR, 0, 4, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR1, 2 },
> +       },
> +
> +       [JZ4780_CLK_I2SPLL] =3D {
> +               "i2s_pll", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_EPLL, -1, -1 =
},
> +               .mux =3D { CGU_REG_I2SCDR, 30, 1 },
> +               .div =3D { CGU_REG_I2SCDR, 0, 8, 29, 28, 27 },
> +       },
> +
> +       [JZ4780_CLK_I2S] =3D {
> +               "i2s", CGU_CLK_MUX,
> +               .parents =3D { JZ4780_CLK_EXCLK, JZ4780_CLK_I2SPLL, -1, -=
1 },
> +               .mux =3D { CGU_REG_I2SCDR, 31, 1 },
> +       },
> +
> +       [JZ4780_CLK_LCD0PIXCLK] =3D {
> +               "lcd0pixclk", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_VPLL, -1 },
> +               .mux =3D { CGU_REG_LP0CDR, 30, 2 },
> +               .div =3D { CGU_REG_LP0CDR, 0, 8, 28, 27, 26 },
> +       },
> +
> +       [JZ4780_CLK_LCD1PIXCLK] =3D {
> +               "lcd1pixclk", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_VPLL, -1 },
> +               .mux =3D { CGU_REG_LP1CDR, 30, 2 },
> +               .div =3D { CGU_REG_LP1CDR, 0, 8, 28, 27, 26 },
> +       },
> +
> +       [JZ4780_CLK_MSCMUX] =3D {
> +               "msc_mux", CGU_CLK_MUX,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1 =
},
> +               .mux =3D { CGU_REG_MSC0CDR, 30, 2 },
> +       },
> +
> +       [JZ4780_CLK_MSC0] =3D {
> +               "msc0", CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_MSCMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_MSC0CDR, 0, 8, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR0, 3 },
> +       },
> +
> +       [JZ4780_CLK_MSC1] =3D {
> +               "msc1", CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_MSCMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_MSC1CDR, 0, 8, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR0, 11 },
> +       },
> +
> +       [JZ4780_CLK_MSC2] =3D {
> +               "msc2", CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_MSCMUX, -1, -1, -1 },
> +               .div =3D { CGU_REG_MSC2CDR, 0, 8, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR0, 12 },
> +       },
> +
> +       [JZ4780_CLK_UHC] =3D {
> +               "uhc", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL, JZ4780_CLK_OTGPHY },
> +               .mux =3D { CGU_REG_UHCCDR, 30, 2 },
> +               .div =3D { CGU_REG_UHCCDR, 0, 8, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR0, 24 },
> +       },
> +
> +       [JZ4780_CLK_SSIPLL] =3D {
> +               "ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1, -1 =
},
> +               .mux =3D { CGU_REG_SSICDR, 30, 1 },
> +               .div =3D { CGU_REG_SSICDR, 0, 8, 29, 28, 27 },
> +       },
> +
> +       [JZ4780_CLK_SSI] =3D {
> +               "ssi", CGU_CLK_MUX,
> +               .parents =3D { JZ4780_CLK_EXCLK, JZ4780_CLK_SSIPLL, -1, -=
1 },
> +               .mux =3D { CGU_REG_SSICDR, 31, 1 },
> +       },
> +
> +       [JZ4780_CLK_CIMMCLK] =3D {
> +               "cim_mclk", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1, -1 =
},
> +               .mux =3D { CGU_REG_CIMCDR, 31, 1 },
> +               .div =3D { CGU_REG_CIMCDR, 0, 8, 30, 29, 28 },
> +       },
> +
> +       [JZ4780_CLK_PCMPLL] =3D {
> +               "pcm_pll", CGU_CLK_MUX | CGU_CLK_DIV,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL, JZ4780_CLK_VPLL },
> +               .mux =3D { CGU_REG_PCMCDR, 29, 2 },
> +               .div =3D { CGU_REG_PCMCDR, 0, 8, 28, 27, 26 },
> +       },
> +
> +       [JZ4780_CLK_PCM] =3D {
> +               "pcm", CGU_CLK_MUX | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, JZ4780_CLK_PCMPLL, -1, -=
1 },
> +               .mux =3D { CGU_REG_PCMCDR, 31, 1 },
> +               .gate =3D { CGU_REG_CLKGR1, 3 },
> +       },
> +
> +       [JZ4780_CLK_GPU] =3D {
> +               "gpu", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL },
> +               .mux =3D { CGU_REG_GPUCDR, 30, 2 },
> +               .div =3D { CGU_REG_GPUCDR, 0, 4, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR1, 4 },
> +       },
> +
> +       [JZ4780_CLK_HDMI] =3D {
> +               "hdmi", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_VPLL, -1 },
> +               .mux =3D { CGU_REG_HDMICDR, 30, 2 },
> +               .div =3D { CGU_REG_HDMICDR, 0, 8, 29, 28, 26 },
> +               .gate =3D { CGU_REG_CLKGR1, 9 },
> +       },
> +
> +       [JZ4780_CLK_BCH] =3D {
> +               "bch", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
> +               .parents =3D { -1, JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL,
> +                            JZ4780_CLK_EPLL },
> +               .mux =3D { CGU_REG_BCHCDR, 30, 2 },
> +               .div =3D { CGU_REG_BCHCDR, 0, 4, 29, 28, 27 },
> +               .gate =3D { CGU_REG_CLKGR0, 1 },
> +       },
> +
> +       /* Gate-only clocks */
> +
> +       [JZ4780_CLK_NEMC] =3D {
> +               "nemc", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_AHB2, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 0 },
> +       },
> +
> +       [JZ4780_CLK_OTG0] =3D {
> +               "otg0", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 2 },
> +       },
> +
> +       [JZ4780_CLK_SSI0] =3D {
> +               "ssi0", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_SSI, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 4 },
> +       },
> +
> +       [JZ4780_CLK_SMB0] =3D {
> +               "smb0", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_PCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 5 },
> +       },
> +
> +       [JZ4780_CLK_SMB1] =3D {
> +               "smb1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_PCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 6 },
> +       },
> +
> +       [JZ4780_CLK_SCC] =3D {
> +               "scc", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 7 },
> +       },
> +
> +       [JZ4780_CLK_AIC] =3D {
> +               "aic", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 8 },
> +       },
> +
> +       [JZ4780_CLK_TSSI0] =3D {
> +               "tssi0", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 9 },
> +       },
> +
> +       [JZ4780_CLK_OWI] =3D {
> +               "owi", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 10 },
> +       },
> +
> +       [JZ4780_CLK_KBC] =3D {
> +               "kbc", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 13 },
> +       },
> +
> +       [JZ4780_CLK_SADC] =3D {
> +               "sadc", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 14 },
> +       },
> +
> +       [JZ4780_CLK_UART0] =3D {
> +               "uart0", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 15 },
> +       },
> +
> +       [JZ4780_CLK_UART1] =3D {
> +               "uart1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 16 },
> +       },
> +
> +       [JZ4780_CLK_UART2] =3D {
> +               "uart2", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 17 },
> +       },
> +
> +       [JZ4780_CLK_UART3] =3D {
> +               "uart3", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 18 },
> +       },
> +
> +       [JZ4780_CLK_SSI1] =3D {
> +               "ssi1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_SSI, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 19 },
> +       },
> +
> +       [JZ4780_CLK_SSI2] =3D {
> +               "ssi2", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_SSI, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 20 },
> +       },
> +
> +       [JZ4780_CLK_PDMA] =3D {
> +               "pdma", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 21 },
> +       },
> +
> +       [JZ4780_CLK_GPS] =3D {
> +               "gps", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 22 },
> +       },
> +
> +       [JZ4780_CLK_MAC] =3D {
> +               "mac", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 23 },
> +       },
> +
> +       [JZ4780_CLK_SMB2] =3D {
> +               "smb2", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_PCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 24 },
> +       },
> +
> +       [JZ4780_CLK_CIM] =3D {
> +               "cim", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 26 },
> +       },
> +
> +       [JZ4780_CLK_LCD] =3D {
> +               "lcd", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 28 },
> +       },
> +
> +       [JZ4780_CLK_TVE] =3D {
> +               "tve", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_LCD, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 27 },
> +       },
> +
> +       [JZ4780_CLK_IPU] =3D {
> +               "ipu", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 29 },
> +       },
> +
> +       [JZ4780_CLK_DDR0] =3D {
> +               "ddr0", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_DDR, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 30 },
> +       },
> +
> +       [JZ4780_CLK_DDR1] =3D {
> +               "ddr1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_DDR, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR0, 31 },
> +       },
> +
> +       [JZ4780_CLK_SMB3] =3D {
> +               "smb3", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_PCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 0 },
> +       },
> +
> +       [JZ4780_CLK_TSSI1] =3D {
> +               "tssi1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 1 },
> +       },
> +
> +       [JZ4780_CLK_COMPRESS] =3D {
> +               "compress", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 5 },
> +       },
> +
> +       [JZ4780_CLK_AIC1] =3D {
> +               "aic1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 6 },
> +       },
> +
> +       [JZ4780_CLK_GPVLC] =3D {
> +               "gpvlc", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 7 },
> +       },
> +
> +       [JZ4780_CLK_OTG1] =3D {
> +               "otg1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 8 },
> +       },
> +
> +       [JZ4780_CLK_UART4] =3D {
> +               "uart4", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 10 },
> +       },
> +
> +       [JZ4780_CLK_AHBMON] =3D {
> +               "ahb_mon", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 11 },
> +       },
> +
> +       [JZ4780_CLK_SMB4] =3D {
> +               "smb4", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_PCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 12 },
> +       },
> +
> +       [JZ4780_CLK_DES] =3D {
> +               "des", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 13 },
> +       },
> +
> +       [JZ4780_CLK_X2D] =3D {
> +               "x2d", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_EXCLK, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 14 },
> +       },
> +
> +       [JZ4780_CLK_CORE1] =3D {
> +               "core1", CGU_CLK_GATE,
> +               .parents =3D { JZ4780_CLK_CPU, -1, -1, -1 },
> +               .gate =3D { CGU_REG_CLKGR1, 15 },
> +       },
> +
> +};
> +
> +static void __init jz4780_cgu_init(struct device_node *np)
> +{
> +       int retval;
> +
> +       cgu =3D ingenic_cgu_new(jz4780_cgu_clocks,
> +                             ARRAY_SIZE(jz4780_cgu_clocks), np);
> +       if (!cgu) {
> +               pr_err("%s: failed to initialise CGU\n", __func__);
> +               return;
> +       }
> +
> +       retval =3D ingenic_cgu_register_clocks(cgu);
> +       if (retval) {
> +               pr_err("%s: failed to register CGU Clocks\n", __func__);
> +               return;
> +       }
> +}
> +CLK_OF_DECLARE(jz4780_cgu, "ingenic,jz4780-cgu", jz4780_cgu_init);
> -- =

> 2.4.1
>=20

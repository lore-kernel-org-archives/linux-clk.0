Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D30C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 08:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3723823333
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 08:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbhAMI0N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 03:26:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:38248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbhAMI0N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Jan 2021 03:26:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B22E23333;
        Wed, 13 Jan 2021 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610526330;
        bh=fvWhujzZk+jY3bf+LHmdOREjJF3z0sKraBMpQ3Gwho0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nBk8osS3JhTv9QV0Y3QH3QsGs0km3Kljp2hnTs4VJdgBOnq4HCy08g2eB4KW0y4ts
         cF01XHXRj32W60P3BVyG/0CAFtZAjBm5r/+CY2k3vYdEPZAGaCjweQ2wNT0cQb5bK4
         ItkdOQ15SQ70OIWjOOsSUnZNVptbXT868fhA1aGbyrYwLzSeD18PQh5mY4OE9uaeoL
         6jrzTDnEF9BPejphcPKy7N+toSnyqnHo2R3LPgLFS8u3GFfAdYyiAkJZCnoaL5i8Vp
         JpNCyzunRXMLDiZB1BCbPyjpXLOoPotStX0JZVYi9NRstWcEHiE50PiWEszKhbpVxS
         JMtmyFDfOkDMA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210112010238.200241-1-damien.lemoal@wdc.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Wed, 13 Jan 2021 00:25:28 -0800
Message-ID: <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2021-01-11 17:02:38)
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
>=20
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. This driver is also automatically selected
> for compilation with the selection of SOC_CANAAN.

That's stated twice.

> The sysctl driver
> retains the SOC early initialization code, but the implementation now
> relies on the new function k210_clk_early_init() provided by the new
> clk-k210 driver.
>=20
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  MAINTAINERS                      |    1 +
>  drivers/clk/Kconfig              |    8 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/clk-k210.c           | 1005 ++++++++++++++++++++++++++++++
>  drivers/soc/canaan/Kconfig       |   18 +-
>  drivers/soc/canaan/Makefile      |    2 +-
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>  include/soc/canaan/k210-sysctl.h |    2 +
>  8 files changed, 1064 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/clk/clk-k210.c

I'm not sure how/if this can be merged through clk tree given that it
deletes code from drivers/soc/

What's the merge strategy?

>=20
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> new file mode 100644
> index 000000000000..1d528395527c
> --- /dev/null
> +++ b/drivers/clk/clk-k210.c
> @@ -0,0 +1,1005 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +#define pr_fmt(fmt)     "k210-clk: " fmt
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <asm/soc.h>
> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/clock/k210-clk.h>
> +
> +/*
> + * Clocks parameters.
> + */
> +struct k210_clk_cfg {
> +       const char *name;
> +       u8 gate_reg;
> +       u8 gate_bit;
> +       u8 div_reg;
> +       u8 div_shift;
> +       u8 div_width;
> +       u8 div_type;
> +       u8 mux_reg;
> +       u8 mux_bit;
> +};
> +
> +enum k210_clk_div_type {
> +       K210_DIV_NONE,
> +       K210_DIV_ONE_BASED,
> +       K210_DIV_DOUBLE_ONE_BASED,
> +       K210_DIV_POWER_OF_TWO,
> +};
> +
> +#define K210_GATE(_reg, _bit)  \
> +       .gate_reg =3D (_reg),     \
> +       .gate_bit =3D (_bit)
> +#define K210_DIV(_reg, _shift, _width, _type)  \
> +       .div_reg =3D (_reg),                      \
> +       .div_shift =3D (_shift),                  \
> +       .div_width =3D (_width),                  \
> +       .div_type =3D (_type)
> +#define K210_MUX(_reg, _bit)   \
> +       .mux_reg =3D (_reg),      \
> +       .mux_bit =3D (_bit)
> +
> +static struct k210_clk_cfg k210_clks[K210_NUM_CLKS] =3D {
> +
> +       /* Gated clocks, no mux, no divider */
> +       [K210_CLK_CPU] =3D {
> +               .name =3D "cpu",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 0)
> +       },
> +       [K210_CLK_DMA] =3D {
> +               .name =3D "dma",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 1)
> +       },
> +       [K210_CLK_FFT] =3D {
> +               .name =3D "fft",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 4)
> +       },
> +       [K210_CLK_GPIO] =3D {
> +               .name =3D "gpio",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 5)
> +       },
> +       [K210_CLK_UART1] =3D {
> +               .name =3D "uart1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 16)
> +       },
> +       [K210_CLK_UART2] =3D {
> +               .name =3D "uart2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 17)
> +       },
> +       [K210_CLK_UART3] =3D {
> +               .name =3D "uart3",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 18)
> +       },
> +       [K210_CLK_FPIOA] =3D {
> +               .name =3D "fpioa",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 20)
> +       },
> +       [K210_CLK_SHA] =3D {
> +               .name =3D "sha",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 26)
> +       },
> +       [K210_CLK_AES] =3D {
> +               .name =3D "aes",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 19)
> +       },
> +       [K210_CLK_OTP] =3D {
> +               .name =3D "otp",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 27)
> +       },
> +       [K210_CLK_RTC] =3D {
> +               .name =3D "rtc",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 29)
> +       },
> +
> +       /* Gated divider clocks */
> +       [K210_CLK_SRAM0] =3D {
> +               .name =3D "sram0",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 1),
> +               K210_DIV(K210_SYSCTL_THR0, 0, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_SRAM1] =3D {
> +               .name =3D "sram1",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 2),
> +               K210_DIV(K210_SYSCTL_THR0, 4, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_ROM] =3D {
> +               .name =3D "rom",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 0),
> +               K210_DIV(K210_SYSCTL_THR0, 16, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_DVP] =3D {
> +               .name =3D "dvp",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 3),
> +               K210_DIV(K210_SYSCTL_THR0, 12, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB0] =3D {
> +               .name =3D "apb0",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 3),
> +               K210_DIV(K210_SYSCTL_SEL0, 3, 3, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB1] =3D {
> +               .name =3D "apb1",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 4),
> +               K210_DIV(K210_SYSCTL_SEL0, 6, 3, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB2] =3D {
> +               .name =3D "apb2",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 5),
> +               K210_DIV(K210_SYSCTL_SEL0, 9, 3, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_AI] =3D {
> +               .name =3D "ai",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 2),
> +               K210_DIV(K210_SYSCTL_THR0, 8, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_SPI0] =3D {
> +               .name =3D "spi0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 6),
> +               K210_DIV(K210_SYSCTL_THR1, 0, 8, K210_DIV_DOUBLE_ONE_BASE=
D)
> +       },
> +       [K210_CLK_SPI1] =3D {
> +               .name =3D "spi1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 7),
> +               K210_DIV(K210_SYSCTL_THR1, 8, 8, K210_DIV_DOUBLE_ONE_BASE=
D)
> +       },
> +       [K210_CLK_SPI2] =3D {
> +               .name =3D "spi2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 8),
> +               K210_DIV(K210_SYSCTL_THR1, 16, 8, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +       [K210_CLK_I2C0] =3D {
> +               .name =3D "i2c0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 13),
> +               K210_DIV(K210_SYSCTL_THR5, 8, 8, K210_DIV_DOUBLE_ONE_BASE=
D)
> +       },
> +       [K210_CLK_I2C1] =3D {
> +               .name =3D "i2c1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 14),
> +               K210_DIV(K210_SYSCTL_THR5, 16, 8, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +       [K210_CLK_I2C2] =3D {
> +               .name =3D "i2c2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 15),
> +               K210_DIV(K210_SYSCTL_THR5, 24, 8, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +       [K210_CLK_WDT0] =3D {
> +               .name =3D "wdt0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 24),
> +               K210_DIV(K210_SYSCTL_THR6, 0, 8, K210_DIV_DOUBLE_ONE_BASE=
D)
> +       },
> +       [K210_CLK_WDT1] =3D {
> +               .name =3D "wdt1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 25),
> +               K210_DIV(K210_SYSCTL_THR6, 8, 8, K210_DIV_DOUBLE_ONE_BASE=
D)
> +       },
> +       [K210_CLK_I2S0] =3D {
> +               .name =3D "i2s0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 10),
> +               K210_DIV(K210_SYSCTL_THR3, 0, 16, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +       [K210_CLK_I2S1] =3D {
> +               .name =3D "i2s1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 11),
> +               K210_DIV(K210_SYSCTL_THR3, 16, 16, K210_DIV_DOUBLE_ONE_BA=
SED)
> +       },
> +       [K210_CLK_I2S2] =3D {
> +               .name =3D "i2s2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 12),
> +               K210_DIV(K210_SYSCTL_THR4, 0, 16, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +
> +       /* Divider clocks, no gate, no mux */
> +       [K210_CLK_I2S0_M] =3D {
> +               .name =3D "i2s0_m",
> +               K210_DIV(K210_SYSCTL_THR4, 16, 8, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +       [K210_CLK_I2S1_M] =3D {
> +               .name =3D "i2s1_m",
> +               K210_DIV(K210_SYSCTL_THR4, 24, 8, K210_DIV_DOUBLE_ONE_BAS=
ED)
> +       },
> +       [K210_CLK_I2S2_M] =3D {
> +               .name =3D "i2s2_m",
> +               K210_DIV(K210_SYSCTL_THR4, 0, 8, K210_DIV_DOUBLE_ONE_BASE=
D)
> +       },
> +
> +       /* Muxed gated divider clocks */
> +       [K210_CLK_SPI3] =3D {
> +               .name =3D "spi3",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 9),
> +               K210_DIV(K210_SYSCTL_THR1, 24, 8, K210_DIV_DOUBLE_ONE_BAS=
ED),
> +               K210_MUX(K210_SYSCTL_SEL0, 12)
> +       },
> +       [K210_CLK_TIMER0] =3D {
> +               .name =3D "timer0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 21),
> +               K210_DIV(K210_SYSCTL_THR2,  0, 8, K210_DIV_DOUBLE_ONE_BAS=
ED),
> +               K210_MUX(K210_SYSCTL_SEL0, 13)
> +       },
> +       [K210_CLK_TIMER1] =3D {
> +               .name =3D "timer1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 22),
> +               K210_DIV(K210_SYSCTL_THR2, 8, 8, K210_DIV_DOUBLE_ONE_BASE=
D),
> +               K210_MUX(K210_SYSCTL_SEL0, 14)
> +       },
> +       [K210_CLK_TIMER2] =3D {
> +               .name =3D "timer2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 23),
> +               K210_DIV(K210_SYSCTL_THR2, 16, 8, K210_DIV_DOUBLE_ONE_BAS=
ED),
> +               K210_MUX(K210_SYSCTL_SEL0, 15)
> +       },
> +};
> +
> +/*
> + * PLL control register bits.
> + */
> +#define K210_PLL_CLKR          GENMASK(3, 0)
> +#define K210_PLL_CLKF          GENMASK(9, 4)
> +#define K210_PLL_CLKOD         GENMASK(13, 10)
> +#define K210_PLL_BWADJ         GENMASK(19, 14)
> +#define K210_PLL_RESET         (1 << 20)
> +#define K210_PLL_PWRD          (1 << 21)
> +#define K210_PLL_INTFB         (1 << 22)
> +#define K210_PLL_BYPASS                (1 << 23)
> +#define K210_PLL_TEST          (1 << 24)
> +#define K210_PLL_EN            (1 << 25)
> +#define K210_PLL_SEL           GENMASK(27, 26) /* PLL2 only */
> +
> +/*
> + * PLL lock register bits.
> + */
> +#define K210_PLL_LOCK          0
> +#define K210_PLL_CLEAR_SLIP    2
> +#define K210_PLL_TEST_OUT      3
> +
> +/*
> + * Clock selector register bits.
> + */
> +#define K210_ACLK_SEL          BIT(0)
> +#define K210_ACLK_DIV          GENMASK(2, 1)
> +
> +/*
> + * PLLs.
> + */
> +enum k210_pll_id {
> +       K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM
> +};
> +
> +struct k210_pll {
> +       enum k210_pll_id id;
> +       void __iomem *reg;
> +       void __iomem *lock;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       struct clk_hw hw;
> +};
> +#define to_k210_pll(hw)        container_of(hw, struct k210_pll, hw)
> +
> +/*
> + * PLLs configuration: by default PLL0 runs at 780 MHz and PLL1 at 299 M=
Hz.
> + * The first 2 SRAM banks depend on ACLK/CPU clock which is by default P=
LL0
> + * rate divided by 2. Set PLL1 to 390 MHz so that the third SRAM bank ha=
s the
> + * same clock as the first 2.
> + */
> +struct k210_pll_cfg {
> +       u32 reg;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       u32 r;
> +       u32 f;
> +       u32 od;
> +       u32 bwadj;
> +};
> +
> +static struct k210_pll_cfg k210_plls_cfg[] =3D {
> +       { K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */
> +       { K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */
> +       { K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */
> +};
> +
> +/*
> + * Indexes in the parents array of clocks used as parents to other clock=
s.
> + */
> +enum k210_parent_idx {
> +       K210_PARENT_IN0 =3D 0,
> +       K210_PARENT_PLL0,
> +       K210_PARENT_PLL1,
> +       K210_PARENT_PLL2,
> +       K210_PARENT_ACLK,
> +       K210_PARENT_APB0,
> +       K210_PARENT_APB1,
> +       K210_PARENT_NUM_CLKS,
> +};
> +
> +/**
> + * struct k210_clk - Driver data
> + * @regs: system controller registers start address
> + * @clk_lock: clock setting spinlock
> + * @plls: SoC PLLs descriptors
> + * @aclk: ACLK clock
> + * @clks: All other clocks
> + * @parents: array of pointers to clocks used as parents for muxed clock=
s.
> + * @clk_data: clock specifier translation for all clocks
> + */
> +struct k210_clk {
> +       void __iomem                    *regs;
> +       spinlock_t                      clk_lock;
> +       struct k210_pll                 plls[K210_PLL_NUM];
> +       struct clk_hw                   aclk;
> +       struct clk_hw                   clks[K210_NUM_CLKS];
> +       const struct clk_hw             *parents[K210_PARENT_NUM_CLKS];
> +       struct clk_hw_onecell_data      *clk_data;
> +};
> +
> +static struct k210_clk *kcl;

Please remove this and get to it from the clk hw structure.

> +
> +/*
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
> + */
> +static void k210_aclk_set_selector(u8 sel)
> +{
> +       u32 reg =3D readl(kcl->regs + K210_SYSCTL_SEL0);
> +
> +       if (sel)
> +               reg |=3D K210_ACLK_SEL;
> +       else
> +               reg &=3D K210_ACLK_SEL;
> +       writel(reg, kcl->regs + K210_SYSCTL_SEL0);
> +}
> +
> +static void k210_init_pll(struct k210_pll *pll, enum k210_pll_id id,
> +                         void __iomem *base)
> +{
> +       pll->id =3D id;
> +       pll->lock =3D base + K210_SYSCTL_PLL_LOCK;
> +       pll->reg =3D base + k210_plls_cfg[id].reg;
> +       pll->lock_shift =3D k210_plls_cfg[id].lock_shift;
> +       pll->lock_width =3D k210_plls_cfg[id].lock_width;
> +}
> +
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
> +{
> +       u32 reg, mask =3D GENMASK(pll->lock_shift + pll->lock_width - 1,
> +                               pll->lock_shift);
> +
> +       while (true) {

Any timeout here? Otherwise this is an infinite loop if the hardware
misbehaves.

> +               reg =3D readl(pll->lock);
> +               if ((reg & mask) =3D=3D mask)
> +                       break;
> +
> +               reg |=3D BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
> +               writel(reg, pll->lock);
> +       }
> +}
> +
> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
> +{
> +       u32 reg =3D readl(pll->reg);
> +       u32 mask =3D K210_PLL_PWRD | K210_PLL_EN;
> +
> +       if (reg & K210_PLL_RESET)
> +               return false;
> +
> +       return (reg & mask) =3D=3D mask;
> +}
> +
> +static void k210_pll_enable_hw(struct k210_pll *pll)
> +{
> +       struct k210_pll_cfg *pll_cfg =3D &k210_plls_cfg[pll->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +
> +       if (k210_pll_hw_is_enabled(pll))
> +               goto unlock;
> +
> +       /*
> +        * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cor=
es and
> +        * SRAM running.
> +        */
> +       if (pll->id =3D=3D K210_PLL0)
> +               k210_aclk_set_selector(0);
> +
> +       /* Set PLL factors */
> +       reg =3D readl(pll->reg);
> +       reg &=3D ~GENMASK(19, 0);
> +       reg |=3D FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
> +       reg |=3D FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
> +       reg |=3D FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
> +       reg |=3D FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
> +       reg |=3D K210_PLL_PWRD;
> +       writel(reg, pll->reg);
> +
> +       /*
> +        * Reset the PLL: ensure reset is low before asserting it.
> +        * The magic NOPs come from the Kendryte reference SDK.
> +        */
> +       reg &=3D ~K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +       reg |=3D K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +       nop();
> +       nop();
> +       reg &=3D ~K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +
> +       k210_pll_wait_for_lock(pll);
> +
> +       reg &=3D ~K210_PLL_BYPASS;
> +       reg |=3D K210_PLL_EN;
> +       writel(reg, pll->reg);
> +
> +       if (pll->id =3D=3D K210_PLL0)
> +               k210_aclk_set_selector(1);
> +
> +unlock:
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static void k210_pll_disable_hw(struct k210_pll *pll)
> +{
> +       unsigned long flags;
> +       u32 reg;
> +
> +       /*
> +        * Bypassing before powering off is important so child clocks do =
not
> +        * stop working. This is especially important for pll0, the indir=
ect
> +        * parent of the cpu clock.
> +        */
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(pll->reg);
> +       reg |=3D K210_PLL_BYPASS;
> +       writel(reg, pll->reg);
> +
> +       reg &=3D ~K210_PLL_PWRD;
> +       reg &=3D ~K210_PLL_EN;
> +       writel(reg, pll->reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static int k210_pll_enable(struct clk_hw *hw)
> +{
> +       k210_pll_enable_hw(to_k210_pll(hw));
> +
> +       return 0;
> +}
> +
> +static void k210_pll_disable(struct clk_hw *hw)
> +{
> +       k210_pll_disable_hw(to_k210_pll(hw));

Why the extra wrapper? Inline k210_pll_disable_hw() here? Same for
enable.

> +}
> +
> +static int k210_pll_is_enabled(struct clk_hw *hw)
> +{
> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));

Same comment.

> +}
> +
> +static unsigned long k210_pll_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       u32 reg =3D readl(pll->reg);
> +       u32 r, f, od;
> +
> +       if (reg & K210_PLL_BYPASS)
> +               return parent_rate;
> +
> +       if (!(reg & K210_PLL_PWRD))
> +               return 0;
> +
> +       r =3D FIELD_GET(K210_PLL_CLKR, reg) + 1;
> +       f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
> +       od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> +
> +       return (u64)parent_rate * f / (r * od);
> +}
> +
> +static const struct clk_ops k210_pll_ops =3D {
> +       .enable         =3D k210_pll_enable,
> +       .disable        =3D k210_pll_disable,
> +       .is_enabled     =3D k210_pll_is_enabled,
> +       .recalc_rate    =3D k210_pll_get_rate,
> +};
> +
> +static int k210_pll2_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +
> +       reg =3D readl(pll->reg);
> +       reg &=3D ~K210_PLL_SEL;
> +       reg |=3D FIELD_PREP(K210_PLL_SEL, index);
> +       writel(reg, pll->reg);
> +
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_pll2_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       u32 reg =3D readl(pll->reg);
> +
> +       return FIELD_GET(K210_PLL_SEL, reg);
> +}
> +
> +static const struct clk_ops k210_pll2_ops =3D {
> +       .enable         =3D k210_pll_enable,
> +       .disable        =3D k210_pll_disable,
> +       .is_enabled     =3D k210_pll_is_enabled,
> +       .recalc_rate    =3D k210_pll_get_rate,
> +       .set_parent     =3D k210_pll2_set_parent,
> +       .get_parent     =3D k210_pll2_get_parent,
> +};
> +
> +static int k210_register_pll(struct k210_pll *pll, const char *name,
> +                            int num_parents, const struct clk_ops *ops)
> +{
> +       struct clk_init_data init =3D {};
> +
> +       init.name =3D name;
> +       init.parent_hws =3D kcl->parents;
> +       init.num_parents =3D num_parents;
> +       init.ops =3D ops;
> +       pll->hw.init =3D &init;
> +
> +       return clk_hw_register(NULL, &pll->hw);
> +}
> +
> +static int k210_register_plls(struct device_node *np)
> +{
> +       int i, ret;
> +
> +       for (i =3D 0; i < K210_PLL_NUM; i++)
> +               k210_init_pll(&kcl->plls[i], i, kcl->regs);
> +
> +       /* PLL0 and PLL1 only have IN0 as parent */
> +       ret =3D k210_register_pll(&kcl->plls[K210_PLL0], "pll0", 1,
> +                               &k210_pll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL0 failed\n", np);
> +               return ret;
> +       }
> +       kcl->parents[K210_PARENT_PLL0] =3D &kcl->plls[K210_PLL0].hw;
> +
> +       ret =3D k210_register_pll(&kcl->plls[K210_PLL1], "pll1", 1,
> +                               &k210_pll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL1 failed\n", np);
> +               return ret;
> +       }
> +       kcl->parents[K210_PARENT_PLL1] =3D &kcl->plls[K210_PLL1].hw;
> +
> +       /* PLL2 has IN0, PLL0 and PLL1 as parents */
> +       ret =3D k210_register_pll(&kcl->plls[K210_PLL2], "pll2", 3,
> +                               &k210_pll2_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL2 failed\n", np);
> +               return ret;
> +       }
> +       kcl->parents[K210_PARENT_PLL2] =3D &kcl->plls[K210_PLL2].hw;
> +
> +       return 0;
> +}
> +
> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       k210_aclk_set_selector(index);
> +
> +       return 0;
> +}
> +
> +static u8 k210_aclk_get_parent(struct clk_hw *hw)
> +{
> +       u32 sel;
> +
> +       sel =3D readl(kcl->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;
> +
> +       return sel ? 1 : 0;
> +}
> +
> +static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       u32 reg =3D readl(kcl->regs + K210_SYSCTL_SEL0);
> +       unsigned int shift;
> +
> +       if (!(reg & 0x1))
> +               return parent_rate;
> +
> +       shift =3D FIELD_GET(K210_ACLK_DIV, reg);
> +
> +       return parent_rate / (2UL << shift);
> +}
> +
> +static const struct clk_ops k210_aclk_ops =3D {
> +       .set_parent     =3D k210_aclk_set_parent,
> +       .get_parent     =3D k210_aclk_get_parent,
> +       .recalc_rate    =3D k210_aclk_get_rate,
> +};
> +
> +static int k210_register_aclk(struct device_node *np)
> +{
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       /* ACLK has IN0 and PLL0 as parents */
> +       init.name =3D "aclk";
> +       init.parent_hws =3D kcl->parents;
> +       init.num_parents =3D 2;
> +       init.ops =3D &k210_aclk_ops;
> +       kcl->aclk.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &kcl->aclk);
> +       if (ret) {
> +               pr_err("%pOFP: register aclk failed\n", np);
> +               return ret;
> +       }
> +
> +       kcl->parents[K210_PARENT_ACLK] =3D &kcl->aclk;
> +
> +       return 0;
> +}
> +
> +#define to_k210_clk_id(hw)     ((unsigned int)((hw) - &kcl->clks[0]))
> +#define to_k210_clk_cfg(hw)    (&k210_clks[to_k210_clk_id(hw)])
> +
> +static u32 k210_clk_get_div_val(struct k210_clk_cfg *kclk)
> +{
> +       u32 reg =3D readl(kcl->regs + kclk->div_reg);
> +
> +       return (reg >> kclk->div_shift) & GENMASK(kclk->div_width - 1, 0);
> +}
> +
> +static unsigned long k210_clk_divider(struct k210_clk_cfg *kclk,
> +                                     u32 div_val)
> +{
> +       switch (kclk->div_type) {
> +       case K210_DIV_ONE_BASED:
> +               return div_val + 1;
> +       case K210_DIV_DOUBLE_ONE_BASED:
> +               return (div_val + 1) * 2;
> +       case K210_DIV_POWER_OF_TWO:
> +               return 2UL << div_val;
> +       case K210_DIV_NONE:
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int k210_clk_enable(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->gate_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->gate_reg);
> +       reg |=3D BIT(kclk->gate_bit);
> +       writel(reg, kcl->regs + kclk->gate_reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_clk_disable(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->gate_reg)
> +               return;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->gate_reg);
> +       reg &=3D ~BIT(kclk->gate_bit);
> +       writel(reg, kcl->regs + kclk->gate_reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->mux_reg) {
> +               if (WARN_ON(index !=3D 0))

Why would this ever happen? Seems like we don't want to allow different
parents? But then why allow set_parent to be called?

> +                       return -EINVAL;
> +               return 0;
> +       }
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->mux_reg);
> +       if (index)
> +               reg |=3D BIT(kclk->mux_bit);
> +       else
> +               reg &=3D ~BIT(kclk->mux_bit);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg, idx;
> +
> +       if (!kclk->mux_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->mux_reg);
> +       idx =3D (reg & BIT(kclk->mux_bit)) ? 1 : 0;
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return idx;
> +}
> +
> +static unsigned long k210_clk_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long divider;
> +
> +       if (!kclk->div_reg)
> +               return parent_rate;
> +
> +       divider =3D k210_clk_divider(kclk, k210_clk_get_div_val(kclk));
> +       if (WARN_ON(!divider))
> +               return 0;
> +
> +       return parent_rate / divider;
> +}
> +
> +static const struct clk_ops k210_clk_ops =3D {
> +       .enable         =3D k210_clk_enable,
> +       .disable        =3D k210_clk_disable,
> +       .set_parent     =3D k210_clk_set_parent,
> +       .get_parent     =3D k210_clk_get_parent,
> +       .recalc_rate    =3D k210_clk_get_rate,
> +};
> +
> +static struct clk_hw *k210_register_clk(int id, enum k210_parent_idx par=
ent_idx,
> +                                       int num_parents, unsigned long fl=
ags)
> +{
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       init.name =3D k210_clks[id].name;
> +       init.parent_hws =3D &kcl->parents[parent_idx];
> +       init.num_parents =3D num_parents;
> +       init.flags =3D flags;
> +       init.ops =3D &k210_clk_ops;
> +       kcl->clks[id].init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &kcl->clks[id]);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &kcl->clks[id];
> +}
> +
> +static inline struct clk_hw *k210_register_mux_clk(int id)
> +{
> +       /*
> +        * All muxed clocks have IN0 and PLL0 as parents: these are the
> +        * first two entries of the parents array.
> +        */
> +       return k210_register_clk(id, K210_PARENT_IN0, 2, 0);
> +}
> +
> +static inline struct clk_hw *k210_register_critical_clk(int id,
> +                                       enum k210_parent_idx parent_idx)
> +{
> +       return k210_register_clk(id, parent_idx, 1, CLK_IS_CRITICAL);

Why critical? Please add a comment. Or that is lower down? Maybe move
that comment up to this inline function instead.

> +}
> +
> +static inline struct clk_hw *k210_register_child(int id,
> +                                       enum k210_parent_idx parent_idx)
> +{
> +       return k210_register_clk(id, parent_idx, 1, 0);
> +}
> +
> +static inline struct clk_hw *k210_register_in0_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_IN0);
> +}
> +
> +static inline struct clk_hw *k210_register_pll0_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_PLL0);
> +}
> +
> +static inline struct clk_hw *k210_register_pll2_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_PLL2);
> +}
> +
> +static inline struct clk_hw *k210_register_aclk_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_ACLK);
> +}
> +
> +static inline struct clk_hw *k210_register_apb0_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_APB0);
> +}
> +
> +static inline struct clk_hw *k210_register_apb1_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_APB1);
> +}
> +
> +static void __init k210_clk_init(struct device_node *np)
> +{
> +       struct device_node *sysctl_np;
> +       struct clk_hw **hws;
> +       struct clk *in0;
> +       int i, ret;
> +
> +       kcl =3D kzalloc(sizeof(*kcl), GFP_KERNEL);
> +       if (!kcl)
> +               return;
> +
> +       kcl->clk_data =3D kzalloc(struct_size(kcl->clk_data, hws, K210_NU=
M_CLKS),
> +                               GFP_KERNEL);
> +       if (!kcl->clk_data)
> +               return;
> +
> +       sysctl_np =3D of_get_parent(np);
> +       kcl->regs =3D of_iomap(sysctl_np, 0);
> +       of_node_put(sysctl_np);
> +       if (!kcl->regs) {
> +               pr_err("%pOFP: failed to map registers\n", np);
> +               return;
> +       }
> +
> +       spin_lock_init(&kcl->clk_lock);
> +       kcl->clk_data->num =3D K210_NUM_CLKS;
> +       hws =3D kcl->clk_data->hws;
> +       for (i =3D 0; i < K210_NUM_CLKS; i++)
> +               hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> +
> +       /* Get the system base fixed-rate 26MHz oscillator clock */
> +       in0 =3D of_clk_get(np, 0);
> +       if (IS_ERR(in0)) {
> +               pr_err("%pOFP: failed to get base fixed-rate oscillator\n=
", np);
> +               return;
> +       }
> +       kcl->parents[K210_PARENT_IN0] =3D __clk_get_hw(in0);

This shouldn't be necessary. Specify the DT node index in the
parent_data structure instead.

> +
> +       ret =3D k210_register_plls(np);
> +       if (ret)
> +               return;
> +
> +       ret =3D k210_register_aclk(np);
> +       if (ret)
> +               return;
> +
> +       /*
> +        * Critical clocks: there are no consumers of the SRAM clocks,
> +        * including the AI clock for the third SRAM bank. The CPU clock
> +        * is only referenced by the uarths serial device and so would be
> +        * disabled if the serial console is disabled. Mark all these clo=
cks
> +        * as critical so that they are never disabled by the core clock
> +        * management.
> +        */
> +       hws[K210_CLK_CPU] =3D
> +               k210_register_critical_clk(K210_CLK_CPU, K210_PARENT_ACLK=
);
> +       hws[K210_CLK_SRAM0] =3D
> +               k210_register_critical_clk(K210_CLK_SRAM0, K210_PARENT_AC=
LK);
> +       hws[K210_CLK_SRAM1] =3D
> +               k210_register_critical_clk(K210_CLK_SRAM1, K210_PARENT_AC=
LK);
> +       hws[K210_CLK_AI] =3D
> +                k210_register_critical_clk(K210_CLK_AI, K210_PARENT_PLL1=
);
> +
> +       /* Clocks with aclk as source */
> +       hws[K210_CLK_DMA] =3D k210_register_aclk_child(K210_CLK_DMA);
> +       hws[K210_CLK_FFT] =3D k210_register_aclk_child(K210_CLK_FFT);
> +       hws[K210_CLK_ROM] =3D k210_register_aclk_child(K210_CLK_ROM);
> +       hws[K210_CLK_DVP] =3D k210_register_aclk_child(K210_CLK_DVP);
> +       hws[K210_CLK_APB0] =3D k210_register_aclk_child(K210_CLK_APB0);
> +       hws[K210_CLK_APB1] =3D k210_register_aclk_child(K210_CLK_APB1);
> +       hws[K210_CLK_APB2] =3D k210_register_aclk_child(K210_CLK_APB2);
> +
> +       /* Clocks with PLL0 as source */
> +       hws[K210_CLK_SPI0] =3D k210_register_pll0_child(K210_CLK_SPI0);
> +       hws[K210_CLK_SPI1] =3D k210_register_pll0_child(K210_CLK_SPI1);
> +       hws[K210_CLK_SPI2] =3D k210_register_pll0_child(K210_CLK_SPI2);
> +       hws[K210_CLK_I2C0] =3D k210_register_pll0_child(K210_CLK_I2C0);
> +       hws[K210_CLK_I2C1] =3D k210_register_pll0_child(K210_CLK_I2C1);
> +       hws[K210_CLK_I2C2] =3D k210_register_pll0_child(K210_CLK_I2C2);
> +
> +       /* Clocks with PLL2 as source */
> +       hws[K210_CLK_I2S0] =3D k210_register_pll2_child(K210_CLK_I2S0);
> +       hws[K210_CLK_I2S1] =3D k210_register_pll2_child(K210_CLK_I2S1);
> +       hws[K210_CLK_I2S2] =3D k210_register_pll2_child(K210_CLK_I2S2);
> +       hws[K210_CLK_I2S0_M] =3D k210_register_pll2_child(K210_CLK_I2S0_M=
);
> +       hws[K210_CLK_I2S1_M] =3D k210_register_pll2_child(K210_CLK_I2S1_M=
);
> +       hws[K210_CLK_I2S2_M] =3D k210_register_pll2_child(K210_CLK_I2S2_M=
);
> +
> +       /* Clocks with IN0 as source */
> +       hws[K210_CLK_WDT0] =3D k210_register_in0_child(K210_CLK_WDT0);
> +       hws[K210_CLK_WDT1] =3D k210_register_in0_child(K210_CLK_WDT1);
> +       hws[K210_CLK_RTC] =3D k210_register_in0_child(K210_CLK_RTC);
> +
> +       /* Clocks with APB0 as source */
> +       kcl->parents[K210_PARENT_APB0] =3D hws[K210_CLK_APB0];
> +       hws[K210_CLK_GPIO] =3D k210_register_apb0_child(K210_CLK_GPIO);
> +       hws[K210_CLK_UART1] =3D k210_register_apb0_child(K210_CLK_UART1);
> +       hws[K210_CLK_UART2] =3D k210_register_apb0_child(K210_CLK_UART2);
> +       hws[K210_CLK_UART3] =3D k210_register_apb0_child(K210_CLK_UART3);
> +       hws[K210_CLK_FPIOA] =3D k210_register_apb0_child(K210_CLK_FPIOA);
> +       hws[K210_CLK_SHA] =3D k210_register_apb0_child(K210_CLK_SHA);
> +
> +       /* Clocks with APB1 as source */
> +       kcl->parents[K210_PARENT_APB1] =3D hws[K210_CLK_APB1];
> +       hws[K210_CLK_AES] =3D k210_register_apb1_child(K210_CLK_AES);
> +       hws[K210_CLK_OTP] =3D k210_register_apb1_child(K210_CLK_OTP);
> +
> +       /* Mux clocks with in0 or pll0 as source */
> +       hws[K210_CLK_SPI3] =3D k210_register_mux_clk(K210_CLK_SPI3);
> +       hws[K210_CLK_TIMER0] =3D k210_register_mux_clk(K210_CLK_TIMER0);
> +       hws[K210_CLK_TIMER1] =3D k210_register_mux_clk(K210_CLK_TIMER1);
> +       hws[K210_CLK_TIMER2] =3D k210_register_mux_clk(K210_CLK_TIMER2);
> +
> +       for (i =3D 0; i < K210_NUM_CLKS; i++) {
> +               if (IS_ERR(hws[i])) {
> +                       pr_err("%pOFP: register clock %s failed %ld\n",
> +                              np, k210_clks[i].name, PTR_ERR(hws[i]));
> +                       return;
> +               }
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->cl=
k_data);
> +       if (ret) {
> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret);
> +               return;
> +       }
> +
> +       pr_info("%pOFP: CPU running at %lu MHz\n",
> +               np, clk_hw_get_rate(hws[K210_CLK_CPU]) / 1000000);
> +}
> +
> +CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);
> +
> +/*
> + * Enable PLL1 to be able to use the AI SRAM.
> + */
> +void __init k210_clk_early_init(void __iomem *regs)

Is it impossible to put this into the bootloader? Does riscv have some
boot constraints or requirements that say memory should be working
before the kernel starts? Otherwise this is depressing that we have to
enable clks to get memory to work early like this.

> +{
> +       struct k210_pll pll1;
> +
> +       /* Make sure ACLK selector is set to PLL0 */
> +       k210_aclk_set_selector(1);
> +
> +       /* Startup PLL1 to enable the aisram bank for general memory use =
*/
> +       k210_init_pll(&pll1, K210_PLL1, regs);
> +       k210_pll_enable_hw(&pll1);
> +}

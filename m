Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C3AC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 01:27:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A913E64E3F
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 01:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbhBJB06 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 20:26:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:48860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234819AbhBJBZ1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 20:25:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5390F64E05;
        Wed, 10 Feb 2021 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612920283;
        bh=C0QX1I3tmtoctJDdYTHro0ZtGetUhL/GckLKyWWqWGg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O1cYHKMaKl3zdk/GZRnCtKCC9lg/+PSGRPOlfsvY3WSO1uJLABeQI2Row3ZVv2Q+h
         Ymn7F0r8Bw/yf7PSJtyRuJxXqzUQJiFyO2NNT4bQqV5v9QUQWwxhbdAEjtaUMzndl0
         eAZxOrhmsBwh0D0zQdzVkkTcxx2Nx3+G63+H5RkLLJN6a0u/fbuFB3KK4gi5XSQTfP
         LobqJtXgiPjS49SwDVURoTTTB0adusVLrghmlYfr9F/mdcVa/rbjXhfnAygR+VR4FF
         CRmuz6R1uGb+n11tDwOVngfl6jwqM6HE5c2w6h5S4mJwLwkEcBzLTB2FdZY5ETR+7C
         lZXiZnL4FxzNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210209123014.165928-2-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com> <20210209123014.165928-2-damien.lemoal@wdc.com>
Subject: Re: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
Date:   Tue, 09 Feb 2021 17:24:41 -0800
Message-ID: <161292028178.418021.10953574123293354986@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Damien Le Moal (2021-02-09 04:29:59)
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
>=20
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. The sysctl driver retains the SOC early
> initialization code, but the implementation now relies on the new
> function k210_clk_early_init() provided by the new clk-k210 driver.
>=20
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---

My inbox has this one patch multiple times and no changelog here. I also
don't see the cover letter, so I guess I wasn't Cced? Can you please add
a changelog so I know if anything has changed?

>  MAINTAINERS                      |    1 +
>  drivers/clk/Kconfig              |    8 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/clk-k210.c           | 1012 ++++++++++++++++++++++++++++++
>  drivers/soc/canaan/Kconfig       |   18 +-
>  drivers/soc/canaan/Makefile      |    2 +-
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>  include/soc/canaan/k210-sysctl.h |    2 +
>  8 files changed, 1071 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/clk/clk-k210.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3031c2012865..2128630a9dd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,6 +3878,7 @@ CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
>  M:     Damien Le Moal <damien.lemoal@wdc.com>
>  L:     linux-riscv@lists.infradead.org
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

This file isn't even introduced in this patch, so please split it off to
another patch.

>  F:     drivers/soc/canaan/
>  F:     include/soc/canaan/
> =20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 85856cff506c..cb971f6632e2 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -368,6 +368,14 @@ config COMMON_CLK_FIXED_MMIO
>         help
>           Support for Memory Mapped IO Fixed clocks
> =20
> +config COMMON_CLK_K210
> +       bool "Clock driver for the Canaan Kendryte K210 SoC"
> +       depends on COMMON_CLK && OF

Is it inside the if COMMON_CLK section? Having depends on COMMON_CLK
again isn't useful.

> +       depends on RISCV && SOC_CANAAN
> +       default SOC_CANAAN
> +       help
> +         Support for the Canaan Kendryte K210 RISC-V SoC clocks.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> new file mode 100644
> index 000000000000..429db4904ad6
> --- /dev/null
> +++ b/drivers/clk/clk-k210.c
> @@ -0,0 +1,1012 @@
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
> +#include <linux/of_clk.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/clk-provider.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <asm/soc.h>

What is this include for? The nop?

> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/clock/k210-clk.h>
> +
> +/*
> + * Clocks parameters.

Please remove this useless comment.

> + */
> +struct k210_sysclk;
> +
> +struct k210_clk {
> +       int id;
> +       struct k210_sysclk *ksc;
> +       struct clk_hw hw;
> +};
> +
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

Nitpick: Newline here.

> +#define K210_DIV(_reg, _shift, _width, _type)  \
> +       .div_reg =3D (_reg),                      \
> +       .div_shift =3D (_shift),                  \
> +       .div_width =3D (_width),                  \
> +       .div_type =3D (_type)

Nitpick: Newline here.

> +#define K210_MUX(_reg, _bit)   \
> +       .mux_reg =3D (_reg),      \
> +       .mux_bit =3D (_bit)
> +
> +static struct k210_clk_cfg k210_clk_cfgs[K210_NUM_CLKS] =3D {
> +

Not sure why there's a newline here.

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
> +       struct k210_sysclk *ksc;
> +       void __iomem *base;
> +       void __iomem *reg;
> +       void __iomem *lock;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       struct clk_hw hw;
> +};
> +#define to_k210_pll(_hw)       container_of(_hw, struct k210_pll, hw)
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
> +/**
> + * struct k210_sysclk - sysclk driver data
> + * @node: device node
> + * @regs: system controller registers start address
> + * @clk_lock: clock setting spinlock
> + * @plls: SoC PLLs descriptors
> + * @aclk: ACLK clock
> + * @clks: All other clocks
> + */
> +struct k210_sysclk {
> +       struct device_node              *node;
> +       void __iomem                    *regs;
> +       spinlock_t                      clk_lock;
> +       struct k210_pll                 plls[K210_PLL_NUM];
> +       struct clk_hw                   aclk;
> +       struct k210_clk                 clks[K210_NUM_CLKS];
> +};
> +
> +#define to_k210_sysclk(_hw)    container_of(_hw, struct k210_sysclk, acl=
k)
> +
> +/*
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
> + */
> +static void k210_aclk_set_selector(void __iomem *regs, u8 sel)
> +{
> +       u32 reg =3D readl(regs + K210_SYSCTL_SEL0);
> +
> +       if (sel)
> +               reg |=3D K210_ACLK_SEL;
> +       else
> +               reg &=3D K210_ACLK_SEL;
> +       writel(reg, regs + K210_SYSCTL_SEL0);
> +}
> +
> +static void k210_init_pll(void __iomem *regs, enum k210_pll_id pllid,
> +                         struct k210_pll *pll)
> +{
> +       pll->id =3D pllid;
> +       pll->reg =3D regs + k210_plls_cfg[pllid].reg;
> +       pll->lock =3D regs + K210_SYSCTL_PLL_LOCK;
> +       pll->lock_shift =3D k210_plls_cfg[pllid].lock_shift;
> +       pll->lock_width =3D k210_plls_cfg[pllid].lock_width;
> +}
> +
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
> +{
> +       u32 reg, mask =3D GENMASK(pll->lock_shift + pll->lock_width - 1,
> +                               pll->lock_shift);
> +
> +       while (true) {
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
> +static void k210_pll_enable_hw(void __iomem *regs, struct k210_pll *pll)
> +{
> +       struct k210_pll_cfg *pll_cfg =3D &k210_plls_cfg[pll->id];
> +       u32 reg;
> +
> +       if (k210_pll_hw_is_enabled(pll))
> +               return;
> +
> +       /*
> +        * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cor=
es and
> +        * SRAM running.
> +        */
> +       if (pll->id =3D=3D K210_PLL0)
> +               k210_aclk_set_selector(regs, 0);
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
> +               k210_aclk_set_selector(regs, 1);
> +}
> +
> +static int k210_pll_enable(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       struct k210_sysclk *ksc =3D pll->ksc;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +
> +       k210_pll_enable_hw(ksc->regs, pll);
> +
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_pll_disable(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       struct k210_sysclk *ksc =3D pll->ksc;
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
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg =3D readl(pll->reg);
> +       reg |=3D K210_PLL_BYPASS;
> +       writel(reg, pll->reg);
> +
> +       reg &=3D ~K210_PLL_PWRD;
> +       reg &=3D ~K210_PLL_EN;
> +       writel(reg, pll->reg);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +}
> +
> +static int k210_pll_is_enabled(struct clk_hw *hw)
> +{
> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));
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
> +       struct k210_sysclk *ksc =3D pll->ksc;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +
> +       reg =3D readl(pll->reg);
> +       reg &=3D ~K210_PLL_SEL;
> +       reg |=3D FIELD_PREP(K210_PLL_SEL, index);
> +       writel(reg, pll->reg);
> +
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
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
> +static int k210_register_pll(struct k210_sysclk *ksc, const char *in0,
> +                            enum k210_pll_id pllid, const char *name,
> +                            int num_parents, const struct clk_ops *ops)
> +{
> +       struct k210_pll *pll =3D &ksc->plls[pllid];
> +       struct clk_init_data init =3D {};
> +       const struct clk_parent_data parent_data[] =3D {
> +               { .name =3D in0 },
> +               { .hw =3D &ksc->plls[K210_PLL0].hw },
> +               { .hw =3D &ksc->plls[K210_PLL1].hw },
> +       };
> +
> +       init.name =3D name;
> +       init.parent_data =3D parent_data;
> +       init.num_parents =3D num_parents;
> +       init.ops =3D ops;
> +
> +       pll->hw.init =3D &init;
> +       pll->ksc =3D ksc;
> +
> +       return clk_hw_register(NULL, &pll->hw);
> +}
> +
> +static int k210_register_plls(struct k210_sysclk *ksc, const char *in0)
> +{
> +       int i, ret;
> +
> +       for (i =3D 0; i < K210_PLL_NUM; i++)
> +               k210_init_pll(ksc->regs, i, &ksc->plls[i]);
> +
> +       /* PLL0 and PLL1 only have IN0 as parent */
> +       ret =3D k210_register_pll(ksc, in0, K210_PLL0, "pll0", 1, &k210_p=
ll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL0 failed\n", ksc->node);
> +               return ret;
> +       }
> +       ret =3D k210_register_pll(ksc, in0, K210_PLL1, "pll1", 1, &k210_p=
ll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL1 failed\n", ksc->node);
> +               return ret;
> +       }
> +
> +       /* PLL2 has IN0, PLL0 and PLL1 as parents */
> +       ret =3D k210_register_pll(ksc, in0, K210_PLL2, "pll2", 3, &k210_p=
ll2_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL2 failed\n", ksc->node);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_sysclk *ksc =3D to_k210_sysclk(hw);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +
> +       k210_aclk_set_selector(ksc->regs, index);
> +
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_aclk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_sysclk *ksc =3D to_k210_sysclk(hw);
> +       u32 sel;
> +
> +       sel =3D readl(ksc->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;
> +
> +       return sel ? 1 : 0;
> +}
> +
> +static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct k210_sysclk *ksc =3D to_k210_sysclk(hw);
> +       u32 reg =3D readl(ksc->regs + K210_SYSCTL_SEL0);
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
> +/*
> + * ACLK has IN0 and PLL0 as parents.
> + */
> +static int k210_register_aclk(struct k210_sysclk *ksc, const char *in0)
> +{
> +       struct clk_init_data init =3D {};
> +       const struct clk_parent_data parent_data[] =3D {
> +               { .name =3D in0 },
> +               { .hw =3D &ksc->plls[K210_PLL0].hw },
> +       };
> +       int ret;
> +
> +       init.name =3D "aclk";
> +       init.parent_data =3D parent_data;
> +       init.num_parents =3D 2;
> +       init.ops =3D &k210_aclk_ops;
> +       ksc->aclk.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &ksc->aclk);
> +       if (ret) {
> +               pr_err("%pOFP: register aclk failed\n", ksc->node);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +#define to_k210_clk(_hw)       container_of(_hw, struct k210_clk, hw)
> +
> +static int k210_clk_enable(struct clk_hw *hw)
> +{
> +       struct k210_clk *kclk =3D to_k210_clk(hw);
> +       struct k210_sysclk *ksc =3D kclk->ksc;
> +       struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!cfg->gate_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg =3D readl(ksc->regs + cfg->gate_reg);
> +       reg |=3D BIT(cfg->gate_bit);
> +       writel(reg, ksc->regs + cfg->gate_reg);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_clk_disable(struct clk_hw *hw)
> +{
> +       struct k210_clk *kclk =3D to_k210_clk(hw);
> +       struct k210_sysclk *ksc =3D kclk->ksc;
> +       struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!cfg->gate_reg)
> +               return;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg =3D readl(ksc->regs + cfg->gate_reg);
> +       reg &=3D ~BIT(cfg->gate_bit);
> +       writel(reg, ksc->regs + cfg->gate_reg);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +}
> +
> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_clk *kclk =3D to_k210_clk(hw);
> +       struct k210_sysclk *ksc =3D kclk->ksc;
> +       struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg =3D readl(ksc->regs + cfg->mux_reg);
> +       if (index)
> +               reg |=3D BIT(cfg->mux_bit);
> +       else
> +               reg &=3D ~BIT(cfg->mux_bit);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_clk *kclk =3D to_k210_clk(hw);
> +       struct k210_sysclk *ksc =3D kclk->ksc;
> +       struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg, idx;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg =3D readl(ksc->regs + cfg->mux_reg);
> +       idx =3D (reg & BIT(cfg->mux_bit)) ? 1 : 0;
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return idx;
> +}
> +
> +static unsigned long k210_clk_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_clk *kclk =3D to_k210_clk(hw);
> +       struct k210_sysclk *ksc =3D kclk->ksc;
> +       struct k210_clk_cfg *cfg =3D &k210_clk_cfgs[kclk->id];
> +       u32 reg, div_val;
> +
> +       if (!cfg->div_reg)
> +               return parent_rate;
> +
> +       reg =3D readl(ksc->regs + cfg->div_reg);
> +       div_val =3D (reg >> cfg->div_shift) & GENMASK(cfg->div_width - 1,=
 0);
> +
> +       switch (cfg->div_type) {
> +       case K210_DIV_ONE_BASED:
> +               return parent_rate / (div_val + 1);
> +       case K210_DIV_DOUBLE_ONE_BASED:
> +               return parent_rate / ((div_val + 1) * 2);
> +       case K210_DIV_POWER_OF_TWO:
> +               return parent_rate / (2UL << div_val);
> +       case K210_DIV_NONE:
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct clk_ops k210_clk_mux_ops =3D {
> +       .enable         =3D k210_clk_enable,
> +       .disable        =3D k210_clk_disable,
> +       .set_parent     =3D k210_clk_set_parent,
> +       .get_parent     =3D k210_clk_get_parent,
> +       .recalc_rate    =3D k210_clk_get_rate,
> +};
> +
> +static const struct clk_ops k210_clk_ops =3D {
> +       .enable         =3D k210_clk_enable,
> +       .disable        =3D k210_clk_disable,
> +       .recalc_rate    =3D k210_clk_get_rate,
> +};

From here...

> +
> +static void k210_register_clk(struct k210_sysclk *ksc, int id,
> +                             const struct clk_parent_data *parent_data,
> +                             int num_parents, unsigned long flags)
> +{
> +       struct k210_clk *kclk =3D &ksc->clks[id];
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       init.name =3D k210_clk_cfgs[id].name;
> +       init.flags =3D flags;
> +       init.parent_data =3D parent_data;
> +       init.num_parents =3D num_parents;
> +       if (num_parents > 1)
> +               init.ops =3D &k210_clk_mux_ops;
> +       else
> +               init.ops =3D &k210_clk_ops;
> +
> +       kclk->id =3D id;
> +       kclk->ksc =3D ksc;
> +       kclk->hw.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &kclk->hw);
> +       if (ret) {
> +               pr_err("%pOFP: register clock %s failed\n",
> +                      ksc->node, k210_clk_cfgs[id].name);
> +               kclk->id =3D -1;
> +       }
> +}
> +
> +/*
> + * All muxed clocks have IN0 and PLL0 as parents.
> + */
> +static inline void k210_register_mux_clk(struct k210_sysclk *ksc,
> +                                        const char *in0, int id)
> +{
> +       const struct clk_parent_data parent_data[2] =3D {
> +               { .name =3D in0 },
> +               { .hw =3D &ksc->plls[K210_PLL0].hw },
> +       };
> +
> +       k210_register_clk(ksc, id, parent_data, 2, 0);
> +}
> +
> +static inline void k210_register_in0_child(struct k210_sysclk *ksc,
> +                                          const char *in0, int id)
> +{
> +       const struct clk_parent_data parent_data =3D {
> +               .name =3D in0,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, 0);
> +}
> +
> +static inline void k210_register_pll_child(struct k210_sysclk *ksc, int =
id,
> +                                          enum k210_pll_id pllid,
> +                                          unsigned long flags)
> +{
> +       const struct clk_parent_data parent_data =3D {
> +               .hw =3D &ksc->plls[pllid].hw,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, flags);
> +}
> +
> +static inline void k210_register_aclk_child(struct k210_sysclk *ksc, int=
 id,
> +                                           unsigned long flags)
> +{
> +       const struct clk_parent_data parent_data =3D {
> +               .hw =3D &ksc->aclk,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, flags);
> +}
> +
> +static inline void k210_register_clk_child(struct k210_sysclk *ksc, int =
id,
> +                                          int parent_id)
> +{
> +       const struct clk_parent_data parent_data =3D {
> +               .hw =3D &ksc->clks[parent_id].hw,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, 0);
> +}

.. to here, shouldn't these all gain __init?

> +
> +static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *cl=
kspec,
> +                                             void *data)
> +{
> +       struct k210_sysclk *ksc =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       if (idx >=3D K210_NUM_CLKS)
> +               return ERR_PTR(-EINVAL);
> +
> +       return &ksc->clks[idx].hw;
> +}
> +
> +static void __init k210_clk_init(struct device_node *np)
> +{
> +       struct device_node *sysctl_np;
> +       struct k210_sysclk *ksc;
> +       const char *in0;
> +       int i, ret;
> +
> +       ksc =3D kzalloc(sizeof(*ksc), GFP_KERNEL);
> +       if (!ksc)
> +               return;
> +
> +       ksc->node =3D np;
> +       spin_lock_init(&ksc->clk_lock);
> +       sysctl_np =3D of_get_parent(np);
> +       ksc->regs =3D of_iomap(sysctl_np, 0);
> +       of_node_put(sysctl_np);
> +       if (!ksc->regs) {
> +               pr_err("%pOFP: failed to map registers\n", np);
> +               return;
> +       }
> +
> +       in0 =3D of_clk_get_parent_name(np, 0);

I'm still lost why we need to get the clk parent name here vs. using the
index approach and using clk_parent_data. There were some comments about
#clock-cells which didn't make sense to me. The fixed rate clk in DT
should have #clock-cells as it is a clk.

> +       if (!in0) {
> +               pr_err("%pOFP: undefined fixed-rate oscillator clock\n", =
np);
> +               return;
> +       }
> +
> +       ret =3D k210_register_plls(ksc, in0);

I suspect the 'np' should be passed to these functions instead, and then
use of_clk_hw_register().

> +       if (ret)
> +               return;
> +
> +       ret =3D k210_register_aclk(ksc, in0);
> +       if (ret)
> +               return;
> +

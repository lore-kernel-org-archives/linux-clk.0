Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH v3] clk: bcm2835: remove remains from stub clk driver
To: Danilo Krummrich <danilokrummrich@dk-develop.de>, rjui@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 Michael Turquette <mturquette@baylibre.com>, Eric Anholt <eric@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20170608222900.18039-1-danilokrummrich@dk-develop.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <a6facd69-ca86-1527-52af-f097a905027e@i2se.com>
Date: Tue, 13 Jun 2017 17:35:17 +0200
MIME-Version: 1.0
In-Reply-To: <20170608222900.18039-1-danilokrummrich@dk-develop.de>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

[add Michael, Eric and Florian]

Am 09.06.2017 um 00:29 schrieb Danilo Krummrich:
> This commit removes the fixed clocks introduced as a stub clock driver
> added with commit 75fabc3f6448 ("ARM: bcm2835: add stub clock driver").
> Originally they were used to drive the AMBA bus and PL011 uart driver.
> Now these clocks are derived by the CPRMAN clock driver and configured
> in DT.
>
> Additionally, get rid of init_machine function in bcm2835 board file
> as there's nothing to do any longer.
>
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---
> v2: v2: added ACK from Eric Anholt
> v3: rebased onto: [PATCH] irqchip/bcm2836: Move SMP startup code to arch/arm

@Michael, @Stephen:

In case you are okay with this patch, can this go via bcm2835-tree?

> ---
>  arch/arm/mach-bcm/board_bcm2835.c |  8 --------
>  drivers/clk/bcm/clk-bcm2835-aux.c |  1 -
>  drivers/clk/bcm/clk-bcm2835.c     | 30 ------------------------------
>  include/linux/clk/bcm2835.h       | 24 ------------------------
>  4 files changed, 63 deletions(-)
>  delete mode 100644 include/linux/clk/bcm2835.h
>
> diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-bcm/board_bcm2835.c
> index 1e7c6aa..82f2d08 100644
> --- a/arch/arm/mach-bcm/board_bcm2835.c
> +++ b/arch/arm/mach-bcm/board_bcm2835.c
> @@ -15,7 +15,6 @@
>  #include <linux/init.h>
>  #include <linux/irqchip.h>
>  #include <linux/of_address.h>
> -#include <linux/clk/bcm2835.h>
>  #include <linux/irqchip/irq-bcm2836.h>
>  
>  #include <asm/mach/arch.h>
> @@ -52,12 +51,6 @@ static const struct smp_operations bcm2836_smp_ops = {
>  	.smp_boot_secondary	= bcm2836_smp_boot_secondary,
>  };
>  #endif
> -
> -static void __init bcm2835_init(void)
> -{
> -	bcm2835_init_clocks();
> -}
> -
>  static const char * const bcm2835_compat[] = {
>  #ifdef CONFIG_ARCH_MULTI_V6
>  	"brcm,bcm2835",
> @@ -69,7 +62,6 @@ static const char * const bcm2835_compat[] = {
>  };
>  
>  DT_MACHINE_START(BCM2835, "BCM2835")
> -	.init_machine = bcm2835_init,
>  	.dt_compat = bcm2835_compat,
>  	.smp = smp_ops(bcm2836_smp_ops),
>  MACHINE_END
> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
> index bd750cf..77e276d 100644
> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
> @@ -14,7 +14,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/clk/bcm2835.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <dt-bindings/clock/bcm2835-aux.h>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 0258538..e8f37f7 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -37,7 +37,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
>  #include <linux/clk.h>
> -#include <linux/clk/bcm2835.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
> @@ -416,35 +415,6 @@ static int bcm2835_debugfs_regset(struct bcm2835_cprman *cprman, u32 base,
>  	return regdump ? 0 : -ENOMEM;
>  }
>  
> -/*
> - * These are fixed clocks. They're probably not all root clocks and it may
> - * be possible to turn them on and off but until this is mapped out better
> - * it's the only way they can be used.
> - */
> -void __init bcm2835_init_clocks(void)
> -{
> -	struct clk_hw *hw;
> -	int ret;
> -
> -	hw = clk_hw_register_fixed_rate(NULL, "apb_pclk", NULL, 0, 126000000);
> -	if (IS_ERR(hw))
> -		pr_err("apb_pclk not registered\n");
> -
> -	hw = clk_hw_register_fixed_rate(NULL, "uart0_pclk", NULL, 0, 3000000);
> -	if (IS_ERR(hw))
> -		pr_err("uart0_pclk not registered\n");
> -	ret = clk_hw_register_clkdev(hw, NULL, "20201000.uart");
> -	if (ret)
> -		pr_err("uart0_pclk alias not registered\n");
> -
> -	hw = clk_hw_register_fixed_rate(NULL, "uart1_pclk", NULL, 0, 125000000);
> -	if (IS_ERR(hw))
> -		pr_err("uart1_pclk not registered\n");
> -	ret = clk_hw_register_clkdev(hw, NULL, "20215000.uart");
> -	if (ret)
> -		pr_err("uart1_pclk alias not registered\n");
> -}
> -
>  struct bcm2835_pll_data {
>  	const char *name;
>  	u32 cm_ctrl_reg;
> diff --git a/include/linux/clk/bcm2835.h b/include/linux/clk/bcm2835.h
> deleted file mode 100644
> index aa937f6..0000000
> --- a/include/linux/clk/bcm2835.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/*
> - * Copyright (C) 2010 Broadcom
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> - */
> -
> -#ifndef __LINUX_CLK_BCM2835_H_
> -#define __LINUX_CLK_BCM2835_H_
> -
> -void __init bcm2835_init_clocks(void);
> -
> -#endif

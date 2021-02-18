Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98590C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 08:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4242A64E5F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 08:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhBRI33 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 03:29:29 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54477 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhBRI1V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 03:27:21 -0500
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr [86.210.203.113])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 781C76000E;
        Thu, 18 Feb 2021 08:26:06 +0000 (UTC)
Date:   Thu, 18 Feb 2021 09:26:05 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH v9 2/7] clk: clock-wizard: Add the clockwizard to clk
 directory
Message-ID: <20210218092605.37909315@xps13>
In-Reply-To: <1613623791-4598-3-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
        <1613623791-4598-3-git-send-email-shubhrajyoti.datta@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
2021 10:19:46 +0530:

> Add clocking wizard driver to clk.
> And delete the driver from the staging as it is in drivers/clk.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v7:
> Combined the patch for deletion and add of the driver
> dropping the ack from Greg for the staging as it is a combined patch.
> Add vendor prefix to speedgrade
> v8:
> No change
> v9:
> No change
> 
>  drivers/clk/Kconfig                                |  9 +++++++
>  drivers/clk/Makefile                               |  1 +
>  .../clk-xlnx-clock-wizard.c                        |  6 +++--
>  drivers/staging/Kconfig                            |  2 --
>  drivers/staging/Makefile                           |  1 -
>  drivers/staging/clocking-wizard/Kconfig            | 10 --------
>  drivers/staging/clocking-wizard/Makefile           |  2 --
>  drivers/staging/clocking-wizard/TODO               | 12 ---------
>  drivers/staging/clocking-wizard/dt-binding.txt     | 30 ----------------------
>  9 files changed, 14 insertions(+), 59 deletions(-)
>  rename drivers/{staging/clocking-wizard => clk}/clk-xlnx-clock-wizard.c (98%)
>  delete mode 100644 drivers/staging/clocking-wizard/Kconfig
>  delete mode 100644 drivers/staging/clocking-wizard/Makefile
>  delete mode 100644 drivers/staging/clocking-wizard/TODO
>  delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c715d46..d210ed2 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -359,6 +359,15 @@ config COMMON_CLK_FIXED_MMIO
>  	help
>  	  Support for Memory Mapped IO Fixed clocks
>  
> +config COMMON_CLK_XLNX_CLKWZRD
> +	tristate "Xilinx Clocking Wizard"
> +	depends on COMMON_CLK && OF
> +	help
> +	  Support for the Xilinx Clocking Wizard IP core clock generator.
> +	  Adds support for clocking wizard and compatible.
> +	  This driver supports the Xilinx clocking wizard programmable clock
> +	  synthesizer. The number of output is configurable in the design.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index da8fcf1..1ad6414 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
>  obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
> +obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
>  
>  # please keep this section sorted lexicographically by directory path name
>  obj-y					+= actions/
> diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
> similarity index 98%
> rename from drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> rename to drivers/clk/clk-xlnx-clock-wizard.c
> index e52a64b..1bab68e 100644
> --- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> @@ -2,9 +2,11 @@
>  /*
>   * Xilinx 'Clocking Wizard' driver
>   *
> - *  Copyright (C) 2013 - 2014 Xilinx
> + *  Copyright (C) 2013 - 2020 Xilinx
>   *
>   *  Sören Brinkmann <soren.brinkmann@xilinx.com>
> + *  Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> + *
>   */
>  
>  #include <linux/platform_device.h>
> @@ -146,7 +148,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk_wzrd->base))
>  		return PTR_ERR(clk_wzrd->base);
>  
> -	ret = of_property_read_u32(np, "speed-grade", &clk_wzrd->speed_grade);
> +	ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);

Should not be part of this commit.

You should do a mv src.c dest.c, that's all.

>  	if (!ret) {
>  		if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
>  			dev_warn(&pdev->dev, "invalid speed grade '%d'\n",


Thanks,
Miquèl

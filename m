Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750836AbeCICp5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Mar 2018 21:45:57 -0500
Date: Fri, 9 Mar 2018 10:45:14 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Bai Ping <ping.bai@nxp.com>
Cc: sboyd@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de,
        fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        aisheng.dong@nxp.com, jacky.baip@gmail.com
Subject: Re: [PATCH v4 4/4] driver: clk: imx: add clock driver for imx6sll
Message-ID: <20180309024513.GE3217@dragon>
References: <1520502445-22576-1-git-send-email-ping.bai@nxp.com>
 <1520502445-22576-4-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1520502445-22576-4-git-send-email-ping.bai@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 08, 2018 at 05:47:25PM +0800, Bai Ping wrote:
> diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
> new file mode 100644
> index 0000000..e938db5
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx6sll.c
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017-2018 NXP.
> + */
> +
> +#include <dt-bindings/clock/imx6sll-clock.h>
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/types.h>
> +
> +#include "clk.h"
> +
> +#define CCM_ANALOG_PLL_BYPASS		(0x1 << 16)
> +#define BM_CCM_CCDR_MMDC_CH0_MASK	(0x2 << 16)
> +#define CCDR				0x4

We agreed to remove this define, right?

Shawn

> +#define xPLL_CLR(offset)		(offset + 0x8)

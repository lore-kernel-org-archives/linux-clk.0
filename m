Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Mon, 27 Jul 2015 13:26:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 7/7] clk: sunxi: Add a simple gates driver
Message-ID: <20150727202648.GB14521@codeaurora.org>
References: <1437945270-32014-1-git-send-email-maxime.ripard@free-electrons.com>
 <1437945270-32014-8-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1437945270-32014-8-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 07/26, Maxime Ripard wrote:
> diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/clk-simple-gates.c
> new file mode 100644
> index 000000000000..1a3963a8a686
> --- /dev/null
> +++ b/drivers/clk/sunxi/clk-simple-gates.c
> @@ -0,0 +1,159 @@
> +/*
> + * Copyright 2015 Maxime Ripard
> + *
> + * Maxime Ripard <maxime.ripard@free-electrons.com>
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
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>

Is this used?

> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/reset-controller.h>

Is this used?

> +#include <linux/spinlock.h>
> +#include <linux/log2.h>

Is this used?

> +
> +static DEFINE_SPINLOCK(gates_lock);
> +
[...]
> +
> +static const int sun4i_a10_ahb_critical_clocks[] __initdata = {

Shouldn't it be __initconst ?

> +	14,	/* ahb_sdram */
> +};
> +
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

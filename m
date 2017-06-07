Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Jun 2017 13:59:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Burton <paul.burton@imgtec.com>,
	Maarten ter Huurne <maarten@treewalker.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/15] clk: Add Ingenic jz4770 CGU driver
Message-ID: <20170607205943.GO20170@codeaurora.org>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170607200439.24450-5-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Paul Cercueil wrote:
> Add support for the clocks provided by the CGU in the Ingenic JZ4770
> SoC.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Signed-off chain looks odd. Sender should be last in the chain
and first is typically author.

WARNING: struct clk_ops should normally be const
#118: FILE: drivers/clk/ingenic/jz4770-cgu.c:84:
+struct clk_ops jz4770_uhc_phy_ops = {

WARNING: struct clk_ops should normally be const
#149: FILE: drivers/clk/ingenic/jz4770-cgu.c:115:
+struct clk_ops jz4770_otg_phy_ops = {

drivers/clk/ingenic/jz4770-cgu.c:84:16:
warning: symbol 'jz4770_uhc_phy_ops' was not declared. Should it
be static?
drivers/clk/ingenic/jz4770-cgu.c:115:16:
warning: symbol 'jz4770_otg_phy_ops' was not declared. Should it
be static?

> diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
> new file mode 100644
> index 000000000000..993db42df5fc
> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4770-cgu.c
> @@ -0,0 +1,485 @@
> +/*
> + * JZ4770 SoC CGU driver
> + *
> + * Copyright 2017, Paul Cercueil <paul@crapouillou.net>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later
> + * as published by the Free Software Foundation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/of.h>
> +#include <linux/syscore_ops.h>
> +#include <dt-bindings/clock/jz4770-cgu.h>
> +#include "cgu.h"
> +
[..]
> +
> +static struct syscore_ops jz4770_cgu_pm_ops = {
> +	.suspend = jz4770_cgu_pm_suspend,
> +	.resume = jz4770_cgu_pm_resume,
> +};
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static void __init jz4770_cgu_init(struct device_node *np)
> +{
> +	int retval;
> +
> +	cgu = ingenic_cgu_new(jz4770_cgu_clocks,
> +			      ARRAY_SIZE(jz4770_cgu_clocks), np);
> +	if (!cgu)
> +		pr_err("%s: failed to initialise CGU\n", __func__);
> +
> +	retval = ingenic_cgu_register_clocks(cgu);
> +	if (retval)
> +		pr_err("%s: failed to register CGU Clocks\n", __func__);
> +
> +#ifdef CONFIG_PM_SLEEP

if (IS_ENABLED(CONFIG_PM_SLEEP) instead?

> +	register_syscore_ops(&jz4770_cgu_pm_ops);
> +#endif
> +}
> +CLK_OF_DECLARE(jz4770_cgu, "ingenic,jz4770-cgu", jz4770_cgu_init);

Any reason this can't be a platform driver? Please add a comment
above CLK_OF_DECLARE describing what is preventing that.

> diff --git a/include/dt-bindings/clock/jz4770-cgu.h b/include/dt-bindings/clock/jz4770-cgu.h
> new file mode 100644
> index 000000000000..54b8b2ae4a73
> --- /dev/null
> +++ b/include/dt-bindings/clock/jz4770-cgu.h

Can you split this file off into a different patch? That way clk
tree can apply clk patches on top of a stable branch where this
file lives by itself.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

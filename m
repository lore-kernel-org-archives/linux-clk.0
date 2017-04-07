Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 12:33:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: ls1021a: new platform clock driver
Message-ID: <20170407193324.GB7065@codeaurora.org>
References: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
 <20170222150349.16790-2-alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170222150349.16790-2-alexander.stein@systec-electronic.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/22, Alexander Stein wrote:
> This driver currently only implements the QSPI divider register
> SCFG_QSPI_CFG.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Nobody reviewed. Sorry it fell down in my queue and I forgot.

> ---
>  drivers/clk/Makefile      |  1 +
>  drivers/clk/clk-ls1021a.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 drivers/clk/clk-ls1021a.c
> 
> diff --git a/drivers/clk/clk-ls1021a.c b/drivers/clk/clk-ls1021a.c
> new file mode 100644
> index 0000000..2f64806
> --- /dev/null
> +++ b/drivers/clk/clk-ls1021a.c
> @@ -0,0 +1,58 @@
> +/*
> + * Copyright (C) 2017 SYS TEC electronic GmbH
> + * Alexander Stein <alexander.stein@systec-electronic.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation.
> + */
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +static const struct clk_div_table qspi_cfg_div_table[] = {
> +	{ 0x0, 256 }, { 0x1, 64 }, { 0x2, 32 }, { 0x3, 24 },
> +	{ 0x4,  20 }, { 0x5, 15 }, { 0x6, 12 }, { 0x7,  8 },
> +	{ 0 },
> +};
> +
> +static void __init scfg_qspi_cfg_ls1021a_init(struct device_node *np)
> +{
> +	const char *parent_name;
> +	const char *name;
> +	void __iomem *base;
> +	struct clk *parent_clk;
> +	struct clk *clk;
> +	struct resource res;

Unused? but should be used!

> +
> +	base = of_iomap(np, 0);
> +	if (!base) {
> +		pr_warn("Failed to map address range for node %s\n", np->name);

We don't typically need any sort of error message.

> +		return;
> +	}
> +
> +	parent_clk = of_clk_get(np, 0);
> +	if (IS_ERR(parent_clk)) {
> +		pr_warn("Failed to get clock for node %s\n", np->name);
> +		return;
> +	}
> +
> +	/* Register the input clock under the desired name. */
> +	parent_name = __clk_get_name(parent_clk);
> +
> +	if (of_property_read_string(np, "clock-output-names", &name))
> +		name = np->name;

Please just hardcode it unless you really need different names
from DT. We're trying to move away from clock-output-names for
clk tree description as it's inflexible in the face of DT ABI.

> +
> +	/* Works only as those 4 bits (Bits 28-31 big endian) do not cross byte boundary */

This line is too long, but also what's going on? Some sort of
64-bit register here?

> +	clk = clk_register_divider_table(NULL, name, parent_name,
> +				   0, base,
> +				   4, 4, 0, qspi_cfg_div_table, NULL);
> +	if (IS_ERR(clk)) {
> +		pr_warn("Failed to register divider table clock (%ld)\n", PTR_ERR(clk));
> +		return;
> +	}
> +	of_clk_add_provider(np, of_clk_src_simple_get, clk);

Can you please use the clk_hw based provider and divider
registration APIs?

> +}
> +CLK_OF_DECLARE(scfg_qspi_cfg_ls1021a, "fsl,scfg-qspi-cfg-ls1021a", scfg_qspi_cfg_ls1021a_init);

Can this be a platform driver? We usually reserve CLK_OF_DECLARE
for clks that we need to get the timer or interrupt controllers
working because they need to probe so early. Otherwise use a
proper driver and we can use platform device APIs instead of OF
specific ones to map register regions and get clks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

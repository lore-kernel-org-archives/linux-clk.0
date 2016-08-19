Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 17:02:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/3] clk: Loongson1: Refactor Loongson1 clock
Message-ID: <20160819000244.GK361@codeaurora.org>
References: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
 <1470999108-9851-2-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470999108-9851-2-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Keguang Zhang wrote:
> @@ -91,3 +90,4 @@ obj-$(CONFIG_COMMON_CLK_VERSATILE)	+= versatile/
>  obj-$(CONFIG_X86)			+= x86/
>  obj-$(CONFIG_ARCH_ZX)			+= zte/
>  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
> +obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/

Please keep this sorted alphabetically.

> diff --git a/drivers/clk/loongson1/clk.c b/drivers/clk/loongson1/clk.c
> new file mode 100644
> index 0000000..367b84a
> --- /dev/null
> +++ b/drivers/clk/loongson1/clk.c
> @@ -0,0 +1,52 @@
> +/*
> + * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/slab.h>
> +
> +int ls1x_pll_clk_enable(struct clk_hw *hw)
> +{
> +	return 0;
> +}
> +
> +void ls1x_pll_clk_disable(struct clk_hw *hw)
> +{
> +}

Why do we need empty functions?

> +
> +struct clk *__init clk_register_pll(struct device *dev,
> +				    const char *name,
> +				    const char *parent_name,
> +				    const struct clk_ops *ops,
> +				    unsigned long flags)
> +{
> +	struct clk_hw *hw;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +
> +	/* allocate the divider */
> +	hw = kzalloc(sizeof(*hw), GFP_KERNEL);
> +	if (!hw)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = ops;
> +	init.flags = flags | CLK_IS_BASIC;
> +	init.parent_names = (parent_name ? &parent_name : NULL);
> +	init.num_parents = (parent_name ? 1 : 0);
> +	hw->init = &init;
> +
> +	/* register the clock */
> +	clk = clk_register(dev, hw);

Please rebase this on clk: ls1x: Migrate to clk_hw based OF and
registration APIs. I've put that into clk-next.

> +
> +	if (IS_ERR(clk))
> +		kfree(hw);
> +
> +	return clk;
> +}
> +
> diff --git a/drivers/clk/loongson1/clk.h b/drivers/clk/loongson1/clk.h
> new file mode 100644
> index 0000000..aa880e6
> --- /dev/null
> +++ b/drivers/clk/loongson1/clk.h
> @@ -0,0 +1,21 @@
> +/*
> + * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#ifndef __LOONGSON1_CLK_H
> +#define __LOONGSON1_CLK_H

Forward declare struct clk_hw, struct device, struct clk_ops
here.

> +
> +int ls1x_pll_clk_enable(struct clk_hw *hw);
> +void ls1x_pll_clk_disable(struct clk_hw *hw);
> +struct clk *__init clk_register_pll(struct device *dev,

__init is unnecessary in header files.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v5 06/44] clk: davinci: Add platform information for TI
 DM365 PLL
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>, Adam Ford
	<aford173@gmail.com>,
        <linux-kernel@vger.kernel.org>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-7-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <ada2321c-3058-0dcc-c04b-9ef3260f8c12@ti.com>
Date: Tue, 16 Jan 2018 14:18:58 +0530
MIME-Version: 1.0
In-Reply-To: <1515377863-20358-7-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> This adds platform-specific declarations for the PLL clocks on TI
> DaVinci 365 based systems.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  drivers/clk/davinci/Makefile    |  1 +
>  drivers/clk/davinci/pll-dm365.c | 64 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/clk/davinci.h     |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 drivers/clk/davinci/pll-dm365.c
> 
> diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
> index 6720bd0..353aa02 100644
> --- a/drivers/clk/davinci/Makefile
> +++ b/drivers/clk/davinci/Makefile
> @@ -5,4 +5,5 @@ obj-y += pll.o
>  obj-$(CONFIG_ARCH_DAVINCI_DA830)	+= pll-da830.o
>  obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
>  obj-$(CONFIG_ARCH_DAVINCI_DM355)	+= pll-dm355.o
> +obj-$(CONFIG_ARCH_DAVINCI_DM365)	+= pll-dm365.o
>  endif
> diff --git a/drivers/clk/davinci/pll-dm365.c b/drivers/clk/davinci/pll-dm365.c
> new file mode 100644
> index 0000000..9892b0b
> --- /dev/null
> +++ b/drivers/clk/davinci/pll-dm365.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PLL clock descriptions for TI DM365
> + *
> + * Copyright (C) 2017 David Lechner <david@lechnology.com>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +
> +#include "pll.h"
> +
> +static const char * const dm365_pll_obsclk_parent_names[] = {
> +	"ref_clk",
> +};
> +
> +static u32 dm365_pll_obsclk_table[] = {
> +	0x10,

Perhaps use a #define here. Something like OBSCLK_SEL_OSC.

> +void __init dm365_pll_clk_init(void __iomem *pll1, void __iomem *pll2)
> +{
> +	const struct davinci_pll_divclk_info *info;
> +
> +	davinci_pll_clk_register("pll1", "ref_clk", pll1);
> +	davinci_pll_aux_clk_register("pll1_aux_clk", "ref_clk", pll1);
> +	davinci_pll_bpdiv_clk_register("pll1_sysclkbp", "ref_clk", pll1);
> +	davinci_pll_obs_clk_register("clkout0", dm365_pll_obsclk_parent_names,
> +				     ARRAY_SIZE(dm365_pll_obsclk_parent_names),
> +				     pll1, dm365_pll_obsclk_table);
> +	for (info = dm365_pll1_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll1);
> +
> +	davinci_pll_clk_register("pll2", "ref_clk", pll2);
> +	davinci_pll_aux_clk_register("clkout1", "ref_clk", pll2);
> +	davinci_pll_obs_clk_register("clkout1", dm365_pll_obsclk_parent_names,
> +				    ARRAY_SIZE(dm365_pll_obsclk_parent_names),
> +				    pll2, dm365_pll_obsclk_table);
> +	for (info = dm365_pll2_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll2);
> +}

With that and the empty line comment I gave earlier.

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar

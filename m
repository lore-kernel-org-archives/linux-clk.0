Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v5 07/44] clk: davinci: Add platform information for TI
 DM644x PLL
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
 <1515377863-20358-8-git-send-email-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <1f19247f-8417-7035-68e3-2779ef316024@ti.com>
Date: Tue, 16 Jan 2018 14:26:27 +0530
MIME-Version: 1.0
In-Reply-To: <1515377863-20358-8-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> This adds platform-specific declarations for the PLL clocks on TI
> DaVinci 644x based systems.

DM644x

> Signed-off-by: David Lechner <david@lechnology.com>

> + * Copyright (C) 2017 David Lechner <david@lechnology.com>

2018 now.

> +void __init dm644x_pll_clk_init(void __iomem *pll1, void __iomem *pll2)
> +{
> +	const struct davinci_pll_divclk_info *info;
> +
> +	davinci_pll_clk_register("pll1", "ref_clk", pll1);
> +	for (info = dm644x_pll1_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll1);
> +	davinci_pll_aux_clk_register("pll1_aux_clk", "ref_clk", pll1);
> +	davinci_pll_bpdiv_clk_register("pll1_sysclkbp", "ref_clk", pll1);
> +
> +	davinci_pll_clk_register("pll2", "ref_clk", pll2);
> +	for (info = dm644x_pll2_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll2);
> +	davinci_pll_bpdiv_clk_register("pll2_sysclkbp", "ref_clk", pll2);
> +}

Here too, more line spacing will help.

With those minor comments.

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar

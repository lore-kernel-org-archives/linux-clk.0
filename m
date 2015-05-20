Return-Path: <sboyd@codeaurora.org>
Date: Wed, 20 May 2015 16:16:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Lars-Peter Clausen <lars@metafoo.de>,
	Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 25/37] clk: ingenic: add driver for Ingenic SoC CGU
 clocks
Message-ID: <20150520231644.GZ31753@codeaurora.org>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-26-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1429881457-16016-26-git-send-email-paul.burton@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/24, Paul Burton wrote:
> +
> +static unsigned long
> +ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct ingenic_clk *ingenic_clk = to_ingenic_clk(hw);
> +	struct ingenic_cgu *cgu = ingenic_clk->cgu;
> +	const struct ingenic_cgu_clk_info *clk_info;
> +	const struct ingenic_cgu_pll_info *pll_info;
> +	unsigned m, n, od_enc, od;
> +	bool bypass, enable;
> +	unsigned long flags;
> +	u32 ctl;
> +
> +	clk_info = &cgu->clock_info[ingenic_clk->idx];
> +	BUG_ON(clk_info->type != CGU_CLK_PLL);
> +	pll_info = &clk_info->pll;
> +
> +	spin_lock_irqsave(&cgu->lock, flags);
> +	ctl = readl(cgu->base + pll_info->reg);
> +	spin_unlock_irqrestore(&cgu->lock, flags);
> +
> +	m = ((ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0));
> +	m += pll_info->m_offset;
> +	n = ((ctl >> pll_info->n_shift) & GENMASK(pll_info->n_bits - 1, 0));

Nitpick: Some unnecessary () here.

> +	n += pll_info->n_offset;
> +	od_enc = ctl >> pll_info->od_shift;
> +	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
> +	bypass = !!(ctl & BIT(pll_info->bypass_bit));
> +	enable = !!(ctl & BIT(pll_info->enable_bit));
> +
> +	if (bypass)
> +		return parent_rate;
> +
> +	if (!enable)
> +		return 0;
> +
> +	for (od = 0; od < pll_info->od_max; od++) {
> +		if (pll_info->od_encoding[od] == od_enc)
> +			break;
> +	}
> +	BUG_ON(od == pll_info->od_max);
> +	od++;
> +
> +	return div_u64((u64)parent_rate * m, n * od);
> +
[...]
> +
> +/*
> + * Setup functions.
> + */
> +
> +static int register_clock(struct ingenic_cgu *cgu, unsigned idx)

Please namespace this. It's too generic. igenic_register_clk()?

> +{
> +	const struct ingenic_cgu_clk_info *clk_info = &cgu->clock_info[idx];
> +	struct clk_init_data clk_init;
> +	struct ingenic_clk *ingenic_clk = NULL;
[...]
> +
> +
> +/**
> + * ingenic_cgu_register_clocks() - Registers the clocks
> + * @cgu: pointer to cgu data
> + *
> + * Register the clocks described by the CGU with the common clock framework.
> + *
> + * Return: 1 on success or -errno if unsuccesful.

It looks like it returns 0 instead of 1 on success? 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

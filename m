Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.137]:52222 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766AbcCICUk (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 8 Mar 2016 21:20:40 -0500
Subject: Re: [RESEND PATCH v2 3/5] clk: rockchip: add new pll-type for rk3399
 and similar socs
To: Heiko Stuebner <heiko@sntech.de>
References: <1456827275-8035-1-git-send-email-zhengxing@rock-chips.com>
 <1456827275-8035-4-git-send-email-zhengxing@rock-chips.com>
 <3286748.Col0jAfKKX@phil>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
	jay.xu@rock-chips.com, elaine.zhang@rock-chips.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Xing Zheng <zhengxing@rock-chips.com>
Message-ID: <56DF8868.6070706@rock-chips.com>
Date: Wed, 9 Mar 2016 10:20:24 +0800
MIME-Version: 1.0
In-Reply-To: <3286748.Col0jAfKKX@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,

On 2016年03月09日 09:22, Heiko Stuebner wrote:
> Am Dienstag, 1. März 2016, 18:14:33 schrieb Xing Zheng:
>
>> +static int rockchip_rk3399_pll_set_params(struct rockchip_clk_pll *pll,
>> +				const struct rockchip_pll_rate_table *rate)
>> +{
>> +	const struct clk_ops *pll_mux_ops = pll->pll_mux_ops;
>> +	struct clk_mux *pll_mux = &pll->pll_mux;
>> +	struct rockchip_pll_rate_table cur;
>> +	u32 pllcon;
>> +	int rate_change_remuxed = 0;
>> +	int cur_parent;
>> +	int ret;
>> +
>> +	pr_debug("%s: rate settings for %lu fbdiv: %d, postdiv1: %d, refdiv: %d,
>> postdiv2: %d, dsmpd: %d, frac: %d\n", +		__func__, rate->rate,
>> rate->fbdiv, rate->postdiv1, rate->refdiv, +		rate->postdiv2,
>> rate->dsmpd, rate->frac);
>> +
>> +	rockchip_rk3399_pll_get_params(pll, &cur);
>> +	cur.rate = 0;
>> +
>> +	cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
>> +	if (cur_parent == PLL_MODE_NORM) {
>> +		pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
>> +		rate_change_remuxed = 1;
>> +	}
>> +
>> +	/* update pll values */
>> +	writel_relaxed(HIWORD_UPDATE(rate->fbdiv, RK3399_PLLCON0_FBDIV_MASK,
>> +					  RK3399_PLLCON0_FBDIV_SHIFT),
> indentation is strange ... I guess the plan was to move
> RK3399_PLLCON0_FBDIV_SHIFT under RK3399_PLLCON0_FBDIV_MASK, currently it's
> having tabs + spaces but has no alignment whatsoever
Yes, I think that it due to copy them from the RK3036 style ...
>
>> +		       pll->reg_base + RK3399_PLLCON(0));
>> +
>> +	writel_relaxed(HIWORD_UPDATE(rate->refdiv, RK3399_PLLCON1_REFDIV_MASK,
>> +						   RK3399_PLLCON1_REFDIV_SHIFT) |
>> +		       HIWORD_UPDATE(rate->postdiv1, RK3399_PLLCON1_POSTDIV1_MASK,
>> +					     RK3399_PLLCON1_POSTDIV1_SHIFT) |
> same for postdiv1
Done.
>
>> +		       HIWORD_UPDATE(rate->postdiv2, RK3399_PLLCON1_POSTDIV2_MASK,
>> +						     RK3399_PLLCON1_POSTDIV2_SHIFT),
>> +		       pll->reg_base + RK3399_PLLCON(1));
>
> rest looks nice
>
>
> Heiko
>
Thanks.

-- 
- Xing Zheng



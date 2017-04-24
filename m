Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52431 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1046392AbdDXLMd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2017 07:12:33 -0400
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, inki.dae@samsung.com,
        sw0312.kim@samsung.com, cw00.choi@samsung.com,
        javier@osg.samsung.com, jy0922.shim@samsung.com,
        broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <017b3ec8-c185-c29a-2944-12f519b461fe@samsung.com>
Date: Mon, 24 Apr 2017 13:12:22 +0200
MIME-version: 1.0
In-reply-to: <20170422152236.tbf4iuoadqrvoc2n@kozik-lap>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
        <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
        <20170422152236.tbf4iuoadqrvoc2n@kozik-lap>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/22/2017 05:22 PM, Krzysztof Kozlowski wrote:
[...]
>> +static void samsung_pll3xxx_disable(struct clk_hw *hw)
>> +{
>> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
>> +	u32 tmp;
>> +
>> +	tmp = readl_relaxed(pll->con_reg);
>> +	tmp |= BIT(pll->enable_offs);
>
> I think you meant here:
> 	tmp &= ~BIT()

Yes, I messed it up while copy/pasting from samsung_pll3xxx_enable().

>> +	writel_relaxed(tmp, pll->con_reg);
>> +}

>>  static unsigned long samsung_pll36xx_recalc_rate(struct clk_hw *hw,
>>  				unsigned long parent_rate)
>> @@ -354,10 +359,12 @@ static int samsung_pll36xx_set_rate(struct clk_hw *hw, unsigned long drate,
>>  	writel_relaxed(pll_con1, pll->con_reg + 4);
>>
>>  	/* wait_lock_time */
>> -	do {
>> -		cpu_relax();
>> -		tmp = readl_relaxed(pll->con_reg);
>> -	} while (!(tmp & (1 << PLL36XX_LOCK_STAT_SHIFT)));

I will add a comment here like:
/* Wait until the PLL is locked if it is enabled. */

>> +	if (pll_con0 & BIT(pll->enable_offs)) {
>
> Why this additional if() is needed?

The PLL will never transition to a locked state if it is disabled, without
this test we would end up with an indefinite loop below.

>> +		do {
>> +			cpu_relax();
>> +			tmp = readl_relaxed(pll->con_reg);
>> +		} while (!(tmp & BIT(PLL36XX_LOCK_STAT_SHIFT)));
>
> To be consistent:
> BIT(pll->lock_offs)?

Yes, fixed.

Thanks for your review!

--
Regards,
Sylwester

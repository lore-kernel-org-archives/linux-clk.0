Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51892 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1046497AbdDXLMq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2017 07:12:46 -0400
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, inki.dae@samsung.com,
        sw0312.kim@samsung.com, cw00.choi@samsung.com,
        javier@osg.samsung.com, krzk@kernel.org, jy0922.shim@samsung.com,
        broonie@kernel.org, robh+dt@kernel.org, b.zolnierkie@samsung.com
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <cf931f91-aec1-d667-bede-da01e0b94258@samsung.com>
Date: Mon, 24 Apr 2017 13:12:36 +0200
MIME-version: 1.0
In-reply-to: <20170422025127.GS7065@codeaurora.org>
Content-type: text/plain; charset="windows-1252"; format="flowed"
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
        <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
        <20170422025127.GS7065@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/22/2017 04:51 AM, Stephen Boyd wrote:
>> +static int samsung_pll3xxx_enable(struct clk_hw *hw)
>> +{
>> +	struct samsung_clk_pll *pll = to_clk_pll(hw);
>> +	u32 tmp;
>> +
>> +	tmp = readl_relaxed(pll->con_reg);
>> +	tmp |= BIT(pll->enable_offs);
>> +	writel_relaxed(tmp, pll->con_reg);
>> +
>> +	/* wait lock time */
>> +	do {
>> +		cpu_relax();
>> +		tmp = readl_relaxed(pll->con_reg);
>> +	} while (!(tmp & BIT(pll->lock_offs)));
 >
> Not a problem with this patch because we're moving code around,
> but this is a potential infinite loop that should have some sort
> of timeout so we don't sit here forever trying to see a bit
> toggle.

Yes, I will add some protection in new patch, like it is done
for newer PLLs. Thanks for you review.

-- 
Regards,
Sylwester

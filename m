Return-Path: <nikita.yoush@cogentembedded.com>
Return-Path: <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH] clk: imx: pllv3: support fractional multiplier on vf610
 PLL1/PLL2
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1481288408-16035-1-git-send-email-nikita.yoush@cogentembedded.com>
 <20161213073858.GO5423@codeaurora.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <b1e99e42-be9f-12ca-d687-b08306ed56fd@cogentembedded.com>
Date: Tue, 13 Dec 2016 10:51:52 +0300
MIME-Version: 1.0
In-Reply-To: <20161213073858.GO5423@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

>> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
>> index 19f9b622981a..24a9e914e0d5 100644
>> --- a/drivers/clk/imx/clk-pllv3.c
>> +++ b/drivers/clk/imx/clk-pllv3.c
>> @@ -288,6 +291,87 @@ static const struct clk_ops clk_pllv3_av_ops = {
>>  	.set_rate	= clk_pllv3_av_set_rate,
>>  };
>>  
>> +static unsigned long clk_pllv3_vf610_recalc_rate(struct clk_hw *hw,
>> +					      unsigned long parent_rate)
>> +{
>> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
>> +	u32 mfn = readl_relaxed(pll->base + PLL_VF610_NUM_OFFSET);
>> +	u32 mfd = readl_relaxed(pll->base + PLL_VF610_DENOM_OFFSET);
>> +	u32 div = (readl_relaxed(pll->base) & pll->div_mask) ? 22 : 20;

Should be not 'div' but 'mfi' to be consistent with datasheet and with
other routines in the same patch. Will fix.

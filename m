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
Message-ID: <c53ea5f7-c913-ea64-5b7f-3c3ce0b66e82@cogentembedded.com>
Date: Tue, 13 Dec 2016 10:49:31 +0300
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
>> +	u64 temp64 = (u64)parent_rate;
> 
> Useless cast, please remove.

Ok

>> +
>> +	temp64 *= mfn;
>> +	do_div(temp64, mfd);
>> +
>> +	return (parent_rate * div) + (u32)temp64;
>> +}
>> +
>> +static long clk_pllv3_vf610_round_rate(struct clk_hw *hw, unsigned long rate,
>> +				    unsigned long *prate)
>> +{
>> +	unsigned long parent_rate = *prate;
>> +	unsigned int mfi = (rate >= 22 * parent_rate) ? 22 : 20;
> 
> What is the importance of 22 and 20? Hint, at the least it needs
> a comment.

These come directly from datasheet:

Frequency multipler selection (MFI).
0: Fout = Fref * 20
1: Fout = Fref * 22

These numbers (20 / 22) are common among flavours of pllv3 hardware.
In similar places in the same file (e.g. in clk_pllv3_recalc_rate(), in
clk_pllv3_set_rate() ,etc) there are no comments explaining them.

Are you sure this place is special and comment is needed here?

>> +	u32 mfn, mfd = 0x3fffffff;
>> +	u64 temp64;
>> +
>> +	if (rate <= parent_rate * mfi)
>> +		mfn = 0;
>> +	else if (rate >= parent_rate * (mfi + 1))
>> +		mfn = mfd - 1;
>> +	else {
>> +		/* rate = parent_rate * (mfi + mfn/mfd) */
>> +		temp64 = rate - parent_rate * mfi;
>> +		temp64 *= mfd;
>> +		do_div(temp64, parent_rate);
>> +		mfn = temp64;
>> +	}
>> +
>> +	temp64 = ((u64)mfd * mfi + mfn) * parent_rate;
>> +	do_div(temp64, mfd);
>> +	return (u32)temp64;
> 
> Do we need the cast here for some reason?

Just for readability, can remove if it hurts.

>> +}
>> +
>> +static int clk_pllv3_vf610_set_rate(struct clk_hw *hw, unsigned long rate,
>> +		unsigned long parent_rate)
>> +{
>> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
>> +	unsigned int mfi = (rate >= 22 * parent_rate) ? 22 : 20;
>> +	u32 val, mfn, mfd = 0x3fffffff;
>> +	u64 temp64;
>> +
>> +	if (rate <= parent_rate * mfi)
>> +		mfn = 0;
>> +	else if (rate >= parent_rate * (mfi + 1))
>> +		mfn = mfd - 1;
>> +	else {
>> +		/* rate = parent_rate * (mfi + mfn/mfd) */
>> +		temp64 = rate - parent_rate * mfi;
>> +		temp64 *= mfd;
>> +		do_div(temp64, parent_rate);
>> +		mfn = temp64;
>> +	}
>> +
>> +	val = readl_relaxed(pll->base);
>> +	if (mfi == 20)
> 
> Presumably this is another place 20 and 22 are special.

See my reply above. Same applies here.

Nikita

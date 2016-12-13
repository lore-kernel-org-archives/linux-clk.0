Return-Path: <sboyd@codeaurora.org>
Date: Tue, 13 Dec 2016 15:19:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] clk: imx: pllv3: support fractional multiplier on vf610
 PLL1/PLL2
Message-ID: <20161213231900.GP5423@codeaurora.org>
References: <1481288408-16035-1-git-send-email-nikita.yoush@cogentembedded.com>
 <20161213073858.GO5423@codeaurora.org>
 <c53ea5f7-c913-ea64-5b7f-3c3ce0b66e82@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <c53ea5f7-c913-ea64-5b7f-3c3ce0b66e82@cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/13, Nikita Yushchenko wrote:
> >> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> >> index 19f9b622981a..24a9e914e0d5 100644
> >> --- a/drivers/clk/imx/clk-pllv3.c
> >> +++ b/drivers/clk/imx/clk-pllv3.c
> 
> >> +
> >> +	temp64 *= mfn;
> >> +	do_div(temp64, mfd);
> >> +
> >> +	return (parent_rate * div) + (u32)temp64;
> >> +}
> >> +
> >> +static long clk_pllv3_vf610_round_rate(struct clk_hw *hw, unsigned long rate,
> >> +				    unsigned long *prate)
> >> +{
> >> +	unsigned long parent_rate = *prate;
> >> +	unsigned int mfi = (rate >= 22 * parent_rate) ? 22 : 20;
> > 
> > What is the importance of 22 and 20? Hint, at the least it needs
> > a comment.
> 
> These come directly from datasheet:
> 
> Frequency multipler selection (MFI).
> 0: Fout = Fref * 20
> 1: Fout = Fref * 22
> 
> These numbers (20 / 22) are common among flavours of pllv3 hardware.
> In similar places in the same file (e.g. in clk_pllv3_recalc_rate(), in
> clk_pllv3_set_rate() ,etc) there are no comments explaining them.
> 
> Are you sure this place is special and comment is needed here?

Probably an oversight when merging the code before. Please add a
comment, or make some sort of function like

	rate_to_mfi(rate, parent_rate)

And then add a comment above the function to describe what's
special about 22 and 20.

> 
> >> +	u32 mfn, mfd = 0x3fffffff;
> >> +	u64 temp64;
> >> +
> >> +	if (rate <= parent_rate * mfi)
> >> +		mfn = 0;
> >> +	else if (rate >= parent_rate * (mfi + 1))
> >> +		mfn = mfd - 1;
> >> +	else {
> >> +		/* rate = parent_rate * (mfi + mfn/mfd) */
> >> +		temp64 = rate - parent_rate * mfi;
> >> +		temp64 *= mfd;
> >> +		do_div(temp64, parent_rate);
> >> +		mfn = temp64;
> >> +	}
> >> +
> >> +	temp64 = ((u64)mfd * mfi + mfn) * parent_rate;
> >> +	do_div(temp64, mfd);
> >> +	return (u32)temp64;
> > 
> > Do we need the cast here for some reason?
> 
> Just for readability, can remove if it hurts.

Please do.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
Date: Mon, 2 May 2016 17:36:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mason <slash.tmp@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sebastian Frias <sf84@laposte.net>, clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3] clk: tango4: improve clkgen driver
Message-ID: <20160503003650.GF3492@codeaurora.org>
References: <56BE0F25.2040909@free.fr>
 <20160225220803.GK4847@codeaurora.org>
 <56D066B1.7000808@free.fr>
 <57023205.6050903@free.fr>
 <20160416001608.GC26353@codeaurora.org>
 <5711F947.4010204@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5711F947.4010204@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 04/16, Mason wrote:
> On 16/04/2016 02:16, Stephen Boyd wrote:
> 
> > Applied to clk-next
> 
> Great! Thanks.
> 
> Hopefully, I won't have to write any more clk code until Tango5.
> 
> The last feature missing is support for fractional dividers.
> We discussed this back in March on IRC, and you mentioned
> "libifying" some parts of the code.
> 
> Could you say a bit more to put me on the right track?

I mean that clk-fractional-divider.c can become more like
clk-divider.c and grow functions like
fractional_divider_round_rate(), fractional_divider_get_val(),
and fractional_divider_recalc_rate() that would parallel
divider_round_rate(), divider_get_val() and divider_recalc_rate()
respectively. If any sort of flags are needed to change rounding
behavior, etc. then a flags argument could be used similar to how
the divider code has one.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

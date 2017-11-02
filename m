Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 00:00:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Opera <montvid@gmail.com>, John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] RESEND: clk: Avoid sending high rates to downstream
 clocks during set_rate
Message-ID: <20171102070003.GI30645@codeaurora.org>
References: <20171004023006.31763-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171004023006.31763-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/04, Linus Walleij wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> If a clock is on and we call clk_set_rate() on it we may get into
> a situation where the clock temporarily increases in rate
> dramatically while we walk the tree and call .set_rate() ops. For
> example, consider a case where a PLL feeds into a divider.
> Initially the divider is set to divide by 1 and the PLL is
> running fairly slow (100MHz). The downstream consumer of the
> divider output can only handle rates =< 400 MHz, but the divider
> can only choose between divisors of 1 and 4.
> 
>  +-----+   +----------------+
>  | PLL |-->| div 1 or div 4 |---> consumer device
>  +-----+   +----------------+
> 
> To achieve a rate of 400MHz on the output of the divider, we
> would have to set the rate of the PLL to 1.6 GHz and then divide
> it by 4. The current code would set the PLL to 1.6GHz first while
> the divider is still set to 1, thus causing the downstream
> consumer of the clock to receive a few clock cycles of 1.6GHz
> clock (far beyond it's maximum acceptable rate). We should be
> changing the divider first before increasing the PLL rate to
> avoid this problem.
> 
> Therefore, set the rate of any child clocks that are increasing
> in rate from their current rate so that they can increase their
> dividers if necessary. We assume that there isn't such a thing as
> minimum rate requirements.
> 
> Cc: Opera <montvid@gmail.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> Stephen: just wanted to check what's up with this patch.
> When I apply it on my kernel I get graphics on the Nexus7,
> when I don't, I don't.
> 
> OpenWRT has started to carry the patch in their tree I noticed.
> I found it in John Stultz patch stack.
> 
> Is there some similar patch floating in some other series, is
> it fundamentally wrong or something else?
> 
> Just wanted to reboot the discussion so we know where this is
> standing.

This patch wants to go away and be replaced with coordinated clk
rates code. So far, nothing has appeared for that though, so this
problem is stuck in limbo, blocking Krait CPUfreq.

I have no idea why it matters for your Nexus7 graphics stuff. As
far as I know the GPU clk on Nexus7 is a plain old dynamic rcg
that can switch rates glitch free and we don't do anything odd
like reprogramming the parent PLL of the rcg to use faster rates,
which is mostly what this patch is for.

I wrote this patch for Krait CPUfreq originally. In that case we
reprogram PLLs higher up in tree and then have to adjust dividers
below that and doing that in the wrong order causes high
frequencies to come down the tree into the CPU that we can't turn
off.

I suspect OpenWRT has pulled in the patch for Krait CPUfreq. It
could be that you also need it for that. Or it could be that odd
line where we don't look at the result of clk_recalc, and just
blast in the calculated new rate into core->rate somehow fixes
something.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

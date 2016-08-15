Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 11:29:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] clk: core: Force setting the phase delay when no change
Message-ID: <20160815182959.GV361@codeaurora.org>
References: <20160813164656.DD30A61A06@smtp.codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160813164656.DD30A61A06@smtp.codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/13, Jean-Francois Moine wrote:
> The hardware phase delay may depend on some other settings as clock
> reparenting, so, it has to be set each time.
> Also, when the delay was the same as previously, an error was returned.
> 
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---

This effectively reverts commit 023bd7166be0 (clk: skip
unnecessary set_phase if nothing to do, 2016-02-26), so I'd like
to see if Shawn has any comments or if that patch was just a
broken optimization.

We may want to go another route and get the phase from the
hardware and compare that to what's requested. That way we don't
set the phase again unnecessarily.

>  drivers/clk/clk.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 820a939..2e6b91e 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1908,10 +1908,6 @@ int clk_set_phase(struct clk *clk, int degrees)
>  
>  	clk_prepare_lock();
>  
> -	/* bail early if nothing to do */
> -	if (degrees == clk->core->phase)
> -		goto out;
> -
>  	trace_clk_set_phase(clk->core, degrees);
>  
>  	if (clk->core->ops->set_phase)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

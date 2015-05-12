Return-Path: <sboyd@codeaurora.org>
Message-ID: <55528B84.5050700@codeaurora.org>
Date: Tue, 12 May 2015 16:23:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Mike Turquette <mturquette@linaro.org>
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: Automatic clock disabling on clk_put()
References: <20150511060129.GG6325@pengutronix.de>
In-Reply-To: <20150511060129.GG6325@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/10/15 23:01, Sascha Hauer wrote:
> Hi,
>
> Since we now have per-user clks we could automatically disable clks on
> clk_put() to make the drivers errors paths easier. AFAIR that was one
> of the motivations to switch to per user clks. Is this just not yet
> implemented or are there problems implementing this?
>
>

I don't recall that as being a motivation for per-user clks. The
documentation explicitly states:

 * Note: drivers must ensure that all clk_enable calls made on this
 * clock source are balanced by clk_disable calls prior to calling
 * this function.

so it seems that such a behavior would be an API change. Is it really
that hard to call clk_disable_unprepare() on a clock at the end of an
error path? Maybe you could add a devm_clk_get_prepare_enable() that
does what you want and then call clk_disable_unprepare on the exit path?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

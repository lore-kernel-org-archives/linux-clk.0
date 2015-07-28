Return-Path: <sboyd@codeaurora.org>
Date: Tue, 28 Jul 2015 14:34:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	romain.perier@gmail.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: handle fixed-rate clocks correctly in
 clk_core_round_rate_nolock
Message-ID: <20150728213434.GD14521@codeaurora.org>
References: <110607065.NoWaKp3mDJ@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <110607065.NoWaKp3mDJ@diego>
List-ID: <linux-clk.vger.kernel.org>

On 07/26, Heiko Stübner wrote:
> Commit 6edc753d8ecc ("clk: change clk_ops' ->determine_rate() prototype")
> changed the behaviour of clk_core_round_rate_nolock as it forgot to also
> include the else conditional simply returning the clock rate for clocks
> that neither have a parent or can determine their rate - for example
> said fixed clocks.
> 
> This resulted in failures to set pll rates on rockchip socs, as it
> returned the target pll rate as suitable rate for the 24MHz xin24m clock,
> thus making the ccf want to set this fixed clock to 1.6GHz or similar.
> 
> Fixes: 6edc753d8ecc ("clk: change clk_ops' ->determine_rate() prototype")
> Reported-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Thanks I folded this into the original patch and pushed it out to
-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

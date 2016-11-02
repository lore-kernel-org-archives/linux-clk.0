Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:56:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: pxa: core pll is not affected by t bit
Message-ID: <20161102005645.GX16026@codeaurora.org>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
 <1477225170-19019-3-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477225170-19019-3-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/23, Robert Jarzmik wrote:
> The t bit of clkfcfg doesn't affect the core pll clock, but it makes core
> clock select between core pll clock and core run clock.
> 
> As such remove it from the core pll rate reporting function, while it
> remains in clk_pxa27x_core_get_parent().
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

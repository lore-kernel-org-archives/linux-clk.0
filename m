Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 17:33:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	James Hogan <james.hogan@imgtec.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: divider: Fix clk_divider_round_rate() to use
 clk_readl()
Message-ID: <20160813003319.GB25111@codeaurora.org>
References: <1471005474-32301-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471005474-32301-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Geert Uytterhoeven wrote:
> clk-divider uses clk_readl()/clk_writel() everywhere, except in
> clk_divider_round_rate(), where plain readl() is used. Change this to
> clk_readl(), as it makes a difference on powerpc.
> 
> Fixes: e6d5e7d90be92cee ("clk-divider: Fix READ_ONLY when divider > 1")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

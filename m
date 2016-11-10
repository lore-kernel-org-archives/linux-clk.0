Return-Path: <sboyd@codeaurora.org>
Date: Thu, 10 Nov 2016 15:35:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: renesas: Updates for v4.10 (take one)
Message-ID: <20161110233556.GN16026@codeaurora.org>
References: <1478532868-5508-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1478532868-5508-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 11/07, Geert Uytterhoeven wrote:
> clk: renesas: Updates for v4.10 (take one)
> 
>   - SYS-DMAC, (H)SCIF, I2C, DRIF, and graphics related clocks for R-Car
>     M3-W,
>   - Minor fixes and cleanups.
> 
> Thanks for pulling!
> ----------------------------------------------------------------
> Geert Uytterhoeven (4):
>       clk: renesas: cpg-mssr: Always use readl()/writel()
>       clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
>       clk: renesas: cpg-mssr: Fix inverted debug check

Hm.. I already applied this one to clk-next. If you're going to
apply patches can you please indicate if they've been picked up
and/or not send them To: Mike and I, please?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

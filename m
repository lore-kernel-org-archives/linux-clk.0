Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 15:00:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: renesas: cpg-mssr: Migrate to CLK_IS_CRITICAL
Message-ID: <20170120230007.GD8009@codeaurora.org>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
 <1484657190-12838-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484657190-12838-2-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/17, Geert Uytterhoeven wrote:
> When the Renesas CPG/MSSR driver was introduced, it was anticipated that
> critical clocks would be handled through a new CLK_ENABLE_HAND_OFF flag
> soon.  However, CLK_ENABLE_HAND_OFF never made it upstream.
> 
> Instead, commit 32b9b10961860860 ("clk: Allow clocks to be marked as
> CRITICAL") introduced CLK_IS_CRITICAL, a flag with slightly differing
> semantics.  Still, it can be used to prevent e.g. the GIC module clock
> from being turned off, until the GIC-400 driver has full support for
> Runtime PM.
> 
> Hence migrate the Renesas CPG/MSSR driver from CLK_ENABLE_HAND_OFF to
> CLK_IS_CRITICAL.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

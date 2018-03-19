Return-Path: <horms@verge.net.au>
Date: Mon, 19 Mar 2018 09:53:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] clk: renesas: Always use readl()/writel()
Message-ID: <20180319085358.mfyjznzxe2n4duwm@verge.net.au>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 16, 2018 at 02:40:14PM +0100, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> On arm32/arm64, there is no reason to use the (soon deprecated)
> clk_readl()/clk_writel(), and the generic readl()/writel() should be
> used in instead.
> 
> Commit 30ad3cf00e94f4a7 ("clk: renesas: rcar-gen3-cpg: Always use
> readl()/writel()") already got rid of them in the R-Car Gen3 clock
> driver, but Stephen noticed that a few new users crept in recently.
> 
> Hence this series fixes that, and replaces all other uses in the Renesas
> clock drivers as a bonus.
> 
> I plan to queue these up in clk-renesas-for-v4.17.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

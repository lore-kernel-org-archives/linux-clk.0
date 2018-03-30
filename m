Return-Path: <horms@verge.net.au>
Date: Fri, 30 Mar 2018 09:41:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: renesas: r-car gen2: Fix LB clock divider
Message-ID: <20180330074136.sirwfohz3tnraf5r@verge.net.au>
References: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 29, 2018 at 07:33:05PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The CLK_TYPE_GEN2_LB clock type is meant for SoCs like R-Car H2, where
> the LB clock divider depends on the value of the MD18 pin.
> 
> However, on most RZ/G1 and R-Car Gen2 SoCs, the LB clock divider is
> fixed to 24.  Hence this series corrects the LB clock on affected SoCs
> by modelling it as a fixed factor clock instead.
> 
> This doesn't have much impact, as no kernel code relies on the rate of
> the LB clock.
> 
> To be queued in clk-renesas-for-v4.18.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

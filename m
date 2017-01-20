Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 15:00:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: renesas: Use CLK_IS_CRITICAL to handle critical
 clocks
Message-ID: <20170120230000.GC8009@codeaurora.org>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/17, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> This patch series adds support for the CLK_IS_CRITICAL flag to drivers
> for module clocks on Renesas ARM SoCs.  For now, this is used to prevent
> disabling of the ARM GIC module clock, which would lead to a system
> lock-up when accessing the GIC's registers.
> 
>   1. The first patch migrates the Renesas CPG/MSSR driver from the
>      never merged CLK_ENABLE_HAND_OFF flag to the CLK_IS_CRITICAL flag.
>      Note that as the driver already handled critical clocks (i.e. it
>      ignored them :-), this is not a prerequisite for linking the GIC to
>      its module clock in DT.
> 
>   2. The second patch makes sure the CLK_IS_CRITICAL flag is set for the
>      INTC-SYS clock on SoCs not (yet) using the Renesas CPG/MSSR driver.
>      Note that this is a hard dependency for describing the INTC-SYS
>      clock in DT on R-Mobile APE6 and R-Car Gen2.
> 
> I plan to queue these patches in my clk-renesas-for-v4.11 branch, if
> you agree.
> 

Would the runtime PM patches for ccf make things any better here?
I still plan to support CLK_ENABLE_HAND_OFF somehow, but it's not
at the top of my priority list right now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

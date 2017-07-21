Return-Path: <sboyd@codeaurora.org>
Date: Fri, 21 Jul 2017 13:34:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: renesas: rcar-gen3: Add support for SCCG/Clean
 peripheral clocks
Message-ID: <20170721203421.GF19878@codeaurora.org>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
 <1500554409-22423-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1500554409-22423-4-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 07/20, Geert Uytterhoeven wrote:
> On R-Car Gen3 SoCs with a Spread Spectrum Clock Generator (e.g. R-Car
> D3), a peripheral clock divider has been added, to select between clean
> and spread spectrum parents.
> 
> Add a new clock type to the R-Car Gen3 driver core to handle this.
> To avoid increasing the size of struct cpg_core_clk, both parents and
> dividers are stored in the existing parent resp. div fields.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

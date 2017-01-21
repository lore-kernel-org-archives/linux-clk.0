Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:12:37 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V6 2/2] clk: vc5: Add support for IDT VersaClock
 5P49V5923 and 5P49V5933
Message-ID: <20170121001237.GI20800@codeaurora.org>
References: <20170112010324.28068-1-marek.vasut@gmail.com>
 <20170112010324.28068-2-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170112010324.28068-2-marek.vasut@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/12, Marek Vasut wrote:
> Add driver for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips. These
> chips have two clock inputs, XTAL or CLK, which are muxed into single
> PLL/VCO input. In case of 5P49V5923, the XTAL in built into the chip
> while the 5P49V5923 requires external XTAL.
> 
> The PLL feeds two fractional dividers. Each fractional divider feeds
> output mux, which allows selecting between clock from the fractional
> divider itself or from output mux on output N-1. In case of output
> mux 0, the output N-1 is instead connected to the output from the mux
> feeding the PLL.
> 
> The driver thus far supports only the 5P49V5923 and 5P49V5933, while
> it should be easily extensible to the whole 5P49V59xx family of chips
> as they are all pretty similar.
> 
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

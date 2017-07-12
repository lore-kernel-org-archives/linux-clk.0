Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:10:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3 8/8] clk: vc5: Add support for IDT VersaClock 5P49V6901
Message-ID: <20170712231034.GN22780@codeaurora.org>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
 <20170709132814.2339-8-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170709132814.2339-8-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Marek Vasut wrote:
> Update IDT VersaClock 5 driver to support IDT VersaClock 6 5P49V6901.
> This chip has two clock inputs (external XTAL or external CLKIN), four
> fractional dividers (FODs) and five clock outputs (four universal clock
> outputs and one reference clock output at OUT0_SELB_I2C).
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> on Salvator-XS with the display LVDS output.
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

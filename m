Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:10:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3 6/8] clk: vc5: Add support for the input frequency
 doubler
Message-ID: <20170712231029.GL22780@codeaurora.org>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
 <20170709132814.2339-6-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170709132814.2339-6-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Marek Vasut wrote:
> The VersaClock 6 has an input frequency doubler between the input
> clock mux and the predivider. Add new capability flag and support
> for this frequency doubler block into the driver.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Alexey Firago <alexey_firago@mentor.com>
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

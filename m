Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:10:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3 5/8] clk: vc5: Split clock input mux and predivider
Message-ID: <20170712231025.GK22780@codeaurora.org>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
 <20170709132814.2339-5-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170709132814.2339-5-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Marek Vasut wrote:
> Split the VC5 clock input mux and the predivider to more accurately
> model the hardware and fix the previously incorrect assumption that
> both the OUT_SEL_I2CB and the PLL are fed from the predivider.
> 
> It is in fact the clock input mux output which is directly feeding
> the clock into the OUT_SEL_I2CB output, while the clock input mux
> output first passes through the predivider before it is fed into
> the PLL.
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

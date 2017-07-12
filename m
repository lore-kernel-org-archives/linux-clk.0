Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:10:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3 1/8] clk: vc5: Prevent division by zero on
 unconfigured outputs
Message-ID: <20170712231007.GG22780@codeaurora.org>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Marek Vasut wrote:
> In case the initial values of the FOD registers are not configured in
> the OTP or by the bootloader, it is possible that the FOD registers
> will contain zeroes. The code in vc5_fod_recalc_rate() immediately
> feeds the FOD divider value obtained from the FOD registers into the
> div64_u64() and if the FOD divider value is zero, triggers division
> by zero exception.
> 
> Check if the FOD divider value is zero and return the frequency of
> the FOD output as 0 Hz if it is so. This prevents the division by
> zero exception.
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

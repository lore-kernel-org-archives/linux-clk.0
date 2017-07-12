Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:10:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3 3/8] clk: vc5: Do not warn about disabled output
 buffer input muxes
Message-ID: <20170712231020.GI22780@codeaurora.org>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
 <20170709132814.2339-3-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170709132814.2339-3-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Marek Vasut wrote:
> The output buffer input mux can be configured in either of three
> states -- disabled, input from FOD, input from previous output.
> If the output buffer input mux is set to disabled, the code in
> vc5_clk_out_get_parent() would consider this an invalid setting
> and warn about it, which is not necessarily the case.
> 
> In case the output buffer input mux is disabled, default to input
> from FOD to have some parent and don't print the warning.
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

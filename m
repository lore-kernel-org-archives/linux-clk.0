Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:10:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V3 4/8] clk: vc5: Configure the output buffer input mux
 on prepare
Message-ID: <20170712231022.GJ22780@codeaurora.org>
References: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
 <20170709132814.2339-4-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170709132814.2339-4-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/09, Marek Vasut wrote:
> The output buffer input mux can be configured in either of three
> states -- disabled, input from FOD, input from previous output.
> Once the .prepare() callback of the output buffer is called, the
> output buffer input mux must be set to either input from FOD or
> input from previous output, it cannot be set to Disabled anymore
> or the output won't work.
> 
> Default to the input from FOD if the output buffer input mux was
> Disabled and the .prepare() was called on it.
> 
> Note that we do not set the output buffer input mux back to Disabled
> in the .unprepare() callback as there is no obvious benefit of doing
> so. We disable the entire output buffer in the .unprepare() callback
> already.
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

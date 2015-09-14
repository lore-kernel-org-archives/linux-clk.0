Return-Path: <sboyd@codeaurora.org>
Date: Mon, 14 Sep 2015 15:00:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Hai Li <hali@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: Allow clk_set_parent() to work on display
 clocks
Message-ID: <20150914220011.GH23081@codeaurora.org>
References: <1440722536-11197-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440722536-11197-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/27, Stephen Boyd wrote:
> Sometimes the display driver may want to change the parent PLL of
> the display clocks (byte and pixel clocks) depending on the
> use-case. Currently the parent is fixed by means of having a
> frequency table with one entry that chooses a particular parent.
> Remove this restriction and use the parent the clock is
> configured for in the hardware during clk_set_rate(). This
> requires consumers to rely on the default parent or to configure
> the parent with clk_set_parent()/assigned-clock-parents on the
> clocks before calling clk_set_rate().
> 
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Hai Li <hali@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

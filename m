Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Jul 2016 18:13:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] clk: qcom: add EBI2 clocks to the MSM8660 GCC
Message-ID: <20160702011348.GS27880@codeaurora.org>
References: <1467388441-22352-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1467388441-22352-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/01, Linus Walleij wrote:
> This adds the EBI2 2X and EBI2 clocks to the MSM8660/APQ8060
> GCC. This is necessary to enable clocking of the external bus
> interface so that peripherals on it can be mounted. These two
> clocks are simple gated branch clocks.
> 
> In the vendor tree clock-8x60, these clocks have some kind of
> dependency, the EBI2 clock has .depends = &ebi2_2x_clk.c,
> what this means is undocumented, it doesn't seem like there
> is a parent/child relationship, so the solution I chose was to
> just have the EBI2 driver get and enable both clocks.
> 
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

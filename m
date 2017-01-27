Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:11:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 3/3] clk: ux500: Convert ABx500 clocks to use OF probing
Message-ID: <20170127001127.GO8801@codeaurora.org>
References: <20170113150842.30250-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170113150842.30250-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/13, Linus Walleij wrote:
> These clocks have been broken for a long time unfortunately, a
> hurdle of misc problems made them stop working at some point
> breaking USB and audio on Ux500.
> 
> The platform as such and all "regular" clocks are migrated to
> OF/device tree, so let's migrate also this driver.
> 
> With this patch and the corresponding DTS fixes, and a bunch
> of probe deferral fixes, audio starts working again on Ux500.
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-ux500 and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

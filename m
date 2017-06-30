Return-Path: <sboyd@codeaurora.org>
Date: Thu, 29 Jun 2017 17:26:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] clk: gemini: Read status before using the value
Message-ID: <20170630002629.GG22780@codeaurora.org>
References: <20170629060107.12548-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170629060107.12548-1-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

On 06/29, Joel Stanley wrote:
> The probe does a shift and mask of val without having read it from the hardware.
> 
> Fixes: 846423f96721 ("clk: Add Gemini SoC clock controller")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

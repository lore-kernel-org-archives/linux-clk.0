Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jun 2015 14:23:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@linaro.org,
	linaro-kernel@lists.linaro.org
Subject: Re: [PATCH] clk: fixed: Add comment to clk_fixed_set_rate
Message-ID: <20150610212337.GE29640@codeaurora.org>
References: <1433966694-23559-1-git-send-email-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433966694-23559-1-git-send-email-daniel.thompson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/10, Daniel Thompson wrote:
> Currently it is not made explicit why clk_fixed_set_rate() can ignore
> its arguments and unconditionally return success. Add a comment
> to explain this.
> 
> We also mark the clk_ops table const since it should never be
> modified at runtime.
> 
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

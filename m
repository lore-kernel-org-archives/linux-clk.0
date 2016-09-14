Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 13:53:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	shawn.guo@linaro.org, jason.liu@linaro.org
Subject: Re: [PATCH v3 1/2] clk: zx: reform pll config info to ease code
 extension
Message-ID: <20160914205331.GY7243@codeaurora.org>
References: <1473141762-4775-1-git-send-email-jun.nie@linaro.org>
 <1473141762-4775-2-git-send-email-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473141762-4775-2-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/06, Jun Nie wrote:
> Add power down bit and pll lock bit in pll config structure
> to ease new SoC support.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---

Applied to clk-zte and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

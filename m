Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 15:33:52 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jun Nie <jun.nie@linaro.org>, Baoyou Xie <xie.baoyou@zte.com.cn>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 1/3] clk: zx296718: do not panic on failure
Message-ID: <20161221233352.GD8288@codeaurora.org>
References: <1481873207-22929-1-git-send-email-shawnguo@kernel.org>
 <1481873207-22929-2-git-send-email-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1481873207-22929-2-git-send-email-shawnguo@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/16, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> Instead of using panic, we should give an error message and return error
> code when of_clk_add_hw_provider() call fails.
> 
> Since we have error prompt for failures, the "init over" pr_info output
> isn't really necessary but becomes a debug noise.  So let's clean it up
> along the way.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

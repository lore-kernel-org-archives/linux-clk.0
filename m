Return-Path: <sboyd@codeaurora.org>
Date: Fri, 24 Jul 2015 14:45:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	shawn.guo@linaro.org, jason.liu@linaro.org, wan.zhijun@zte.com.cn
Subject: Re: [PATCH v2 1/3] clk: zx: Add audio div clock method for zx296702
Message-ID: <20150724214523.GI15042@codeaurora.org>
References: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
 <1437634973-27347-2-git-send-email-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437634973-27347-2-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/23, Jun Nie wrote:
> Add SPDIF/I2S divider clock method for zx296702
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---

Applied to clk-next

Please format patches with -M -C so that the diff is more
readable next time. Or you can add

	[diff]
		renames = copy

in your .gitconfig file.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

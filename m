Return-Path: <sboyd@codeaurora.org>
Date: Fri, 24 Jul 2015 14:45:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	shawn.guo@linaro.org, jason.liu@linaro.org, wan.zhijun@zte.com.cn
Subject: Re: [PATCH v2 3/3] clk: zx: Constify parent names in clock init data
Message-ID: <20150724214546.GA14521@codeaurora.org>
References: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
 <1437634973-27347-4-git-send-email-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437634973-27347-4-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/23, Jun Nie wrote:
> The array of parent names can be made as array of const pointers to
> const strings.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

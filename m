Return-Path: <sboyd@codeaurora.org>
Date: Tue, 12 May 2015 16:59:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@linaro.org, haojian.zhuang@gmail.com,
	james.hogan@imgtec.com
Subject: Re: [PATCH 1/2] clk: divider: don't set_rate with
 CLK_DIVIDER_READ_ONLY flag
Message-ID: <20150512235910.GC14873@codeaurora.org>
References: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/07, Joonyoung Shim wrote:
> Even if use CLK_DIVIDER_READ_ONLY flag, divider setting can be changed
> by set_rate callback. Don't change divider setting from set_rate
> callback of divider with CLK_DIVIDER_READ_ONLY flag.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---

Is the rate actually changing? Or is it just a problem that we
may be writing the register to the same value it already is?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

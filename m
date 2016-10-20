Return-Path: <sboyd@codeaurora.org>
Date: Thu, 20 Oct 2016 16:01:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Orson Zhai <orson.zhai@spreadtrum.com>
Cc: mturquette@baylibre.com, baolin.wang@spreadtrum.com,
	xiaolong.zhang@spreadtrum.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, ben.li@spreadturm.com
Subject: Re: [PATCH] clk: Register clkdev after setup of fixed-rate and
 fixed-factor clocks
Message-ID: <20161020230103.GD26139@codeaurora.org>
References: <1476184424-8528-1-git-send-email-orson.zhai@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476184424-8528-1-git-send-email-orson.zhai@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/11, Orson Zhai wrote:
> From: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
> 
> When common kernel setups fixed clock, of_clk_provider will be registerred.
> But there is no clkdev being registerred at the same time. This will make
> it difficult to get the clock by using clk_get(NULL, con_id).
> 
> Add clkdev register for fixed-rate and fixed-factor clock and ignore
> the error if any.
> 
> Signed-off-by: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
> Signed-off-by: Orson Zhai <orson.zhai@spreadtrum.com>
> ---

Why are we using clkdev lookups for clks populated from DT?
Shouldn't we be able to point to them from the consumers that
would also be in DT? I'm a little lost.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

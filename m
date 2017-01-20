Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 14:58:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Guodong Xu <guodong.xu@linaro.org>,
	John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] clk: hisilicon: fix lock assignment
Message-ID: <20170120225827.GB8009@codeaurora.org>
References: <1484727218-3499-1-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484727218-3499-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/18, Leo Yan wrote:
> In clock driver initialize phase the spinlock is missed to assignment
> to struct clkgate_separated, finally there have no locking to protect
> exclusive accessing for clock registers.
> 
> This bug introduces the console has no output after enable coresight
> driver on 96borads Hikey; this is because console using UART3, which

s/borads/boards/

> has shared the same register with coresight clock enabling bit. After
> applied this patch it can assign lock properly to protect exclusive
> accessing, and console can work well after enabled coresight modules.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Is there a Fixes: tag needed?

Is coresight support merged into Linus' tree? I want to know if
this needs to be applied for v4.10 or can wait until v4.11.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

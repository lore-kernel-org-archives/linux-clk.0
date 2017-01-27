Return-Path: <sboyd@codeaurora.org>
Date: Thu, 26 Jan 2017 16:18:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v2] clk: hisilicon: fix lock assignment
Message-ID: <20170127001846.GV8801@codeaurora.org>
References: <1484965591-743-1-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484965591-743-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/21, Leo Yan wrote:
> In clock driver initialize phase the spinlock is missed to assignment
> to struct clkgate_separated, finally there have no locking to protect
> exclusive accessing for clock registers.
> 
> This bug introduces the console has no output after enable coresight
> driver on 96boards Hikey; this is because console using UART3, which
> has shared the same register with coresight clock enabling bit. After
> applied this patch it can assign lock properly to protect exclusive
> accessing, and console can work well after enabled coresight modules.
> 
> Fixes: 0aa0c95f743a ("clk: hisilicon: add common clock support")
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

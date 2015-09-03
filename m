Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 2 Sep 2015 17:09:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Leo Yan <leo.yan@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] clk: Hi6220: separately build stub clock driver
Message-ID: <20150903000934.GD15099@codeaurora.org>
References: <1441162667-25532-1-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1441162667-25532-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/02, Leo Yan wrote:
> The previous code, kernel builds Hi6220's common clock driver and stub
> clock driver together. Stub clock driver has introduced the dependency
> with CONFIG_MAILBOX, so kernel will not build Hi6220's common clock
> driver due ARM64's defconfig have not enabled CONFIG_MAILBOX by default.
> 
> So separately build stub clock driver and common clock driver for
> Hi6220; and only let stub clock driver has the dependency with
> CONFIG_MAILBOX.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---

I had to read it a couple times, but it makes sense.

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

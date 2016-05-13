Return-Path: <sboyd@codeaurora.org>
Date: Thu, 12 May 2016 17:09:06 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, p.zabel@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	yanhaifeng@hisilicon.com, haojian.zhuang@linaro.org,
	zhangfei.gao@linaro.org, xuwei5@hisilicon.com,
	yanghongwei@hisilicon.com
Subject: Re: [PATCH 0/5] clk: hisilicon: Fix some problems of clk-hi3519
Message-ID: <20160513000900.GP3492@codeaurora.org>
References: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1462871953-26606-1-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/10, Jiancheng Xue wrote:
> This patch is base on branch clk-hi3519 in clk tree. It mainly fixes the
> following issues:
> 1. Add driver remove path.
> 2. Fix the ordering issue about clock provider being published.
> 3. Add error checking upon registering clocks. 

I'm waiting for round 2. Otherwise it looks ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

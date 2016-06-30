Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Jun 2016 12:36:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, p.zabel@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com
Subject: Re: [PATCH v2 5/5] clk: hisilicon: hi3519: add driver remove path
 and fix some issues
Message-ID: <20160630193612.GU1521@codeaurora.org>
References: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
 <1465971998-29619-6-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465971998-29619-6-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/15, Jiancheng Xue wrote:
> 1. Add driver remove path.
> 2. Fix some issues.
>    -Fix the ordering issue about clock provider being published.
>    -Add error checking upon registering clocks.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

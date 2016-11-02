Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:40:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Chao Xie <chao.xie@marvell.com>,
	Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mmp: mmp2: fix return value check in mmp2_clk_init()
Message-ID: <20161102004032.GO16026@codeaurora.org>
References: <1474127653-14529-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474127653-14529-1-git-send-email-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/17, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fix the retrn value check which testing the wrong variable
> in mmp2_clk_init().
> 
> Fixes: 1ec770d92a62 ("clk: mmp: add mmp2 DT support for clock driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

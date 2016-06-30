Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Jun 2016 12:36:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, p.zabel@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com
Subject: Re: [PATCH v2 2/5] clk: hisilicon: add hisi_clk_alloc function.
Message-ID: <20160630193625.GX1521@codeaurora.org>
References: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
 <1465971998-29619-3-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465971998-29619-3-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/15, Jiancheng Xue wrote:
> Before, there was an ordering issue that the clock provider
> had been published in hisi_clk_init before it could provide
> valid clocks to consumers. hisi_clk_alloc is just used to
> allocate memory space for struct hisi_clock_data. It makes
> it possible to publish the provider after the clocks are ready.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

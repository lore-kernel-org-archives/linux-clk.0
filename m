Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 11:20:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, p.zabel@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, yanhaifeng@hisilicon.com,
	yanghongwei@hisilicon.com, suwenping@hisilicon.com,
	raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com,
	zhangzhenxing@hisilicon.com, hermit.wangheming@hisilicon.com,
	jiangheng@hisilicon.com
Subject: Re: [PATCH 1/3] reset: hisilicon: add reset controller driver for
 hisilicon SOCs
Message-ID: <20160506182020.GC3492@codeaurora.org>
References: <1461397230-1757-1-git-send-email-xuejiancheng@hisilicon.com>
 <1461397230-1757-2-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461397230-1757-2-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/23, Jiancheng Xue wrote:
> In most of hisilicon SOCs, reset controller and clock provider are
> combined together as a block named CRG (Clock and Reset Generator).
> This patch mainly implements the reset function.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Applied to clk-hi3519

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
Date: Wed, 31 Aug 2016 15:51:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yang Ling <gnaygnil@gmail.com>
Cc: keguang.zhang@gmail.com, mturquette@baylibre.com,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] CLK: Add Loongson1C clock support
Message-ID: <20160831225113.GL12510@codeaurora.org>
References: <20160822045034.GA6545@ly-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160822045034.GA6545@ly-pc>
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Yang Ling wrote:
> This patch adds clock support to Loongson1C SoC.
> 
> Signed-off-by: Yang Ling <gnaygnil@gmail.com>
> 

It would be better to use the new clk_hw_*() and clkdev_hw_*()
registration APIs. Care to make that change? Obviously
clk_register_pll() isn't going to work there, but we can fix that
later.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

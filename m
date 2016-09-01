Return-Path: <gnaygnil@gmail.com>
Return-Path: <gnaygnil@gmail.com>
From: Yang Ling <gnaygnil@gmail.com>
Date: Thu, 1 Sep 2016 15:31:03 +0800
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Yang Ling <gnaygnil@gmail.com>, keguang.zhang@gmail.com,
	mturquette@baylibre.com, linux-mips@linux-mips.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] CLK: Add Loongson1C clock support
Message-ID: <20160901073100.GA11754@ly-pc>
References: <20160822045034.GA6545@ly-pc>
 <20160831225113.GL12510@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160831225113.GL12510@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 31, 2016 at 03:51:13PM -0700, Stephen Boyd wrote:
> On 08/22, Yang Ling wrote:
> > This patch adds clock support to Loongson1C SoC.
> > 
> > Signed-off-by: Yang Ling <gnaygnil@gmail.com>
> > 
> 
> It would be better to use the new clk_hw_*() and clkdev_hw_*()
> registration APIs. Care to make that change? Obviously
> clk_register_pll() isn't going to work there, but we can fix that
> later.
> 

Well, I will use the new APIs to debug the code.
Thanks for your friendly reminder.

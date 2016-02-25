Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 14:41:11 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
	linux-mips@linux-mips.org
Subject: Re: [PATCH] clk: Get rid of HAVE_MACH_CLKDEV
Message-ID: <20160225224111.GO4847@codeaurora.org>
References: <1453933020-8577-1-git-send-email-sboyd@codeaurora.org>
 <56CF6461.9040308@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56CF6461.9040308@microchip.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/25, Joshua Henderson wrote:
> On 01/27/2016 03:17 PM, Stephen Boyd wrote:
> > This config was used for the ARM port so that it could use a
> > machine specific clkdev.h include, but those are all gone now.
> > The MIPS architecture is the last user, and from what I can tell
> > it doesn't actually use it anyway, so let's remove the config all
> > together.
> > 
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: <linux-mips@linux-mips.org>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> Reviewed-by: Joshua Henderson <joshua.henderson@microchip.com>
> 

Thanks. Merged to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

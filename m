Return-Path: <sboyd@codeaurora.org>
Date: Tue, 6 Oct 2015 12:44:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: York Sun <yorksun@freescale.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Russell King <linux@arm.linux.org.uk>
Subject: Re: What's the proper use of con_id in clkdev
Message-ID: <20151006194430.GJ12338@codeaurora.org>
References: <5612D4D0.30104@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5612D4D0.30104@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/05, York Sun wrote:
> Michael and Stephen,
> 
> Can you help me to understand "#define MAX_CON_ID 16" in clkdev.c? I am trying
> to use clk_get() to acquire the clock with its name. This fails when the clock
> name is more than 15 characters. I traced it to this macro.
> 
> The reason of using clk_get() is I don't have device tree for my platform until
> device tree overlay is officially supported. So I use clkdev_add() in the clock
> driver.
> 
> So my issue is with the MAX_CON_ID. Is there a reason to limit it to 16?
> Wouldn't it be better to use kstrdup() in vclkdev_alloc()?
> 

Mike and I are not the maintainers of clkdev. The maintainer of
clkdev is Russell King.

I believe we can't use kstrdup() in vclkdev_alloc() because we
don't know if vclkdev_alloc() is called before the slab
allocators are up and running (this is why we have a
__clkdev_alloc() function). The simplest solution is to use
shorter names, can you do that?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

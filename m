Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 10:31:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: question about clk_hw_register_fixed_factor
Message-ID: <20160920173105.GA8319@codeaurora.org>
References: <alpine.DEB.2.10.1609200811560.3346@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.DEB.2.10.1609200811560.3346@hadrien>
List-ID: <linux-clk.vger.kernel.org>

On 09/20, Julia Lawall wrote:
> Hello,
> 
> The function clk_hw_register_fixed_factor from
> drivers/clk/clk-fixed-factor.c contains:
> 
> struct clk_init_data init;
> ...
> fix->hw.init = &init;
> ...
> hw = &fix->hw;
> ...
> return hw;
> 
> It looks like hw would then contain a dangling pointer, to init.  Should
> this be nulled out, or does it not matter because it is certain that no
> one will look at it anyway?  Or did I miss a null assignment elsewhere?
> 

Yes this is a common pattern in clk drivers. The init structure
is not used after clk_register() (or its variants) is called, so
there will typically be a dangling pointer in clk_hw to the
clk_init_data structure. Sometimes that structure is allocated on
the stack, which leads to other problems like people forgetting
to initialize all the members. Usually they forgot to set flags
to something and then clk framework does very odd things. We
could null out the init pointer if we really cared, but so far
this hasn't been a problem.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

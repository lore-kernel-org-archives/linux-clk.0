Return-Path: <julia.lawall@lip6.fr>
Date: Tue, 20 Sep 2016 08:15:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: mturquette@baylibre.com, sboyd@codeaurora.org
cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: question about clk_hw_register_fixed_factor
Message-ID: <alpine.DEB.2.10.1609200811560.3346@hadrien>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hello,

The function clk_hw_register_fixed_factor from
drivers/clk/clk-fixed-factor.c contains:

struct clk_init_data init;
...
fix->hw.init = &init;
...
hw = &fix->hw;
...
return hw;

It looks like hw would then contain a dangling pointer, to init.  Should
this be nulled out, or does it not matter because it is certain that no
one will look at it anyway?  Or did I miss a null assignment elsewhere?

thanks,
julia

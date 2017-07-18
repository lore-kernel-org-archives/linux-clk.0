Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Jul 2017 18:30:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: moxart: remove unnecessary statics
Message-ID: <20170718013026.GR22780@codeaurora.org>
References: <20170704223650.GA22546@embeddedgus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170704223650.GA22546@embeddedgus>
List-ID: <linux-clk.vger.kernel.org>

On 07/04, Gustavo A. R. Silva wrote:
> Remove unnecessary static on local variable _base_ in both functions
> moxart_of_pll_clk_init() and moxart_of_apb_clk_init(). Such variables
> are initialized before being used, on every execution path throughout
> the mentioned functions. The statics have no benefit and, removing
> them reduce the code size.
> 
> This issue was detected using Coccinelle and the following semantic patch:
> 
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> 
> static T x@p;
> ...
> x = <+...x...+>
> 
> @@
> identifier x;
> expression e;
> type T;
> position p != bad.p;
> @@
> 
> -static
>  T x@p;
>  ... when != x
>      when strict
> ?x = e;
> 
> In the following log you can see the difference in the code size. Also,
> notice that the bss segment is reduced down to zero. This log is the
> output of the size command, before and after the code change:
> 
> before:
>    text    data     bss     dec     hex filename
>    1724     384     128    2236     8bc drivers/clk/clk-moxart.o
> 
> after:
>    text    data     bss     dec     hex filename
>    1697     240       0    1937     791 drivers/clk/clk-moxart.o
> 
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

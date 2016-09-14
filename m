Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn
Subject: Re: [PATCH] clk: versatile: add missing header dependencies
Date: Wed, 14 Sep 2016 09:31:39 +0200
Message-ID: <4600074.xAL28UziL1@wuerfel>
In-Reply-To: <1473834587-22526-1-git-send-email-baoyou.xie@linaro.org>
References: <1473834587-22526-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Wednesday, September 14, 2016 2:29:47 PM CEST Baoyou Xie wrote:
> We get 1 warning when building kernel with W=1:
> drivers/clk/versatile/clk-realview.c:54:13: warning: no previous prototype for 'realview_clk_init' [-Wmissing-prototypes]
> 
> In fact, this function is declared in clk-realview.h,
> so this patch add missing header dependencies.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> 

Please leave this one for now. We are in the process of removing the
last caller of this function, and should just remove the header file
and the function definition in the next release.

	Arnd

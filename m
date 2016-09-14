Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn
Subject: Re: [PATCH] clk: mmp: add missing header dependencies
Date: Wed, 14 Sep 2016 09:32:01 +0200
Message-ID: <2595424.yMzLFSIofe@wuerfel>
In-Reply-To: <1473834208-25896-1-git-send-email-baoyou.xie@linaro.org>
References: <1473834208-25896-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Wednesday, September 14, 2016 2:23:28 PM CEST Baoyou Xie wrote:
> We get 1 warning when building kernel with W=1:
> drivers/clk/mmp/clk-mmp2.c:75:13: warning: no previous prototype for 'mmp2_clk_init' [-Wmissing-prototypes]
> 
> In fact, this function is declared in linux/clk/mmp.h,
> so this patch add missing header dependencies.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

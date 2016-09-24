Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:61602 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754313AbcIXJJj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Sep 2016 05:09:39 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn
Subject: Re: [PATCH] clk: versatile: add missing header dependencies
Date: Sat, 24 Sep 2016 11:09:17 +0200
Message-ID: <2048131.z1JiX2E8WD@wuerfel>
In-Reply-To: <1474691500-19793-1-git-send-email-baoyou.xie@linaro.org>
References: <1474691500-19793-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Saturday, September 24, 2016 12:31:40 PM CEST Baoyou Xie wrote:
> We get 1 warning when building kernel with W=1:
> drivers/clk/versatile/clk-realview.c:54:13: warning: no previous prototype for 'realview_clk_init' [-Wmissing-prototypes]
> 
> In fact, this function is declared in
> include/linux/platform_data/clk-realview.h,
> so this patch adds missing header dependencies.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> 

I think I commented on this one already: the only caller of the
function is getting removed in v4.9, so we should remove the
definition of the function subsequently in the next release.

We could in theory try to remove this at the same time, but
the effort to synchronize the git trees is not worth the benefit.

	Arnd


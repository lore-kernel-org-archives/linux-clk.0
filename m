Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:59255 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbcINJIw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2016 05:08:52 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Baoyou Xie <baoyou.xie@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        xie.baoyou@zte.com.cn
Subject: Re: [PATCH] clk: versatile: add missing header dependencies
Date: Wed, 14 Sep 2016 11:08:28 +0200
Message-ID: <2862092.ohvOYo10Tb@wuerfel>
In-Reply-To: <CACRpkdb2BK2_CeSJ8kbuZH6_WwDRqabhcuMqRb+etCBwT80K7A@mail.gmail.com>
References: <1473834587-22526-1-git-send-email-baoyou.xie@linaro.org> <4600074.xAL28UziL1@wuerfel> <CACRpkdb2BK2_CeSJ8kbuZH6_WwDRqabhcuMqRb+etCBwT80K7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wednesday, September 14, 2016 11:04:29 AM CEST Linus Walleij wrote:
> On Wed, Sep 14, 2016 at 9:31 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wednesday, September 14, 2016 2:29:47 PM CEST Baoyou Xie wrote:
> >> We get 1 warning when building kernel with W=1:
> >> drivers/clk/versatile/clk-realview.c:54:13: warning: no previous prototype for 'realview_clk_init' [-Wmissing-prototypes]
> >>
> >> In fact, this function is declared in clk-realview.h,
> >> so this patch add missing header dependencies.
> >>
> >> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> >>
> >
> > Please leave this one for now. We are in the process of removing the
> > last caller of this function, and should just remove the header file
> > and the function definition in the next release.
> 
> +1 on this, leave it. I can clean it up for v4.10 or even
> for an -rc if you want it real neat in v4.9.
> 

I think v4.10 is fine: Baoyou has done a great job so far fixing a lot
of those warnings, but we already know that there will be a lot remaining
after v4.9, so v4.10 is the earliest possible version in which we
can turn on the warning by default.

	Arnd

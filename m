Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbeHTSlI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 Aug 2018 14:41:08 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Stephen Boyd <sboyd@kernel.org>
To: Jiecheng Wu <jasonwood2031@gmail.com>, linux-clk@vger.kernel.org
References: <20180817081117.15256-1-jasonwood2031@gmail.com>
In-Reply-To: <20180817081117.15256-1-jasonwood2031@gmail.com>
Message-ID: <153477870280.28926.15382370236941900212@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk-wm831x.c: fix wrong return value when wm831x_reg_read() fails
Date: Mon, 20 Aug 2018 08:25:02 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Jiecheng Wu (2018-08-17 01:11:17)
> Function wm831x_fll_is_prepared() defined in drivers/clk/clk-wm831x.c ret=
urns true when function wm831x_reg_read() fails (should return false).

Sorry, this is missing signed-off-by so I can't apply this.

Also, please wrap commit text at 78 characters and add a reason why you
believe failure to read the register would mean it's not prepared. And
also Cc people who worked on this driver to solicit their feedback on
your change as well.

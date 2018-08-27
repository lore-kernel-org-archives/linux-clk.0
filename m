Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbeH1AME (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 27 Aug 2018 20:12:04 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Maxime Ripard <maxime.ripard@bootlin.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180820134013.16527-1-icenowy@aosc.io>
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20180820134013.16527-1-icenowy@aosc.io>
Message-ID: <153540143478.129321.8502068006504989469@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: sunxi-ng: sun50i: h6: Add 2x fixed post-divider to MMC
 module clocks
Date: Mon, 27 Aug 2018 13:23:54 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Icenowy Zheng (2018-08-20 06:40:13)
> On the H6, the MMC module clocks are fixed in the new timing mode,
> i.e. they do not have a bit to select the mode. These clocks have
> a 2x divider somewhere between the clock and the MMC module.
> =

> To be consistent with other SoCs supporting the new timing mode,
> we model the 2x divider as a fixed post-divider on the MMC module
> clocks.
> =

> This patch adds the post-dividers to the MMC clocks, following the
> approach on A64.
> =

> Fixes: 542353ea ("clk: sunxi-ng: add support for the Allwinner H6 CCU")

This commit doesn't exist. Did you mean:

524353ea48

instead?

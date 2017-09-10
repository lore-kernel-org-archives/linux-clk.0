Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:38228 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751587AbdIJMkV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 10 Sep 2017 08:40:21 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/2] clk: sunxi-ng: Add several flags to H3 CCU
Date: Sun, 10 Sep 2017 20:40:04 +0800
Message-Id: <20170910124006.60250-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The H3 CCU is the earliest driver that uses sunxi-ng clk framework, and
some problems show when doing further development.

This patchset fixes some issues by add several clock flags.

The first patch solves the problem that setting some PLL before ungating
them will trigger timeout for waiting for lock by adds CLK_SET_RATE_UNGATE
flag.

The second patch solves the problem that H3 GPU clock is not really tweaked
by add CLK_SET_RATE_PARENT flag to it.

Icenowy Zheng (2):
  clk: sunxi-ng: add CLK_SET_RATE_UNGATE to all H3 PLLs
  clk: sunxi-ng: add CLK_SET_RATE_PARENT flag to H3 GPU clock

 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.13.5


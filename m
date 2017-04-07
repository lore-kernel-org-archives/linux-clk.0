Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:36657 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933588AbdDGQTw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Apr 2017 12:19:52 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 1/2] clk: sunxi-ng: fix PRCM CCU ir clk parent
Date: Sat,  8 Apr 2017 00:19:03 +0800
Message-Id: <20170407161904.32624-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The first parent of ir clk in PRCM CCU is wrongly written as "osc32K"
instead of "osc32k".

Change it to "osc32k".

Fixes: cdb8b80b6093 ("clk: sunxi-ng: add support for PRCM CCUs")

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r.c b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
index 0d027d53dbdf..119f47b568ea 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
@@ -81,7 +81,7 @@ static SUNXI_CCU_GATE(apb0_i2c_clk,	"apb0-i2c",	"apb0",
 static SUNXI_CCU_GATE(apb0_twd_clk,	"apb0-twd",	"apb0",
 		      0x28, BIT(7), 0);
 
-static const char * const r_mod0_default_parents[] = { "osc32K", "osc24M" };
+static const char * const r_mod0_default_parents[] = { "osc32k", "osc24M" };
 static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
 				  r_mod0_default_parents, 0x54,
 				  0, 4,		/* M */
-- 
2.12.2


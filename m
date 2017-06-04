Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:54743 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751433AbdFDQD2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 4 Jun 2017 12:03:28 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 08/11] clk: sunxi-ng: allow CLK_DE to set CLK_PLL_DE for H3
Date: Mon,  5 Jun 2017 00:01:46 +0800
Message-Id: <20170604160149.30230-9-icenowy@aosc.io>
In-Reply-To: <20170604160149.30230-1-icenowy@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner H3 features a PLL named CLK_PLL_DE, and a mod clock for the
"Display Engine 2.0" named CLK_DE. As the name indicated, the CLK_PLL_DE
is a PLL for CLK_DE.

Only CLK_DE and CLK_TVE have a parent of CLK_PLL_DE, and CLK_TVE is also
one part of the display clocks.

So allow CLK_DE to set CLK_PLL_DE (add CLK_SET_RATE_PARENT to it).

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 62e4f0d2b2fc..b6a1636c2f6b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -439,7 +439,7 @@ static SUNXI_CCU_GATE(dram_ts_clk,	"dram-ts",	"dram",
 
 static const char * const de_parents[] = { "pll-periph0-2x", "pll-de" };
 static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
-				 0x104, 0, 4, 24, 3, BIT(31), 0);
+				 0x104, 0, 4, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 
 static const char * const tcon_parents[] = { "pll-video" };
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,
-- 
2.12.2


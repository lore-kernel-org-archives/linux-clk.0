Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:43960 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbeISU3C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Sep 2018 16:29:02 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a77990: Fix incorrect PLL0 divider in comment
Date: Wed, 19 Sep 2018 16:50:42 +0200
Message-Id: <20180919145042.8429-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

PLL0 runs at 4.8 GHz, i.e. EXTAL x 100.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.20.

 drivers/clk/renesas/r8a77990-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 7e000d0705891a3f..9eb80180eea0b1a6 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -250,8 +250,8 @@ static const unsigned int r8a77990_crit_mod_clks[] __initconst = {
 /*
  * MD19		EXTAL (MHz)	PLL0		PLL1		PLL3
  *--------------------------------------------------------------------
- * 0		48 x 1		x100/4		x100/3		x100/3
- * 1		48 x 1		x100/4		x100/3		 x58/3
+ * 0		48 x 1		x100/1		x100/3		x100/3
+ * 1		48 x 1		x100/1		x100/3		 x58/3
  */
 #define CPG_PLL_CONFIG_INDEX(md)	(((md) & BIT(19)) >> 19)
 
-- 
2.17.1

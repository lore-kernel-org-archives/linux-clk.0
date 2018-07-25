Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38038 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729354AbeGYU1Z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 25 Jul 2018 16:27:25 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] clk: renesas: r8a77965: Add SATA clock
Date: Wed, 25 Jul 2018 21:14:17 +0200
Message-Id: <20180725191417.3313-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds SATA clock to the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[wsa: rebased to upstream base]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 8fae5e9c4a77..98c97f2cc7cb 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -192,6 +192,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("vin1",			810,	R8A77965_CLK_S0D2),
 	DEF_MOD("vin0",			811,	R8A77965_CLK_S0D2),
 	DEF_MOD("etheravb",		812,	R8A77965_CLK_S0D6),
+	DEF_MOD("sata0",		815,	R8A77965_CLK_S3D2),
 	DEF_MOD("imr1",			822,	R8A77965_CLK_S0D2),
 	DEF_MOD("imr0",			823,	R8A77965_CLK_S0D2),
 
-- 
2.11.0


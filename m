Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Dien Pham <dien.pham.ry@rvc.renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: r8a7796: Add IIC-DVFS clock
Date: Wed, 25 Jan 2017 12:19:34 +0100
Message-Id: <1485343174-16973-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
References: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

This patch adds DVFS clock for R8A7796 SoC.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Khiem: I've updated your email address, and added your missing SoB.
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 3bc36ef3aebf4108..11e084a56b0d9005 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -192,6 +192,7 @@ enum clk_ids {
 	DEF_MOD("can-if0",		 916,	R8A7796_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A7796_CLK_S0D6),
+	DEF_MOD("i2c-dvfs",		 926,	R8A7796_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A7796_CLK_S3D2),
-- 
1.9.1

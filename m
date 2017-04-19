Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
Date: Thu, 20 Apr 2017 02:46:30 +0900
Message-Id: <1492624001-3758-10-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixed the SD divider settiing for corresponding to the change
in the HS200/HS400 mode.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/rcar-gen3-cpg.c | 41 +++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 8419f27..4ab76b1 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -1,6 +1,7 @@
 /*
  * R-Car Gen3 Clock Pulse Generator
  *
+ * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2015-2016 Glider bvba
  *
  * Based on clk-rcar-gen3.c
@@ -205,29 +206,29 @@ struct sd_clock {
  *                     sd_srcfc   sd_fc   div
  * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
  *-------------------------------------------------------------------
- *  0         0         0 (1)      1 (4)      4
- *  0         0         1 (2)      1 (4)      8
- *  1         0         2 (4)      1 (4)     16
- *  1         0         3 (8)      1 (4)     32
- *  1         0         4 (16)     1 (4)     64
- *  0         0         0 (1)      0 (2)      2
- *  0         0         1 (2)      0 (2)      4
- *  1         0         2 (4)      0 (2)      8
- *  1         0         3 (8)      0 (2)     16
- *  1         0         4 (16)     0 (2)     32
+ *  0         0         1 (2)      0 (-)      2 : HS400
+ *  0         0         0 (1)      1 (4)      4 : SDR104 / HS200
+ *  0         0         1 (2)      1 (4)      8 : SDR50
+ *  1         0         2 (4)      1 (4)     16 : HS / SDR25
+ *  1         0         3 (8)      1 (4)     32 : NS / SDR12
+ *  0         0         0 (1)      0 (2)      2 : (no case)
+ *  1         0         2 (4)      0 (2)      8 : (no case)
+ *  1         0         3 (8)      0 (2)     16 : (no case)
+ *  1         0         4 (16)     0 (2)     32 : (no case)
+ *  1         0         4 (16)     1 (4)     64 : (no case)
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
 /*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          1,        4),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        4),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          0,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          0,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          0,       32),
+	CPG_SD_DIV_TABLE_DATA(0,	0,	  1,	      0,        2),
+	CPG_SD_DIV_TABLE_DATA(0,	0,	  0,	      1,        4),
+	CPG_SD_DIV_TABLE_DATA(0,	0,	  1,	      1,        8),
+	CPG_SD_DIV_TABLE_DATA(1,	0,	  2,	      1,       16),
+	CPG_SD_DIV_TABLE_DATA(1,	0,	  3,	      1,       32),
+	CPG_SD_DIV_TABLE_DATA(0,	0,	  0,	      0,        2),
+	CPG_SD_DIV_TABLE_DATA(1,	0,	  2,	      0,        8),
+	CPG_SD_DIV_TABLE_DATA(1,	0,	  3,	      0,       16),
+	CPG_SD_DIV_TABLE_DATA(1,	0,	  4,	      0,       32),
+	CPG_SD_DIV_TABLE_DATA(1,	0,	  4,	      1,       64),
 };
 
 #define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-- 
1.9.1

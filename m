Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56651 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751599AbdHAKsz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Aug 2017 06:48:55 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] clk: renesas: rcar-gen3-cpg: add setting for HS400
Date: Tue,  1 Aug 2017 12:46:02 +0200
Message-Id: <20170801104603.10459-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
References: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We don't have support for that yet, but adding the setting now is
trivial and will remove a dependency when adding HS400 support.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 81b7713afd694c..4d2574f233290a 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -68,26 +68,26 @@ struct sd_clock {
  *                     sd_srcfc   sd_fc   div
  * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
  *-------------------------------------------------------------------
+ *  0         0         1 (2)      (unused)   2 -> HS400
  *  0         0         0 (1)      1 (4)      4 -> SDR104 / HS200
  *  0         0         1 (2)      1 (4)      8 -> SDR50
  *  1         0         2 (4)      1 (4)     16 -> HS / SDR25
  *  1         0         3 (8)      1 (4)     32 -> NS / SDR12
  *  1         0         4 (16)     1 (4)     64
  *  0         0         0 (1)      0 (2)      2
- *  0         0         1 (2)      0 (2)      4
  *  1         0         2 (4)      0 (2)      8
  *  1         0         3 (8)      0 (2)     16
  *  1         0         4 (16)     0 (2)     32
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
 /*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
+	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        2),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          1,        4),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        4),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          0,        8),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          0,       16),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          0,       32),
-- 
2.11.0


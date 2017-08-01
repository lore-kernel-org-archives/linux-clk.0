Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56655 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751623AbdHAKsz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Aug 2017 06:48:55 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] clk: renesas: rcar-gen3-cpg: remove unused SD divider entries
Date: Tue,  1 Aug 2017 12:46:03 +0200
Message-Id: <20170801104603.10459-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
References: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

They will not be selected, so no need to keep them. If there will be a
use-case, we will re-add that setting.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 4d2574f233290a..5ac4154b459102 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -73,11 +73,6 @@ struct sd_clock {
  *  0         0         1 (2)      1 (4)      8 -> SDR50
  *  1         0         2 (4)      1 (4)     16 -> HS / SDR25
  *  1         0         3 (8)      1 (4)     32 -> NS / SDR12
- *  1         0         4 (16)     1 (4)     64
- *  0         0         0 (1)      0 (2)      2
- *  1         0         2 (4)      0 (2)      8
- *  1         0         3 (8)      0 (2)     16
- *  1         0         4 (16)     0 (2)     32
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
 /*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
@@ -86,11 +81,6 @@ static const struct sd_div_table cpg_sd_div_table[] = {
 	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          0,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          0,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          0,       32),
 };
 
 #define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-- 
2.11.0


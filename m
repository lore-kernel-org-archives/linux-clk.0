Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47815 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753841AbeASNix (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jan 2018 08:38:53 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
Date: Fri, 19 Jan 2018 14:38:42 +0100
Message-Id: <20180119133842.11135-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch fixed the SD divider settiing for corresponding to the change
in the HS200/HS400 mode.

NOTE:
- In H3/M3, the clock in HS400 mode refers to SDnH clock
  (others are SDn clock). Therefore, only the division value of SD is set
  as struct sd_div_table.div of cpg_sd_div_table[].
- In M3N, HS400 mode and HS200 mode use the same clock setting.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on renesas-drivers/clk-renesas-for-v4.17

I believe that this is a pre-requisite for enabling HS400 as with HS400
enabled but without this patch I see:

* M3-W ES1.0 / Salvator-X

[    1.874323] renesas_sdhi_internal_dmac ee140000.sd: mmc0 base at 0xee140000 max clock rate 200 MHz
[    2.064014] mmc0: new HS400 MMC card at address 0001
[    2.065225] mmcblk0: mmc0:0001 eMMC   28.8 GiB
[    2.065722] mmcblk0boot0: mmc0:0001 eMMC   partition 1 4.00 MiB
[    2.066116] mmcblk0boot1: mmc0:0001 eMMC   partition 2 4.00 MiB
[    2.066751] mmcblk0rpmb: mmc0:0001 eMMC   partition 3 4.00 MiB, chardev (243:0)
[    2.469721] print_req_error: I/O error, dev mmcblk0, sector 0
[    2.478455] Buffer I/O error on dev mmcblk0, logical block 0, async page read
[    2.611630] print_req_error: I/O error, dev mmcblk0, sector 0
[    2.613261] Buffer I/O error on dev mmcblk0, logical block 0, async page read
[    2.623928]  mmcblk0: unable to read partition table
[   11.379974] print_req_error: I/O error, dev mmcblk0, sector 0
[   11.477670] print_req_error: I/O error, dev mmcblk0, sector 0
[   11.487071] Buffer I/O error on dev mmcblk0, logical block 0, async page read
[   12.125520] print_req_error: I/O error, dev mmcblk0boot1, sector 7936
[   12.355220] print_req_error: I/O error, dev mmcblk0boot1, sector 7936
[   12.365142] Buffer I/O error on dev mmcblk0boot1, logical block 992, async page read

* On H3 ES2.0 / Salvator-XS:

[    2.456253] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    2.462243] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    2.517855] renesas_sdhi_internal_dmac ee140000.sd: mmc0 base at 0xee140000 max clock rate 200 MHz
[    2.527651] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    2.533834] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    2.645783] mmc0: error -84 whilst initialising MMC card
[    2.745795] mmc0: error -84 whilst initialising MMC card
[    2.894756] mmc0: error -84 whilst initialising MMC card
[    2.957199] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    2.964230] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    3.020456] renesas_sdhi_internal_dmac ee100000.sd: mmc1 base at 0xee100000 max clock rate 200 MHz
[    3.031186] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    3.038196] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    3.090806] renesas_sdhi_internal_dmac ee160000.sd: mmc2 base at 0xee160000 max clock rate 200 MHz
[    3.124870] mmc0: error -84 whilst initialising MMC card

On H3 ES1.0 / Salvator-X I do not see any problems either with or without
this patch.

To assist testing and review I will make patches, including this one, to
enable HS400 on H3 / Salvator-X, M3-W 1.0 / Salvator-X and
H3 ES2.0 Salvator-XS available at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-v2
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 0904886f5501..caa39d33726a 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -95,32 +95,32 @@ struct sd_clock {
 };
 
 /* SDn divider
- *                     sd_srcfc   sd_fc   div
- * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
+ *                     sd_srcfc   sd_fc       div
+ * stp_hck   stp_ck    (div)      (div)        = sd_srcfc div x sd_fc div
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
+ *  0         0         1 (2)      0 (no refs) 2 : HS400 (H3/M3)
+ *  0         0         0 (1)      1 (4)       4 : SDR104 / HS200 / HS400 (M3N)
+ *  0         0         1 (2)      1 (4)       8 : SDR50
+ *  1         0         2 (4)      1 (4)      16 : HS / SDR25
+ *  1         0         3 (8)      1 (4)      32 : NS / SDR12
+ *  0         0         0 (1)      0 (2)       2 : (no case)
+ *  1         0         2 (4)      0 (2)       8 : (no case)
+ *  1         0         3 (8)      0 (2)      16 : (no case)
+ *  1         0         4 (16)     0 (2)      32 : (no case)
+ *  1         0         4 (16)     1 (4)      64 : (no case)
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
 /*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
+	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        2),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          1,        4),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        4),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          0,        8),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          0,       16),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          0,       32),
+	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
 };
 
 #define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-- 
2.11.0


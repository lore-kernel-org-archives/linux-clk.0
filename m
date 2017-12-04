Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:42207 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdLDNed (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Dec 2017 08:34:33 -0500
Received: by mail-wm0-f68.google.com with SMTP id l141so5832951wmg.1
        for <linux-clk@vger.kernel.org>; Mon, 04 Dec 2017 05:34:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks
Date: Mon,  4 Dec 2017 14:34:28 +0100
Message-Id: <20171204133428.24631-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Remove CLK_IGNORE_UNUSED from mmc clocks. This was only needed while the
mmc driver incorrectly used the xtal as source instead of the mmc
clock. Now, the driver takes the correct clock, CCF is aware that the
clock is being used and we can remove this flag.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index ae385310e980..182ed00e2ec5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1031,17 +1031,7 @@ static struct clk_gate gxbb_sd_emmc_a_clk0 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "sd_emmc_a_clk0_div" },
 		.num_parents = 1,
-
-		/*
-		 * FIXME:
-		 * We need CLK_IGNORE_UNUSED because mmc DT node point to xtal
-		 * instead of this clock. CCF would gate this on boot, killing
-		 * the mmc controller. Please remove this flag once DT properly
-		 * point to this clock instead of xtal
-		 *
-		 * Same goes for emmc B and C clocks
-		 */
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1084,7 +1074,7 @@ static struct clk_gate gxbb_sd_emmc_b_clk0 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "sd_emmc_b_clk0_div" },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1127,7 +1117,7 @@ static struct clk_gate gxbb_sd_emmc_c_clk0 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "sd_emmc_c_clk0_div" },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.14.3


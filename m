Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36720 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751521AbeETRQV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 May 2018 13:16:21 -0400
Received: by mail-wm0-f68.google.com with SMTP id n10-v6so22754957wmc.1
        for <linux-clk@vger.kernel.org>; Sun, 20 May 2018 10:16:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, khilman@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2] clk: meson: meson8b: mark fclk_div2 gate clocks as CLK_IS_CRITICAL
Date: Sun, 20 May 2018 19:16:06 +0200
Message-Id: <20180520171606.4430-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Until commit 05f814402d6174 ("clk: meson: add fdiv clock gates") we
relied on the bootloader to enable the fclk_div clock gates. It turns
out that our clock tree is incomplete at least on Meson8b (tested with
an Odroid-C1, which uses an RGMII PHY) because after the mentioned
commit Ethernet is not working anymore (no RX/TX activity can be seen).
At the same time Ethernet was still working on Meson8m2 with a RMII PHY.

Testing has shown that as soon as "fclk_div2" is disabled Ethernet stops
working on Odroid-C1. Unfortunately it's currently not clear what the
Ethernet controller IP block uses the fclk_div2 clock for. Mark the
clock as CLK_IS_CRITICAL to keep it enabled (as it's already enabled by
most bootloaders by default, which is why we didn't notice it before).

Fixes: 05f814402d6174 ("clk: meson: add fdiv clock gates")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
changes since v1 at [0]:
- only fclk_div2 has to be kept running (so the commit message and the
  patch itself are updated)
- added a FIXME comment to the code

[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-May/007272.html

 drivers/clk/meson/meson8b.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 40068c1b5e80..415ba1d8a904 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -246,6 +246,13 @@ static struct clk_regmap meson8b_fclk_div2 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div2_div" },
 		.num_parents = 1,
+		/*
+		 * FIXME: Ethernet with a RGMII PHYs is not working if
+		 * fclk_div2 is disabled. it is currently unclear why this
+		 * is. keep it enabled until the Ethernet driver knows how
+		 * to manage this clock.
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.17.0


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40858 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751029AbeEAVqL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 May 2018 17:46:11 -0400
Received: by mail-wr0-f196.google.com with SMTP id v60-v6so11948714wrc.7
        for <linux-clk@vger.kernel.org>; Tue, 01 May 2018 14:46:10 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] clk: meson: meson8b: mark fclk_div gate clocks as CLK_IS_CRITICAL
Date: Tue,  1 May 2018 23:45:55 +0200
Message-Id: <20180501214555.11476-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Until commit 05f814402d6174 ("clk: meson: add fdiv clock gates") we
relied on the bootloader to enable the fclk_div clock gates. It turns
out that our clock tree is incomplete at least on Meson8b (tested with
an Odroid-C1, which uses an RGMII PHY) because after the mentioned
commit Ethernet is not working anymore (no RX/TX activity can be seen).
At the same time Ethernet was still working on Meson8m2 with a RMII PHY.

It is currently not clear which of the fclk_div gates is required for
(RGMII) Ethernet operation on Meson8b and why. Mark the fclk_div gates
as CLK_IS_CRITICAL so the common clock framework keeps these gates
enabled for us until we know which clock is required for Ethernet on
Meson8b and which driver has to claim it.

Fixes: 05f814402d6174 ("clk: meson: add fdiv clock gates")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index d0524ec71aad..f3ac099ee22c 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -246,6 +246,7 @@ static struct clk_regmap meson8b_fclk_div2 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div2_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -270,6 +271,7 @@ static struct clk_regmap meson8b_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -294,6 +296,7 @@ static struct clk_regmap meson8b_fclk_div4 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div4_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -318,6 +321,7 @@ static struct clk_regmap meson8b_fclk_div5 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div5_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -342,6 +346,7 @@ static struct clk_regmap meson8b_fclk_div7 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div7_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.17.0


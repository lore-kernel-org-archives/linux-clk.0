Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52520 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbeI0PQr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 11:16:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id l7-v6so5053314wme.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 01:59:34 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
        narmstrong@baylibre.com
Cc: linux-clk@vger.kernel.org, carlo@caione.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] clk: meson: meson8b: fix the width of the cpu_scale_div clock
Date: Thu, 27 Sep 2018 10:59:21 +0200
Message-Id: <20180927085921.24627-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
References: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

According to the public S805 datasheet HHI_SYS_CPU_CLK_CNTL1[29:20] is
the register for the CPU scale_div clock. This matches the code in
Amlogic's 3.10 GPL kernel sources:
N = (aml_read_reg32(P_HHI_SYS_CPU_CLK_CNTL1) >> 20) & 0x3FF;

This means that the divider register is 10 bit wide instead of 9 bits.
So far this is not a problem since all u-boot versions I have seen are
not using the cpu_scale_div clock at all (instead they are configuring
the CPU clock to run off cpu_in_sel directly).

The fixes tag points to the latest rework of the CPU clocks. However,
even before the rework it was wrong. Commit 7a29a869434e8b ("clk: meson:
Add support for Meson clock controller") defines MESON_N_WIDTH as 9 (in
drivers/clk/meson/clk-cpu.c). But since the old clk-cpu implementation
this only carries the fixes tag for the CPU clock rewordk.

Fixes: 251b6fd38bcb9c ("clk: meson: rework meson8b cpu clock")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index d3f4e11d106d..8658a662b10e 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -594,7 +594,7 @@ static struct clk_regmap meson8b_cpu_scale_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset =  HHI_SYS_CPU_CLK_CNTL1,
 		.shift = 20,
-		.width = 9,
+		.width = 10,
 		.table = cpu_scale_table,
 		.flags = CLK_DIVIDER_ALLOW_ZERO,
 	},
-- 
2.19.0

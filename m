Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34886C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  1 Nov 2022 14:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiKAORS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Nov 2022 10:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiKAORQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2022 10:17:16 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC52411A32;
        Tue,  1 Nov 2022 07:17:15 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BE41FB;
        Tue,  1 Nov 2022 07:17:21 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E38B13F703;
        Tue,  1 Nov 2022 07:17:13 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 5/9] clk: sunxi-ng: f1c100s: Add IR mod clock
Date:   Tue,  1 Nov 2022 14:16:54 +0000
Message-Id: <20221101141658.3631342-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101141658.3631342-1-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For some reason the mod clock for the Allwinner F1C100s CIR (infrared
receiver) peripheral was not modeled in the CCU driver.

Add the clock description to the list, and wire it up in the clock list.
By assigning a new clock ID at the end, it extends the number of clocks.

This allows to use the CIR peripheral on any F1C100s series board.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++++++++++-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
 include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 ++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
index ed097c4f780ff..af4811e720b39 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
@@ -239,7 +239,14 @@ static SUNXI_CCU_MUX_WITH_GATE(i2s_clk, "i2s", i2s_spdif_parents,
 static SUNXI_CCU_MUX_WITH_GATE(spdif_clk, "spdif", i2s_spdif_parents,
 			       0x0b4, 16, 2, BIT(31), 0);
 
-/* The BSP header file has a CIR_CFG, but no mod clock uses this definition */
+static const char * const ir_parents[] = { "osc32k", "osc24M" };
+static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
+				  ir_parents, 0x0b8,
+				  0, 4,		/* M */
+				  16, 2,	/* P */
+				  24, 1,        /* mux */
+				  BIT(31),      /* gate */
+				  0);
 
 static SUNXI_CCU_GATE(usb_phy0_clk,	"usb-phy0",	"osc24M",
 		      0x0cc, BIT(1), 0);
@@ -355,6 +362,7 @@ static struct ccu_common *suniv_ccu_clks[] = {
 	&mmc1_output_clk.common,
 	&i2s_clk.common,
 	&spdif_clk.common,
+	&ir_clk.common,
 	&usb_phy0_clk.common,
 	&dram_ve_clk.common,
 	&dram_csi_clk.common,
@@ -446,6 +454,7 @@ static struct clk_hw_onecell_data suniv_hw_clks = {
 		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
 		[CLK_I2S]		= &i2s_clk.common.hw,
 		[CLK_SPDIF]		= &spdif_clk.common.hw,
+		[CLK_IR]		= &ir_clk.common.hw,
 		[CLK_USB_PHY0]		= &usb_phy0_clk.common.hw,
 		[CLK_DRAM_VE]		= &dram_ve_clk.common.hw,
 		[CLK_DRAM_CSI]		= &dram_csi_clk.common.hw,
diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
index b22484f1bb9a5..d56a4316289d8 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
@@ -29,6 +29,6 @@
 
 /* All bus gates, DRAM gates and mod clocks are exported */
 
-#define CLK_NUMBER		(CLK_AVS + 1)
+#define CLK_NUMBER		(CLK_IR + 1)
 
 #endif /* _CCU_SUNIV_F1C100S_H_ */
diff --git a/include/dt-bindings/clock/suniv-ccu-f1c100s.h b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
index f5ac155c9c70a..d7570765f424d 100644
--- a/include/dt-bindings/clock/suniv-ccu-f1c100s.h
+++ b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
@@ -67,4 +67,6 @@
 #define CLK_CODEC		65
 #define CLK_AVS			66
 
+#define CLK_IR			67
+
 #endif
-- 
2.25.1


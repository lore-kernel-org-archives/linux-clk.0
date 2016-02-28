Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from 212-186-180-163.dynamic.surfer.at ([212.186.180.163]:45127 "EHLO
	cgate.sperl.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758505AbcB1Phm (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 28 Feb 2016 10:37:42 -0500
From: kernel@martin.sperl.org
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: [PATCH v5 14/20] clk: bcm2835: added missing PLL clock divider
Date: Sun, 28 Feb 2016 15:37:05 +0000
Message-Id: <1456673831-2408-15-git-send-email-kernel@martin.sperl.org>
In-Reply-To: <1456673831-2408-1-git-send-email-kernel@martin.sperl.org>
References: <1456673831-2408-1-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Added the missing pll clock divider definitions.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 drivers/clk/bcm/clk-bcm2835.c       |   50 +++++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/bcm2835.h |    8 ++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index b67147b..ff02871 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1470,6 +1470,22 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.load_mask = CM_PLLA_LOADPER,
 		.hold_mask = CM_PLLA_HOLDPER,
 		.fixed_divider = 1),
+	[BCM2835_PLLA_DSI0]	= REGISTER_PLL_DIV(
+		.name = "plla_dsi0",
+		.source_pll = "plla",
+		.cm_reg = CM_PLLA,
+		.a2w_reg = A2W_PLLA_DSI0,
+		.load_mask = CM_PLLA_LOADDSI0,
+		.hold_mask = CM_PLLA_HOLDDSI0,
+		.fixed_divider = 1),
+	[BCM2835_PLLA_CCP2]	= REGISTER_PLL_DIV(
+		.name = "plla_ccp2",
+		.source_pll = "plla",
+		.cm_reg = CM_PLLA,
+		.a2w_reg = A2W_PLLA_DSI0,
+		.load_mask = CM_PLLA_LOADCCP2,
+		.hold_mask = CM_PLLA_HOLDCCP2,
+		.fixed_divider = 1),
 
 	/* PLLB is used for the ARM's clock. */
 	[BCM2835_PLLB]		= REGISTER_PLL(
@@ -1494,6 +1510,24 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.load_mask = CM_PLLB_LOADARM,
 		.hold_mask = CM_PLLB_HOLDARM,
 		.fixed_divider = 1),
+	[BCM2835_PLLB_SP0]	= REGISTER_PLL_DIV(
+		.name = "pllb_sp0",
+		.source_pll = "pllb",
+		.cm_reg = CM_PLLB,
+		.a2w_reg = A2W_PLLB_SP0,
+		.fixed_divider = 1),
+	[BCM2835_PLLB_SP1]	= REGISTER_PLL_DIV(
+		.name = "pllb_sp1",
+		.source_pll = "pllb",
+		.cm_reg = CM_PLLB,
+		.a2w_reg = A2W_PLLB_SP1,
+		.fixed_divider = 1),
+	[BCM2835_PLLB_SP2]	= REGISTER_PLL_DIV(
+		.name = "pllb_sp2",
+		.source_pll = "pllb",
+		.cm_reg = CM_PLLB,
+		.a2w_reg = A2W_PLLB_SP2,
+		.fixed_divider = 1),
 
 	/*
 	 * PLLC is the core PLL, used to drive the core VPU clock.
@@ -1584,6 +1618,22 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.load_mask = CM_PLLD_LOADPER,
 		.hold_mask = CM_PLLD_HOLDPER,
 		.fixed_divider = 1),
+	[BCM2835_PLLD_DSI0]	= REGISTER_PLL_DIV(
+		.name = "plld_dsi0",
+		.source_pll = "plld",
+		.cm_reg = CM_PLLD,
+		.a2w_reg = A2W_PLLD_DSI0,
+		.load_mask = CM_PLLD_LOADDSI0,
+		.hold_mask = CM_PLLD_HOLDDSI0,
+		.fixed_divider = 1),
+	[BCM2835_PLLD_DSI1]	= REGISTER_PLL_DIV(
+		.name = "plld_dsi1",
+		.source_pll = "plld",
+		.cm_reg = CM_PLLD,
+		.a2w_reg = A2W_PLLD_DSI1,
+		.load_mask = CM_PLLD_LOADDSI1,
+		.hold_mask = CM_PLLD_HOLDDSI1,
+		.fixed_divider = 1),
 
 	/*
 	 * PLLH is used to supply the pixel clock or the AUX clock for the
diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clock/bcm2835.h
index 9a7b4a5..9689812 100644
--- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -45,3 +45,11 @@
 #define BCM2835_CLOCK_PERI_IMAGE	29
 #define BCM2835_CLOCK_PWM		30
 #define BCM2835_CLOCK_PCM		31
+
+#define BCM2835_PLLA_DSI0		32
+#define BCM2835_PLLA_CCP2		33
+#define BCM2835_PLLB_SP0		34
+#define BCM2835_PLLB_SP1		35
+#define BCM2835_PLLB_SP2		36
+#define BCM2835_PLLD_DSI0		37
+#define BCM2835_PLLD_DSI1		38
-- 
1.7.10.4


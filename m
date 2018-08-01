Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:54809 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389418AbeHAPxf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Aug 2018 11:53:35 -0400
Received: by mail-wm0-f67.google.com with SMTP id c14-v6so7145508wmb.4
        for <linux-clk@vger.kernel.org>; Wed, 01 Aug 2018 07:07:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] clk: meson: axg: round audio system master clocks down
Date: Wed,  1 Aug 2018 16:07:32 +0200
Message-Id: <20180801140732.27671-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Some of the master clocks provided by the axg audio clock controller are
system clock (spdifin and pdm sysclk). They are used to clock an internal
DSP of the related devices. Having them constantly rounded down instead
of closest is preferable.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index a0ed41e73bde..5f6c860aa122 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -101,10 +101,16 @@ static const char * const mst_mux_parent_names[] = {
 	"axg_mst_in4", "axg_mst_in5", "axg_mst_in6", "axg_mst_in7",
 };
 
-#define AXG_MST_MCLK_MUX(_name, _reg)					\
-	AXG_AUD_MUX(_name##_sel, _reg, 0x7, 24, CLK_MUX_ROUND_CLOSEST, \
+#define AXG_MST_MUX(_name, _reg, _flag)				\
+	AXG_AUD_MUX(_name##_sel, _reg, 0x7, 24, _flag,		\
 		    mst_mux_parent_names, CLK_SET_RATE_PARENT)
 
+#define AXG_MST_MCLK_MUX(_name, _reg)				\
+	AXG_MST_MUX(_name, _reg, CLK_MUX_ROUND_CLOSEST)
+
+#define AXG_MST_SYS_MUX(_name, _reg)				\
+	AXG_MST_MUX(_name, _reg, 0)
+
 static AXG_MST_MCLK_MUX(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
 static AXG_MST_MCLK_MUX(mst_b_mclk,   AUDIO_MCLK_B_CTRL);
 static AXG_MST_MCLK_MUX(mst_c_mclk,   AUDIO_MCLK_C_CTRL);
@@ -112,13 +118,19 @@ static AXG_MST_MCLK_MUX(mst_d_mclk,   AUDIO_MCLK_D_CTRL);
 static AXG_MST_MCLK_MUX(mst_e_mclk,   AUDIO_MCLK_E_CTRL);
 static AXG_MST_MCLK_MUX(mst_f_mclk,   AUDIO_MCLK_F_CTRL);
 static AXG_MST_MCLK_MUX(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
-static AXG_MST_MCLK_MUX(spdifin_clk,  AUDIO_CLK_SPDIFIN_CTRL);
 static AXG_MST_MCLK_MUX(pdm_dclk,     AUDIO_CLK_PDMIN_CTRL0);
-static AXG_MST_MCLK_MUX(pdm_sysclk,   AUDIO_CLK_PDMIN_CTRL1);
+static AXG_MST_SYS_MUX(spdifin_clk,   AUDIO_CLK_SPDIFIN_CTRL);
+static AXG_MST_SYS_MUX(pdm_sysclk,    AUDIO_CLK_PDMIN_CTRL1);
+
+#define AXG_MST_DIV(_name, _reg, _flag)				\
+	AXG_AUD_DIV(_name##_div, _reg, 0, 16, _flag,		\
+		    "axg_"#_name"_sel", CLK_SET_RATE_PARENT)	\
+
+#define AXG_MST_MCLK_DIV(_name, _reg)				\
+	AXG_MST_DIV(_name, _reg, CLK_DIVIDER_ROUND_CLOSEST)
 
-#define AXG_MST_MCLK_DIV(_name, _reg)					\
-	AXG_AUD_DIV(_name##_div, _reg, 0, 16, CLK_DIVIDER_ROUND_CLOSEST, \
-		    "axg_"#_name"_sel", CLK_SET_RATE_PARENT)		\
+#define AXG_MST_SYS_DIV(_name, _reg)				\
+	AXG_MST_DIV(_name, _reg, 0)
 
 static AXG_MST_MCLK_DIV(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
 static AXG_MST_MCLK_DIV(mst_b_mclk,   AUDIO_MCLK_B_CTRL);
@@ -127,12 +139,12 @@ static AXG_MST_MCLK_DIV(mst_d_mclk,   AUDIO_MCLK_D_CTRL);
 static AXG_MST_MCLK_DIV(mst_e_mclk,   AUDIO_MCLK_E_CTRL);
 static AXG_MST_MCLK_DIV(mst_f_mclk,   AUDIO_MCLK_F_CTRL);
 static AXG_MST_MCLK_DIV(spdifout_clk, AUDIO_CLK_SPDIFOUT_CTRL);
-static AXG_MST_MCLK_DIV(spdifin_clk,  AUDIO_CLK_SPDIFIN_CTRL);
 static AXG_MST_MCLK_DIV(pdm_dclk,     AUDIO_CLK_PDMIN_CTRL0);
-static AXG_MST_MCLK_DIV(pdm_sysclk,   AUDIO_CLK_PDMIN_CTRL1);
+static AXG_MST_SYS_DIV(spdifin_clk,   AUDIO_CLK_SPDIFIN_CTRL);
+static AXG_MST_SYS_DIV(pdm_sysclk,    AUDIO_CLK_PDMIN_CTRL1);
 
-#define AXG_MST_MCLK_GATE(_name, _reg)					\
-	AXG_AUD_GATE(_name, _reg, 31,  "axg_"#_name"_div",		\
+#define AXG_MST_MCLK_GATE(_name, _reg)				\
+	AXG_AUD_GATE(_name, _reg, 31,  "axg_"#_name"_div",	\
 		     CLK_SET_RATE_PARENT)
 
 static AXG_MST_MCLK_GATE(mst_a_mclk,   AUDIO_MCLK_A_CTRL);
-- 
2.17.1


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:38545 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389492AbeHAPq6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Aug 2018 11:46:58 -0400
Received: by mail-wm0-f66.google.com with SMTP id t25-v6so7155820wmi.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Aug 2018 07:01:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/4] clk: meson: clk-pll: drop CLK_GET_RATE_NOCACHE where unnecessary
Date: Wed,  1 Aug 2018 16:00:51 +0200
Message-Id: <20180801140053.25899-3-jbrunet@baylibre.com>
In-Reply-To: <20180801140053.25899-1-jbrunet@baylibre.com>
References: <20180801140053.25899-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

CLK_GET_RATE_NOCACHE should only be necessary when the registers
controlling the rate of clock may change outside of CCF. On Amlogic,
it should only be the case for the hdmi pll which is directly controlled
by the display driver (WIP to fix this).

The other plls should not require this flag.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c     |  1 -
 drivers/clk/meson/gxbb.c    | 12 ++++++++----
 drivers/clk/meson/meson8b.c |  3 ---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 6d8976554656..991fa511c05a 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -106,7 +106,6 @@ static struct clk_regmap axg_sys_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 5ed34566917c..01e3f80e88cc 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -218,7 +218,6 @@ static struct clk_regmap gxbb_fixed_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -286,6 +285,10 @@ static struct clk_regmap gxbb_hdmi_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "hdmi_pll_pre_mult" },
 		.num_parents = 1,
+		/*
+		 * Display directly handle hdmi pll registers ATM, we need
+		 * NOCACHE to keep our view of the clock as accurate as possible
+		 */
 		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -349,6 +352,10 @@ static struct clk_regmap gxl_hdmi_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
+		/*
+		 * Display directly handle hdmi pll registers ATM, we need
+		 * NOCACHE to keep our view of the clock as accurate as possible
+		 */
 		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
@@ -391,7 +398,6 @@ static struct clk_regmap gxbb_sys_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -442,7 +448,6 @@ static struct clk_regmap gxbb_gp0_pll = {
 		.ops = &meson_clk_pll_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -500,7 +505,6 @@ static struct clk_regmap gxl_gp0_pll = {
 		.ops = &meson_clk_pll_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index fd4c414893f5..ec1f97725b9f 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -137,7 +137,6 @@ static struct clk_regmap meson8b_fixed_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -179,7 +178,6 @@ static struct clk_regmap meson8b_vid_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -222,7 +220,6 @@ static struct clk_regmap meson8b_sys_pll = {
 		.ops = &meson_clk_pll_ro_ops,
 		.parent_names = (const char *[]){ "xtal" },
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
 	},
 };
 
-- 
2.17.1


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33198 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754139AbeFTKGW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jun 2018 06:06:22 -0400
Received: by mail-wm0-f68.google.com with SMTP id z6-v6so22138148wma.0
        for <linux-clk@vger.kernel.org>; Wed, 20 Jun 2018 03:06:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: meson: remove unused clk-audio-divider driver
Date: Wed, 20 Jun 2018 12:06:10 +0200
Message-Id: <20180620100610.29010-3-jbrunet@baylibre.com>
In-Reply-To: <20180620100610.29010-1-jbrunet@baylibre.com>
References: <20180620100610.29010-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

clk-audio-divider is no longer used, we can remove it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Makefile            |   2 +-
 drivers/clk/meson/clk-audio-divider.c | 110 ----------------------------------
 drivers/clk/meson/clkc.h              |   7 ---
 3 files changed, 1 insertion(+), 118 deletions(-)
 delete mode 100644 drivers/clk/meson/clk-audio-divider.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index d0d13aeb369a..e40fea96069b 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -2,7 +2,7 @@
 # Makefile for Meson specific clk
 #
 
-obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-mpll.o clk-audio-divider.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-mpll.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
 obj-$(CONFIG_COMMON_CLK_GXBB)	 += gxbb.o gxbb-aoclk.o gxbb-aoclk-32k.o
diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
deleted file mode 100644
index e4cf96ba704e..000000000000
--- a/drivers/clk/meson/clk-audio-divider.c
+++ /dev/null
@@ -1,110 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2017 AmLogic, Inc.
- * Author: Jerome Brunet <jbrunet@baylibre.com>
- */
-
-/*
- * i2s master clock divider: The algorithm of the generic clk-divider used with
- * a very precise clock parent such as the mpll tends to select a low divider
- * factor. This gives poor results with this particular divider, especially with
- * high frequencies (> 100 MHz)
- *
- * This driver try to select the maximum possible divider with the rate the
- * upstream clock can provide.
- */
-
-#include <linux/clk-provider.h>
-#include "clkc.h"
-
-static inline struct meson_clk_audio_div_data *
-meson_clk_audio_div_data(struct clk_regmap *clk)
-{
-	return (struct meson_clk_audio_div_data *)clk->data;
-}
-
-static int _div_round(unsigned long parent_rate, unsigned long rate,
-		      unsigned long flags)
-{
-	if (flags & CLK_DIVIDER_ROUND_CLOSEST)
-		return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, rate);
-
-	return DIV_ROUND_UP_ULL((u64)parent_rate, rate);
-}
-
-static int _get_val(unsigned long parent_rate, unsigned long rate)
-{
-	return DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
-}
-
-static int _valid_divider(unsigned int width, int divider)
-{
-	int max_divider = 1 << width;
-
-	return clamp(divider, 1, max_divider);
-}
-
-static unsigned long audio_divider_recalc_rate(struct clk_hw *hw,
-					       unsigned long parent_rate)
-{
-	struct clk_regmap *clk = to_clk_regmap(hw);
-	struct meson_clk_audio_div_data *adiv = meson_clk_audio_div_data(clk);
-	unsigned long divider;
-
-	divider = meson_parm_read(clk->map, &adiv->div) + 1;
-
-	return DIV_ROUND_UP_ULL((u64)parent_rate, divider);
-}
-
-static long audio_divider_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
-{
-	struct clk_regmap *clk = to_clk_regmap(hw);
-	struct meson_clk_audio_div_data *adiv = meson_clk_audio_div_data(clk);
-	unsigned long max_prate;
-	int divider;
-
-	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
-		divider = _div_round(*parent_rate, rate, adiv->flags);
-		divider = _valid_divider(adiv->div.width, divider);
-		return DIV_ROUND_UP_ULL((u64)*parent_rate, divider);
-	}
-
-	/* Get the maximum parent rate */
-	max_prate = clk_hw_round_rate(clk_hw_get_parent(hw), ULONG_MAX);
-
-	/* Get the corresponding rounded down divider */
-	divider = max_prate / rate;
-	divider = _valid_divider(adiv->div.width, divider);
-
-	/* Get actual rate of the parent */
-	*parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
-					 divider * rate);
-
-	return DIV_ROUND_UP_ULL((u64)*parent_rate, divider);
-}
-
-static int audio_divider_set_rate(struct clk_hw *hw,
-				  unsigned long rate,
-				  unsigned long parent_rate)
-{
-	struct clk_regmap *clk = to_clk_regmap(hw);
-	struct meson_clk_audio_div_data *adiv = meson_clk_audio_div_data(clk);
-	int val = _get_val(parent_rate, rate);
-
-	meson_parm_write(clk->map, &adiv->div, val);
-
-	return 0;
-}
-
-const struct clk_ops meson_clk_audio_divider_ro_ops = {
-	.recalc_rate	= audio_divider_recalc_rate,
-	.round_rate	= audio_divider_round_rate,
-};
-
-const struct clk_ops meson_clk_audio_divider_ops = {
-	.recalc_rate	= audio_divider_recalc_rate,
-	.round_rate	= audio_divider_round_rate,
-	.set_rate	= audio_divider_set_rate,
-};
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 2fb084330ee9..48db02424f02 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -91,11 +91,6 @@ struct meson_clk_mpll_data {
 
 #define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
 
-struct meson_clk_audio_div_data {
-	struct parm div;
-	u8 flags;
-};
-
 #define MESON_GATE(_name, _reg, _bit)					\
 struct clk_regmap _name = {						\
 	.data = &(struct clk_regmap_gate_data){				\
@@ -117,7 +112,5 @@ extern const struct clk_ops meson_clk_pll_ops;
 extern const struct clk_ops meson_clk_cpu_ops;
 extern const struct clk_ops meson_clk_mpll_ro_ops;
 extern const struct clk_ops meson_clk_mpll_ops;
-extern const struct clk_ops meson_clk_audio_divider_ro_ops;
-extern const struct clk_ops meson_clk_audio_divider_ops;
 
 #endif /* __CLKC_H */
-- 
2.14.3


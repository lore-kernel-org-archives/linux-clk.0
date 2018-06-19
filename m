Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33040 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966661AbeFSPr7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jun 2018 11:47:59 -0400
Received: by mail-wm0-f65.google.com with SMTP id z6-v6so19389386wma.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Jun 2018 08:47:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: audio-divider is one based
Date: Tue, 19 Jun 2018 17:47:53 +0200
Message-Id: <20180619154753.12788-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The audio divider is one based. This offset was mistakenly dropped from
recalc_rate() when migrating to clk_regmap.

Fixes: 88a4e1283681 ("clk: meson: migrate the audio divider clock to clk_regmap")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-audio-divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
index 58f546e04807..e4cf96ba704e 100644
--- a/drivers/clk/meson/clk-audio-divider.c
+++ b/drivers/clk/meson/clk-audio-divider.c
@@ -51,7 +51,7 @@ static unsigned long audio_divider_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_audio_div_data *adiv = meson_clk_audio_div_data(clk);
 	unsigned long divider;
 
-	divider = meson_parm_read(clk->map, &adiv->div);
+	divider = meson_parm_read(clk->map, &adiv->div) + 1;
 
 	return DIV_ROUND_UP_ULL((u64)parent_rate, divider);
 }
-- 
2.14.3


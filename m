Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:52150 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751276AbdFBKKj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Jun 2017 06:10:39 -0400
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH 10/19] drm/sun4i: hdmi: Rename internal DDC clock to avoid name collision
Date: Fri,  2 Jun 2017 18:10:15 +0800
Message-Id: <20170602101024.18940-11-wens@csie.org>
In-Reply-To: <20170602101024.18940-1-wens@csie.org>
References: <20170602101024.18940-1-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The DDC parent clock on the A31 SoC is also conveniently named
"hdmi-ddc", which results in a name collision when the hdmi driver
registers its internal DDC divider clock.

Rename the internal clock to "hdmi-ddc-divider".

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index e1071838f487..9a6b6243e977 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -125,7 +125,7 @@ static int _sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent,
 	if (!ddc)
 		return -ENOMEM;
 
-	init.name = "hdmi-ddc";
+	init.name = "hdmi-ddc-divider";
 	init.ops = &sun4i_ddc_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
-- 
2.11.0


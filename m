Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs61.siol.net ([185.57.226.252]:38563 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S934332AbeFLUC0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jun 2018 16:02:26 -0400
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v2 14/27] drm/sun4i: Don't check for panel or bridge on TV TCONs
Date: Tue, 12 Jun 2018 22:00:23 +0200
Message-Id: <20180612200036.21483-15-jernej.skrabec@siol.net>
In-Reply-To: <20180612200036.21483-1-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

TV TCONs are always connected to TV or HDMI encoder, so it doesn't make
sense to check if panel or bridge is connected to them.

Check if TCON has channel 0 and only then check for connected panel or
bridges.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index b1205a7bc20f..c9ffa5381185 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1189,13 +1189,19 @@ static const struct component_ops sun4i_tcon_ops = {
 static int sun4i_tcon_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
+	const struct sun4i_tcon_quirks *quirks;
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
-	if (ret == -EPROBE_DEFER)
-		return ret;
+	quirks = of_device_get_match_data(&pdev->dev);
+
+	/* panels and bridges are present only on TCONs with channel 0 */
+	if (quirks->has_channel_0) {
+		ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+	}
 
 	return component_add(&pdev->dev, &sun4i_tcon_ops);
 }
-- 
2.17.1


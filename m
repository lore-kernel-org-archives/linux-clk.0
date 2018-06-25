Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs60.siol.net ([185.57.226.251]:47970 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932739AbeFYMFP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jun 2018 08:05:15 -0400
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v3 11/24] drm/sun4i: Don't check for LVDS and RGB when TCON has only ch1
Date: Mon, 25 Jun 2018 14:02:51 +0200
Message-Id: <20180625120304.7543-12-jernej.skrabec@siol.net>
In-Reply-To: <20180625120304.7543-1-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

LVDS and RGB interfaces are always connected to TCONs which have channel
0. It doesn't make sense to try to init them on TV TCONs.

Add a check if TCON has channel 0 before trying to init LVDS or RGB
interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 264bcc43da11..761687ebacba 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1106,23 +1106,25 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		goto err_free_dotclock;
 	}
 
-	/*
-	 * If we have an LVDS panel connected to the TCON, we should
-	 * just probe the LVDS connector. Otherwise, just probe RGB as
-	 * we used to.
-	 */
-	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
-	if (of_device_is_compatible(remote, "panel-lvds"))
-		if (can_lvds)
-			ret = sun4i_lvds_init(drm, tcon);
+	if (tcon->quirks->has_channel_0) {
+		/*
+		 * If we have an LVDS panel connected to the TCON, we should
+		 * just probe the LVDS connector. Otherwise, just probe RGB as
+		 * we used to.
+		 */
+		remote = of_graph_get_remote_node(dev->of_node, 1, 0);
+		if (of_device_is_compatible(remote, "panel-lvds"))
+			if (can_lvds)
+				ret = sun4i_lvds_init(drm, tcon);
+			else
+				ret = -EINVAL;
 		else
-			ret = -EINVAL;
-	else
-		ret = sun4i_rgb_init(drm, tcon);
-	of_node_put(remote);
+			ret = sun4i_rgb_init(drm, tcon);
+		of_node_put(remote);
 
-	if (ret < 0)
-		goto err_free_dotclock;
+		if (ret < 0)
+			goto err_free_dotclock;
+	}
 
 	if (tcon->quirks->needs_de_be_mux) {
 		/*
-- 
2.18.0


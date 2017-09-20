Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs1.siol.net ([213.250.19.134]:43609 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751506AbdITTir (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Sep 2017 15:38:47 -0400
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@free-electrons.com, wens@csie.org
Cc: Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, icenowy@aosc.io,
        linux-sunxi@googlegroups.com
Subject: [RFC PATCH 1/7] drm: bridge: Enable polling hpd event in dw_hdmi
Date: Wed, 20 Sep 2017 21:38:25 +0200
Message-Id: <20170920193831.20268-2-jernej.skrabec@siol.net>
In-Reply-To: <20170920193831.20268-1-jernej.skrabec@siol.net>
References: <20170920193831.20268-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Some custom phys don't support hpd interrupts. Add support for polling
such events.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bf14214fa464..09cb5a3e4c71 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1954,7 +1954,11 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 	struct drm_connector *connector = &hdmi->connector;
 
 	connector->interlace_allowed = 1;
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
+	if (hdmi->phy.ops->setup_hpd)
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	else
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+				    DRM_CONNECTOR_POLL_DISCONNECT;
 
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
-- 
2.14.1


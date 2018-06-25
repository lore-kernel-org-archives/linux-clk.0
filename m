Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs55.siol.net ([185.57.226.246]:48269 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933756AbeFYMFp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jun 2018 08:05:45 -0400
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v3 21/24] drm: of: Export drm_crtc_port_mask()
Date: Mon, 25 Jun 2018 14:03:01 +0200
Message-Id: <20180625120304.7543-22-jernej.skrabec@siol.net>
In-Reply-To: <20180625120304.7543-1-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Function is useful when drm_of_find_possible_crtcs() can't be used and
custom parsing is needed. This can happen for example when there is a
node with multiple muxes between crtc and encoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/drm_of.c | 5 +++--
 include/drm/drm_of.h     | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 1fe122461298..50e738857258 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -22,8 +22,8 @@ static void drm_release_of(struct device *dev, void *data)
  * Given a port OF node, return the possible mask of the corresponding
  * CRTC within a device's list of CRTCs.  Returns zero if not found.
  */
-static uint32_t drm_crtc_port_mask(struct drm_device *dev,
-				   struct device_node *port)
+uint32_t drm_crtc_port_mask(struct drm_device *dev,
+			    struct device_node *port)
 {
 	unsigned int index = 0;
 	struct drm_crtc *tmp;
@@ -37,6 +37,7 @@ static uint32_t drm_crtc_port_mask(struct drm_device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_crtc_port_mask);
 
 /**
  * drm_of_find_possible_crtcs - find the possible CRTCs for an encoder port
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b93c239afb60..a61fd77e46ba 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -17,6 +17,8 @@ struct drm_bridge;
 struct device_node;
 
 #ifdef CONFIG_OF
+uint32_t drm_crtc_port_mask(struct drm_device *dev,
+			    struct device_node *port);
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port);
 void drm_of_component_match_add(struct device *master,
@@ -34,6 +36,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
 #else
+static inline uint32_t drm_crtc_port_mask(struct drm_device *dev,
+					  struct device_node *port)
+{
+	return 0;
+}
+
 static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 						  struct device_node *port)
 {
-- 
2.18.0


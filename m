Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:38146 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752704AbcEPMre (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2016 08:47:34 -0400
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 07/20] drm/sun4i: rgb: Validate the clock rate
Date: Mon, 16 May 2016 14:47:07 +0200
Message-Id: <1463402840-17062-8-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Our pixel clock cannot reach a high enough rate for some rather high while
common resolutions (like 1080p60).

Make sure we filter the resolutions we cannot reach in our mode_valid
function.

Fixes: 29e57fab97fc ("drm: sun4i: Add RGB output")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_rgb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index ab6494818050..923f55039cb1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -54,8 +54,13 @@ static int sun4i_rgb_get_modes(struct drm_connector *connector)
 static int sun4i_rgb_mode_valid(struct drm_connector *connector,
 				struct drm_display_mode *mode)
 {
+	struct sun4i_rgb *rgb = drm_connector_to_sun4i_rgb(connector);
+	struct sun4i_drv *drv = rgb->drv;
+	struct sun4i_tcon *tcon = drv->tcon;
 	u32 hsync = mode->hsync_end - mode->hsync_start;
 	u32 vsync = mode->vsync_end - mode->vsync_start;
+	unsigned long rate = mode->crtc_clock * 1000;
+	long rounded_rate;
 
 	DRM_DEBUG_DRIVER("Validating modes...\n");
 
@@ -87,6 +92,15 @@ static int sun4i_rgb_mode_valid(struct drm_connector *connector,
 
 	DRM_DEBUG_DRIVER("Vertical parameters OK\n");
 
+	rounded_rate = clk_round_rate(tcon->dclk, rate);
+	if (rounded_rate < rate)
+		return MODE_CLOCK_LOW;
+
+	if (rounded_rate > rate)
+		return MODE_CLOCK_HIGH;
+
+	DRM_DEBUG_DRIVER("Clock rate OK\n");
+
 	return MODE_OK;
 }
 
-- 
2.8.2


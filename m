Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs16.siol.net ([185.57.226.207]:48078 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933639AbeFYMFY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jun 2018 08:05:24 -0400
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v3 14/24] drm/sun4i: Add support for R40 mixers
Date: Mon, 25 Jun 2018 14:02:54 +0200
Message-Id: <20180625120304.7543-15-jernej.skrabec@siol.net>
In-Reply-To: <20180625120304.7543-1-jernej.skrabec@siol.net>
References: <20180625120304.7543-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Both mixers have similar capabilities as others SoCs with DE2.

First mixer has 1 VI and 3 UI planes and supports HW scaling on all
planes.

Second mixer has 1 VI and 1 UI planes and also supports HW scaling on
all planes.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 126899d6f0d3..ee8febb25903 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -500,6 +500,22 @@ static const struct sun8i_mixer_cfg sun8i_h3_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun8i_r40_mixer0_cfg = {
+	.ccsc		= 0,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0xf,
+	.ui_num		= 3,
+	.vi_num		= 1,
+};
+
+static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
+	.ccsc		= 1,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.ui_num		= 1,
+	.vi_num		= 1,
+};
+
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.vi_num = 2,
 	.ui_num = 1,
@@ -521,6 +537,14 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun8i-h3-de2-mixer-0",
 		.data = &sun8i_h3_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun8i-r40-de2-mixer-0",
+		.data = &sun8i_r40_mixer0_cfg,
+	},
+	{
+		.compatible = "allwinner,sun8i-r40-de2-mixer-1",
+		.data = &sun8i_r40_mixer1_cfg,
+	},
 	{
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
-- 
2.18.0


Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 20/26] drm: sun4i: tv: Add PAL output standard
Date: Thu, 14 Jan 2016 16:25:03 +0100
Message-Id: <1452785109-6172-21-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Now that we have support for the composite output, we can start adding new
supported standards. Start with PAL, and we will add other eventually.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 4f10f8b6b07c..4f369de2a1fc 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -176,7 +176,49 @@ struct sun4i_tv {
 	struct sun4i_drv	*drv;
 };
 
+struct video_levels pal_video_levels = {
+	.black = 252,	.blank = 252,
+};
+
+struct burst_levels pal_burst_levels = {
+	.cb = 40,	.cr = 40,
+};
+
+struct color_gains pal_color_gains = {
+	.cb = 224,	.cr = 224,
+};
+
+struct resync_parameters pal_resync_parameters = {
+	.field = true,	.line = 13,	.pixel = 12,
+};
+
 struct tv_mode tv_modes[] = {
+	{
+		.name		= "PAL",
+		.mode		= SUN4I_TVE_CFG0_RES_576i,
+		.chroma_freq	= 0x2a098acb,
+
+		.back_porch	= 138,
+		.front_porch	= 24,
+		.line_number	= 625,
+
+		.hdisplay	= 720,
+		.hfront_porch	= 3,
+		.hsync_len	= 2,
+		.hback_porch	= 139,
+
+		.vdisplay	= 576,
+		.vfront_porch	= 28,
+		.vsync_len	= 2,
+		.vback_porch	= 19,
+
+		.vblank_level	= 252,
+
+		.color_gains	= &pal_color_gains,
+		.burst_levels	= &pal_burst_levels,
+		.video_levels	= &pal_video_levels,
+		.resync_params	= &pal_resync_parameters,
+	},
 };
 
 static inline struct sun4i_tv *
-- 
2.6.4

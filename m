Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>
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
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 07/19] drm/panel: simple: Add timings for the Olimex LCD-OLinuXino-4.3TS
Date: Fri, 30 Oct 2015 15:20:53 +0100
Message-Id: <1446214865-3972-8-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Add support for the Olimex LCD-OLinuXino-4.3TS panel to the DRM simple
panel driver.

It is a 480x272 panel connected through a 24-bits RGB interface.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f97b73ec4713..3a9ecb64d1e6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1096,6 +1096,29 @@ static const struct panel_desc shelly_sca07010_bfn_lnn = {
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
+static const struct drm_display_mode olimex_lcd_olinuxino_43ts_mode = {
+	.clock = 9000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 5,
+	.hsync_end = 480 + 5 + 30,
+	.htotal = 480 + 5 + 30 + 10,
+	.vdisplay = 272,
+	.vsync_start = 272 + 8,
+	.vsync_end = 272 + 8 + 5,
+	.vtotal = 272 + 8 + 5 + 3,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc olimex_lcd_olinuxino_43ts = {
+	.modes = &olimex_lcd_olinuxino_43ts_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 105,
+		.height = 67,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+};
+
 static const struct of_device_id platform_of_match[] = {
 	{
 		.compatible = "ampire,am800480r3tmqwa1h",
@@ -1191,6 +1214,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "shelly,sca07010-bfn-lnn",
 		.data = &shelly_sca07010_bfn_lnn,
 	}, {
+		.compatible = "olimex,lcd-olinuxino-43-ts",
+		.data = &olimex_lcd_olinuxino_43ts,
+	}, {
 		/* sentinel */
 	}
 };
-- 
2.6.2

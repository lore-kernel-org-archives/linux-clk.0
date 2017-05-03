Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH v2 11/20] drm/sun4i: tcon: Switch mux on only for composite
Date: Wed,  3 May 2017 13:59:48 +0200
Message-Id: <9f97dbff6f99c108b5f4b7f144d02dde8c253ab6.1493812478.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Even though that mux is undocumented, it seems like it needs to be set to 1
when using composite, and 0 when using HDMI.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 0204d9fadb66..1c609d808b86 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -111,16 +111,23 @@ EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
 void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
 			struct drm_encoder *encoder)
 {
+	u32 val;
+
 	if (!tcon->quirks->has_unknown_mux)
 		return;
 
 	if (channel != 1)
 		return;
 
+	if (encoder->encoder_type == DRM_MODE_ENCODER_TVDAC)
+		val = 1;
+	else
+		val = 0;
+
 	/*
 	 * FIXME: Undocumented bits
 	 */
-	regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, 1);
+	regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, val);
 }
 EXPORT_SYMBOL(sun4i_tcon_set_mux);
 
-- 
git-series 0.8.11

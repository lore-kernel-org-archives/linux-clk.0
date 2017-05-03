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
Subject: [PATCH v2 12/20] drm/sun4i: tcon: Fix tcon channel 1 backporch calculation
Date: Wed,  3 May 2017 13:59:49 +0200
Message-Id: <c742fe1641de0a5a8ce83c1dbcb8df79f953a19e.1493812478.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

It seems like what's called a backporch in the datasheet is actually the
backporch plus the sync period. Fix that in our driver.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 1c609d808b86..86a806fae9fb 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -262,7 +262,7 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 		     SUN4I_TCON1_BASIC2_Y(mode->crtc_vdisplay));
 
 	/* Set horizontal display timings */
-	bp = mode->crtc_htotal - mode->crtc_hsync_end;
+	bp = mode->crtc_htotal - mode->crtc_hsync_start;
 	DRM_DEBUG_DRIVER("Setting horizontal total %d, backporch %d\n",
 			 mode->htotal, bp);
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC3_REG,
@@ -270,7 +270,7 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
 
 	/* Set vertical display timings */
-	bp = mode->crtc_vtotal - mode->crtc_vsync_end;
+	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
 	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
 			 mode->vtotal, bp);
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
-- 
git-series 0.8.11

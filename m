Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v3 09/21] drm/sun4i: tcon: Add channel debug
Date: Wed, 17 May 2017 09:40:38 +0200
Message-Id: <fdbddab4a5ab3945acb56b3402016cf32eccb0cd.1495006350.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

While all functions have debug logs, the channel enable and disable are not
logged. Make sure this is the case.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 8b6aaa60037d..48fadd188d65 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -55,6 +55,8 @@ EXPORT_SYMBOL(sun4i_tcon_enable);
 
 void sun4i_tcon_channel_disable(struct sun4i_tcon *tcon, int channel)
 {
+	DRM_DEBUG_DRIVER("Disabling TCON channel %d\n", channel);
+
 	/* Disable the TCON's channel */
 	if (channel == 0) {
 		regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
@@ -72,6 +74,8 @@ EXPORT_SYMBOL(sun4i_tcon_channel_disable);
 
 void sun4i_tcon_channel_enable(struct sun4i_tcon *tcon, int channel)
 {
+	DRM_DEBUG_DRIVER("Enabling TCON channel %d\n", channel);
+
 	/* Enable the TCON's channel */
 	if (channel == 0) {
 		regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
-- 
git-series 0.9.1

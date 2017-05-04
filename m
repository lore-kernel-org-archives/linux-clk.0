Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v6 06/13] drm/sun4i: add a dedicated module for sun4i-backend
 and sun4i-layer
Date: Thu,  4 May 2017 19:48:51 +0800
Message-Id: <20170504114858.9008-7-icenowy@aosc.io>
In-Reply-To: <20170504114858.9008-1-icenowy@aosc.io>
References: <20170504114858.9008-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Currently the direct call from CRTC code to layer code has disappeared,
instead the layer's init function is called via the backend's ops.

Add a dedicated module for sun4i-backend and sun4i-layer, and drop the
EXPORT_SYMBOL from backend code to layer code.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Splited out patch.

 drivers/gpu/drm/sun4i/Makefile        | 5 +++--
 drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 59b757350a1f..a251fb36c951 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -5,9 +5,10 @@ sun4i-tcon-y += sun4i_tcon.o
 sun4i-tcon-y += sun4i_rgb.o
 sun4i-tcon-y += sun4i_dotclock.o
 sun4i-tcon-y += sun4i_crtc.o
-sun4i-tcon-y += sun4i_layer.o
+
+sun4i-backend-y += sun4i_backend.o sun4i_layer.o
 
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i-drm.o sun4i-tcon.o
-obj-$(CONFIG_DRM_SUN4I)		+= sun4i_backend.o
+obj-$(CONFIG_DRM_SUN4I)		+= sun4i-backend.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun6i_drc.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i_tv.o
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 611cdcb9c182..fac1a414ba49 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -83,7 +83,6 @@ void sun4i_backend_layer_enable(struct sun4i_backend *backend,
 	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_MODCTL_REG,
 			   SUN4I_BACKEND_MODCTL_LAY_EN(layer), val);
 }
-EXPORT_SYMBOL(sun4i_backend_layer_enable);
 
 static int sun4i_backend_drm_format_to_layer(struct drm_plane *plane,
 					     u32 format, u32 *mode)
@@ -170,7 +169,6 @@ int sun4i_backend_update_layer_coord(struct sun4i_backend *backend,
 
 	return 0;
 }
-EXPORT_SYMBOL(sun4i_backend_update_layer_coord);
 
 int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 				       int layer, struct drm_plane *plane)
@@ -205,7 +203,6 @@ int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 
 	return 0;
 }
-EXPORT_SYMBOL(sun4i_backend_update_layer_formats);
 
 int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 				      int layer, struct drm_plane *plane)
@@ -246,7 +243,6 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 
 	return 0;
 }
-EXPORT_SYMBOL(sun4i_backend_update_layer_buffer);
 
 static int sun4i_backend_init_sat(struct device *dev) {
 	struct sun4i_backend *backend = dev_get_drvdata(dev);
-- 
2.12.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

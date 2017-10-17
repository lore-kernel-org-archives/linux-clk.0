Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 02/23] drm/sun4i: Realign Makefile padding and reorder it
Date: Tue, 17 Oct 2017 11:06:09 +0200
Message-Id: <9410b284ec97453fa692537dffaaa4fb4833347c.1508231063.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, plaes@plaes.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Some options were not padded as they should, and the order in the Makefile
was chaotic. Fix that.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/Makefile | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 43c753cafc88..af18b70ba5ed 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -1,24 +1,24 @@
-sun4i-drm-y += sun4i_drv.o
-sun4i-drm-y += sun4i_framebuffer.o
+sun4i-backend-y			+= sun4i_backend.o sun4i_layer.o
 
-sun4i-drm-hdmi-y += sun4i_hdmi_enc.o
-sun4i-drm-hdmi-y += sun4i_hdmi_i2c.o
-sun4i-drm-hdmi-y += sun4i_hdmi_ddc_clk.o
-sun4i-drm-hdmi-y += sun4i_hdmi_tmds_clk.o
+sun4i-drm-y			+= sun4i_drv.o
+sun4i-drm-y			+= sun4i_framebuffer.o
 
-sun4i-tcon-y += sun4i_tcon.o
-sun4i-tcon-y += sun4i_rgb.o
-sun4i-tcon-y += sun4i_dotclock.o
-sun4i-tcon-y += sun4i_crtc.o
+sun4i-drm-hdmi-y		+= sun4i_hdmi_enc.o
+sun4i-drm-hdmi-y		+= sun4i_hdmi_i2c.o
+sun4i-drm-hdmi-y		+= sun4i_hdmi_ddc_clk.o
+sun4i-drm-hdmi-y		+= sun4i_hdmi_tmds_clk.o
 
-sun4i-backend-y += sun4i_backend.o sun4i_layer.o
+sun4i-tcon-y			+= sun4i_tcon.o
+sun4i-tcon-y			+= sun4i_rgb.o
+sun4i-tcon-y			+= sun4i_dotclock.o
+sun4i-tcon-y			+= sun4i_crtc.o
 
-sun8i-mixer-y += sun8i_mixer.o sun8i_layer.o
+sun8i-mixer-y			+= sun8i_mixer.o sun8i_layer.o
 
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i-drm.o sun4i-tcon.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun6i_drc.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i_tv.o
 
-obj-$(CONFIG_DRM_SUN4I_BACKEND)		+= sun4i-backend.o
+obj-$(CONFIG_DRM_SUN4I_BACKEND)	+= sun4i-backend.o
 obj-$(CONFIG_DRM_SUN4I_HDMI)	+= sun4i-drm-hdmi.o
-obj-$(CONFIG_DRM_SUN8I_MIXER)		+= sun8i-mixer.o
+obj-$(CONFIG_DRM_SUN8I_MIXER)	+= sun8i-mixer.o
-- 
git-series 0.9.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

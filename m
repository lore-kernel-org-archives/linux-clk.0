Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 03/23] drm/sun4i: tcon: Make tcon_set_mux mode argument const
Date: Tue, 17 Oct 2017 11:06:10 +0200
Message-Id: <b0cce5a43fc3b56953d21a54fc3c14672f755f42.1508231063.git-series.maxime.ripard@free-electrons.com>
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

The drm_display_mode pointer can be mark const, so let's do it.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 6 +++---
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 68751b999877..54e1796d2953 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -134,7 +134,7 @@ static struct sun4i_tcon *sun4i_get_tcon0(struct drm_device *drm)
 }
 
 void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
-			struct drm_encoder *encoder)
+			const struct drm_encoder *encoder)
 {
 	int ret = -ENOTSUPP;
 
@@ -783,7 +783,7 @@ static int sun4i_tcon_remove(struct platform_device *pdev)
 
 /* platform specific TCON muxing callbacks */
 static int sun5i_a13_tcon_set_mux(struct sun4i_tcon *tcon,
-				  struct drm_encoder *encoder)
+				  const struct drm_encoder *encoder)
 {
 	u32 val;
 
@@ -799,7 +799,7 @@ static int sun5i_a13_tcon_set_mux(struct sun4i_tcon *tcon,
 }
 
 static int sun6i_tcon_set_mux(struct sun4i_tcon *tcon,
-			      struct drm_encoder *encoder)
+			      const struct drm_encoder *encoder)
 {
 	struct sun4i_tcon *tcon0 = sun4i_get_tcon0(encoder->dev);
 	u32 shift;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index d9e1357cc8ae..d81c6e20efe6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -152,7 +152,7 @@ struct sun4i_tcon_quirks {
 	bool	needs_de_be_mux; /* sun6i needs mux to select backend */
 
 	/* callback to handle tcon muxing options */
-	int	(*set_mux)(struct sun4i_tcon *, struct drm_encoder *);
+	int	(*set_mux)(struct sun4i_tcon *, const struct drm_encoder *);
 };
 
 struct sun4i_tcon {
-- 
git-series 0.9.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

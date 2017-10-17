Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 04/23] drm/sun4i: tcon: Make tcon_get_clk_delay mode argument
 const
Date: Tue, 17 Oct 2017 11:06:11 +0200
Message-Id: <e6f92f126640aa6de639386f9b4677db3d8bb37b.1508231063.git-series.maxime.ripard@free-electrons.com>
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
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 54e1796d2953..9b5b21ad8378 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -146,7 +146,7 @@ void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
 }
 EXPORT_SYMBOL(sun4i_tcon_set_mux);
 
-static int sun4i_tcon_get_clk_delay(struct drm_display_mode *mode,
+static int sun4i_tcon_get_clk_delay(const struct drm_display_mode *mode,
 				    int channel)
 {
 	int delay = mode->vtotal - mode->vdisplay;
-- 
git-series 0.9.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

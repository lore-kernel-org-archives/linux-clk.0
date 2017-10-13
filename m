Return-Path: <fabrizio.castro@bp.renesas.com>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/4] drm: rcar-du: Add R8A7743 support
Date: Fri, 13 Oct 2017 16:22:20 +0100
Message-Id: <1507908142-13142-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Add support for the R8A7743 DU (which is very similar to the R8A7791 DU);
it has 1 DPAD (RGB) output and 1 LVDS output.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d2f29e6..3db5e8d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -34,6 +34,27 @@
  * Device Information
  */
 
+static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
+	.gen = 2,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+	.num_crtcs = 2,
+	.routes = {
+		/*
+		 * R8A7743 has one RGB output and one LVDS output
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(1) | BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 1,
+		},
+	},
+	.num_lvds = 1,
+};
+
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 	.gen = 2,
 	.features = 0,
@@ -207,6 +228,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 };
 
 static const struct of_device_id rcar_du_of_table[] = {
+	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
 	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
 	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },
-- 
2.7.4

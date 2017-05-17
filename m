Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Subject: [RFC PATCH 07/11] drm: sun4i: add support for the TV encoder in H3 SoC
Date: Thu, 18 May 2017 00:43:50 +0800
Message-Id: <20170517164354.16399-8-icenowy@aosc.io>
In-Reply-To: <20170517164354.16399-1-icenowy@aosc.io>
References: <20170517164354.16399-1-icenowy@aosc.io>
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

Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
but with some different points about clocks:
- It has a mod clock and a bus clock.
- The mod clock must be at a fixed rate to generate signal.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/sun4i/sun4i_tv.c | 65 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index a9cad00d4ee8..c9943103f499 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -169,14 +170,23 @@ struct tv_mode {
 	const struct resync_parameters	*resync_params;
 };
 
+struct sun4i_tv_quirks {
+	bool has_mod_clk;
+	bool fixed_clock;
+	unsigned long fixed_clock_rate;
+};
+
 struct sun4i_tv {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 
 	struct clk		*clk;
+	struct clk		*mod_clk;
 	struct regmap		*regs;
 	struct reset_control	*reset;
 
+	const struct sun4i_tv_quirks *quirks;
+
 	struct sun4i_drv	*drv;
 };
 
@@ -578,6 +588,10 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 	tv->drv = drv;
 	dev_set_drvdata(dev, tv);
 
+	tv->quirks = of_device_get_match_data(dev);
+	if (!tv->quirks)
+		return -EINVAL;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(regs)) {
@@ -604,7 +618,10 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	tv->clk = devm_clk_get(dev, NULL);
+	if (tv->quirks->has_mod_clk)
+		tv->clk = devm_clk_get(dev, "bus");
+	else
+		tv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(tv->clk)) {
 		dev_err(dev, "Couldn't get the TV encoder clock\n");
 		ret = PTR_ERR(tv->clk);
@@ -612,6 +629,26 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 	}
 	clk_prepare_enable(tv->clk);
 
+	if (tv->quirks->has_mod_clk) {
+		tv->mod_clk = devm_clk_get(dev, "mod");
+		if (IS_ERR(tv->mod_clk)) {
+			dev_err(dev, "Couldn't get the TV encoder mod clock\n");
+			ret = PTR_ERR(tv->mod_clk);
+			goto err_disable_clk;
+		};
+
+		if (tv->quirks->fixed_clock) {
+			ret = clk_set_rate(tv->mod_clk,
+					   tv->quirks->fixed_clock_rate);
+			if (ret) {
+				dev_err(dev, "Couldn't set TV encoder mod clock rate\n");
+				goto err_disable_clk;
+			}
+		}
+
+		clk_prepare_enable(tv->mod_clk);
+	}
+
 	drm_encoder_helper_add(&tv->encoder,
 			       &sun4i_tv_helper_funcs);
 	ret = drm_encoder_init(drm,
@@ -621,14 +658,14 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 			       NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the TV encoder\n");
-		goto err_disable_clk;
+		goto err_disable_mod_clk;
 	}
 
 	tv->encoder.possible_crtcs = drm_of_find_possible_crtcs(drm,
 								dev->of_node);
 	if (!tv->encoder.possible_crtcs) {
 		ret = -EPROBE_DEFER;
-		goto err_disable_clk;
+		goto err_disable_mod_clk;
 	}
 
 	drm_connector_helper_add(&tv->connector,
@@ -649,6 +686,9 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 err_cleanup_connector:
 	drm_encoder_cleanup(&tv->encoder);
+err_disable_mod_clk:
+	if (tv->quirks->has_mod_clk)
+		clk_disable_unprepare(tv->mod_clk);
 err_disable_clk:
 	clk_disable_unprepare(tv->clk);
 err_assert_reset:
@@ -683,8 +723,25 @@ static int sun4i_tv_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun4i_tv_quirks sun4i_a10_tv_quirks = {
+	/* Nothing special */
+};
+
+static const struct sun4i_tv_quirks sun8i_h3_tv_quirks = {
+	.has_mod_clk = true,
+	.fixed_clock = true,
+	.fixed_clock_rate = 216000000UL,
+};
+
 static const struct of_device_id sun4i_tv_of_table[] = {
-	{ .compatible = "allwinner,sun4i-a10-tv-encoder" },
+	{
+		.compatible = "allwinner,sun4i-a10-tv-encoder",
+		.data = &sun4i_a10_tv_quirks,
+	},
+	{
+		.compatible = "allwinner,sun8i-h3-tv-encoder",
+		.data = &sun8i_h3_tv_quirks,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tv_of_table);
-- 
2.12.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

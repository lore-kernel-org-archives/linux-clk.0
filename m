Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EF3CEBBD
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353236; cv=none; b=gYBzw3UktXPv9gjSsqIDppxH3Pd3LvMmGI2qyxVXZmt1eAzSkxmAmPM3n7Hf6zdNQ4zf8L9sRwsymGxgDjHHQM//PNQ2EUnmRnDyOoj2NYm0/BD+m1K0ocQJdf/LqrpJu/ta99DUyGmK7DvertXFDFKeUy6qGV2oYhBeo1DAyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353236; c=relaxed/simple;
	bh=u3VpWNk/RWixyJZ3CJNCNMCUuCxshozWAkhJ1uzm9aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdD9X3xStR7W0vpXyj6jdvFENv5tGgO6VEnLkg5NaCTV228xhOGEmW+ST09cDpISCSuVKjFZm9/ZA0vz0gEJpEve+RMDfiBwVoXBYEeoVyqNFjK0FjhvJtqkVDvd/fYBAyWSu9b6h36T98BCZ33olVa1Og30L30O6IEZw4+uFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4A1djO9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4A1djO9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1773909f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353232; x=1778958032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRiBGQ2QPdeyt3UQcFiASOhwWyz97F1JtdNHI4C4Guw=;
        b=G4A1djO9kr/rAUKiQrDtuyePTJXN2HamNNfDjbhNbGb9nSpxsWmZ4+i5lOyWbVtvux
         NQZTIhuszxy199AXPsQMJ09F4Dc1m331kt6HAPqusaXzDd3/Khl9S2/YFkI2cfp0TBga
         PelDdUgwnYmS1TL2qGu1uovSlTv6peWOs39Lv71eiXj3itvfiPPcGGRncXgccT07vbTR
         iDsMLLa8u2IRakkQJl6UbBIo34l3l6rOAAf/EdM/J/DmooEVWkSFXpwCMvcKNmHPn7Hz
         1B49Dwt01XzlLHWf6KtlVWqDdNdte9h8CdgGH2neDmR0wz/jPmqDK+NxZ0tR+xK1FIp/
         5dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353232; x=1778958032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dRiBGQ2QPdeyt3UQcFiASOhwWyz97F1JtdNHI4C4Guw=;
        b=Mcnqpt9fWt03kLmpBgJbzsl3Ilc1Ng8NETtsICHTQnBFJcuhDtXszWcS/wmwVXBy/b
         JwxK2NRG14K8BZfkuNJEniZlsVz0MNIP/9EJUBGVBF8KU46NjI6AJcJSFv6P9bVwnoWq
         Oa5DE0GryoO6ASz7v2JzjClSiP25tSSTElaamBVOHp4WOGjIWwTsGwU/FQGa+R6fPrIT
         tT13OkScPvBo24df989rqyUqX0vFGF+SvACwamFq/1MV7DeTRNC2wnMDDYkCpYCxtXIC
         ot4cB4aR2k0uuz4l+VGgXN2hkUZDMIQV9KVdAdYL70axeXtdH5Yc0hugKEmHe78cijcX
         GoKw==
X-Forwarded-Encrypted: i=1; AFNElJ8U67OYSjL+t9EgvfPE1XjZbbQ5zpq5q+OPC2Fggrlh5JdukfWh/DuhQc9HJbbhYOWNofhj2QWLuMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfLDln5IHrPF5wdo4ymymsX9ROgbOIw0RZ8Jl3e9nK01lp8COQ
	Y/Rwq0OZjEnuZmlSm7Ya8a2Ao9LJuJlZl9su+KRPYk5xAmQ+MmEhfq9Q
X-Gm-Gg: Acq92OF9qDbhvZDdk1ghEik17cFy8XRt0BUq1Gvfoe8LRni8P0Pt+3nHqDCtaXW0HCX
	dAhzgDxQ8e6P0MbMZYJq4Hx59TFmCAjQwtR2d/vlljNtuqg+9qg6FDEcAAQiinaOf4YQxadJ5tP
	uRzraaWKkJgGz/EnmdVpaZRiLp94VdPt7rVWyCdH5Ejb9YSJ7AIEy120dROkcwTHX18ltotR5c3
	Fa6nPDRPvmHK/es0Ke8/vQm4Qq3Ay1wpbGt31if3UFr+MbCX/Pid++/yRiZwEA4akxZrnX6SzB0
	obWAJOem41CzbSDGdQpnDd2ZDaGh+HtTzuzL2axoxd6Sq/J5aGNIKqS6kGjDrzs4hRTnfo2utaf
	XdAG6uL/hPgwLF6VX4NHvjva+yhRthkAcDq7SNqkkYOfs8kBgoQqnmevPxzB5konHXsdpGJDtjY
	uyRCTbE/zl/0eu30hvcXsh9bZAThGWkM53810tSHe1wLtv7of3pcouAuahc0rF9g8hxZY=
X-Received: by 2002:a5d:5d85:0:b0:454:86d:b4d2 with SMTP id ffacd0b85a97d-45689baa9b3mr4635330f8f.8.1778353231444;
        Sat, 09 May 2026 12:00:31 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:31 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 8/8] drm/sun4i: switch DE33 to new bindings
Date: Sat,  9 May 2026 21:00:15 +0200
Message-ID: <20260509190015.79086-9-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Now that everything is in place, switch DE33 to new bindings.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- remove CONFIG_DRM_SUN50I_PLANES guard
- fix error path

 drivers/gpu/drm/sun4i/sun8i_mixer.c | 131 +++++++++++++++-------------
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
 2 files changed, 72 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 4071ab38b4ae..957db0938455 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -25,6 +26,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
+#include "sun50i_planes.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -257,7 +259,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
-	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -294,16 +295,16 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 			     SUN8I_MIXER_COORD(x, y));
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 			     SUN8I_MIXER_SIZE(w, h));
 	}
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	if (mixer->cfg->de_type != SUN8I_MIXER_DE33)
@@ -318,7 +319,6 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
-	unsigned int phy_index;
 	int i;
 
 	planes = devm_kcalloc(drm->dev, plane_cnt + 1, sizeof(*planes), GFP_KERNEL);
@@ -333,12 +333,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = i;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[i];
-
 		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
-						i, phy_index, plane_cnt,
+						i, i, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -358,12 +354,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = index;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[index];
-
 		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
-						index, phy_index, plane_cnt,
+						index, index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
@@ -377,16 +369,22 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	return planes;
 }
 
+static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
+					     struct sunxi_engine *engine)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+
+	return sun50i_planes_setup(mixer->planes_dev, drm, engine->id);
+}
+
 static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
-	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
@@ -398,14 +396,14 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -418,8 +416,14 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.mode_set	= sun8i_mixer_mode_set,
 };
 
+static const struct sunxi_engine_ops sun50i_engine_ops = {
+	.commit		= sun8i_mixer_commit,
+	.layers_init	= sun50i_layers_init,
+	.mode_set	= sun8i_mixer_mode_set,
+};
+
 static const struct regmap_config sun8i_mixer_regmap_config = {
-	.name		= "layers",
+	.name		= "display",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
@@ -434,14 +438,6 @@ static const struct regmap_config sun8i_top_regmap_config = {
 	.max_register	= 0x3c,
 };
 
-static const struct regmap_config sun8i_disp_regmap_config = {
-	.name		= "display",
-	.reg_bits	= 32,
-	.val_bits	= 32,
-	.reg_stride	= 4,
-	.max_register	= 0x20000,
-};
-
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -464,17 +460,14 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
-	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
+	struct regmap *top_regs;
 	int plane_cnt, i;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 		top_regs = mixer->top_regs;
-		disp_regs = mixer->disp_regs;
-	} else {
+	else
 		top_regs = mixer->engine.regs;
-		disp_regs = mixer->engine.regs;
-	}
 
 	/* Enable the mixer */
 	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
@@ -484,25 +477,25 @@ static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
 
 	/* Set background color to black */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(disp_regs,
+		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -533,7 +526,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer)
 		return -ENOMEM;
 	dev_set_drvdata(dev, mixer);
-	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
 	/*
@@ -566,6 +558,11 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		mixer->engine.ops = &sun50i_engine_ops;
+	else
+		mixer->engine.ops = &sun8i_engine_ops;
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -588,17 +585,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			dev_err(dev, "Couldn't create the top regmap\n");
 			return PTR_ERR(mixer->top_regs);
 		}
-
-		regs = devm_platform_ioremap_resource_byname(pdev, "display");
-		if (IS_ERR(regs))
-			return PTR_ERR(regs);
-
-		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
-							 &sun8i_disp_regmap_config);
-		if (IS_ERR(mixer->disp_regs)) {
-			dev_err(dev, "Couldn't create the disp regmap\n");
-			return PTR_ERR(mixer->disp_regs);
-		}
 	}
 
 	mixer->reset = devm_reset_control_get(dev, NULL);
@@ -638,6 +624,34 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	clk_prepare_enable(mixer->mod_clk);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		struct platform_device *pdev;
+		struct device_node *np;
+		void *data;
+
+		np = of_parse_phandle(dev->of_node, "allwinner,planes", 0);
+		if (!np) {
+			ret = -ENODEV;
+			goto err_disable_mod_clk;
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev) {
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+
+		data = platform_get_drvdata(pdev);
+		if (!data) {
+			put_device(&pdev->dev);
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+
+		mixer->planes_dev = &pdev->dev;
+	}
+
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
 	/* Reset registers and disable unused sub-engines */
@@ -672,6 +686,8 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	return 0;
 
+err_disable_mod_clk:
+	clk_disable_unprepare(mixer->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(mixer->bus_clk);
 err_assert_reset:
@@ -686,6 +702,9 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
 
 	list_del(&mixer->engine.list);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		put_device(mixer->planes_dev);
+
 	clk_disable_unprepare(mixer->mod_clk);
 	clk_disable_unprepare(mixer->bus_clk);
 	reset_control_assert(mixer->reset);
@@ -867,16 +886,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.lay_cfg = {
-		.de_type	= SUN8I_MIXER_DE33,
-		.scaler_mask	= 0xf,
-		.scanline_yuv	= 4096,
-	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.ui_num		= 3,
-	.vi_num		= 1,
-	.map		= {0, 6, 7, 8},
 };
 
 static const struct of_device_id sun8i_mixer_of_table[] = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index e2f83301aae8..7abc88c898d9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
 	int			ui_num;
 	unsigned int		de_type;
 	unsigned long		mod_rate;
-	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
@@ -216,7 +215,7 @@ struct sun8i_mixer {
 	struct clk			*mod_clk;
 
 	struct regmap			*top_regs;
-	struct regmap			*disp_regs;
+	struct device			*planes_dev;
 };
 
 enum {
@@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
-static inline struct regmap *
-sun8i_blender_regmap(struct sun8i_mixer *mixer)
-{
-	return mixer->cfg->de_type == SUN8I_MIXER_DE33 ?
-		mixer->disp_regs : mixer->engine.regs;
-}
-
 static inline u32
 sun8i_channel_base(struct sun8i_layer *layer)
 {
-- 
2.54.0


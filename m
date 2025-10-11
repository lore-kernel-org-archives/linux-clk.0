Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96B27FD72;
	Sat, 11 Oct 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202220; cv=none; b=ROukI0er5lHJNFcl+BlzPd/C5exr3/khn1jxb9xTojvbD/79GaO5btSsEdGlo06bGlL5FNpxv4hKQKo1ZiHz1kLN1QCuv6AxY82I78SXnsszfx1aB9G7AKfmp0YTGwBEFIAhEyZ6HXqL9FTFQtCOjGNJVsK2+cC7Gtt2CAwrXEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202220; c=relaxed/simple;
	bh=x/O/kfWplNx5SOnyyOsIPkX6ytFO8iKWC62KxIhfOcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuImwDremj6oNq7INdwej0LZTZRNkftwEqVbqSRuLU1Ipf6p5UCAu4uE8BdtG4ctdvjriKEVdEs0fGJbeN9Z9sdKM7ltZilICvVN1YSWGSgkimPqwZh82bcpZ4+X5cZLXeP+lCzDvY/pbKcoPP+NhWAlFhTzC7SbQezYibF/JrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PgKVJSrr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tR0SDR38; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PgKVJSrr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tR0SDR38"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVLb6FClz9tX0;
	Sat, 11 Oct 2025 19:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3c874SDSKbcoshhevl3uU1YDsKILsMO8Dwbbu5sbIg=;
	b=PgKVJSrrpEoERbFLH+9TArdxdGUsXn6RPgIpg4iW6/NHo7Q3KiQfDnVmwaqV8Oaci3ZD7o
	gPbmFzwvTuQOE9AIe8OMNktHQHOdNof3J2fY2Ehnp+oJi215EZPgDGoSndce8288VIodkq
	I9aDWgy/0DUYrS8NaVHm7LX4i2v73KV53Ywjm102Cz0KJko2emz+rHzxebvoUg1yqrsbmU
	kRm2+m9LRNlJxCLnRbgsS8OjJbfP8hsXp+s9h5g7+2kfiHltnwUaqXoDjefDKsE3Vqfhnc
	az3jstD09X74NY9lAzW7g8ouw8uTVcaL5/WHuFjkjEIbnZ0k8umLmXA9yX9v1A==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3c874SDSKbcoshhevl3uU1YDsKILsMO8Dwbbu5sbIg=;
	b=tR0SDR386HRhnu8yS8l9xRZiewEDTa35OfkerUUYH3PEVQwL7u+OJFSfFrBFycpxNNQpPv
	QfmnkKOfGUCAz+Ka0dIFrbWTL/ma5tGhtNQkTYyl3C2MGJsjb3ja4FW5oto4VDtprQ2odM
	+lmP6SDJd3+Gkg6Szcwr7opJ7YdN113QlOkx68ejd6w/LvghY7cg8VGJOjB2W3RlzQtGs/
	8y4z6RmhT9bTpESZHxINlZdYz0stFCqa06fP5zoC3K3AsSjNwQeZ1SgWpKhWe4wePkBqcw
	YRM1x49/yX9jL4QdIRvs6lXJh+yewleo18fE25ebSIptJqcr5k6fDXhrAFAH1Q==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 15/39] drm/imx: dc: fu: Pass struct dc_fu_subdev_match_data via OF match data
Date: Sat, 11 Oct 2025 18:51:30 +0200
Message-ID: <20251011170213.128907-16-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wnsdsprt6qidwo64otr5uaai3k6ecxdg
X-MBO-RS-ID: 75c00d33bd9538b2a14

Introduce struct dc_fu_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case register offsets as well
as address space offsets, and pass it as OF match data into the driver, so
the driver can use the match data to correctly access registers on each SoC.
This is a preparatory patch for i.MX95 addition. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-fl.c | 61 +++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index a76825dc75fe1..53647e3a395b4 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -15,8 +15,6 @@
 #include "dc-drv.h"
 #include "dc-fu.h"
 
-#define FRAC_OFFSET			0x28
-
 #define BURSTBUFFERMANAGEMENT		0xc
 #define BASEADDRESS			0x10
 #define SOURCEBUFFERATTRIBUTES		0x14
@@ -28,35 +26,55 @@
 #define CLIPWINDOWDIMENSIONS		0x2c
 #define CONSTANTCOLOR			0x30
 #define LAYERPROPERTY			0x34
-#define FRAMEDIMENSIONS			0x150
+#define FRAMEDIMENSIONS_IMX8QXP		0x150
 
 struct dc_fl {
 	struct dc_fu fu;
 };
 
-static const struct dc_subdev_info dc_fl_info[] = {
+struct dc_fl_subdev_match_data {
+	const struct regmap_config	*regmap_config;
+	unsigned int			reg_offset_bbm;
+	unsigned int			reg_offset_base;
+	unsigned int			reg_offset_rest;
+	unsigned int			reg_framedimensions;
+	unsigned int			reg_frac_offset;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_fl_info_imx8qxp[] = {
 	{ .reg_start = 0x56180ac0, .id = 0, },
 	{ /* sentinel */ },
 };
 
-static const struct regmap_range dc_fl_regmap_ranges[] = {
-	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS),
+static const struct regmap_range dc_fl_regmap_ranges_imx8qxp[] = {
+	regmap_reg_range(STATICCONTROL, FRAMEDIMENSIONS_IMX8QXP),
 };
 
-static const struct regmap_access_table dc_fl_regmap_access_table = {
-	.yes_ranges = dc_fl_regmap_ranges,
-	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges),
+static const struct regmap_access_table dc_fl_regmap_access_table_imx8qxp = {
+	.yes_ranges = dc_fl_regmap_ranges_imx8qxp,
+	.n_yes_ranges = ARRAY_SIZE(dc_fl_regmap_ranges_imx8qxp),
 };
 
-static const struct regmap_config dc_fl_cfg_regmap_config = {
+static const struct regmap_config dc_fl_cfg_regmap_config_imx8qxp = {
 	.name = "cfg",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
-	.wr_table = &dc_fl_regmap_access_table,
-	.rd_table = &dc_fl_regmap_access_table,
-	.max_register = FRAMEDIMENSIONS,
+	.wr_table = &dc_fl_regmap_access_table_imx8qxp,
+	.rd_table = &dc_fl_regmap_access_table_imx8qxp,
+	.max_register = FRAMEDIMENSIONS_IMX8QXP,
+};
+
+static const struct dc_fl_subdev_match_data dc_fl_match_data_imx8qxp = {
+	.regmap_config = &dc_fl_cfg_regmap_config_imx8qxp,
+	.reg_offset_bbm = 0,
+	.reg_offset_base = 0,
+	.reg_offset_rest = 0,
+	.reg_framedimensions = FRAMEDIMENSIONS_IMX8QXP,
+	.reg_frac_offset = 0x28,
+	.info = dc_fl_info_imx8qxp,
 };
 
 static void dc_fl_set_fmt(struct dc_fu *fu, enum dc_fu_frac frac,
@@ -99,9 +117,11 @@ static void dc_fl_set_ops(struct dc_fu *fu)
 
 static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_fl_subdev_match_data *dc_fl_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_fl_info = dc_fl_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
-	unsigned int off_base, off_regs;
+	unsigned int off, off_base, off_regs;
 	struct resource *res_pec;
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
@@ -121,7 +141,7 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(base_cfg);
 
 	fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
-					    &dc_fl_cfg_regmap_config);
+					    dc_fl_match_data->regmap_config);
 	if (IS_ERR(fu->reg_cfg))
 		return PTR_ERR(fu->reg_cfg);
 
@@ -134,9 +154,10 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	fu->link_id = LINK_ID_FETCHLAYER0;
 	fu->id = DC_FETCHUNIT_FL0;
 	for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
-		off_base = i * FRAC_OFFSET;
+		off = i * dc_fl_match_data->reg_frac_offset;
+		off_base = off + dc_fl_match_data->reg_offset_base;
 		fu->reg_baseaddr[i]		  = BASEADDRESS + off_base;
-		off_regs = i * FRAC_OFFSET;
+		off_regs = off + dc_fl_match_data->reg_offset_rest;
 		fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES + off_regs;
 		fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION + off_regs;
 		fu->reg_colorcomponentbits[i]     = COLORCOMPONENTBITS + off_regs;
@@ -147,8 +168,8 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 		fu->reg_constantcolor[i]	  = CONSTANTCOLOR + off_regs;
 		fu->reg_layerproperty[i]	  = LAYERPROPERTY + off_regs;
 	}
-	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT;
-	fu->reg_framedimensions = FRAMEDIMENSIONS;
+	fu->reg_burstbuffermanagement = BURSTBUFFERMANAGEMENT + dc_fl_match_data->reg_offset_bbm;
+	fu->reg_framedimensions = dc_fl_match_data->reg_framedimensions;
 	snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", id);
 
 	dc_fl_set_ops(fu);
@@ -180,7 +201,7 @@ static void dc_fl_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_fl_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-fetchlayer" },
+	{ .compatible = "fsl,imx8qxp-dc-fetchlayer", .data = &dc_fl_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_fl_dt_ids);
-- 
2.51.0


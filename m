Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53501F4169;
	Sun,  2 Nov 2025 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762102988; cv=none; b=BLjmO8jHYHcQSoJe3vKg/nim7JbDVO/NdUi5JlxBVYwkT4RkMFRSAHM1QeCa8CRIlNgaDu5ZgwW8+6vumW9y2uAKkUDaa1sQahs49IRaBnWbcYi9/0QrVNVYYohAb/g5VDhv9DjJwAuqnngvdaJhmVnF3TvrDMB86iIHip0KL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762102988; c=relaxed/simple;
	bh=Q44u91lhf5R27Cl1jnURa9DZbc9cRDZspfIyAdqwurY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2jdljUkVcer5KefvGmGCgBp9SfDwjjvtfVM5UBMHKkqVm+kHiThNZP6LofYLkpd+bWsHbKPs4LdIRaS60MkdR25zxpbyBA7/koZ/2jrLZ+MDyWWNT4l5VkqW1kbsIt53uBO8I1I6KPIEIqJfafSCbF5PeXdO9xBUris3ei5CSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=n2Q1XX2L; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iRvrAYr4; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="n2Q1XX2L";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iRvrAYr4"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d01Hr69VNz9tWy;
	Sun,  2 Nov 2025 18:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762102984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cObXJ30PSUthwthSYfE+TCB57ZPuOUf5acEEf646mE0=;
	b=n2Q1XX2LmiQ/N2Mkv3nqCEAW57yBf3oAFd/XIEY92LJCgpXFFM/rOquUPeSzHcodQIP0jj
	kTIgPHcGfZURrQgPkaOgKZXa0WXzbhChKaBq65Iq4SrTeLR/zu9wYu97Xp6wscT9mXCsav
	1d62AVGPtijgbe8BXNZcHNGKBJ+QwQcD4ooSqOjXFdbYWeWoYLqnACKwrl1EblsZaOxTvB
	GHwxzYc8psf2tnHLZ+lqG3YSP9byE21ENYKcrfthmfG8b+JFFamfPEA5iTZRq4M89IQpM0
	DyfJR6a6QT2XzGVeGGXGFXKwulNzZ+4kywdCFTnMAg3PKfqD4JGfLn9L5Ozy8w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=iRvrAYr4;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762102983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cObXJ30PSUthwthSYfE+TCB57ZPuOUf5acEEf646mE0=;
	b=iRvrAYr4FO7AzaJkf8eBmFevGmmIb+djXPYubKgKxQmGZmQqcTQK4UGrqDgKr8IIEDxzPr
	0JqqYJxZ1fSjgOaWZlot8P69AO8eKAS3zYuT1FZ2K0gm+16zBLhdWS2njea6YQIenKxt34
	hIFtklgZ5r154mq91B+Qu27HipodPiJRIfAFpa7/XlKXtT7YNrG6AA4QjzgnO7NRj8vreq
	ILdHwrmgU97EQW3W/nWzF/kg1B0WvuxNuDBfHUS1G0jco/lBE1dma2arhnO61BOifwUUXo
	Bv08mHPeL+zySrbVc/RomM+vY6rDxbPrYYefqjg8xsgxMHaZXR3Cf1t5pwKbqQ==
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
Subject: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
Date: Sun,  2 Nov 2025 18:02:18 +0100
Message-ID: <20251102170257.65491-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xcxj75s7zio9aapmup5yw6jehygx1ii8
X-MBO-RS-ID: 309f2c2b1c1acb202cc
X-Rspamd-Queue-Id: 4d01Hr69VNz9tWy

The DT binding for this bridge describe register offsets for the LDB,
parse the register offsets from DT instead of hard-coding them in the
driver. No functional change.

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
V2: - Switch to of_property_read_reg()
    - Parse single-register LDB variants from DT too
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 58 ++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bce..2357cb2fbbe39 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -8,6 +8,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
 };
 
 struct fsl_ldb_devdata {
-	u32 ldb_ctrl;
-	u32 lvds_ctrl;
 	bool lvds_en_bit;
-	bool single_ctrl_reg;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
-	[IMX6SX_LDB] = {
-		.ldb_ctrl = 0x18,
-		.single_ctrl_reg = true,
-	},
-	[IMX8MP_LDB] = {
-		.ldb_ctrl = 0x5c,
-		.lvds_ctrl = 0x128,
-	},
+	[IMX6SX_LDB] = { },
+	[IMX8MP_LDB] = { },
 	[IMX93_LDB] = {
-		.ldb_ctrl = 0x20,
-		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
 	},
 };
@@ -90,8 +80,11 @@ struct fsl_ldb {
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
+	u64 ldb_ctrl;
+	u64 lvds_ctrl;
 	bool ch0_enabled;
 	bool ch1_enabled;
+	bool single_ctrl_reg;
 };
 
 static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
@@ -204,15 +197,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
 			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
 
-	if (fsl_ldb->devdata->single_ctrl_reg)
+	if (fsl_ldb->single_ctrl_reg)
 		return;
 
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
 	usleep_range(15, 20);
@@ -220,7 +213,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
 		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
@@ -231,12 +224,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 	/* Stop channel(s). */
 	if (fsl_ldb->devdata->lvds_en_bit)
 		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
-		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
+		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
 			     LVDS_CTRL_LVDS_EN);
 	else
-		if (!fsl_ldb->devdata->single_ctrl_reg)
-			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
+		if (!fsl_ldb->single_ctrl_reg)
+			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
 
 	clk_disable_unprepare(fsl_ldb->clk);
 }
@@ -296,7 +289,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device_node *remote1, *remote2;
 	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
-	int dual_link;
+	int dual_link, idx, ret;
 
 	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
 	if (IS_ERR(fsl_ldb))
@@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
+	/* No "reg-names" property likely means single-register LDB */
+	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
+	if (idx < 0) {
+		fsl_ldb->single_ctrl_reg = true;
+		idx = 0;
+	}
+
+	ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NULL);
+	if (ret)
+		return ret;
+
+	if (!fsl_ldb->single_ctrl_reg) {
+		idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
+		if (idx < 0)
+			return idx;
+
+		ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, NULL);
+		if (ret)
+			return ret;
+	}
+
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
 		return PTR_ERR(fsl_ldb->clk);
-- 
2.51.0


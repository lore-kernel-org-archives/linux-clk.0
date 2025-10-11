Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C36280CC9;
	Sat, 11 Oct 2025 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202277; cv=none; b=oNxg4NPeOgZ9cKvDVtsw/woYjGcVUpAPySxD1ZbHTiLpl6/f+q+SSyjU0EA318zzFC8yuxijbCqkHMdr5wsLR1lL5JKFWK1Umzl4515RTrCO8prYD/w9wqR7W/hmF5j0g6/C0azmZu4JlJId4Id77IaY7ZGE9kY73ipDX1KHB6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202277; c=relaxed/simple;
	bh=kZFXgirDnFVfMgug9ztIUHUZy/8kzzUqjm0iBPlnxC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJVwOUfJapuedad0FikNEyf/uwec2FNP0LaaTNAKskTseh9rrLITe3dl4FdiNhXjAqfpRPerTDkrW3t06rCA5x2Gc88mHenQF6TjIuyqE/fr7ZOD4JTwWeZUhv4bIUVuOKyIv8qVqXufGlyFBhWAxxu0pYKn+Ra2YgfJ6OEGajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RVIAzvfQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mUixiEpw; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RVIAzvfQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mUixiEpw"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVMj5NPpz9tCk;
	Sat, 11 Oct 2025 19:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0w+B/tCledBrlOq6HIpAHqdVg2SY76LtseeOT2jub/4=;
	b=RVIAzvfQHpCMffZm841KON3A5nvmrP8XNbIn5GMdR19rO/ZO1vQOEPTbNuFqM9CNg/ZnLQ
	DPHB2Dcn0GoUjW8sW0KxsK6JIq+nAO5RcHv+XE57jD+UxMqUmyDlfUTFEUysT320qvG5ve
	t92iVj4w2fa03FUII4WNySbovgSqTnV6m+vZ5N2rXa0SxnUpZLrQ4p6BtaVKtqmQJKMKjw
	ekGQoID+YFVqEr0s8qQN1zbs+KOFfJObzIGJnB4+I5kNRhdPByF1swJVjnjgEjFZp/QLtb
	RTK+vLtOAsBX2VVPlWmrtjUTfrUsq7IwCq5cCsQiKkapICICgW3teDZTqw/ywQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0w+B/tCledBrlOq6HIpAHqdVg2SY76LtseeOT2jub/4=;
	b=mUixiEpwpW3c3V4Ub2e7psSTx6UmwmLgemrJ9G9/0NCMPJSFCpExucMvy+As8H1VglndLL
	q69EBWzx/vlHHpQf3d8pOBOVu6q8NGRZ7ZLKJzuFNynjCoHqueMaBeQNIsC0OD+AZXUcjX
	pHkgU+t77KsVL3QnSSo97HRjxpi6mhX1ZLLT1cd/xgpQ5VKGtHtO5rhQ37oE8oAPofUrQT
	jwe9VWf0dGPm5qZfPm/9Yi1nhCKgcQjOY2q3eodUD8TT0ZzT1sdyvAncbSpn2OxIoD247E
	z6BQYvxQumaWj6OOxlHntzSl429kgVhZcdEoDBNDB16lmFHTHNvh8wJqvBif+g==
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
Subject: [PATCH 35/39] drm/bridge: fsl-ldb: Parse register offsets from DT
Date: Sat, 11 Oct 2025 18:51:50 +0200
Message-ID: <20251011170213.128907-36-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ea661708900ef395549
X-MBO-RS-META: kd9wg3mdhk94dhn81apjjnztjthnmakq

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
 drivers/gpu/drm/bridge/fsl-ldb.c | 42 ++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bce..c54caea0b63fc 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
 };
 
 struct fsl_ldb_devdata {
-	u32 ldb_ctrl;
-	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
-		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
 	},
-	[IMX8MP_LDB] = {
-		.ldb_ctrl = 0x5c,
-		.lvds_ctrl = 0x128,
-	},
+	[IMX8MP_LDB] = { },
 	[IMX93_LDB] = {
-		.ldb_ctrl = 0x20,
-		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
 	},
 };
@@ -90,6 +82,8 @@ struct fsl_ldb {
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
+	u32 ldb_ctrl;
+	u32 lvds_ctrl;
 	bool ch0_enabled;
 	bool ch1_enabled;
 };
@@ -204,7 +198,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
 			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
 
 	if (fsl_ldb->devdata->single_ctrl_reg)
 		return;
@@ -212,7 +206,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
 	usleep_range(15, 20);
@@ -220,7 +214,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
 		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
 
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
 }
 
 static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
@@ -231,12 +225,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
 	/* Stop channel(s). */
 	if (fsl_ldb->devdata->lvds_en_bit)
 		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
-		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
+		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
 			     LVDS_CTRL_LVDS_EN);
 	else
 		if (!fsl_ldb->devdata->single_ctrl_reg)
-			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
-	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
+			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
+	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
 
 	clk_disable_unprepare(fsl_ldb->clk);
 }
@@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device_node *remote1, *remote2;
 	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
-	int dual_link;
+	int dual_link, idx, ret;
 
 	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
 	if (IS_ERR(fsl_ldb))
@@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	fsl_ldb->dev = &pdev->dev;
 	fsl_ldb->bridge.of_node = dev->of_node;
 
+	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
+	if (idx < 0)
+		return idx;
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->ldb_ctrl);
+	if (ret)
+		return ret;
+
+	idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
+	if (idx < 0)
+		return idx;
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 2 * idx, &fsl_ldb->lvds_ctrl);
+	if (ret)
+		return ret;
+
 	fsl_ldb->clk = devm_clk_get(dev, "ldb");
 	if (IS_ERR(fsl_ldb->clk))
 		return PTR_ERR(fsl_ldb->clk);
-- 
2.51.0


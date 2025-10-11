Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A7D27FD71;
	Sat, 11 Oct 2025 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202225; cv=none; b=ilyyBW2l3mWAScEvAqMpEVnSfR17hLrNpvWg9znsSXJwmoyybGj7pHCywzUmZEydy8M0Q2o5p9a351/XUhnhpTyrjoKopKFunNtiQMeeetgawAwLXvb6e3VodI3JpfC4tdxY30xjppkPC7UU29A6X31zTDrV14vJA4l5p3dnVMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202225; c=relaxed/simple;
	bh=znaYZqBKIvfjOZkZVPox+7DkOyZnR3MNv2H0Gp3oSxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFNjqZ8dPYfc7USUlZDawgtD6HV5rPtm0BsEpfxAsYg4bblQnI+yBTEytYvfNMAHxOUcN/ChlmVQBuLHBfrozzatcaXoj9+imUprPSzc1RL20AyJ9vUBh4mBc4hwfCuKHHu+UGWmDm09jJZANmKR/iOBxE4OUkOENprC5GXbQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Iqfds4v7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eC0dM4iM; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Iqfds4v7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eC0dM4iM"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLk0J5wz9shj;
	Sat, 11 Oct 2025 19:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwxMGeGR8HYAFgIYgFgH/nuyjFRZ9lUI5NYYPxFc2zQ=;
	b=Iqfds4v7pM032cX+c0oD6WBAH+E4DuYE1XyRWfPvwZ2ws5O2a0eBDYUkdWqWCcN+kZezey
	H6eXHYfcd4itD1sQowC4UnSyv1GH7LIYvIvblnqaLAFEcGdyQW6FBSE/oqcaHr+MWUJcqU
	IBeiBpSin72mJtMfMbi4KKHHeucsM2+0uoxVLCTv3y8YXSAODrSegzfa5a+FYgdGerPhwd
	FAI4OVJRrkVONaFKR7kYRZQqu3XBYN3aoqdRN9ZLbdfmyKfzEZRVxwZJ1t+EiDMLnGVMkh
	3RLnkkc5yOGs20Bpun4Q3lS36XNw+LgvAqIkeKjGf0xUfh+tl/tKFPl+6yv6Uw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwxMGeGR8HYAFgIYgFgH/nuyjFRZ9lUI5NYYPxFc2zQ=;
	b=eC0dM4iMXPgFkO88uxIKQf7yJU+0FGLpCb1I6IGLT9x5qfcO1E2E0IezUU+2EWwSgv5t4B
	pcBr2tb8jbE7FZg7MMGtthlmQXlzZCKF7o2iWzedxWvUksbTgFr2HD/wdx7lxi171tDuW8
	gvpTdYjJDq7rdeztBgDQP+rnuKXkglmTYniDPXqrmBGGx3wdBFDpSecsabcTTCzlrFXof6
	k2NZNLrEmBM3S3DUx0tlitT3CyuAM9OF2ROSAtL5gFlGT2IeGhk2IOwC1snzL5mgebyNV6
	VgcAzeGr+GJ/fh6SQS0feujdliZtYkRu9a1JXGtVJ9XoJHjjwH6A5Qx5kvC27w==
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
Subject: [PATCH 17/39] drm/imx: dc: tc: Pass struct dc_tc_subdev_match_data via OF match data
Date: Sat, 11 Oct 2025 18:51:32 +0200
Message-ID: <20251011170213.128907-18-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4828139fbd68ded75fc
X-MBO-RS-META: e7tkbej4qt34ohijfjstm8jt6yepg418

Introduce struct dc_tc_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case need for configuration
and address space offsets, and pass it as OF match data into the driver, so
the driver can use the match data to optionally configure the TCON.
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
 drivers/gpu/drm/imx/dc/dc-de.h |  1 +
 drivers/gpu/drm/imx/dc/dc-tc.c | 40 ++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 797056a09ddb4..e74368aacf553 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -32,6 +32,7 @@ struct dc_fg {
 struct dc_tc {
 	struct device *dev;
 	struct regmap *reg;
+	bool need_config;
 };
 
 struct dc_de {
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index f44b68c0a5e6d..1f287706e8706 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -7,6 +7,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "dc-drv.h"
@@ -25,7 +26,12 @@
 #define MAPBIT27_24	0x430
 #define MAPBIT31_28	0x434
 
-static const struct dc_subdev_info dc_tc_info[] = {
+struct dc_tc_subdev_match_data {
+	bool				need_config;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_tc_info_imx8qxp[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
 	{ /* sentinel */ },
@@ -61,8 +67,16 @@ static const u32 dc_tc_mapbit[] = {
 	0x13121110, 0x03020100, 0x07060504, 0x00000908,
 };
 
+static const struct dc_tc_subdev_match_data dc_tc_match_data_imx8qxp = {
+	.need_config = true,
+	.info = dc_tc_info_imx8qxp,
+};
+
 void dc_tc_init(struct dc_tc *tc)
 {
+	if (!tc->need_config)
+		return;
+
 	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
 	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
 
@@ -73,6 +87,8 @@ void dc_tc_init(struct dc_tc *tc)
 
 static int dc_tc_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_tc_subdev_match_data *dc_tc_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_tc_info = dc_tc_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res;
@@ -84,13 +100,19 @@ static int dc_tc_bind(struct device *dev, struct device *master, void *data)
 	if (!tc)
 		return -ENOMEM;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
-	if (IS_ERR(tc->reg))
-		return PTR_ERR(tc->reg);
+	if (dc_tc_match_data->need_config) {
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
+		if (IS_ERR(tc->reg))
+			return PTR_ERR(tc->reg);
+	} else {
+		res = platform_get_resource(to_platform_device(pdev->dev.parent), IORESOURCE_MEM, 0);
+		if (IS_ERR(res))
+			return PTR_ERR(res);
+	}
 
 	id = dc_subdev_get_id(dc_tc_info, res);
 	if (id < 0) {
@@ -126,7 +148,7 @@ static void dc_tc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_tc_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-tcon" },
+	{ .compatible = "fsl,imx8qxp-dc-tcon", .data = &dc_tc_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
-- 
2.51.0


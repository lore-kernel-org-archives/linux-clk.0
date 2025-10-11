Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11427FD6E;
	Sat, 11 Oct 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202204; cv=none; b=CE4oO8yUYCIXzxFldzHLThGSPjtVvQ5Gj5ZSrMzPRYDsgZAF4tGl3IiiHbB3s14FmoP2LvDBoi/ayn3yHfbCE/qxb1yBdYXCNnt5l4Y2+qBRALF/xLyusTNMwEqbrd3cB6NARd3BWmSaXOQLh85s7raBeaSO3BHpJlef5CeEDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202204; c=relaxed/simple;
	bh=akC1NsQLGdqLNkf2rsEPviePJQksmb2F8XkbsUCroiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cR7lJgMv5+lLUpbcF8T6EkaxC5YqBNJL/w1R9ThIZ2Q7seE+ckOf48AkqLmgdhWon33kfcqvFvY18EMdylyrjvKqA9sPunzy3gDZFw0p1p/SH2jd2IdX+halvzFKm0y5KQqTzf1bGjZEL8TOtcZCsuiB0QfWMIxhD82w8A7dFCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EqO43FLI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZVePI4yq; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EqO43FLI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZVePI4yq"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckVLK1BZFz9t1g;
	Sat, 11 Oct 2025 19:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7FprWKfv6NkWU+IK5Uxmm4Vashq7YlDd7qRaerBYZ0=;
	b=EqO43FLIInxWNkEbVnpAiT1ydZCdg6oZs6hgx7w6QYAXbmoZEkEMgU9UNh9lDGVIy8MJaz
	WJ4WOmOkKGmjk7/HudAIJ59sXv4a0FgE2Lb+iU6VIA/azkO6PKjDx0Vj8h+5gRD1Fopyhc
	iWN05KQreCW1sjNoLN+enQYuArepaeYswBG7sPSHXCErGIUoQcJRCs+5GtVBTLfJontU+w
	qAYbpRdUT5EGOjrj9B7QD/wcW2MLeuu8Zsp7+S5iGpzzJDAoORbBGwCu603ixtbxr2LzGw
	BNJmw7hUSB1vTun9yVgQAHqB0sDHD50l3ny4+5Frn8qxGfFbwbakq9TJmEJuuQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7FprWKfv6NkWU+IK5Uxmm4Vashq7YlDd7qRaerBYZ0=;
	b=ZVePI4yqMI2W73BIo3FtxrWwvwsPzc+3ugiu6fIcaiEitjMfGcHDLh/9tlfRGjsB7y3tau
	2KmFdS8fdekouOiqiJ5nOoi9ud3IbGz9j4UWn35LnWTvQ+8DSCwE3DSg++4lbhCobYdQlP
	yOp+//fRrME8zlCIrc9+7AqmZKjSddysxDqhPEBDq8CD8q2Xdbe0EhOzvR8VnF4bq4CIxd
	CVQLelFnmFGt7ctWP2rkh3qAvbQ6DUWj3Rg7IyFXdxctvIcbPcivm+ffTwL0A2TbsirmM1
	qsaXYuklJ1UaywhQ0a5M7Om7XK2A9rG4HXQK8lhgQQ81VjhLQqPOppeorSk1OQ==
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
Subject: [PATCH 10/39] drm/imx: dc: ed: Pass struct dc_ed_subdev_match_data via OF match data
Date: Sat, 11 Oct 2025 18:51:25 +0200
Message-ID: <20251011170213.128907-11-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c3a95c61710d4cd17b4
X-MBO-RS-META: bktexf8x8epk3i57k5rwy1upm9qr7yzm

Introduce struct dc_ed_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case is src_sels mapping and
address space offsets, and pass it as OF match data into the driver, so
the driver can use the match data to apply correct src_sels value to the
IP registers on each SoC. This is a preparatory patch for i.MX95 addition.
No functional change.

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
 drivers/gpu/drm/imx/dc/dc-ed.c | 24 +++++++++++++++++++-----
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 2fdd22a903dec..63dcad30ecced 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "dc-drv.h"
@@ -35,7 +36,12 @@
 #define CONTROL			0xc
 #define  GAMMAAPPLYENABLE	BIT(0)
 
-static const struct dc_subdev_info dc_ed_info[] = {
+struct dc_ed_subdev_match_data {
+	const enum dc_link_id		*src_sels;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_ed_info_imx8qxp[] = {
 	{ .reg_start = 0x56180980, .id = 0, },
 	{ .reg_start = 0x56180a00, .id = 1, },
 	{ .reg_start = 0x561809c0, .id = 4, },
@@ -106,7 +112,7 @@ static const struct regmap_config dc_ed_cfg_regmap_config = {
 	.max_register = CONTROL,
 };
 
-static const enum dc_link_id src_sels[] = {
+static const enum dc_link_id src_sels_imx8qxp[] = {
 	LINK_ID_NONE,
 	LINK_ID_CONSTFRAME0,
 	LINK_ID_CONSTFRAME1,
@@ -119,6 +125,11 @@ static const enum dc_link_id src_sels[] = {
 	LINK_ID_LAST	/* sentinel */
 };
 
+static const struct dc_ed_subdev_match_data dc_ed_match_data_imx8qxp = {
+	.src_sels = src_sels_imx8qxp,
+	.info = dc_ed_info_imx8qxp,
+};
+
 static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
 {
 	regmap_write_bits(ed->reg_pec, PIXENGCFG_STATIC, SHDEN, SHDEN);
@@ -144,8 +155,8 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
 {
 	int i = 0;
 
-	while (src_sels[i] != LINK_ID_LAST) {
-		if (src_sels[i++] == src) {
+	while (ed->src_sels[i] != LINK_ID_LAST) {
+		if (ed->src_sels[i++] == src) {
 			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
 			return;
 		}
@@ -192,6 +203,8 @@ void dc_ed_init(struct dc_ed *ed)
 
 static int dc_ed_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_ed_subdev_match_data *dc_ed_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_ed_info = dc_ed_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res_pec;
@@ -227,6 +240,7 @@ static int dc_ed_bind(struct device *dev, struct device *master, void *data)
 		return ed->irq_shdload;
 
 	ed->dev = dev;
+	ed->src_sels = dc_ed_match_data->src_sels;
 
 	id = dc_subdev_get_id(dc_ed_info, res_pec);
 	if (id < 0) {
@@ -274,7 +288,7 @@ static void dc_ed_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_ed_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-extdst" },
+	{ .compatible = "fsl,imx8qxp-dc-extdst", .data = &dc_ed_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_ed_dt_ids);
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 1e1e04cc39d4b..7928f947b0cef 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -56,6 +56,7 @@ struct dc_ed {
 	struct regmap *reg_pec;
 	struct regmap *reg_cfg;
 	int irq_shdload;
+	const enum dc_link_id *src_sels;
 };
 
 struct dc_lb {
-- 
2.51.0


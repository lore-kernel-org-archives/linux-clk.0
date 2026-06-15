Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157513F4840;
	Mon, 15 Jun 2026 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529159; cv=none; b=BLWDdlPXnGE2FySLOSvDdL267NmaRbOFruC3yON5GKqV1hKMXzX6ytSkiQqQsGGM3IPxfkggAKAwQB1oCiRgr2ZBVwXaXtovZCD0T/EFUvCshK3kY1/51FUzbaqLF2CbiN1FBW8hW+Xp09itMdZS8CTuH0/bnhbwguHFUjFKUoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529159; c=relaxed/simple;
	bh=WVpTKxt0Y8sZjOVfWvvS0mMmoeM0hdHAkcNHqIhwc3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVbSRPK2XXm7f0PpB6T/Q8deYdETZnoFWSXoq6nJCyB5wYqlwY0gMgKggq4N1Luq3clJAMJ60MV2no4FYnihvR0uVCcPAjGGQJZOhI5PvbP4bij5VKqYUbPh7mzS5HtCBdjh4Rwy0WdH82kbcJntgskOGqLPaJS3axryv7wUoRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gc0fIuNn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gc0fIuNn"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C17081044;
	Mon, 15 Jun 2026 15:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529119;
	bh=WVpTKxt0Y8sZjOVfWvvS0mMmoeM0hdHAkcNHqIhwc3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gc0fIuNnurtsUC08Dc2Bw+ceWOiqwgh1o60sGIe7zwMMnf4kKezAr8pz+bbR5oTrW
	 M+e/VPNfxdwchY+PmdNRzZhm8/O8eu/RQJnKfv8nQR2KJGh2VO+13AyefPAcCvl3qz
	 gCgs1yuwoeg3XcmvIzx6Ek2Mw5Y/J+izXSIpThEM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 16:11:56 +0300
Subject: [PATCH v5 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v5-3-aed1a28610e4@ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6466;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=L1p23iFOE66iZmdNQuzpbDv4ojnQKbPbzpr4ebYOCjo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/o3sOnu/wRaCTlMmlctlslzId47CyNmiUN0a
 uUSfB586Y+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6NwAKCRD6PaqMvJYe
 9eJAD/91wQa8iZ3gzD/kWD8wMXMW9VVm/LsTRIDUJUkVFMEpltHq1rJpC+v4l6Nq/8Im8/M/Y/+
 +DMzt/qKlBCutjAFYxOthn6/EVjqZuLHHjmPukC1YR/TVhzQVVafG3WTx5RZNg9MxNZDwUvlfjq
 8QA+yhrexfE4k7GbLEcYap05tpPk1gw6HGhGkWyI8riqVbDOg36gedUmDDgG5vdWz1evj/B61Sf
 tv7rRTyDAPMoN5U1tHjig7+ghsikZAR8QtQjvuhNFh9GQsKuB0NVFc/DSDinyEUPaiynD3Ru94V
 0cQAoANTa2lZ7lnX8+Sq1mvlS+wzRpvSNRRkyAukjnWvF+9vPGcCNkgcXmqMHfit7935D/IhD4/
 J1XgkSnx24iN/ile4BFKOtWkWcEAUPlFw7719xaniN2HAfwk2wq+qildE+/jTLlTFeot8w9jcIU
 igPhXUUyD/2WcV7S1G3FtBRQjsniKWvGOPRpoyc6eEscgBQ3V7AWRKlqcRZVZ0s+f/0pwX07YnH
 5ROhElAxwWLS01GkfK3O2XglNtAEZcTzZnMIPIJ2xLPz6X1oBED0rpMhY15mFdSW2tD3A2vmXTm
 I3XRl/X10ZHtlUU7skHIFKYXih286aRkzqGUv1qEEeESw1s0ktlUiCWTuWy5p73nXKpaZz7PtX1
 kOiG7TmA1xXsHAQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
8k or 400 Mpixel/s. Add rudimentary driver, which currently acts as a
pass-through bridge and allows DSI1 to be operational on R-Car V4H.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: use bridge->next_bridge, minor changes]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/Kconfig    |  12 +++
 drivers/gpu/drm/renesas/rcar-du/Makefile   |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c | 154 +++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 840305fdeb49..80bd770ae0f6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -25,6 +25,18 @@ config DRM_RCAR_CMM
 	def_tristate DRM_RCAR_DU
 	depends on DRM_RCAR_USE_CMM
 
+config DRM_RCAR_USE_DSC
+	bool "R-Car DU DSC Encoder Support"
+	depends on DRM_BRIDGE && OF
+	depends on DRM_RCAR_DU || COMPILE_TEST
+	default DRM_RCAR_DU
+	help
+	  Enable support for the R-Car Display Unit embedded DSC encoder.
+
+config DRM_RCAR_DSC
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_DSC
+
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
index 6f132325c8b7..9ab7a0ac45d8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Makefile
+++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
@@ -10,6 +10,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
+obj-$(CONFIG_DRM_RCAR_DSC)		+= rcar_dsc.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
new file mode 100644
index 000000000000..362e683289d6
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car DSC Encoder
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+
+struct rcar_dsc {
+	struct drm_bridge bridge;
+
+	struct device *dev;
+};
+
+static inline struct rcar_dsc *bridge_to_rcar_dsc(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct rcar_dsc, bridge);
+}
+
+/* -----------------------------------------------------------------------------
+ * Bridge
+ */
+
+static int rcar_dsc_attach(struct drm_bridge *bridge,
+			   struct drm_encoder *encoder,
+			   enum drm_bridge_attach_flags flags)
+{
+	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return drm_bridge_attach(encoder, dsc->bridge.next_bridge, bridge,
+				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+}
+
+static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
+				   struct drm_atomic_commit *commit)
+{
+	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
+
+	WARN_ON(pm_runtime_get_sync(dsc->dev) < 0);
+}
+
+static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
+				    struct drm_atomic_commit *commit)
+{
+	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
+
+	pm_runtime_put(dsc->dev);
+}
+
+static enum drm_mode_status
+rcar_dsc_bridge_mode_valid(struct drm_bridge *bridge,
+			   const struct drm_display_info *info,
+			   const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay < 320 || mode->hdisplay > 8190)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay < 160 || mode->vdisplay > 8190)
+		return MODE_BAD_VVALUE;
+
+	if (mode->clock > 400000) /* Really 400 Mpixel/s */
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs rcar_dsc_bridge_ops = {
+	.attach = rcar_dsc_attach,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_enable = rcar_dsc_atomic_enable,
+	.atomic_disable = rcar_dsc_atomic_disable,
+	.mode_valid = rcar_dsc_bridge_mode_valid,
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int rcar_dsc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rcar_dsc *dsc;
+	int ret;
+
+	dsc = devm_drm_bridge_alloc(dev, struct rcar_dsc, bridge,
+				    &rcar_dsc_bridge_ops);
+	if (IS_ERR(dsc))
+		return PTR_ERR(dsc);
+
+	platform_set_drvdata(pdev, dsc);
+
+	dsc->dev = &pdev->dev;
+
+	dsc->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node,
+								1, 0);
+	if (IS_ERR(dsc->bridge.next_bridge))
+		return PTR_ERR(dsc->bridge.next_bridge);
+
+	dsc->bridge.of_node = dev->of_node;
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_drm_bridge_add(dev, &dsc->bridge);
+	if (ret)
+		goto err_runtime_disable;
+
+	return 0;
+
+err_runtime_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void rcar_dsc_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id rcar_dsc_of_table[] = {
+	{ .compatible = "renesas,r8a779g0-dsc" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, rcar_dsc_of_table);
+
+static struct platform_driver rcar_dsc_platform_driver = {
+	.probe          = rcar_dsc_probe,
+	.remove		= rcar_dsc_remove,
+	.driver         = {
+		.name   = "rcar-dsc",
+		.of_match_table = rcar_dsc_of_table,
+	},
+};
+
+module_platform_driver(rcar_dsc_platform_driver);
+
+MODULE_DESCRIPTION("Renesas R-Car DSC Encoder Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


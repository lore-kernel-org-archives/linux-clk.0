Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6E449B21;
	Mon,  7 Sep 2026 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773427; cv=none; b=SmDqSxrdg61FdZY6TPSQZB2BkdkDwHcmX2xuIrKaGbfTsKwsbOYzmRWv67++7n5BsD9LtijxqBADUHplqdQOOwYzp/5o6oW7YZ2o3tg8ID4oGzh442x1/aw0dyFix2SgRlmFzm2tWVq4BMCuKN7LViBJSP+2yFte65WdHueAG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773427; c=relaxed/simple;
	bh=dNMdVTeMnVFobPtujimvIvf0UaVgbftd7IP+qP4UKe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usIY5lrzeV8s1kWvo7gIYf/EqmXcyn8khHlMj991T5glaxr83B/hX6ZOjlc8oA65ZLiX9En6y+HaaGIwAy2E7zQNkWMMq1+hszYMOu5amuIFN/SA96U3r7d385oCbNDRhxC5sLLruiWz/dGidw7o2I2rcbja8np3AX08s9e18Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jIsTILzk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jIsTILzk"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC16C64;
	Mon,  7 Sep 2026 11:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788773326;
	bh=dNMdVTeMnVFobPtujimvIvf0UaVgbftd7IP+qP4UKe0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jIsTILzkrzy2cgmDU7Jx3oYwe9LOZ1Y0ZPuNElkQqs3ebNwRNiDRxGReb5/dTYQCf
	 Y7RhZdMtRXfaY1ew714mc1adw9Xx5BIvaIf2HP6tBuOuq7plj1dR7hPa34WaMRGpQN
	 B2kUkyHdYr9FrhEW34AeJwgIn7LkSi6FISI6m5Bw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 07 Sep 2026 12:29:41 +0300
Subject: [PATCH v6 2/6] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rcar-du-dsc-v6-2-f8ef711a7494@ideasonboard.com>
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6456;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=g2/8Jh0ABpCUs5YdMLctkWPvIDgmwvU/t7MGNkq2yNo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnoQm40cDNmCOTgYA0ycH15uLPf35tPYllbVID
 1fFDAiWjH6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6EJgAKCRD6PaqMvJYe
 9dCXD/9eqlp7oKGywlJdarcYb3r6MYgdWd/WlXReIBorZV9XZtI4GHdeMTWV7emtIk8DLfNc+qX
 3sHuh2SbZj8ZmOv1kYf/9e/sVff7pOcrZrseHbDilbKcly7Oqym6LHkG1pK7avJjJdcWlAJTF68
 i6fExiOdf0K62imrEaH2o3Se1dW+T8++n+0TYraEyAtw6X0XmSzqoPO7a7x699uspb3mB0nIkoY
 anG4GLfiUGNoma1CWsns8kjYDAkeZiBE0hjzp2a6emQ0UW+7WAl3OXCTgL5m/WYpjn+6FWbddCH
 kJ2IXrFaIJi3J1MQdzJQjMEPEBkLaSbb2IdFM+JjJJTDS0MeIuB0zEKMzIWC9TxaN+SmkIeq0L7
 UCiLascOy0QZMX8gtEzPt7WXEh2imcZAorUAffbMjCv47SkPVh9TtBaoQFuJKiLUGF4SA35SaYn
 9gcckybMQGDoT54wwndxaLcA48r/J/RWESMa6+NBvx4BSsY3Aui41MvFNyl+UNrp+scPwAJZNe4
 THoBhzdLxpsbanhbDfFHygItSf0bcWNYBCXkJIOKPCpXfeAPpSHH875ZKeiiiZxY5g4qYw5Trfh
 Jb47GMx8Ic7L4MfqMMVOjpEoZNUqCALQkw4F0//8/vF8GCe8cv3zf8B0+r00N0Lp6jRMwBk1sno
 uVphB+DcrvDshOA==
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
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c | 153 +++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

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
index 000000000000..1882ae34ce8f
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R-Car DSC Encoder
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/container_of.h>
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
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
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


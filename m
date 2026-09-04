Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7DF51354F;
	Fri,  4 Sep 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537563; cv=none; b=LyeqbcpETj6ZLAichcHnpev4twNDreibb3G/0XN4ThErDreEP1OIWt97SR2snqkb0VjoeYuWMn7bJ3WFpUoGyH5i6zUzPV6X3lo9bxT3m/9WGDm9HKVL6DyJA6mV0tBEx+4oaooeBD3iYB67MKduPM4r6jTlK8CYmL91oO+aOu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537563; c=relaxed/simple;
	bh=S6RE8DMZLw3o8SY3x9yBDlGJ+lT5My7SLZmkJBI85oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jo99VvD0KHplFS4qfipKpuOUJaO80MhdUy2m0QDgOXZ7BSXMTp6bv+1FKHYb0Gw9I4PsiQMrdwnZSJLFiNU73RONp+tXp0YWtQtOZcUoItB9Hv4zZ4jTCTxiixdHtks8ov65LR/LvadW9pMiZfcgovaFBzd4C/pt4+iem9/ItqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IFl4uvPR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IFl4uvPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537559;
	bh=S6RE8DMZLw3o8SY3x9yBDlGJ+lT5My7SLZmkJBI85oA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IFl4uvPRIxKEzVtiWp2SCwQbuqkIyirsPCfNgcmuw8xgD7fQNVzc8yJhSkJSgOS3F
	 N8v+twbU8+oPpfcNGfch2Xl9EqxEfqzSbXkCJ9WnnzX58RAFP3xBCbAqGO8Y232AmC
	 GEZwuVQi8eZm1oR9zuIE2FlBFx9F5Fa+RNFZH69KjF4soEsgNNNKLV8TdNoujFnCsX
	 2+7r1L99eHHnaiCDnackERnG0NboXT0oiYnZYZCgH2CMVQvRnZ7SmgsGXsoICdrqLF
	 +QQ/w/dcqtEpYFAaI9ZLQtxQax2/KML6BGg2ur9fDNgSqgHwjI1xsJ/djYubkmyrvp
	 GWvzfLHxap8DQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36E3017E157F;
	Fri, 04 Sep 2026 17:59:18 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:36 +0200
Subject: [PATCH v6 25/27] clk: mediatek: Add MT8189 i2c clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-25-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Irving-CH Lin <irving-ch.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=6555;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=S6RE8DMZLw3o8SY3x9yBDlGJ+lT5My7SLZmkJBI85oA=;
 b=3BXQmqZbRN6avFT0oW6W5IzWF9yFB+K5Ay1Xcm2j+/UwDrpGJUxiTu5b2Z7Pzi+b/oQjEjFMq
 eV/Rtol0PIfC8Izm5aZt9oDX4JZaZUw46XdwYff6mHE675R/Qk9n+aQ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add support for the MT8189 i2c clock controller,
which provides clock gate control for i2c.

Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/Kconfig          |  13 ++++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8189-iic.c | 121 ++++++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 9ed3f7b155ff..7b3bc27edbe3 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -869,6 +869,19 @@ config COMMON_CLK_MT8189_DVFSRC
 	  vcore dvfs clocks. If you want to control its clocks, say Y or M
 	  to include this driver in your kernel build.
 
+config COMMON_CLK_MT8189_IIC
+	tristate "Clock driver for MediaTek MT8189 iic"
+	depends on COMMON_CLK_MT8189
+	default COMMON_CLK_MT8189
+	help
+	  Enable this option to support the clock framework for MediaTek MT8189
+	  integrated circuits (iic). This driver is responsible for managing
+	  clock sources, dividers, and gates specifically designed for MT8189
+	  SoCs. Enabling this driver ensures that the system can correctly
+	  manage clock frequencies and power for various components within
+	  the MT8189 chipset, improving the overall performance and power
+	  efficiency of the device.
+
 config COMMON_CLK_MT8192
 	tristate "Clock driver for MediaTek MT8192"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 822abeae205b..5e35185d23b0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -129,6 +129,7 @@ obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8189_BUS) += clk-mt8189-bus.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DBGAO) += clk-mt8189-dbgao.o
 obj-$(CONFIG_COMMON_CLK_MT8189_DVFSRC) += clk-mt8189-dvfsrc.o
+obj-$(CONFIG_COMMON_CLK_MT8189_IIC) += clk-mt8189-iic.o
 obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
 obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
 obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8189-iic.c b/drivers/clk/mediatek/clk-mt8189-iic.c
new file mode 100644
index 000000000000..d574fa5f892e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8189-iic.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026 MediaTek Inc.
+ *                    Qiqi Wang <qiqi.wang@mediatek.com>
+ *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
+ * Copyright (C) 2026 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
+ */
+
+#include <dt-bindings/clock/mediatek,mt8189-clk.h>
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs impe_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPE(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &impe_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate impe_clks[] = {
+	GATE_IMPE(CLK_IMPE_I2C0, "impe_i2c0", "i2c_sel", 0),
+	GATE_IMPE(CLK_IMPE_I2C1, "impe_i2c1", "i2c_sel", 1),
+};
+
+static const struct mtk_clk_desc impe_mcd = {
+	.clks = impe_clks,
+	.num_clks = ARRAY_SIZE(impe_clks),
+};
+
+static const struct mtk_gate_regs impen_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPEN(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &impen_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate impen_clks[] = {
+	GATE_IMPEN(CLK_IMPEN_I2C7, "impen_i2c7", "i2c_sel", 0),
+	GATE_IMPEN(CLK_IMPEN_I2C8, "impen_i2c8", "i2c_sel", 1),
+};
+
+static const struct mtk_clk_desc impen_mcd = {
+	.clks = impen_clks,
+	.num_clks = ARRAY_SIZE(impen_clks),
+};
+
+static const struct mtk_gate_regs imps_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPS(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imps_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imps_clks[] = {
+	GATE_IMPS(CLK_IMPS_I2C3, "imps_i2c3", "i2c_sel", 0),
+	GATE_IMPS(CLK_IMPS_I2C4, "imps_i2c4", "i2c_sel", 1),
+	GATE_IMPS(CLK_IMPS_I2C5, "imps_i2c5", "i2c_sel", 2),
+	GATE_IMPS(CLK_IMPS_I2C6, "imps_i2c6", "i2c_sel", 3),
+};
+
+static const struct mtk_clk_desc imps_mcd = {
+	.clks = imps_clks,
+	.num_clks = ARRAY_SIZE(imps_clks),
+};
+
+static const struct mtk_gate_regs impws_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_IMPWS(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &impws_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate impws_clks[] = {
+	GATE_IMPWS(CLK_IMPWS_I2C2, "impws_i2c2", "i2c_sel", 0),
+};
+
+static const struct mtk_clk_desc impws_mcd = {
+	.clks = impws_clks,
+	.num_clks = ARRAY_SIZE(impws_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8189_iic[] = {
+	{ .compatible = "mediatek,mt8189-iic-wrap-e", .data = &impe_mcd },
+	{ .compatible = "mediatek,mt8189-iic-wrap-en", .data = &impen_mcd },
+	{ .compatible = "mediatek,mt8189-iic-wrap-s", .data = &imps_mcd },
+	{ .compatible = "mediatek,mt8189-iic-wrap-ws", .data = &impws_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_iic);
+
+static struct platform_driver clk_mt8189_iic_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8189-iic",
+		.of_match_table = of_match_clk_mt8189_iic,
+	},
+};
+module_platform_driver(clk_mt8189_iic_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8189 iic clocks driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0


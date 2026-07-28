Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF4420476
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230309; cv=none; b=h+D3STVsi8u7/6PkDxb0jz/Weo8e2L4ImeXhbv/r7Ui7SrHeQfVoYnPYn03sigREWfzY9b6qBaCn66TYsK2wYaD51tQPAQy0pOzL1dY4WKnWXWRtWFPLNd0WdYTVcB6pXQgQBVB0lbo6iwPOlbOA+F6kbSYckfeRWZxFOs46SN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230309; c=relaxed/simple;
	bh=A146EED0+59ltr/PtWbjztumGFMIYQ/iLKAM1rCYKfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvsXIyemHYKiwRQlWv41J6eFK1d+AnFYKhrQgIn1KDZfw+NHIvioNd64bu585c6kbHybkYolQ0d4guk36ArdQS4ahwxy/lnI4wgSyrH87EdpzyUB0SIqhtSHugiVqb9v3APeNarjHDRh3iUBiqXKXFnbjEBWClhPOp1I5UCsGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oCthohki; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oCthohki"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf52d15d88so36772315ad.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230306; x=1785835106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49h1VdeF+Zg75pYUFKdBO+lS3yePgIwfgX1PP2SoBhU=;
        b=oCthohkiYYSwM6Nts0fHBThpccNoQhg01pvfsNL8PpKYjGjyXz7Jj9k1/h6KVTcgua
         Mj1VTFY9I3U4HQIYafE3fl88zxh0gWfrUMojMo5gusNeBLiAMdoKq3f+6zH0Z2XtE3X8
         jY1bx+5d2TG81hH3vINL03H+DGXilTosu1inQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230306; x=1785835106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49h1VdeF+Zg75pYUFKdBO+lS3yePgIwfgX1PP2SoBhU=;
        b=O56EGYEf+UF72pFAUE/g8nKpVIgrj/n2G8HviFlrMKO86uR7eWQC+FWJ8fG0YTJ2jE
         70Y+01DaAHWCSE8IDGzm92KMbAEJT7GKCPtkbr2hfoX0/7yXrJ3kcfHIfQHvTVvkJV1X
         Jle5IRzD8HcDM9mRKEIWZ+bZDNanfNKpy6JB/yWj0HLS58NMb2E9xYQgdtJz+KqqmwVr
         LvRLr6CPeX8z6nlnYgI22IwJITk9HKSNFa6LDqNcGrck3VTx8Hk1aSKPlUidnqo4nJ2g
         cQY6J49XJLCDw+++V2xmcsoawo5ydRjvH2LGwYGRvML9c12/0iB7lnwj2upCOvr6rnQL
         TlMw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9rAXndU/y0qjiIPt/VzXI8+GZf51Tg6gUKRBOTKhkAUmcR8EVQGlev2j36I4ykju4lAfdYleViEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEywr76sdImakzhNO+4BaZs0WNxZ9MI+YqqDjNKY9vsSWzuFDm
	RP1GEoliepj4PUE9W6KtGDdhQM6c595z/QMYhlXJn+34f1danE5t2amnh8qwNyRorg==
X-Gm-Gg: AR+sD11qv5YjKlXA0oAVo8JOH7y+9D7r11IbjHJG3s17kxOdf0ysRDELOQgOG2pxWP9
	fg1vA4NQBDPbOQG35HtsBKHggRTi8MolUBzRrLAzEjHaqxOYbFAW2PWGICRTvovuGitbFE51baD
	5KCskYdEhsLOM//8KrliNYokoKrLpbcIiyHaId2Swoj43V+u2wPySSXAztFpx6TWhK8dJ7Hx2T2
	ZN29+wup4rZ4GY67K57FHTIAIfpLOV46Sx3rT/uPi/xvvR4HZznbnSickJtHv/ZKN0HfF6gk+4j
	ba77NYRvZsUzVuneTLtSYi70bH/YcGrzQXy/mfEMZoKk0ENEygM9dPAzbqbRv7FVLDxcoM0Qr45
	XKNrcvmHT5kZPWD++WjNWOHZ760aafXGnnMUMbtQ9U09Lz79WRGkts+jdypV5S4H+3rzoStuNOr
	mS3HPZFXtlMtBLEIsZTRftuDC4ltNR5qG/45ictjqh+hNe+L+PgrEPzy8xiEg=
X-Received: by 2002:a17:903:2f0e:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2d015ac45camr19804365ad.3.1785230306195;
        Tue, 28 Jul 2026 02:18:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 2/5] clk: mediatek: Add mt8173-mfgtop driver
Date: Tue, 28 Jul 2026 17:18:00 +0800
Message-ID: <20260728091804.382753-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Changed pm_runtime_put() to pm_runtime_put_sync()
- Added missing of_node_put() in remove function

Changes since v2:
- Made COMMON_CLK_MT8173_MFGTOP depend on PM
  - Needed since the driver implements PM domains using the generic PM
    domain library, which also depends on PM
  - Fixes build breakage (kernel test robot)
- Fixed "RST_DELAY_CNT" name (Brian)
- Dropped unused mfg_desc (Brian)
- Added check of clk_prepare_enable()'s return value in
  clk_mt8173_mfgtop_power_on() (Brian)
- Saved error value for return in IS_ERR(data->clk_26m) branch
  (Dan Carpenter / kernel test robot w/ smatch)
---
 drivers/clk/mediatek/Kconfig             |  10 +
 drivers/clk/mediatek/Makefile            |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 242 +++++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c09fd729bab..8eea3766a910 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -537,6 +537,16 @@ config COMMON_CLK_MT8173_IMGSYS
 	help
 	  This driver supports MediaTek MT8173 imgsys clocks.
 
+config COMMON_CLK_MT8173_MFGTOP
+	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
+	depends on COMMON_CLK_MT8173
+	depends on PM
+	default COMMON_CLK_MT8173
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
+	help
+	  This driver supports MediaTek MT8173 mfgtop clocks and power domain.
+
 config COMMON_CLK_MT8173_MMSYS
        tristate "Clock driver for MediaTek MT8173 mmsys"
        depends on COMMON_CLK_MT8173
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index d8736a060dbd..892a54eeb281 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) += clk-mt8167-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173-apmixedsys.o clk-mt8173-infracfg.o \
 				   clk-mt8173-pericfg.o clk-mt8173-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) += clk-mt8173-img.o
+obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) += clk-mt8173-mfgtop.o
 obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) += clk-mt8173-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) += clk-mt8173-vdecsys.o
 obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) += clk-mt8173-vencsys.o
diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
new file mode 100644
index 000000000000..5669ca9954dc
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Google LLC
+ * Author: Chen-Yu Tsai <wenst@chromium.org>
+ *
+ * Based on driver in downstream ChromeOS v5.15 kernel.
+ *
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Chiawen Lee <chiawen.lee@mediatek.com>
+ */
+
+#include <dt-bindings/clock/mt8173-clk.h>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mfg_cg_regs = {
+	.sta_ofs = 0x0000,
+	.clr_ofs = 0x0008,
+	.set_ofs = 0x0004,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
+
+/* TODO: The block actually has dividers for the core and mem clocks. */
+static const struct mtk_gate mfg_clks[] = {
+	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
+};
+
+struct mt8173_mfgtop_data {
+	struct clk_hw_onecell_data *clk_data;
+	struct regmap *regmap;
+	struct generic_pm_domain genpd;
+	struct of_phandle_args parent_pd, child_pd;
+	struct clk *clk_26m;
+};
+
+/* Delay count in clock cycles */
+#define MFG_ACTIVE_POWER_CON0	0x24
+ #define RST_B_DELAY_CNT	GENMASK(7, 0)	/* pwr_rst_b de-assert delay during power-up */
+ #define CLK_EN_DELAY_CNT	GENMASK(15, 8)	/* CLK_DIS deassert delay during power-up */
+ #define CLK_DIS_DELAY_CNT	GENMASK(23, 16)	/* CLK_DIS assert delay during power-down */
+ #define FORCE_ABORT		BIT(30)		/* write 1 to force abort a power event */
+ #define ACTIVE_PWRCTL_EN	BIT(31)		/* enable ACTIVE_POWER */
+
+#define MFG_ACTIVE_POWER_CON1	0x28
+ #define PWR_ON_S_DELAY_CNT	GENMASK(7, 0)	/* pwr_on_s assert delay during power-up */
+ #define ISO_DELAY_CNT		GENMASK(15, 8)	/* ISO assert delay during power-down */
+ #define ISOOFF_DELAY_CNT	GENMASK(23, 16)	/* ISO de-assert delay during power-up */
+ #define RST_DELAY_CNT		GENMASK(31, 24) /* pwr_rsb_b assert delay during power-down */
+
+static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
+{
+	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
+	int ret;
+
+	/* drives internal power management */
+	ret = clk_prepare_enable(data->clk_26m);
+	if (ret)
+		return ret;
+
+	/* Power on/off delays for various signals */
+	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
+		     FIELD_PREP(RST_B_DELAY_CNT, 77) |
+		     FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
+		     FIELD_PREP(CLK_DIS_DELAY_CNT, 60) |
+		     FIELD_PREP(ACTIVE_PWRCTL_EN, 0));
+	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
+		     FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
+		     FIELD_PREP(ISO_DELAY_CNT, 68) |
+		     FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
+		     FIELD_PREP(RST_DELAY_CNT, 77));
+
+	/* Magic numbers related to core switch sequence and delays */
+	regmap_write(data->regmap, 0xe0, 0x7a710184);
+	regmap_write(data->regmap, 0xe4, 0x835f6856);
+	regmap_write(data->regmap, 0xe8, 0x002b0234);
+	regmap_write(data->regmap, 0xec, 0x80000000);
+	regmap_write(data->regmap, 0xa0, 0x08000000);
+
+	return 0;
+}
+
+static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
+{
+	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
+
+	/* Magic numbers related to core switch sequence and delays */
+	regmap_write(data->regmap, 0xec, 0);
+
+	/* drives internal power management */
+	clk_disable_unprepare(data->clk_26m);
+
+	return 0;
+}
+
+static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct mt8173_mfgtop_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+
+	data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
+	if (!data->clk_data)
+		return -ENOMEM;
+
+	/* MTK clock gates also uses regmap */
+	data->regmap = device_node_to_regmap(node);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
+
+	data->child_pd.np = node;
+	data->child_pd.args_count = 0;
+	ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
+					 &data->parent_pd);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
+
+	devm_pm_runtime_enable(dev);
+	/*
+	 * Do a pm_runtime_resume_and_get() to workaround a possible
+	 * deadlock between clk_register() and the genpd framework.
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to runtime resume device\n");
+		goto put_of_node;
+	}
+
+	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
+				     data->clk_data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register clock gates\n");
+		goto put_pm_runtime;
+	}
+
+	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
+	if (IS_ERR(data->clk_26m)) {
+		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
+		goto unregister_clks;
+	}
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
+		goto put_26m_clk;
+	}
+
+	data->genpd.name = "mfg-top";
+	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
+	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
+	ret = pm_genpd_init(&data->genpd, NULL, true);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add power domain\n");
+		goto del_clk_provider;
+	}
+
+	ret = of_genpd_add_provider_simple(node, &data->genpd);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
+		goto remove_pd;
+	}
+
+	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to link PM domains\n");
+		goto del_pd_provider;
+	}
+
+	pm_runtime_put(dev);
+	return 0;
+
+del_pd_provider:
+	of_genpd_del_provider(node);
+remove_pd:
+	pm_genpd_remove(&data->genpd);
+del_clk_provider:
+	of_clk_del_provider(node);
+put_26m_clk:
+	clk_put(data->clk_26m);
+unregister_clks:
+	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
+put_pm_runtime:
+	pm_runtime_put_sync(dev);
+put_of_node:
+	of_node_put(data->parent_pd.np);
+	return ret;
+}
+
+static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
+{
+	struct mt8173_mfgtop_data *data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_genpd_remove_subdomain(&data->parent_pd, &data->child_pd);
+	of_genpd_del_provider(node);
+	pm_genpd_remove(&data->genpd);
+	of_clk_del_provider(node);
+	clk_put(data->clk_26m);
+	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
+	of_node_put(data->parent_pd.np);
+}
+
+static const struct of_device_id of_match_clk_mt8173_mfgtop[] = {
+	{ .compatible = "mediatek,mt8173-mfgtop" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
+
+static struct platform_driver clk_mt8173_mfgtop_drv = {
+	.probe = clk_mt8173_mfgtop_probe,
+	.remove = clk_mt8173_mfgtop_remove,
+	.driver = {
+		.name = "clk-mt8173-mfgtop",
+		.of_match_table = of_match_clk_mt8173_mfgtop,
+	},
+};
+module_platform_driver(clk_mt8173_mfgtop_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8173 mfgtop clock driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0.229.g6434b31f56-goog


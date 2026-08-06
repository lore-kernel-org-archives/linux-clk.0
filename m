Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC403A83B1;
	Thu,  6 Aug 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027909; cv=none; b=tAux11n2N3143zHpn3oIAiokdlyM9HfW5Dki+1y0PzSkZR4w9YdOaEMKF5TdYmU5XCVCzN7oOcruS/j1oft1Ix/11a5leJoUK8h0DVxJ0vJ2UxIgFEEvWXPK4YHwngolGMg5Np2DNL8l8B3SHMyrjh6hmrULF/6ZwHbmQFzonrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027909; c=relaxed/simple;
	bh=soxRym6RY3RfM53rerMfeBGkcyCA5XDKnD5/Hsi4xLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyHmXkPuRCXrXTE/ibOn+3QjbT/sbrI0ifu0qfmTo01whAQX0V/qR408N84pY9VPOyVY9cBQeF2Zifgu/XP7UmUPG27XDbOrXOKgb6w2ibrKZX2FxE0c5Sf322il62eSYBir4IjuPcvqP9AQtXe1wUEWyv46yDN4cpV19WPa7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi1xGXzP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi1xGXzP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70FFEC2BCFB;
	Thu,  6 Aug 2026 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786027909;
	bh=soxRym6RY3RfM53rerMfeBGkcyCA5XDKnD5/Hsi4xLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oi1xGXzP4M6ua5KBcjtxymCs4V5pQtOp5rYAjKUw+FSKa+1vd5qdwTxumMPmr+8Ne
	 3HtByVEb5oK0S7box4p418nEOTkvnbumBbsbtRjAbcA6whp0jAhbU+A8KNZx4a7X02
	 NK8waTkHi3MKaxH+KGtS0C9UCvYTq7VTKZ67yUvXIvT4uhoX92dDt88nDSjz+MJmNt
	 ylYor4v/P8g0V82FbgeDsqAEbf+p+SnuzwKC9JEMFNtxFJiWSa4brkDPNI/wczWJod
	 H8FpJk/HbZtrIy21cwKQ2xAGtlg3sL3mPnYSe+cH5xGAYkGF6rgYjzYkQFd/HhF/+T
	 Q2PiuUoiolYeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D3CC5AC7C;
	Thu,  6 Aug 2026 14:51:49 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Thu, 06 Aug 2026 20:21:37 +0530
Subject: [PATCH v5 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-master-20260805-sync-v5-2-0ff42e9b6431@oss.qualcomm.com>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com>
In-Reply-To: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786027907; l=6661;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=QCZX+fDXiHb3ToEAJRmgWv5daRhV3Xx1Tckmhg/5yfY=;
 b=NNtJmRDse4DTlxPlb0X+zf53FAcSDL0pkv1wSeV+EF4q5m1PlOAeK0sWBzhWdEyEYl1qplow+
 076wDW88awNCEfjZio1WA9IPuF4lnCd3h6FCMVN9UGl1+7gF/ruplk9
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecases and
can serve as a periodic wakeup source for the DSP.

Add the LPASS VA CSR driver that models the rate generator as a clock
provider so it is enabled and disabled automatically alongside the
other clocks during runtime PM resume and suspend.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  14 ++++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/lpass-va-csr.c | 148 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d1fc9bf87126..756f6ed727d0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -2040,6 +2040,20 @@ config CLK_GFM_LPASS_SM8250
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
 
+config QCOM_CLK_LPASS_HEARTBEAT_PULSE
+	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
+	depends on COMMON_CLK
+	depends on ARM64 || COMPILE_TEST
+	select REGMAP_MMIO
+	default m if ARCH_QCOM
+	help
+	  Qualcomm LPASS VA CSR block contains the rate generator hardware
+	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
+	  This driver models the rate generator as a clock provider so
+	  that consumers can enable or disable it via the common clock
+	  framework, and it can be used to synchronize the start of DMAs
+	  and Codec Interfaces or as a periodic wakeup source for the DSP.
+
 config SM_VIDEOCC_8450
 	tristate "SM8450 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index daf25d583be2..8d3e3381bc29 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
new file mode 100644
index 000000000000..2e692407a966
--- /dev/null
+++ b/drivers/clk/qcom/lpass-va-csr.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/pm_runtime.h>
+
+#define LPASS_RATE_GEN_CTRL		0xd000
+#define LPASS_RATE_GEN_COUNTER_0	0xd004
+#define LPASS_RATE_GEN_DELAY		0xd010
+
+#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
+
+#define LPASS_RG_CTRL_EN		BIT(0)
+
+struct lpass_va_csr_data {
+	u32 counter_0;
+	u32 delay;
+};
+
+static const struct lpass_va_csr_data hawi_csr_data = {
+	.counter_0 = 0x960,
+	.delay = 0x16,
+};
+
+static const struct regmap_config lpass_rate_gen_regmap_config = {
+	.name = "lpass_rate_gen",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LPASS_RATE_GEN_MAX_REG,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+struct lpass_va_csr {
+	struct regmap *regmap;
+	const struct lpass_va_csr_data *data;
+	struct clk_hw hb_hw;
+};
+
+#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
+
+static int heartbeat_pulse_prepare(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+	int ret;
+
+	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static void heartbeat_pulse_unprepare(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	regmap_clear_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static int heartbeat_pulse_is_prepared(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	return regmap_test_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static const struct clk_ops heartbeat_pulse_ops = {
+	.prepare = heartbeat_pulse_prepare,
+	.unprepare = heartbeat_pulse_unprepare,
+	.is_prepared = heartbeat_pulse_is_prepared,
+};
+
+static int lpass_va_csr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpass_va_csr *csr;
+	struct clk_init_data init = {
+		.name = "lpass_heartbeat_pulse",
+		.ops = &heartbeat_pulse_ops,
+	};
+	void __iomem *base;
+	int ret;
+
+	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	csr->data = of_device_get_match_data(dev);
+	if (!csr->data)
+		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	csr->regmap = devm_regmap_init_mmio(dev, base,
+					    &lpass_rate_gen_regmap_config);
+	if (IS_ERR(csr->regmap))
+		return dev_err_probe(dev, PTR_ERR(csr->regmap),
+				     "failed to init regmap\n");
+
+	csr->hb_hw.init = &init;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	ret = devm_clk_hw_register(dev, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id lpass_va_csr_dt_match[] = {
+	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
+
+static struct platform_driver lpass_va_csr_driver = {
+	.driver = {
+		.name = "qcom-lpass-va-csr",
+		.of_match_table = lpass_va_csr_dt_match,
+	},
+	.probe = lpass_va_csr_probe,
+};
+
+module_platform_driver(lpass_va_csr_driver);
+
+MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
+MODULE_LICENSE("GPL");

-- 
2.34.1



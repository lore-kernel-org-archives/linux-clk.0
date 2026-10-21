Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586408;
	b=ep2pwr5fm5UcZXFJq5cvNPSHIUwc/L1wGEYUOlnE8r2gQZqDtXkQzqsPVBImSeoFlpMZ
	 Qr6sxXK4w9jDX+gLORUuxNloKPtluli2PEceSEZWP9/Od4GDIt5HXc4vkUBOChVF14dMS
	 PfKoFzTftn2kWAwtqvrmrYM8DdAcN1dQ1WkEsVzDJt277WuuM6cD/lZzD6OPaBZhLzzp/
	 YbpkBuilG8KeGX+WP+qtoAOgd+VEcYyfAs56fkqzJm5FdS2cBT5yFj1Kf1uVHKt6J5jYC
	 wpQB6WPwI3pySxuqRzgD4xVhTbXFqxLGYRS4AxH6MyjDqyWnJZyb3/nHbK3M3r9pKLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586408;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gesf9pqGuiVnH5DLpEDSQllRaMzCxZkjouvQmn4tsR0=;
	b=ctM4gN/rQY7bbTNR62IQuyGklZudsE3jCiPfKrjqUkoOnyUvEqND8BiVb9WgBdNmQWc3
	 UZ75YV/ncismxs2eYb6fi6zX8h2iQ5Ni521Ltp7NuHrCtkM56HOHyoxNnYcum69OzFElb
	 JBGPtKDwv/2V6nltJ+EjYg2P4Wk8sWWKTbXloIyvQKCg24x8jEnWCQUVZnp5P8TccQHT8
	 WZTY2ulOLBla09wcYCHgpL3PDHlSKupnTXQPYAHNK2SsLkKYFjDw1A4lUJv0k4H+Dhx3T
	 ozDAvWw2BugQOpfH31RXT8B+E13wcJ/LFmjZpyvE30XtN2xlXGM5MLxljaAKSJhzk+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bANR7O2a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BE606A320;
	Wed, 21 Oct 2026 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bANR7O2a
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792586408;
	b=mjjpBvpn872hYJ8tlDtOO+d+xdG02zuGfh709ix/LIgT0Z6wWCpLgfuKxxOgmtqi74a7
	 ld/ydGxK7lFDubhDDVQPrNKUTyHK/VPArvgjJP9g68KVlnh/mRH9hB73J1rBYmPW/k5lk
	 n/Xp1OnKooeliYRoMigMyjvrKgB0bdML5/nEIuAHxrAFK1Tyx10N3fbQPxD+ai63zfaBO
	 a3JjUN6lctGTHjwDnXNJqV6SfuwiJmgu8EcPxObyDRKQ4aXEQ1fuUCiNL7o9Hk+g5fJpz
	 h2Ry0xA8v+PRPIUKsdHS8OewUHmN0B1HPXbuofBoWcEbyJQdvOMlmhh3VYX9k0lWvtA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792586408;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gesf9pqGuiVnH5DLpEDSQllRaMzCxZkjouvQmn4tsR0=;
	b=z/DKy6HMeHz/Utrn8/C+dWfEhitehwvIwAspa9BB5wfJsa8FZJNFeSc43+3lumynZJfw
	 TeGPSrVhMFSCoofOLLzyl8hIj+GTiSL70AL5QTPN/K947sAsgb+mNyOj4lsaCeTkUU+Nz
	 M+2ur6A/JwdaG2Ka2pzCx3LZv/eMxjzjIRikXyT+yuMmUCDwQBNrjUOJM61b4wpwmdYLt
	 v9Ij2sB844ubhEULSkqv7gNnBgGhUrK/M4PWwbzDeUdaoMUZRYJ+DX75JDiKXuZl3VGrF
	 fNEMy8big+JTVkKbfJtAQoYJfV1vdgLOoGpcC72KTwZa2W9E+IEvpRfFj8HxTUuA4Bw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CF331F000C5;
	Wed, 21 Oct 2026 12:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792586408;
	bh=gesf9pqGuiVnH5DLpEDSQllRaMzCxZkjouvQmn4tsR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bANR7O2aeLSmcoY0EizIva6q38XaYyfdtR5/saRd4afFfYYBYN5H7VGEI2pIHPv3c
	 C0/+YPjlnI/YSr3mYdNVRhjRVLpSXEgN+DoftBaDKo3ZUjEkbKmQoziP2DBKVxRlGb
	 Oe2kB9oq5ZWb2/4T6BgIh87XQqyr3xKFgUGJpKv37NDGkyoGpyIklMIl64F/K2vqZX
	 sumBw1gc3cGMy0J8e57qZO9AnwnLq2Yl/M1hdyehBIuYrVjFji0uBbvk+87+Wkqymf
	 b2qooHMCXpr/hlrZd41SkFUW0gdnsDEW5KZWqQLVojzzt90yxIFuRKGJpHvtQXq4/7
	 2orQ+6M1nY9cw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D16C643371;
	Wed, 21 Oct 2026 12:40:06 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Wed, 21 Oct 2026 18:10:07 +0530
Subject: [PATCH v12 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-master-v12-2-9b3df51fd1d7@oss.qualcomm.com>
References: <20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com>
In-Reply-To: <20261021-master-v12-0-9b3df51fd1d7@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792586405; l=7461;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=M5zeR76sp46EqUZAq7ejS5vTnu2/SBT4u1ZUg8DwdZs=;
 b=oHtnOsHJ8mbH8MoZl1oAHdqMK281FEaYzzPHj4Ps2E+XOBfooEDogdveXIbrHq+LKXFAHBXqO
 sIICp2flkyhBGrYzMGlkqypOWz2Glpg0Qwuy5yW/7vNjBOy4HE+wAjm
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com
Content-Transfer-Encoding: 7bit

From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
start of DMAs and Codec Interfaces for the audio usecases and can
serve as a periodic wakeup source for the DSP.

Add the LPASS VA CSR driver that models the rate generator as a clock
provider so consumers can enable and disable it through the common
clock framework.

Attach the DT vote clocks to runtime PM and program the rate generator
counter and delay registers from runtime resume after the votes are
enabled. This restores the state if the LPASS register context is lost
across runtime suspend.

Rely on the clock core provider runtime PM handling around clock
prepare and unprepare to keep the votes active for regmap gate
accesses.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  15 ++++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/lpass-va-csr.c | 180 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..718a847fa8a0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -2137,6 +2137,21 @@ config CLK_GFM_LPASS_SM8250
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
 
+config QCOM_CLK_LPASS_HEARTBEAT_PULSE
+	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
+	depends on COMMON_CLK
+	depends on ARM64 || COMPILE_TEST
+	depends on PM_CLK
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
index 6affb5073f26..787a3761af3b 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
new file mode 100644
index 000000000000..e5fb870aa36d
--- /dev/null
+++ b/drivers/clk/qcom/lpass-va-csr.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/pm_clock.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "clk-regmap.h"
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
+	const struct lpass_va_csr_data *data;
+	struct clk_regmap hb;
+};
+
+static const struct clk_ops lpass_va_csr_hb_ops = {
+	.enable = clk_enable_regmap,
+	.disable = clk_disable_regmap,
+	.is_enabled = clk_is_enabled_regmap,
+};
+
+static int lpass_va_csr_runtime_resume(struct device *dev)
+{
+	struct lpass_va_csr *csr = dev_get_drvdata(dev);
+	const struct lpass_va_csr_data *data = csr->data;
+	int ret;
+
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(csr->hb.regmap, LPASS_RATE_GEN_COUNTER_0,
+			   data->counter_0);
+	if (ret)
+		goto err_pm_clk_suspend;
+
+	ret = regmap_write(csr->hb.regmap, LPASS_RATE_GEN_DELAY, data->delay);
+	if (ret)
+		goto err_pm_clk_suspend;
+
+	return 0;
+
+err_pm_clk_suspend:
+	pm_clk_suspend(dev);
+	return ret;
+}
+
+static int lpass_va_csr_runtime_suspend(struct device *dev)
+{
+	return pm_clk_suspend(dev);
+}
+
+static int lpass_va_csr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct lpass_va_csr_data *data = of_device_get_match_data(dev);
+	struct lpass_va_csr *csr;
+	struct clk_init_data init = {
+		.name = "lpass_heartbeat_pulse",
+		.ops = &lpass_va_csr_hb_ops,
+	};
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	if (!data)
+		return dev_err_probe(dev, -EINVAL, "missing match data\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base,
+				       &lpass_rate_gen_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to init regmap\n");
+
+	csr->data = data;
+	csr->hb.regmap = regmap;
+	csr->hb.enable_reg = LPASS_RATE_GEN_CTRL;
+	csr->hb.enable_mask = LPASS_RG_CTRL_EN;
+	csr->hb.hw.init = &init;
+
+	platform_set_drvdata(pdev, csr);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get vote clocks\n");
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_clk_register_regmap(dev, &csr->hb);
+	if (ret) {
+		pm_runtime_put_sync(dev);
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb.hw);
+	if (ret) {
+		pm_runtime_put_sync(dev);
+		return ret;
+	}
+
+	pm_runtime_put_sync(dev);
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
+static const struct dev_pm_ops lpass_va_csr_pm_ops = {
+	SET_RUNTIME_PM_OPS(lpass_va_csr_runtime_suspend,
+			   lpass_va_csr_runtime_resume, NULL)
+};
+
+static struct platform_driver lpass_va_csr_driver = {
+	.driver = {
+		.name = "qcom-lpass-va-csr",
+		.of_match_table = lpass_va_csr_dt_match,
+		.pm = pm_ptr(&lpass_va_csr_pm_ops),
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



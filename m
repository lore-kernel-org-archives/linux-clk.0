Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163810;
	b=5HyOZyvM+RRx0uYY5uoDxq+KGzX5lONBCTgyjPLlvOjIUffj/j92fxG+m3SNTpXR8Kw3
	 jryuLbeJOHZ7wuNrQB4I5VrRtF9S8KmAac63keUljcodpttaN3OhO4LBCnZZHOmgMVcG/
	 I8k/c/sP8L4HlBulyEJoQG8kWeAeoerO9RkUG4/NU5JaCZqRdL6snvyZN1CYlfSfoebCS
	 JagUZWTUvta587Cc7fHgOF6ZCvvcbR2yuRaCo4anGDVMa03mHKCOVg5VHGhk/+BmAmVLI
	 ZDriwR1aHQATfLnFmAKH2O1uas8ovjeGyiaLGZcmQZ9MtfautytjUZk9d/bNnhjOxbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163810;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z63sD21MFwBXtkfed9A55IIPOsEn78QtENpd0PJu00o=;
	b=uABno+jMktZ+qIYWZIvu95wT8XjbHluZcgKdlo46PZUKKQEqi/p+AiIICQpHe3lsvNKO
	 cUIxt33OVu0kAtGbclQIHySx1YZbn9FuX3GXdLOjZrOKfjbYQFnBReuHlMJrjbcBgXI1Q
	 IMUi5UO9yM1IYwaydDzaHYOIJ9sf/PcypHie569xv7Lq5+WN5uXYIyGuHb8rAQba1D2ET
	 7VGwMbAhc5K9pE6D+ij7ICu5MhYFafknUco4hWPe586PbK/mZGnbIL1gNvBYoUJyhsa8W
	 awRz5SddTigdwsqm3rDWvQMYmZ8VQe6dI+2U3j5ZcaXUhABi0/2t90YalwDAPyawlcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAYUs2kC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADA8606A33B;
	Fri, 20 Nov 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAYUs2kC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795163810;
	b=df49uW35gmjUabgmXXzS7eJcBW27jzH5S0ZsK1bP+2p9Mg2HuaxtUZhLyJ4LvmJyIw2g
	 2gD7IV87Jr3cA+jo781DYwxk39DWvPvz39gImO2/V0XBerVa89gLdmQrMJD+WRdqlZJBM
	 WhsFytAwaC+Kz7P/4xDt4wrMfeGf7RS2RinRQkKpKa19LSM6GgTQfVUq8qeMbAsjMZKVg
	 HYKxoNj8CypZOVTQNbimEdJUWKsMH5G3HkL7Pw4nmN+9sr0a3peG2PS4HD7wqFpGXXpYX
	 0iAWYZMNOayxtnzjvj3Qg6fqKnS0CeGHmLoTZkQcQmfumuY9cRjO+pmM+1fd+Lko91g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795163810;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=z63sD21MFwBXtkfed9A55IIPOsEn78QtENpd0PJu00o=;
	b=hfvJZ3VoRPizP8mlGKPSlIBVPMChokFY9do5i+6+aS7NuAbDqzu9Rio860xi79LCmYRY
	 s9SNgkrRIGJ2seq8Hyb2MB0H1+jpQf1t8t/9PoUzxbKEcy3APGucr4ggkM/tLGcFKI4zm
	 pxmMdYTfNZJSt9sg3MYxM9KFBjUA+uyYZU35MKuIPRc4OZbIYcRO0vKJtgNgROHVIXyIc
	 Bf+lIhJLZ7+CsLJnsnvaKODrk2o2vYlgdbPvix2jP+wLiVJWzm+wjg5/DuudNsU8M3SCp
	 kUAvUrXsLP4RtWXJ/Y1ErXr447xzFDafD2ymu9DWJO3mIkICZBuh7HhAhECwzRfsAiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 299EA1F000D0;
	Fri, 20 Nov 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795163810;
	bh=z63sD21MFwBXtkfed9A55IIPOsEn78QtENpd0PJu00o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OAYUs2kC7Y6WouMY4PnfsgVoD3O400zbObx9XobgteAkwslB9ZyFjg5brvs7UYpCL
	 CboSEC7l8v461ALY681gucaTwjpnhX34Fx+z33WrvBGaUtd0CAqooCaV0Ivb8ZRNTS
	 fW/nJu9M06TM14/WAFcfT79A/GUYRqiJtSLYdiX/QTk5DJOdbxObGVRULYF6rsGdbA
	 wNgN4aM1/n9x0VaEfetv3cDJk8syr/rmZv12aswKZWoMeL7LxAaoZeNwvXrZKyAP0h
	 YI+grX8LJRklK5FVueR+I1vOQ2BP19hYQYaW49O4takUrYGLTusnRstAHDdDeA3gxb
	 ANQdR/HEV3DHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A8B85497A9;
	Fri, 20 Nov 2026 08:36:48 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Fri, 20 Nov 2026 14:06:48 +0530
Subject: [PATCH v14 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
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
Message-Id: <20261120-master-v14-2-112cfd63438d@oss.qualcomm.com>
References: <20261120-master-v14-0-112cfd63438d@oss.qualcomm.com>
In-Reply-To: <20261120-master-v14-0-112cfd63438d@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795163807; l=8593;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=hWUOqIp70+7tbNk8ZoL2B0Bd4sifWZKINu8/13oNjNs=;
 b=g+yb0z4UB/m93hO62vPurmi8jJk1w1f9HJQ7gVxlqs1JumFVzKi1A8eLPOtc+Ef6nmsYdjT1I
 r4zI0xUIJFPBVwmx1jQ0MPBrWn7dMDxwjvAbLXQlGz8Cx+ICb+nZ+xy
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
accesses. Use the same runtime suspend and resume callbacks for
system sleep so the vote clocks are enabled before restoring the
rate generator after suspend. Track the heartbeat gate state in the
clock callbacks and restore LPASS_RATE_GEN_CTRL on resume when the
clock was enabled before the LPASS register context was lost.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Tested-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  15 +++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/lpass-va-csr.c | 210 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b1849..f4f4b48e1e5d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -2159,6 +2159,21 @@ config CLK_GFM_LPASS_SM8250
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
index f84d7343a3a4..89cdc43a6b03 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
 obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += apcs-msm8996.o clk-cpu-8996.o clk-cbf-8996.o
 obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
+obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
 obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
new file mode 100644
index 000000000000..b4257e8d74e4
--- /dev/null
+++ b/drivers/clk/qcom/lpass-va-csr.c
@@ -0,0 +1,210 @@
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
+};
+
+struct lpass_va_csr {
+	const struct lpass_va_csr_data *data;
+	struct clk_regmap hb;
+	bool hb_enabled;
+};
+
+static int lpass_va_csr_hb_enable(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = container_of(to_clk_regmap(hw),
+					       struct lpass_va_csr, hb);
+	int ret;
+
+	ret = clk_enable_regmap(hw);
+	if (ret)
+		return ret;
+
+	csr->hb_enabled = true;
+
+	return 0;
+}
+
+static void lpass_va_csr_hb_disable(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = container_of(to_clk_regmap(hw),
+					       struct lpass_va_csr, hb);
+
+	clk_disable_regmap(hw);
+	csr->hb_enabled = false;
+}
+
+static const struct clk_ops lpass_va_csr_hb_ops = {
+	.enable = lpass_va_csr_hb_enable,
+	.disable = lpass_va_csr_hb_disable,
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
+	if (csr->hb_enabled) {
+		ret = regmap_update_bits(csr->hb.regmap, LPASS_RATE_GEN_CTRL,
+					 LPASS_RG_CTRL_EN, LPASS_RG_CTRL_EN);
+		if (ret)
+			goto err_pm_clk_suspend;
+	}
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
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get vote clocks\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
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
+static DEFINE_RUNTIME_DEV_PM_OPS(lpass_va_csr_pm_ops,
+				 lpass_va_csr_runtime_suspend,
+				 lpass_va_csr_runtime_resume, NULL);
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



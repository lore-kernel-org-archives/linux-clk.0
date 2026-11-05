Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855698;
	b=z/BTDbCx/XBHWistCtcH74+yx+c3EpcMcLAoBvFnqmzvond9/Z9Lle0gyO+tOmxsFVS2
	 qZ5d8Ek/A3gXhnwHi4xmEsTpYwKfTK/4CfnUER6ES1QUmMHA/jCElxp3lpcsKaZmIPWSC
	 pX+rHZ/CmkWTDuwZrQjpKfXHnxYRIgpJSVFd20WjRhqG4meJWbt4Dei40P6Zq+mJO9NnJ
	 rI9fc2jZLMUe8IAPivbwOvQgjahGUq1axn4q3J5hgyP0KGjtx7W6t4IxX64VWRK5VZx0H
	 5qWEZdiadlxfEgvXK7tq/1mk00LAcJdYdzKxVpDdIdIXWpTCuozfU9RyddFSh/Jc4rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855698;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0dIAs2kt+dAL68lnWUPR1YliPBZmyPiUmhrMKawtCe4=;
	b=qUUWdN/mL3ArYVbnNmRzYPVgSxG4Ji9kcux+Z2T5MTIB5LpR974dXw6MoKlUUs7r1U4m
	 l/RFfFY3c/oxNAMePPgAXit1g1xVxewwLy6cc/aqhUy/7Fqcv5d9CFxqylwaMua5zrX7g
	 B2I9ecOtjrmRcVDdv7tZyCMWwheD7i3ODctTBGrgTcdmRQIuyYggcBfk1vf8vqC3NAD3o
	 HELhtBQ++arlV1YQBzcsOezo5DQ4vZJECaJL+jnIrdRak6JKHn1bxJzrtb6uV4jaHKWSm
	 Dl8sLwCUtrZlt3eh/LUAoEF8YA1lGCdCbTFDi3OkOtnHrhH1njzhdft9K4LuxmgCZUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b27MiM0W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87373606A326;
	Thu,  5 Nov 2026 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b27MiM0W
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793855698;
	b=sYk1g5WhVN9TaoMerhG7PTfaaJ69Mxh3pdgZuzZNPPmQvgHELtvNFrpqjIHYjag6kPMu
	 4QbYC8n+NGhemnFAVpY06vpcdr1b8f+iwOZVuQEDtT62zNRdk/UOTFerIKRXPFvxjTI6e
	 1owsezfcLwGQkGIp0uhZ6ac/LbGN/yn627uCzwyTnj4h68WbSwBtBfVxQxvj4uYbwvkM2
	 82TU/3yycDNM/dEo0jOx/iBENJLczg0Hhrfbv2a3+QpIe58BSCz4ZDzMLcHfGT8RCRK2u
	 8QQ2IoWAHtd/K5tW69bX11amYp6DuQTdlDb6OwvIZ4PobWPUECwnTLgpZXItujWR8Hg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793855698;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0dIAs2kt+dAL68lnWUPR1YliPBZmyPiUmhrMKawtCe4=;
	b=vWh3rTOppviF007aLOaZuKMM5NLcpu1pR64mvnoMBXTgCJcm2JMis8U99hp/bMXZFjHE
	 yb51sJbXjpR6LeXd7040jM3QvPsLmbnm+etj6gS1QeX6fv4w3Qzi3YPV1bXO8zAoFx1vg
	 jg83xFLRNoszTwXh1MrEEHJWfIk5ruhVZ3pxi3dylCoO49PKf2hv93xbUHqIj0qhM0UhN
	 fp6nx0aPFzaq/bG0SIiKfi7H+k1ORC51p4AfzNaswWzfJR4uXv/sKRGGaoPuetnPM2VlH
	 AcbU4sOAfHtHv+KsnwupOU5VG61rbAITd8zuK2rpjuiS5ue7KW4C2w77RVDEeDGDcnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 446981F00A02;
	Thu,  5 Nov 2026 05:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855698;
	bh=0dIAs2kt+dAL68lnWUPR1YliPBZmyPiUmhrMKawtCe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b27MiM0WsULshskbG/RSFHpUGCNsYhp7frIPDGVEtJpR4ROrD97NpHMdzk7uV+07S
	 Ih1TuJhs/BotOcmFRbpKFG9PySRSHK6wahtW7XkrtfbMDl0UeZgg1TciTKRn+/Xb9u
	 1udAZT8IBcH+nB3K+mZKL/eJTgHJ207/WsY8AL9BnpQKuGQFMz7f3GWZ99adDQC5YH
	 OEtVDNBaoOobJ2BFYx46JIT/S1GJYBS/2ltsjQI11dSxToFjmYiUIG3Yube/3XcCdI
	 EgU0VIS+2skxblyaVdfPUptRfcB6/LFJCZxKBtFGtp/Bxg1mC48MhsaZvbUb6pvS0D
	 9Q7Ph6+JD0W/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C01F9470BE;
	Thu,  5 Nov 2026 05:14:56 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Date: Thu, 05 Nov 2026 10:44:57 +0530
Subject: [PATCH v13 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
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
Message-Id: <20261105-master-v13-2-dbb43cdc60e5@oss.qualcomm.com>
References: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
In-Reply-To: <20261105-master-v13-0-dbb43cdc60e5@oss.qualcomm.com>
To: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 srinivas.kandagatla@oss.qualcomm.com, sarath.ganapathiraju@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793855695; l=8461;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=gA9ojBmiDpwXK+6wEqXMXy8AjyVKLAFP4FkN77mtAtg=;
 b=IMWKW2XB3166zLTGOlzhKIB1QxHHg4lWVZChosA7lLTk75AfWE7diBbeiFGuyt5DuIgOLCDb9
 4gPWpEmU7H3BKLy+fuV6rUAqFBH4Uuq/eycHn8tKgcJDq6bgUP7o+2Q
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

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  15 +++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/lpass-va-csr.c | 210 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)

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



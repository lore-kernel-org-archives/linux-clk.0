Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB276C61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 09:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240140AbjAMJLE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 04:11:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240944AbjAMJKZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 04:10:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890DF76217
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:55 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o20so256178lfk.5
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNU5vbwi8kesZ/PK2S0aMAB2OBF5X1de5BdV3sczaOc=;
        b=dsGR7Kj1Tt3BbMwlnb0omrdUBPVj6KE/1nHaMrn+rjH8F/MojYpCRdJCgSt0Cs6slx
         b3nJba5Kfko2Wldw558DF8nu4p/VoXwaLw2ig2iyisY6LxP/BnwAKnsQZPZQNcow0vwr
         J8zC3Q6ck60HkTJQbfaTKk3Cg15RWYB1uQHzWZs+8+c1h/oC45+Ed6flqGwa5VIGi4UE
         np++jymXHhYZ1C7+jKH9a6B6/NWWfWOjeeLIDvJGe3YHRsIwD2DZHb/uGIj5gPdPlN9p
         xL9ZNVKMNwz5jbR+3nLZ+rTUlFv4Cf2F62tWvk/fonEjFpjgkjf2lIrzWTcGd/9B3wN+
         uBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNU5vbwi8kesZ/PK2S0aMAB2OBF5X1de5BdV3sczaOc=;
        b=ymwCLLB/WOLbPRdt1llTzOovOFKW2Wyk7KHrhNy/f/KXNQEepRXcuxTyHlj0Njqx5y
         PHByoEhnM3QzIeeKuVSL2SshjguDCZRtO7uTBIXdW5mXLEbSsqUxVo3sLKs5zH7gf2+B
         JVaCQn52wS/JpU2bmZPKCwsnuUFW61eHeIatSUWSSarnbYV9+/Qvd14l6ju54eP64bDK
         2vfu1kvzkXun3eVnp+A3N44WiEXH/bPUwuwiF37Wt3kgAbLxycrPExFEVo2oH19Xr7SN
         vFK8ylDNHA1leX685OjJGq4MZY2Gs/r/yd+EOYLXnHFY3RlE2aUbff0Qax4KYo0pO83e
         QZEw==
X-Gm-Message-State: AFqh2krhOodgwM7/wq+hACvBa8W/9njnY/ENPObXWwpeRzcXpy2KKBko
        p1Dksug1oebtIPmjeSm2oIxKBA==
X-Google-Smtp-Source: AMrXdXvS4QG/QOeOl+ud5xWwZgd9EDmJTRDthbzjEJzSZfX236IXTwIktpbaWLo+T6y1+KLpDPAPdQ==
X-Received: by 2002:a05:6512:2a85:b0:4cc:7c51:bf46 with SMTP id dt5-20020a0565122a8500b004cc7c51bf46mr6316556lfb.63.1673600875100;
        Fri, 13 Jan 2023 01:07:55 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] clk: qcom: add the driver for the MSM8996 APCS clocks
Date:   Fri, 13 Jan 2023 11:07:39 +0200
Message-Id: <20230113090739.45805-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a simple driver handling the APCS clocks on MSM8996. For now it
supports just a single aux clock, linking GPLL0 to CPU and CBF clocks.

Note, there is little sense in registering sys_apcs_aux as a child of
gpll0. The PLL is always-on. And listing the gpll0 as a property of the
apcs would delay its probing until the GCC has been probed (while we
would like for the apcs to be probed as early as possible).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Makefile       |  2 +-
 drivers/clk/qcom/apcs-msm8996.c | 76 +++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f18c446a97ea..ca2f586edb3e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -52,7 +52,7 @@ obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
 obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
 obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
-obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
+obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += apcs-msm8996.o clk-cpu-8996.o
 obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
 obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
diff --git a/drivers/clk/qcom/apcs-msm8996.c b/drivers/clk/qcom/apcs-msm8996.c
new file mode 100644
index 000000000000..7e46ea8ed444
--- /dev/null
+++ b/drivers/clk/qcom/apcs-msm8996.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm APCS clock controller driver
+ *
+ * Copyright (c) 2022, Linaro Limited
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define APCS_AUX_OFFSET	0x50
+
+#define APCS_AUX_DIV_MASK GENMASK(17, 16)
+#define APCS_AUX_DIV_2 0x1
+
+static int qcom_apcs_msm8996_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct regmap *regmap;
+	struct clk_hw *hw;
+	unsigned int val;
+	int ret = -ENODEV;
+
+	regmap = dev_get_regmap(parent, NULL);
+	if (!regmap) {
+		dev_err(dev, "failed to get regmap: %d\n", ret);
+		return ret;
+	}
+
+	regmap_read(regmap, APCS_AUX_OFFSET, &val);
+	regmap_update_bits(regmap, APCS_AUX_OFFSET, APCS_AUX_DIV_MASK,
+			   FIELD_PREP(APCS_AUX_DIV_MASK, APCS_AUX_DIV_2));
+
+	/* Hardware mandated delay */
+	udelay(5);
+
+	/*
+	 * Register the clock as fixed rate instead of being a child of gpll0
+	 * to let the driver register probe as early as possible.
+	 */
+	hw = devm_clk_hw_register_fixed_rate(dev, "sys_apcs_aux", NULL, 0, 300000000);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+}
+
+static struct platform_driver qcom_apcs_msm8996_clk_driver = {
+	.probe = qcom_apcs_msm8996_clk_probe,
+	.driver = {
+		.name = "qcom-apcs-msm8996-clk",
+	},
+};
+
+/* Register early enough to fix the clock to be used for other cores */
+static int __init qcom_apcs_msm8996_clk_init(void)
+{
+	return platform_driver_register(&qcom_apcs_msm8996_clk_driver);
+}
+postcore_initcall(qcom_apcs_msm8996_clk_init);
+
+static void __exit qcom_apcs_msm8996_clk_exit(void)
+{
+	platform_driver_unregister(&qcom_apcs_msm8996_clk_driver);
+}
+module_exit(qcom_apcs_msm8996_clk_exit);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm MSM8996 APCS clock driver");
-- 
2.39.0


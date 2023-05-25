Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F174C7EE3A
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 12:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241085AbjEYM3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 08:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241119AbjEYM3u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 08:29:50 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A01122
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:49 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3094910b150so2003652f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017787; x=1687609787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLjGEgGmeVEL+jwwVHpKA001ieTWzrIilLSBq362ab0=;
        b=EP/+un4s7kCvbN/Dm4b/FmYuqrrZpYcDF3LRrczwT9l97gZDPInhUpQv9cjOpppU/z
         MApIg3QBw3wEgncWlRZdQiGDo10TKEouvT8SGbTrdbwTrzJAJMHFlotN8P48i1dfr3wW
         tzjqofqK6aFloWWQ9k8UpedoH4lefA2teKILuQsBr17ey0Yj2ifBa2RTD5ZEaoEoYx5z
         170wsE2/emm9xdn6HasUW7cuqaEV4PoAeQlDstmkVazlUXgHP+kxcx9WO5R6xMBtVhEU
         H3CMPzZB5vzfosfboPD7iUnL3eaorlFI6pSp1ei7pVBwKzxXy9dRl35bNoUe57/7Tv7U
         mzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017787; x=1687609787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLjGEgGmeVEL+jwwVHpKA001ieTWzrIilLSBq362ab0=;
        b=O8057dR09oG/4cwBL8jakQCSVQnDEbyWfpgGyFEQ8RwqUwYbBovnqhQUO7Hw4paOLh
         rDBA42XhZUCH31+noT9tfSVY5v1xX0NYGV3TGU6TqK8hRumNOX2rTb7fV89CaC0X5hlG
         eAokOcJmffL4/UfcoeFZDYJZiE9jd4AVSCL1cN8fgoPwkq+EvVdogf7XH61ktrD4fMBe
         VFyBx+7y+KNkc/attr0hlegR9mDQZPhfHzO9uefxzwg9geJUB6tSXZzbSkY9qLVuv1/7
         z5oo3DGjRN2BrVtjkaeLqM3BEqxTLLTY/+ba1eaUDSNTohgUdwI+7Mug6oiBYkjxd6Sb
         x82A==
X-Gm-Message-State: AC+VfDz00+yqdd6fQX4dn8TKRgW6xwUvKdhVslJ9i6FqhTC8MnxSu5t9
        yw+9nhbJIjX3xA0Ph185iGHJdA==
X-Google-Smtp-Source: ACHHUZ4cu94IrmeLNjyJYPfjIRssYgw4FABlF6WVW/6Aii4kjeEZAqHkMOy4CRqF3BQGO/403znw/A==
X-Received: by 2002:adf:fc83:0:b0:307:9da1:c9d8 with SMTP id g3-20020adffc83000000b003079da1c9d8mr2227680wrr.4.1685017787795;
        Thu, 25 May 2023 05:29:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:46 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/6] clk: qcom: Add lpass clock controller driver for SC8280XP
Date:   Thu, 25 May 2023 13:29:27 +0100
Message-Id: <20230525122930.17141-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the lpass clock controller found on SC8280XP based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/Kconfig            |  8 ++++
 drivers/clk/qcom/Makefile           |  1 +
 drivers/clk/qcom/lpasscc-sc8280xp.c | 63 +++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 85869e7a9f16..e25993abb519 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -523,6 +523,14 @@ config SC_LPASSCC_7280
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_8280XP
+	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"
+	select SC_GCC_8280XP
+	help
+	  Support for the LPASS clock controller on SC8280XP devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	select SC_GCC_7180
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 9ff4c373ad95..1d420e112fae 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7280) += gpucc-sc7280.o
 obj-$(CONFIG_SC_GPUCC_8280XP) += gpucc-sc8280xp.o
 obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
 obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
new file mode 100644
index 000000000000..547f15d41a9d
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpasscc_sc8280xp_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
+};
+
+static struct regmap_config lpasscc_sc8280xp_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_reset_sc8280xp_desc = {
+	.config = &lpasscc_sc8280xp_regmap_config,
+	.resets = lpasscc_sc8280xp_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_sc8280xp_resets),
+};
+
+static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
+	{
+		.compatible = "qcom,sc8280xp-lpasscc",
+		.data = &lpasscc_reset_sc8280xp_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_sc8280xp_match_table);
+
+static int lpasscc_sc8280xp_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = of_device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_sc8280xp_driver = {
+	.probe = lpasscc_sc8280xp_probe,
+	.driver = {
+		.name = "lpasscc-sc8280xp",
+		.of_match_table = lpasscc_sc8280xp_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_sc8280xp_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org>");
+MODULE_DESCRIPTION("QTI LPASSCC SC8280XP Driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0


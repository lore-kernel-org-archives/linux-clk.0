Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D95C83003
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 12:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbjFHMxp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 08:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236548AbjFHMxh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 08:53:37 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED552D53
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 05:53:25 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so3705665e9.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228803; x=1688820803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+w0DXb+KJnwyugAvGaMzfdLL4Qyi7E6pl/fJpCqVpM=;
        b=hpkc77bxEv6Nt5TLQ6HrIVk8bXgIwkYJ40v4ip9jWDO+Ht84kuPQJcyZFU+ja88UoL
         lXSQx5Eekz8lGoF1eedp9LAJA4gijyr6GP4Zg1oaUgIUz134Cf8WbAS2dadv0shZWkuS
         /ykjjwvdD6UVqEhXYKQEXlIe8nC/cSJPncfMdaosNkm3cPfolPlYzCm9uZj6mkjip7SX
         Uq/SmzRAq7tTTwGZ1Wzqi8UKiFt289pw3j6V2MSCSrj8LwEuNrxISa6nRnAZ5jSTYMaG
         Dj7deqBS/ZytWG17D+dyOg3A+asT2P11mIIg+HmsYHIG1V+0z2hpVLDmuguVC6c55JRa
         rdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228803; x=1688820803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+w0DXb+KJnwyugAvGaMzfdLL4Qyi7E6pl/fJpCqVpM=;
        b=jhEaoVrkAupyHxQoxbN6MnTFcvgSjtYRyCdzLQNuQtM2eYgScRcMK/7g3MJvb9rFrQ
         WfeiyUx/RRVSTfB0sJ/LkIC5V1Xn5CiTQWKEb5M4Bmeot9LWJFUFFXKZ/1vZmSmMFwdN
         eqNzFITtYBuwwrS5Vm9v10DA3W2Z5QZ0sLHfmXnFSukflwq/I6v7fdjoOS0LTzdEoAri
         q+im7sNTtfpg8jvNO3Rv010QIEhOvHMDJlzKooOGYME4WYG1mNVIDquML3h5RcgtCJG0
         R7cbY0VzdR1p5oTWEKh0vs2RpL0CbRji9+lZPsTskNIPecotk8WRQCjzlFA541G19HIX
         Pubg==
X-Gm-Message-State: AC+VfDxu5JIvs/8KrPuwnFdCdNrpk+eoV485OIm4oE3h6UdEQKSC17oT
        1/1mLlS0lRxsnvuBn0RrnrHvEQ==
X-Google-Smtp-Source: ACHHUZ4wpFE0EUAqye9xqotGMvLhmDNtxQgVPciIHKq5+W8ucJFxGbhCwGQiHBHnx+hk4/2wS73nvQ==
X-Received: by 2002:a05:600c:2249:b0:3f6:cfc7:8bc7 with SMTP id a9-20020a05600c224900b003f6cfc78bc7mr1277609wmm.17.1686228803298;
        Thu, 08 Jun 2023 05:53:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003f7e4d143cfsm1894032wmc.15.2023.06.08.05.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:53:22 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/6] clk: qcom: Add lpass clock controller driver for SC8280XP
Date:   Thu,  8 Jun 2023 13:53:12 +0100
Message-Id: <20230608125315.11454-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
References: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
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
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/clk/qcom/Kconfig            |  9 ++++
 drivers/clk/qcom/Makefile           |  1 +
 drivers/clk/qcom/lpasscc-sc8280xp.c | 64 +++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9cd1f05d436b..263e55d75e3f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -551,6 +551,15 @@ config SC_LPASSCC_7280
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_8280XP
+	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SC_GCC_8280XP
+	help
+	  Support for the LPASS clock controller on SC8280XP devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 75d035150118..e6e294274c35 100644
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
index 000000000000..4a0470fc6153
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -0,0 +1,64 @@
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
+
+#include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
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
+static const struct qcom_cc_desc lpasscc_sc8280xp_reset_desc = {
+	.config = &lpasscc_sc8280xp_regmap_config,
+	.resets = lpasscc_sc8280xp_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_sc8280xp_resets),
+};
+
+static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
+	{
+		.compatible = "qcom,sc8280xp-lpasscc",
+		.data = &lpasscc_sc8280xp_reset_desc,
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
2.25.1


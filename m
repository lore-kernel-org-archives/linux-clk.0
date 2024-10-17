Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF432D05E
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 00:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729126690; cv=none; b=jzl/FRCRBF2zI61AWyV0l/AMLO18NTUE5/N1DvbeP/REjEewmpIku6IyRUvZSWEp4/Iz1eaVCNtzWL8E4PwmmWs8f+AlfxNPI1n6aA4HrVfad68tqskZWmbrbxTe9SeZ/0PIgliAMba3+8V5Do2gelrZDXXG5xNpyyM8OcVvOpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729126690; c=relaxed/simple;
	bh=Kydf90Boptxr2z52VNv2OFtn2CG3mVnzY9BbDsSibD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgSJzWsp20CDrgTye94M2U9R+bNc+RiEVsOBWVOueTXTB0Daeg4Kzqam2K5DexrJ1LjT0Rl4NCQnNenyFfghO7VPjFuD45Fb3uxVZyO9+sE4JX+GPTuCcpKIPE0as3rqFOOnbuwLgwxoiaSUedH/EQN2TAKt/XQQWjePDrIr4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggWXV8p8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggWXV8p8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so5440685e9.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2024 17:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729126687; x=1729731487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNexrbHaIqnB+mzCZSc1HSIpWs6IThzjJ0LX4I5tIz8=;
        b=ggWXV8p8UYGrXoYH/dTGKTcgxb4H6+g8YN5RangOHiEtgcXGbHPCPByH5fSFvVuQUI
         /tYtOFLPdpUO4UPN8pHI8V9hhffyP4e30FyjDDf0M4SIKEEZkRCgGaDex1NyCJYozXo1
         bh/Xwp0h3HcKB9Fv/LZJxhopeY96Gl8AREYXCHwa9xiCADhZKYSvJuDiMDt7X825RuYc
         fo3DJPzewEjYbMVRPaLtcGIwhhDZgxaiobFS2Cgm7VYUlICxRzjAaMPdGdrYCjpZa+Jd
         b1yrUUNrB6UCrGV4iX5FDrvnhFk9kq+q7bxeCabbIKMRlqAsAUIGoDoFrn+pMsPAieyr
         eZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729126687; x=1729731487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNexrbHaIqnB+mzCZSc1HSIpWs6IThzjJ0LX4I5tIz8=;
        b=icw1dqJiyFQ65oj9j2AnGp1XS+ZlMXQ8rdpA76WxVPi2ssmOKhwPnGAFDUIdVeMi10
         hnYn0fdldCIahP+3SIiJ8JiIuxjSm0DV66Ksdb66AKVpQ2RNYKba/k6xdLJIxSw/8wMm
         Bb/ufQTK2n6unL33pV/NqLZJBgzbiW1fOTGK1iHfPifpTcZA3g37prB4V0Fqj5CnNrgK
         uhQDwZcwnNQ3K7CrnIISS+16w9ALYRUivzBKm9kpSzYlAAMPWbZUKUsh20hqspxN62Mh
         U+d1MPRzvHgvw500EOmw6eAtooyD9bY9/VF6gDTshX7jx5hf2Pnul/nLCnsLSgatf5l3
         HJkA==
X-Forwarded-Encrypted: i=1; AJvYcCUgUoj0SEpC/pS8w5NQxA1GGUr2eVLNfMlUCE77MK9A1o67B3SyYP8YXY80wBMoXig2F5XDVzudg9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfpcifcJzYJzY490QWEn57vdgdq/5WXUTHM7JdT2hIE20CnnJ
	mO+2iX8ZCNK/PjYnUm5jxttfhpDfrC1s+GvbSRlP3cXRwkXuG69evPSg4py1BWM=
X-Google-Smtp-Source: AGHT+IER1r3RSb5pUx7dVyVomfRFMbqK2hXWA6j2nAh/cEU/GK9jdUnH19/CakJZYSPggntuUB0Lkg==
X-Received: by 2002:a05:600c:314c:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-43148474899mr71701485e9.7.1729126687257;
        Wed, 16 Oct 2024 17:58:07 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa9053csm5657259f8f.59.2024.10.16.17.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 17:58:06 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] clk: qcom: Add SM6115 LPASSCC
Date: Thu, 17 Oct 2024 01:58:00 +0100
Message-ID: <20241017005800.1175419-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017005800.1175419-1-alexey.klimov@linaro.org>
References: <20241017005800.1175419-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@linaro.org>

SM6115 (and its derivatives or similar SoCs) has an LPASS clock
controller block which provides audio-related resets.

Add the required code to support them.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[alexey.klimov] fixed compilation errors after rebase,
slightly changed the commit message
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/qcom/Kconfig          |  9 ++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-sm6115.c | 85 +++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 30eb8236c9d8..b6b68fc5c3f7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1173,6 +1173,15 @@ config SM_GPUCC_8650
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_LPASSCC_6115
+	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_6115
+	help
+	  Support for the LPASS clock controller on SM6115 devices.
+	  Say Y if you want to toggle LPASS-adjacent resets within
+	  this clock controller to reset the LPASS subsystem.
+
 config SM_TCSRCC_8550
 	tristate "SM8550 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 2b378667a63f..16e65148066e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -147,6 +147,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
 obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
+obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
 obj-$(CONFIG_SM_VIDEOCC_7150) += videocc-sm7150.o
diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
new file mode 100644
index 000000000000..8ffdab71b948
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-sm6115.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, 2023 Linaro Limited
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm6115-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_sm6115_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] =  { .reg = 0x98, .bit = 1, .udelay = 500 },
+};
+
+static struct regmap_config lpass_audiocc_sm6115_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
+	.config = &lpass_audiocc_sm6115_regmap_config,
+	.resets = lpass_audiocc_sm6115_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_sm6115_resets),
+};
+
+static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
+	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
+};
+
+static struct regmap_config lpasscc_sm6115_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpasscc_sm6115_reset_desc = {
+	.config = &lpasscc_sm6115_regmap_config,
+	.resets = lpasscc_sm6115_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_sm6115_resets),
+};
+
+static const struct of_device_id lpasscc_sm6115_match_table[] = {
+	{
+		.compatible = "qcom,sm6115-lpassaudiocc",
+		.data = &lpass_audiocc_sm6115_reset_desc,
+	}, {
+		.compatible = "qcom,sm6115-lpasscc",
+		.data = &lpasscc_sm6115_reset_desc,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lpasscc_sm6115_match_table);
+
+static int lpasscc_sm6115_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = of_device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_sm6115_driver = {
+	.probe = lpasscc_sm6115_probe,
+	.driver = {
+		.name = "lpasscc-sm6115",
+		.of_match_table = lpasscc_sm6115_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_sm6115_driver);
+
+MODULE_DESCRIPTION("QTI LPASSCC SM6115 Driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


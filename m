Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6642F3C2C
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679243; cv=none; b=SODj3yqPLUDXx+McPPXp7VwojAlrkaxru2txHil93zi3XR9S1onizCooeL3Gum4tnBHRpCSGyWtvTTjUbjxQ0ArRriLkm/DV+SvchBrswb+U+agAz8voe0uDTttb0fOrCGpkx94hDvGGxN5PYFKGT7H1t3OQJBFIp0a7Uxx+EiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679243; c=relaxed/simple;
	bh=h4mVcnnC/+PqRNOCf2U2rD83YN7/FlSU0+4cAlA1d+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lt/2je7NGyKcAlHz/NW+TbvQ2msMP8mgmXVMYlG3SWbSBqf0XLle8hw/doYnWU4Rkm/QWRBjX5DsDvKl4LxMwGkFTeB6fa4TRd8vHMAVPCIIjrpUBHDeMQGs29ujvHMKW35Lu+MqP7mHAm0LakzcIdwJHcrfRu1R/Huly4eoSw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMAVJlvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMAVJlvW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDBp96007378
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=241Uxu/boDg
	Pn4Scavhp/R8zXpk13EMprfJK++uFtmY=; b=bMAVJlvWaXY/5L4B/a8h7tL3UCX
	IN8MtKDfanrVVLznNKDf5txJTDlxWKL6J5i+/Uwyl1BStrVWexLsRFitG+pF7qUk
	BuegnXZXtVlyuR04s1DchPyJcCXQaF7jAPNwOjHJXcV6vx7FQwAg8Pw+IyDSDs8E
	P2X/MYTg66SuwSmtHyyz/V4HzZjoBS2wr0tWT0AWemZqIr4CZ3rUJzkKYKVCeC02
	gqZCQPAd2KYN2B2jt+od0ogy5m8JHflacSUBwwaYuCiPE2HdUPzgFEgzurxhPWd5
	reppqwfmZFeQ0SAYAu+H1i7TGL7h+xesPfiTKZJ13e5Yjj5D8dUh0x6rT1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5vp1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:20:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b39280167fdso5280921a12.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679240; x=1753284040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=241Uxu/boDgPn4Scavhp/R8zXpk13EMprfJK++uFtmY=;
        b=IV6i8I2PcjevBurOr4kn/YCxaPWg3LMq4M8GDop3eqgQ+qbePH4Rw2Jc6mXxJlY8u/
         s4MjFMr+JXnmy/oUJI1ojq+RXzYkcNEHtxf2SIK0bclWS4ny3J77BBVOk8TB/d6bxAnr
         0yS/VwYPP9AdWo0L/MfO8yWwjPff4lGdiqflxzqMGyMyHbe5IiLcBzV6Q6rcP8XeQ1p1
         O4wzhrvfekQoQdJU7QGbVp8+Rbf3pOGodpeoSxRM/2gmFQebtlmLb1s1rcyHGanf6YaX
         I+f5Fxa4qcReb0NzbYSvqSNiyOskYkPcbyUT1ckoPYD2G6vRGSPSH4zWbXV0TJLCQrQP
         qmKw==
X-Gm-Message-State: AOJu0Yy1Ohop9nmAmr15KVOyV7ba22Rgb2sTOHld3O3s6jGEkBTzAsly
	W9/mKlUgNWOUZiZfwECvC0rkUva+Yaa9AYVgPoIEKg+qoPwNUVBHcLR7nXIEAonNOY7vx8LlS1q
	DbbuZj4uE5CkSyIDCwvPfQQS7yBNmfzB2vOEtQIK/t6nB9Dpbyc+oDjWdF5ob/Ew=
X-Gm-Gg: ASbGncu9fhftcfBPuGFlzojhzpiy+cPneb4zSfP1Zp8XLgdXHyzdPLBzRFDX+CwSx+p
	l9jiFzsPut0hJydMZjEBsWnA9F59cQrc4bJI/SBMqvbvaF2Pe823U+DCNR6ytT/j/ScUhm2p/Xh
	/H+wPFdv2kWuHPGoalFmIeSMDnMLhqIwSM6fjz/IWIQSjTDD+m4zb/UvNIHRFhPdBbfPllMXBcf
	/qWzLj9l9+u8tEFgX/FRw6+L7x+OQRwCbP/0Sg3QOjUnsfZmSLPJQDDSRDEVJVPVxh79aMajyba
	EyME+2JaTPF8rcsrEzTKzNJGret5D1faXXk6MvRZRnjJ/gjBqps+LkvsS16VW5IPDY6niwlnXmu
	OpSXlAepUbEFN0htVUNzjOSDIRapZBG3pM7uEOZCoc2vByBDNN9eOhUurJ4Yd
X-Received: by 2002:a05:6a20:3944:b0:231:620a:4509 with SMTP id adf61e73a8af0-237d753f9eemr6099953637.30.1752679239823;
        Wed, 16 Jul 2025 08:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGl54paG6PWCVHkTt8cMYgI8d/ja4vfmT8FWzZ9z0rH+y1X1yn2oL18/ttlKBtVbVA9SH6w==
X-Received: by 2002:a05:6a20:3944:b0:231:620a:4509 with SMTP id adf61e73a8af0-237d753f9eemr6099898637.30.1752679239185;
        Wed, 16 Jul 2025 08:20:39 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8f8sm13912054a12.38.2025.07.16.08.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:20:38 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] clk: qcom: Add TCSR clock driver for Glymur
Date: Wed, 16 Jul 2025 20:50:13 +0530
Message-Id: <20250716152017.4070029-4-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877c348 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Faslhf6HPDYYN2OqSgcA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 8nrvQDEK-4dCOr9VV7MWueUenGGOyrhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzOCBTYWx0ZWRfXzEExCP4jGor+
 yNai73hIWRuQv0x5AQ4HtsEVpdN/J+X6PQ51AjfEtjMefJTSOOEIjpYKl1+4PQtGPF5qIaExB5J
 wPcPTjCnWQRDAlrXGfPsS0fer8cqWkjQpde3RBiIFMpna0ruVkXnNO9Vc16UD2mosDUDKEf1TM3
 8j+1t4hXS2KkCVJ8Pg0kcR4kCMJ7awh6hsNUAm60Hq/D9R4daajw8+q+3SMflsps40BMvu7VjeH
 hUlZ2JZtHlBx8QJiVbzsBUpSDby7hKz4mL52oZtxUBjos/+iSv//HNi99CMs5yEQDPEHHC+Rt8P
 OkcIlL8LjQz8uDGpGMzl42/NGZRhaXvJM0uv9O0SUm8QnNTMf0IzrKxE7DEuWWhQjD6z7gdOR0s
 pKu6JYL5b7kXMTe5q+8UN2Wn2WywLR6QhvKzF3CPYG0V4bUhOhv6e3GGR6bEhrVgXq6jik9d
X-Proofpoint-ORIG-GUID: 8nrvQDEK-4dCOr9VV7MWueUenGGOyrhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160138

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add a clock driver for the TCSR clock controller found on Glymur, which
provides refclks for PCIE, USB, and UFS.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   8 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/tcsrcc-glymur.c | 263 +++++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 drivers/clk/qcom/tcsrcc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0..051301007aa6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1304,6 +1304,14 @@ config SM_LPASSCC_6115
 	  Say Y if you want to toggle LPASS-adjacent resets within
 	  this clock controller to reset the LPASS subsystem.
 
+config SC_TCSRCC_GLYMUR
+	tristate "GLYMUR TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on GLYMUR devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
+
 config SM_TCSRCC_8550
 	tristate "SM8550 TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ab59434338bb..bf95729678f6 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
+obj-$(CONFIG_SC_TCSRCC_GLYMUR) += tcsrcc-glymur.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
 obj-$(CONFIG_SM_TCSRCC_8750) += tcsrcc-sm8750.o
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
new file mode 100644
index 000000000000..760d36339b10
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-tcsrcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+static struct clk_branch tcsr_edp_clkref_en = {
+	.halt_reg = 0x1c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_edp_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x4,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_2_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_3_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_3_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_4_clkref_en = {
+	.halt_reg = 0x14,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x14,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_4_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_1_clkref_en = {
+	.halt_reg = 0x28,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x28,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_2_clkref_en = {
+	.halt_reg = 0x2c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_3_clkref_en = {
+	.halt_reg = 0x30,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x30,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_3_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_4_clkref_en = {
+	.halt_reg = 0x44,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x44,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_4_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_0_clkref_en = {
+	.halt_reg = 0x20,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x20,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_0_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_1_clkref_en = {
+	.halt_reg = 0x24,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x24,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb4_1_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb4_1_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb4_2_clkref_en = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb4_2_clkref_en",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_glymur_clocks[] = {
+	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_PCIE_2_CLKREF_EN] = &tcsr_pcie_2_clkref_en.clkr,
+	[TCSR_PCIE_3_CLKREF_EN] = &tcsr_pcie_3_clkref_en.clkr,
+	[TCSR_PCIE_4_CLKREF_EN] = &tcsr_pcie_4_clkref_en.clkr,
+	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
+	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
+	[TCSR_USB2_3_CLKREF_EN] = &tcsr_usb2_3_clkref_en.clkr,
+	[TCSR_USB2_4_CLKREF_EN] = &tcsr_usb2_4_clkref_en.clkr,
+	[TCSR_USB3_0_CLKREF_EN] = &tcsr_usb3_0_clkref_en.clkr,
+	[TCSR_USB3_1_CLKREF_EN] = &tcsr_usb3_1_clkref_en.clkr,
+	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
+	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x44,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
+	.config = &tcsr_cc_glymur_regmap_config,
+	.clks = tcsr_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
+};
+
+static const struct of_device_id tcsr_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-tcsr" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
+
+static int tcsr_cc_glymur_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &tcsr_cc_glymur_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(&pdev->dev, &tcsr_cc_glymur_desc, regmap);
+}
+
+static struct platform_driver tcsr_cc_glymur_driver = {
+	.probe = tcsr_cc_glymur_probe,
+	.driver = {
+		.name = "tcsrcc-glymur",
+		.of_match_table = tcsr_cc_glymur_match_table,
+	},
+};
+
+static int __init tcsr_cc_glymur_init(void)
+{
+	return platform_driver_register(&tcsr_cc_glymur_driver);
+}
+subsys_initcall(tcsr_cc_glymur_init);
+
+static void __exit tcsr_cc_glymur_exit(void)
+{
+	platform_driver_unregister(&tcsr_cc_glymur_driver);
+}
+module_exit(tcsr_cc_glymur_exit);
+
+MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


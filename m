Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A82D3A96
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349374; cv=none; b=UTBmXOMyqkM4sQf1zFJw0ghDkorwtS5rciBlDZ3hsvOQRlweUDzV0lNeHA46RzAmaNoTz8J/NQf7lfsmFIpKYfpEyFDsWlB/YaAzZtYW9wYaT6Ub7Pl6mV4klAKRmeB6xxHQfgqQKgPD4DCL+jaGuKruXjw3BiiYk3Cm+3zI/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349374; c=relaxed/simple;
	bh=eg0SzanF5TxCr/HLqXggM/7Hm5yLudB3WWb2HcM/Ajg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHVZEDqMVXmBU/HzB7Nq013741N0mrI62goV3b2nsY7KrRzQm3v186Fd9hMMkjZ6KPiTsnxTUL/AsKAXDayDCs2ziMW1wjX5zFQbMMN6bPNBMg5jD6keTfdW29NMVzeLTDw/4iYVavLlpPKtT4pGqLyNXPbMx3CLnydLXwbiCuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqnK9VDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqnK9VDv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXhq5029601
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYNTbhy50jLqfum7J46dRHMuDOU/3KyzNZLOkILGVrM=; b=OqnK9VDveNveRhtN
	D1cxFiuqMgyyOwjMoU7xFgTSKTrdDQpiYCq9EO5WMn7JY24fwALwUJg48q88rd5T
	hVqvafllfH7qAbz7CW6n2F1lmG24Ec/PptRW7udKJw4WRvddFkWuxJGloehkx+i+
	1L+CSSzQMroVvGHxRxvxVu+rt41rzpk0DPMK2BSQEe8dtQ7Qviz2d8cUn0ccAUQ/
	QvUcsGGmf3RYD/vrus087ySfm0VPA4qzxe4jFV01R91OrpVeH0m8pxXHFaF5E/z4
	uucYNZDNtOasMyHbn2q8zuz3MaaHn46uNnKMEo1+66AbHpZWoFG8aEPyPDp+ua4I
	HdgFZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1fh6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 09:29:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2355651d204so8169885ad.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 02:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349370; x=1753954170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYNTbhy50jLqfum7J46dRHMuDOU/3KyzNZLOkILGVrM=;
        b=W2fjl9qGmCxsBfNH9uZrmm9W5S5KQ+FHeCfKJ0Kw7X9NJ0r3M3BnEbJCMj6wvahCJi
         f8gsX2Ku23fNuSNTtLY6G0L+ucrkWzm2Ts9CA2pDxbYdrPtl19YA2pIKcqdj019I/Jt+
         ZwaEorXy/lTpU6sY5VjYNBfnkfpmfZBgKpaQXOsaApDWFKvUnLoMNG+wOSoJobAce26B
         Fdu/jr+hn/fkK2XetCwbuMeUnZWAkTgetvCbORecuT6N5sWQgl7nAKM5+dz2Yn7EbNS3
         JtC/rmEfkIWCiCiyXHJhMq0isi7HgIJ5GMz4UCFu7OvhtNDVOErVlYLMkbYu6gGveagK
         21Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX3tXjhV9fJC+Dqo7Tx4Codb9hK00sWtDUihMvzaOtllH/ZlV85oUoaAkwSmymYXN3YyAPdKxRlHM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLNaw2paRAVI4IWdE/wZ7BpxsaV3lUnvftaQcYY7nG8dpjEKz
	V3y4yRMmh6zBEWgkLdWjVs8obyTV2Co5ge7JJHyGlIxiW2mRjlkLCw3OCBOMHVh8E9jdWc1e6cp
	dYiMTARbKjHvJD4rPe3OVIXAro2QwKJJcDZAD8NtX2u7s6fOzJMAPuDqPynFQAfo=
X-Gm-Gg: ASbGncskOSM/2yG9CNu8uLzC8oTTxGSlYKSue1uVNtkkFdhm6TG7SwmoZpDJwajPH1p
	ciBY68YwlrzO0q7wRRdHryx8E2A2gNKtCK1HedkJAp7Ezu2sObcmpWjRmWzhqEMoVIeNLZJXYbT
	r/1sOjsnSRhiHJ/FHwo/d7YVtBbYc8MQ1D9GbeV0pRFAV+AsINjzc5OBu+vNPUo4l+En58DJGX2
	AnNRWH4W8XI7/GQjksJJwZ77wJyw4CK2g3V8m8FZSnNTdDETl9zhcyYMLw1j7mSU7I4X9L6ry9m
	+G3WosAArOLerzLQFq/mFiTZ+L99W0JoPB+KWRM2yyioflH4bFsBbZEedrKXQ5DY
X-Received: by 2002:a17:903:3c4b:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23f981bb450mr117912085ad.29.1753349370191;
        Thu, 24 Jul 2025 02:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGFlTWEcjcMWNG0q+KCM93oh0fVbffxgoxjAdNu4uowXAe71wmyjDClIY9NUqyYt+ee24L4w==
X-Received: by 2002:a17:903:3c4b:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23f981bb450mr117911645ad.29.1753349369705;
        Thu, 24 Jul 2025 02:29:29 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:59:11 +0530
Subject: [PATCH v2 3/7] clk: qcom: Add TCSR clock driver for Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-glymur_clock_controllers-v2-3-ab95c07002b4@oss.qualcomm.com>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
In-Reply-To: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 4KHme_5iEGPUTAyuzOy4w_GBQ7plfcq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA2OCBTYWx0ZWRfXzZ5ISxVObmOM
 2a8FQcmwScCG6F2xguzIWqiKtFMDuHJgTpxFfOhIgGjBdN4aH9cipAJxgd/kNVt392SkKD6OAzr
 N1Qh28Ja+omqkz3twDqfbB5yYadd/nQhqqqiEtiM8cuh7xVW8WJ2A4WUntEK+MZ+9P5niQjYpzE
 iMzJHRs1ysh8X6mMPCx1BPuhHsT3MgG/WNpyUe33G3K3xJVy1cD9n+8ZQp76zO499iUc6Agy5b1
 KHRNwhZtgMvkQ5yZiJe3zcZxgidWaTZ0LBfmHw1k/ABh6Z3x+4iVwZ3anmoD2TTVCGP7KpOgYax
 c6G7kMOoKoMjPD60BiT3p3uUZYFjObOoGS8p6fgruKaBAOG1Bm+EdjY8NzUhl2HME0OGdijgtCi
 jaZ3sHmDLfcJ00U9qzpeEUHeu6zFgboS9MZF/V+DYGUPb8UrRBTD2bPEEkgoLedZsD4dQ5Pm
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6881fcfb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Gy7E3jco3CzYnCXRI60A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4KHme_5iEGPUTAyuzOy4w_GBQ7plfcq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240068

Add a clock driver for the TCSR clock controller found on Glymur, which
provides refclks for PCIE, USB, and UFS.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   8 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 266 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6cb6cd3e1778ad3f2b6af3b8ebf22c7fb927cfe9..60fdda23674244adf9d7cefa896a887d9c8eb885 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -19,6 +19,14 @@ menuconfig COMMON_CLK_QCOM
 
 if COMMON_CLK_QCOM
 
+config CLK_GLYMUR_TCSRCC
+	tristate "GLYMUR TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
+	help
+	  Support for the TCSR clock controller on GLYMUR devices.
+	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
+
 config CLK_X1E80100_CAMCC
 	tristate "X1E80100 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ddb7e06fae405de33c1cd4a68f4cf976f503c930..6a1099600fdd411c105489fb1bba6235dd77f380 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..7debfdc87a552a79bc081f28c34ae18e031ff2e6
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-tcsr.h>
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
+	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
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


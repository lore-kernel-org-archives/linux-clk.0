Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6004949EF
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086302; cv=none; b=a1Wsvbpq6YTDp2jsv0KZtuVwjsMRhKK42XDtGYlLjw7HHksdyIJuFn2YisRlZm+qocpoHS418bOjuSLL0Rjfa02ZYUR+lRErpWUT5MQO9r0vsImueIwJXDGLcJWMqtK1uoRBP3zyYajwU3PZHEFYgbcvaWJr2ZErgN5Y092zW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086302; c=relaxed/simple;
	bh=ZnNgSpO+rDe+yjBS+MiU11AXoaRoAFc5EaHISqIfggw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRyiULavxFLAgi3ejWyV/TXfEiCcO6BBR7T4KwfNA4g5CthbX7n8WbAHedk1zsq+SK+7+Ytbc4xLpWi5nSTgSPnzIgiaMP9OX2jDF8cfgazpxO36cq9xfUFRdrH/9bNfBIlnlOZCRSVVc+zSZL9PqHylDvK9H13kHU9OnO59+b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqrAhnF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqnQ3yrB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqrAhnF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqnQ3yrB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646ELaLx2428125
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkow89ZOZQzN7WmylajJzM+goCRPh33PqTU7SObuX2c=; b=kqrAhnF0ScuIkR5L
	efSWmJ5lD+OfBT0DLzrkol1gkwPGUjfiFIfuoBtruVBxlhsUPpvwuGF6T1GxnNfL
	a9QtdcvShTD9OpMbjaT+bIIH9OPF5iccLYtmes85/1bwnsZnzwDXW3++SOd/wfic
	eRMp2GRRzb5pWJHZM7VyNz3zVdG+qkyYl1/MhmDrImAcJCDDT4F8MI4IHw6GaI6/
	moD9U4EeLbVn/tuhN6PqUpCIbYljIWBLS/7C+YJr0oniNt/iH6HeJVwUrzHU/RUS
	r+0rKf9U3nlymyjz4WDr6AqmoZhu9q8/ZwSMcFnUGC2b3vSmk+v55TSeCTqRirMf
	YSLQIA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph23e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1309f4ee9a3so3211568c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkow89ZOZQzN7WmylajJzM+goCRPh33PqTU7SObuX2c=;
        b=HqnQ3yrBzOnvpiydn5G6PTYHqk65PVcaKOyveV1MQpujxozohPbpO21RVCFtCkvVxp
         6AYIULEGgviVMim7u1oRjta/2CWW3TVRPABe7cD3hC845v3zF/PGLdTkWhQcjNu49EgS
         LiTD7NZW4SFja8V7jqVEZ4ClDp+co965KGFOMG84sOR0GvcuSJof5ts24ddF0n37TE9K
         ktUmM8Y7tdvFF9GGiiig5D7lOjjpr69jRnCrIw3AmlUBkSsZqJsZyZsqBz2U0el9vacL
         CNe+jobMMIg8liwfG8DPJpB8lcqRip6KNBVow8u1bElMtwqYWQOb4n3eaBAEOkpHNWzA
         qaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rkow89ZOZQzN7WmylajJzM+goCRPh33PqTU7SObuX2c=;
        b=oAxYdI0jc8ws7Rl6BiQa89cM3ofO8lVVfvpB0PUXctEIMlOdGvgWEzsLmLm1P6Yls5
         P62pqo/hevGs89+kMBve+AvRKIlMLw+dDzl27j1eT6gDSAMXu+U/2D04HDbNm3dNdYnq
         TjhvIikejJIPzXeIifQ0YkDDM09rMiEY3cEkZHclW24y9FoPV5Dxa2i08m0JgVbCG8xX
         ARWQOWBfjoMzIahEGyRUO0hSJRBVFqS1BlplAh56H4k0umFV0fPu9/mGfouI0W2AgEHr
         P0qa0UK+BJJN483ZgMs3EZ0D7BlMIpPwgECeURJpMaShWW+ZtCtrLvej2EStL8CqeOTk
         Eqxw==
X-Forwarded-Encrypted: i=1; AFNElJ/Zl7Xt3g3kGR/7rbTfIKgygI2uqaOgT8Og9680q9hB6Oji5xkzUST76MEtHsYvnuqR5V6WVN8mmbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtj3T7Gr+xocUxVffMThiB2AYY0WfeHDgf744INmoA4JdhV68
	32hLa6OeIoXa/cXh3fJN68iieGQecFbrVDN/Ngax6c3i9YdcbhOtN+SLCYvh93XjWbYhjjXStTD
	tHar7FfEZqat1qaiOLMkSD8X5FJb77H6f+0qhplKC9SHdaGNLTiyjOEjnwWkExGc=
X-Gm-Gg: AeBDiesGfNi8KW7Mc4YcZIDue79xcwZtUt1hccakbQSFoHk/n8iVGrd4u7enQ2R700B
	kxt889/p1NwtRZs8UKX4+rdRY7oQRWfuMnwd5/tGVyiT9vHTAxUj6zOKD/Sr7whN0u8wfRam77M
	QzHnUHxYguQ0EpTifKq3SqCHaqHAruefSLhJkilsPWzOTyGsniPuHE+OCqiHaHNHkg7BR01am5E
	m5FnI3By7IDtSUyT/RkrwQt2XhMhuSKSvMLwM1CTXAs7NmtMcFv3/0oBYbTzFFoOTc1ddGaEJBf
	Uo3UQbJoZDV2/kAwpEUWWYWlXKsa5b5AHUgkqyuth9995DY0I9pq5fov2j83umUpLC2B/p+aq90
	YSGpHe0BULfy0kKC3O2sNHw7cTipDA9mRNrZcDUvL/mkUxukeHXcN/v2pJ7R+7QhuZq/BiuRVRu
	CsKNmvEXjeTrU=
X-Received: by 2002:a05:7022:fa9:b0:12f:1f67:e744 with SMTP id a92af1059eb24-1318eb518a7mr2029527c88.44.1778086294607;
        Wed, 06 May 2026 09:51:34 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:12f:1f67:e744 with SMTP id a92af1059eb24-1318eb518a7mr2029498c88.44.1778086293914;
        Wed, 06 May 2026 09:51:33 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:33 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:44 -0700
Subject: [PATCH v3 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-5-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=6233;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=ZnNgSpO+rDe+yjBS+MiU11AXoaRoAFc5EaHISqIfggw=;
 b=44uPQNXToTXGtWBY/tywIrO8ReAZNvLxKXceYuJyPBmp2C1Q+wEJMvU0Bu4aGdrKk0kheMv32
 m1r8amzszbVB/3sWciX5Bcm7pUsbUFIYzC21YgMBfJbT3UCr5UqQ6Ys
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX+TKu8/JXlpsN
 SNmGzm+XkIHTkqg8dTj4dwTZQkz/yS2VjtmpTK1kNdTNO+bAhajY7QOnJbSGIy+65g0yJAWgQPh
 ALOTP4fjIs2gtCWQ5wOvWuBoN1SpMFTM+toA37sbaT5MsBi4VvYWKp4O3gKGav4U1CEQJ8GuIBJ
 rAFwSIJ8H7Nsb+iDwMfzzpvFTTS/k5FKd1vsTSN0UmPHSsjWumzx5cr+G+x7XRPe5QaqxPtmF71
 DPH5QJV6tmGzruvMdMEJg/KK2Yp8D9eADr3aJycPaf2TZT2pUr51ptrDBIEUEm6P8Jahb9XpOLo
 0xSqInpX/Ot5N2pN+dW/AwT1ChFXH/JVW3iwUnRzUf6SbbR2SHjXSfonp2hSmzM/PkA5Ux+c0nT
 k5yrv8bcMQdbqd9jWyZPb9EQnr7EqsVg6r2PVBOX2XcJW2dlqzNFQWL8fWRswlH/z/ksX68s1mJ
 aVn6T19O/bfld0hJdvg==
X-Proofpoint-GUID: 9XTKQs5Nmm2Ew4xxVkC0RoTeza-q8fRt
X-Proofpoint-ORIG-GUID: 9XTKQs5Nmm2Ew4xxVkC0RoTeza-q8fRt
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb7197 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8uJ8VFNcneawzIKLpTsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
This controller provides reference clocks for various peripherals
including PCIe, UFS, and USB.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |   7 ++
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index df21ef5ffd68..86914bab79c9 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -296,6 +296,13 @@ config QCOM_CLK_RPMH
 	 Say Y if you want to support the clocks exposed by RPMh on
 	 platforms such as SDM845.
 
+config CLK_HAWI_TCSRCC
+	tristate "Hawi TCSR Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Support for the TCSR clock controller on Hawi devices.
+	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..282b1dbe2585 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
+obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
diff --git a/drivers/clk/qcom/tcsrcc-hawi.c b/drivers/clk/qcom/tcsrcc-hawi.c
new file mode 100644
index 000000000000..c942b0c8e09f
--- /dev/null
+++ b/drivers/clk/qcom/tcsrcc-hawi.c
@@ -0,0 +1,158 @@
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
+#include <dt-bindings/clock/qcom,hawi-tcsrcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO_PAD,
+};
+
+static struct clk_branch tcsr_pcie_0_clkref_en = {
+	.halt_reg = 0x4c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x4c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_pcie_1_clkref_en = {
+	.halt_reg = 0x0,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_pcie_1_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_ufs_clkref_en = {
+	.halt_reg = 0x10,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_ufs_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb2_clkref_en = {
+	.halt_reg = 0x18,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x18,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb2_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch tcsr_usb3_clkref_en = {
+	.halt_reg = 0x8,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "tcsr_usb3_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *tcsr_cc_hawi_clocks[] = {
+	[TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
+	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
+	[TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
+	[TCSR_USB2_CLKREF_EN] = &tcsr_usb2_clkref_en.clkr,
+	[TCSR_USB3_CLKREF_EN] = &tcsr_usb3_clkref_en.clkr,
+};
+
+static const struct regmap_config tcsr_cc_hawi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x4c,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc tcsr_cc_hawi_desc = {
+	.config = &tcsr_cc_hawi_regmap_config,
+	.clks = tcsr_cc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(tcsr_cc_hawi_clocks),
+};
+
+static const struct of_device_id tcsr_cc_hawi_match_table[] = {
+	{ .compatible = "qcom,hawi-tcsrcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tcsr_cc_hawi_match_table);
+
+static int tcsr_cc_hawi_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &tcsr_cc_hawi_desc);
+}
+
+static struct platform_driver tcsr_cc_hawi_driver = {
+	.probe = tcsr_cc_hawi_probe,
+	.driver = {
+		.name = "tcsrcc-hawi",
+		.of_match_table = tcsr_cc_hawi_match_table,
+	},
+};
+
+module_platform_driver(tcsr_cc_hawi_driver);
+
+MODULE_DESCRIPTION("QTI TCSRCC HAWI Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


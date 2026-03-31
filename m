Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D82280CD5
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917319; cv=none; b=tnMIjL75KOxTQlu728eBiuJAOp9kCdJ2DY566JehVKddqnohQ4QTBEw4+z9j5Jn0XF9XxAoc1jFz8KbZ7Bml2I1Glcwbg6Jkdks2IviLgVOO7gMpF2GKJuvZWDQTogykGaYBXoD4PN8pHcCM8YbnclrDdl0FO1APKgD8lLAa8YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917319; c=relaxed/simple;
	bh=iR7NbPxINjAouUYeeIId0ffLvCwiOben9ExgvHA/Awg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OuCEaMuVEpl8K01y7Xyaz1hKDhGpk5tjdVJC1Goe0LKGVtjL0DXFPz/WhQgBJdOee4BDhpfeItQMj8BkvcdYo2Ea9u9N0A0V5xSF9eTd37QNyOD23jwiWJTR2KVYoQUDOvDxEEXI9eZRflQ+hz/z69Pzh7CN5JlONGjq6kxGIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c04mj/ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVuKEZEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c04mj/ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVuKEZEO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKL7Ab1091985
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M63UFBd45xWloYDenKImaYTuEuDt8MZ7ixSNR8M0o0=; b=c04mj/ovHcacXzcv
	zv+8JEzx9ojgcDb2XMXqKIsFEKAgR0Vke7WyzNauUnC8Ce8ZpdlTuphAwWLXy8NP
	Yy6lV+rWgFoEivXn77kprtaMntE6Edm+ShB9pRwt0qd63//5O3jq920XmCj/7wR0
	lyXjlaG+8OKYg563PLIEaf9D7xmksHrnXZQOGgcfcRftz/U9otXTlHL/8dFPqvft
	cFS+35ICSfiWaI3xuYAv93mnhRfMVeyuz2uvYatpy2gFTN2H62eMZKEMXK7fw5Dn
	BKuL3fAX5UYVBgy3lLbWAsO+5VS8cxJa7oPiy7Ttm46GN8fcMKdsdh2opE8KkE7+
	AxCKWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd249t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c7f2b72c91so1492181eec.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917315; x=1775522115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M63UFBd45xWloYDenKImaYTuEuDt8MZ7ixSNR8M0o0=;
        b=TVuKEZEOluy32bz0uQYAtdCsI3nm7l9Z0FAqEVRzSFw9UHNwBZuBouGL7kx6v6hUyf
         a3n6jpdS64mf9bEa3DKz/oN94RGdj9rvgEkpTE618w06hv6wR6d9nHaP9KU0QxMkhGx2
         Wd5PTVlMLuYRcmplp6kSIc06Gyb/N1KthvKBVH/eymLsxVWc10pOaENbb/9pcu5pAhoW
         PbR+RhQpCwqfQ7dlxYTE4BxJ0VLyJ8M7IAWTy1mFfpQT3BuW4cRrS4pQVI74IMHb/OhX
         WLqW87mszJ0Tx6Or+FmESjUGkjAPFqSZv8VAFkv4PjpuB6wrdqGBNiPg9Mx7fW/hFs45
         w/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917315; x=1775522115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/M63UFBd45xWloYDenKImaYTuEuDt8MZ7ixSNR8M0o0=;
        b=h1hxy8GWVnKdY5ezwyFf+vWq/ogk0rM4tYn8YimJ531b72fBMJyJ7G7P7d2qY9zdcZ
         Zg4t01dcAt6aU9pfPnFtzSkjv41qmbb7W0ogvGgc8VwD2a+vqqq5ta5ocyCuysDfr8tZ
         s2/JNi6n2pAD6vetJaRQ17DKqTN1LAbfMUwCZTdgCWCp6xxy6Tx5YtY5cTvXWpybln0e
         zDvJKUQrBOYwDZv2kudmH0ucC21hRpVG5CBV1TkuZLMQ8yxwH2p6GX1U10V6iVKlmN4k
         D74n8alMFiLOa4KcKbtvRE4H0Qu8jo5R+1St/SxwCqStcrvdCkLYVxahTr6/BtOraB49
         Jtrg==
X-Forwarded-Encrypted: i=1; AJvYcCXPZPw0v6W5BmcgqmpZFlKlEyaHn3dP4PepLfVMhQOxJehXO60ET9ruG0bgb1lq2pQ8wM6bR1f/IRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzm+0h5C2Nt5mzfEsQANlQT+mSkfQrMHliBM3gDbpQx1fhPOPS
	PczYARFpj6Aoso3Bg7EL8Rlg6/68M/5izgHjGlcluYQi3QxzuXAlz51L4T1LZ5Qc+vDDZsA2t7B
	NT2gJYm/i396Ep/5xsSgOd0NzMY3KgVzDrN5yXkrSI5jz/Vb4E4f1VwjToKEZCVzdte6phzs=
X-Gm-Gg: ATEYQzyFZd3+kACINwazrbpu29wy76gf7l3rtUY6WOAIAykLNwjWsOTWkJtPYD+9Tm5
	OBfmWExbmZcKUqPnQBbR6cK0jb7251V+PQpvv3y1zFcy36qGpo0H1W3BOr8k5m6cjWMpeJF6+TX
	CP+GmqM8aHYUB4vDIRiYbSbEJujY2McV+KF+LwRQq74bWPj+v5ZvdzUW9/nYsbd6/POxC/Rb48m
	HoJLOl9ERP0kpriejzpMC8mEX3ZaQ5v8BdnZtHp2UAl5w95NemaSalFvsu+UGUX5OzMXyWSfnwf
	48I7wKSL+iEltUHOSC0qJaQUA1awWzlSmFlwT5fP19AhXooi2Bx8BIwCrPPSOUDvaimjszYdbb0
	7a6+mILMhmS0T/7V5z5CSb40Nd2Lw9ydssif+BZO6Kx58yIyoId0vJ1LqwDsplYNwrUiuq6YrnL
	AL
X-Received: by 2002:a05:7300:4307:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2c7028769cfmr2586669eec.28.1774917315328;
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
X-Received: by 2002:a05:7300:4307:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2c7028769cfmr2586660eec.28.1774917314829;
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:14 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:35:00 -0700
Subject: [PATCH 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-5-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=6048;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=iR7NbPxINjAouUYeeIId0ffLvCwiOben9ExgvHA/Awg=;
 b=3GbspS3jHwy4BofsDn+/BuVz0sPsjZkP8jh3m4tK3aIAL5Urt5pjctJCDY55+6tiu1eSeXZLc
 09D0jRSKVtyBrKbJ9+/5MXKe91wqzyZNIQfG/I6E3Cfh5EuzTHK+CRY
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: r_yb3l9xU48RAnldZoXxwJwdKqEqyP5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfXx9rAJNioaJuF
 rfsCm4kdz9XWmnRfFQ3kBLwK4LO3CCy5NsxWk0RL+3lBnXbHCqwIVaShgrnAjyJ/yZ+nlRWJWh8
 ZltpApPSEjEqc+J3dGXALxhj2bgUVEMF9PgRTxRzKpnnlPlanvdV7gV162hedBgszIKyG8Vy0om
 Ov9wae5n8lNjj7rECtx/EWydUT17weXTtF3eIYYIaS+y5EomhnUN+V32vhSKGAlkbJQNnuSzhwF
 FlPbvBFeD1Jz2KmgLiFcicV8knoFQ/X17DgEbQ6iyV03LqzG9Yho2l4B45hsXvrzoGv4fnWWMKi
 lt+1taYwUBKJa9J0JPWsjdpm/t0jLD2utSYG34LuXUGI5RG/0aML17LVe4peF6/AvaUPXPDSytl
 bEJERTu0Y+JSJbB9TGJR3jPcSdVn06RViHoRH8YEUgPU8pTGnVBdz2G5s1zBboI3i55fyZEa4A/
 GL1gLIhQXP4vRJsLXFQ==
X-Proofpoint-ORIG-GUID: r_yb3l9xU48RAnldZoXxwJwdKqEqyP5u
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb16c4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L8n4sJc4XsezP8dVquAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add support for the TCSR clock controller found on Hawi SoCs.
This controller provides reference clocks for various peripherals
including PCIe, UFS, and USB.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |   7 ++
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f55f10261ec..412badb0fb58 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -286,6 +286,13 @@ config QCOM_CLK_RPMH
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
index 103d6c4b860c..e85ed6678e51 100644
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


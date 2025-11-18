Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E62302177
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450261; cv=none; b=ZrfgOSrCia/v6OGvyKMBB8DqyWpiR8p6GOxIszhNdc6p3TwYDBkOSANdKgfyC4bmNujEtupuMkGe68aDTcfjCZi98Ujx65VZ77f77CYpk1NH+S48yIDXJYl5x/aUjYLqhM9WWgkHfn7mDuhLle9k5EOlKKu4Xb+ArL/+02TQYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450261; c=relaxed/simple;
	bh=TGLkXxO2JG2AYEoAIVewlDsW32+17NCrfzYjXohe2Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXG4+Pl3v+YOdLv0cavk7s0Fobn6Ykx1nR79R4fQEw5x2Ug36FizE8O1qt/L81Bi6nd3IBfnUYogusu5AXpAl7W5VuO0z2NL4h6Ke1M8YLQuey3cwZO7cn7GrBz9S8cWplK5Uykjgnjc3B/luL1ruXAeo6lTL6UpZH/jpECcZqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AiSJxmkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLXVsNTd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AiSJxmkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLXVsNTd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI67koJ3671301
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ex/dwTsOBdc0Oabutv/KMv+YQVe5juRm25Xb1v7EFo=; b=AiSJxmkSQn7Et3VG
	xaI12/SSzF/fp8QW4R2m1EsTdTbI0bozKKv0v1SVvDRgjnT1przNg/Q5KHkHCxdk
	bMoVN3gQ43/32qchuwPVbZNkr5vIKzkWFzeVCexmAajhHdmz7yq4PbSYbLnjVPLT
	yxeVKT/HGeL8O3WHaO1cifKa6smHVIjj1AQu7JaaqypSDypnRND9JJrG1OHZmfOu
	eAUEhM0uz9YgTCt6+lL48x0IudqDA+OLCL381KUZOpB16aAHG9SBua/cP3AD42Vo
	lZ1JaFsGsLsx/SEJRqJqqoo3sjKTK8xytRnpPMGy/g1zveeHtgrqo8EW5OobrzmO
	NhcNeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g5b49t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2980ef53fc5so90368055ad.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 23:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450258; x=1764055058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ex/dwTsOBdc0Oabutv/KMv+YQVe5juRm25Xb1v7EFo=;
        b=BLXVsNTd2vnBHBbNzIQkftT7HAH+5tCxSZrML8DAJqc/nToG2Hxl0pL7fqBZaMAGNq
         3imB4rqBLKi8mggjyKjogoOmMPv6zYDJI/T9DGLZqdB1BP2L0jc6YRmnmzYxjXYfS8v/
         zhWTQ2vNaRrbGJJoU3fghMOaNwKr8KUlJUTk8Bqzi2LJkEKjaec5qj81ygEZDSVMb/2Y
         ZHxzaBxFZ0S9I52JohxiJESSVTwx3/qNAURgDTgffNCaF1prDIbGovyhW80s4bNCAjak
         SST6AmkiGSIyS7EoUcI/yujV1gdwkgc6BqgcVGKSTITWbFoqVdALsLygAWuv33v1kZlo
         UQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450258; x=1764055058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ex/dwTsOBdc0Oabutv/KMv+YQVe5juRm25Xb1v7EFo=;
        b=RBDfPlYuKDh1OR5p5xMb5n24Pk/G594RBu39EA4VKhvRIGvIczYDXA6XHhv06ofaQV
         hKYlBV58x9pHjbdHshYCIXOk0UWhqZAXAnahCl2HHV5mJ8Ugvjli3KGFBMbKHPfdlaYY
         0K7LMAd/P/bsEowOto/z7S2DZwPavI4z/tcmypYHX1iZkPvl28h2eB69iIs5mqsaxnco
         T26fv/Li/usUc1Urq/wvHmLbp8EuIYwCzCq21+kVVnOcVpQMxuJv1PVV4MwJVyG4d2/V
         tSv83nSsg9BXVL2B8c2wtkd6YBWLdHL+cpkhlSOAdN7Be34cb6nUJaVm5ZFI5WuNwthC
         0csQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdeVQNKx9zKL7Hu15x3CVTENrmxOXo988aDx+vHBpMKZCgKgZMj3TB6ODmfmr6s7swWcQ6qHxbdF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD279dZEgHuUJkxPhV/mgtI0ygg9vlKabghhU53UzvaIGyNfn0
	zczr7QOyQO1m90HcuaWlWLY4z1MbdXP7PeInnXvbjgSBQ/U4zl+L8wq+ZeracnMjoAhaQpWTps7
	gyVXb36WkGS1XeaRsj8GKn7ayHKxKd5nLxAg8rYOThj4oJweyDiXj3M7nU8250zIAn8TlMws=
X-Gm-Gg: ASbGncviH/InbgGhACl8cvxjGnq8+OWQ+MSgEPWOH6tCYEAkaGZc17QY2+TdBgmzbCW
	r2e8dgbavyuobUomva1/OAqL/W+kRiSUTXZIuI2AyXMY6np8hFy8O8DA/Tk8phEH/CVSAHWEsdx
	e7c0VSZROWwu/jkcv3oxVSqPm+9AAAWvJ7UXTYwbRmYtLhfWA0qZ28mDGOVCPSuN2nKrWY+es8w
	ZycXEeGHWVF340thPOkm9P4mbgGXuXMSz2hceTu+l7sIWXqB9b/LXN4YsVpG3lJcMmZX2EgPKMM
	skMtjFsW7jc9a1GV+5MBJEUO6N22rzBWC1CEmyir5Ut72Qhle+RYjLJRcltr36EcztIofV2mUHm
	x/TWm0j8feEt4+yfLJVqioeuWnSnXMoxhCw==
X-Received: by 2002:a17:902:ef06:b0:298:595d:3d3a with SMTP id d9443c01a7336-2986a7566edmr160902695ad.50.1763450257366;
        Mon, 17 Nov 2025 23:17:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNe6X33EUjIJ9RH4k/tw/wo5j2bb0naJDZpb6jxguUoR6oC+zL3ECu1zXuNCf1fQMWVg5kxA==
X-Received: by 2002:a17:902:ef06:b0:298:595d:3d3a with SMTP id d9443c01a7336-2986a7566edmr160902335ad.50.1763450256827;
        Mon, 17 Nov 2025 23:17:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm129955285ad.79.2025.11.17.23.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:47:09 +0530
Subject: [PATCH v4 5/5] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691c1d92 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2N9sESmJbKjiMZoAsBIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sdgD3j3ByPEU0LM_VbT2OVpb-8wfwcB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1NiBTYWx0ZWRfX5AUL7wtQQLWg
 dsSlfvu/UTSe6QZuVMTrR7fm+oHnB0+H6ZIWXUCnyexsLq/SieKNLkj4yvOW99dZpwKaodLAM92
 PoBM3vbeYMsiwD8DnlgNUI5utUvGlVtbE/n7R/Wzci09g7k0fqHxR98EEMXDIct+ifWHI8HYmR+
 PYacyEuM/h/ObEq/UkavhNpzSo5SK8AL2F5PJ6Tpevv7ZvG2bXLfj1hpX6FJC8FHPvbxwtQqmhh
 9J2VbJoXm7MGoFSTzY2D1GQ3CCfCbdhXyiGi+MhoIis8KtDVrOWUupC4jwuc9SQkByFisylMXmw
 Jmzs1jLnVYIP/Zk5n8WB6RTjqkVSOv/qsb2BaPYycqCpqHMLsD8kBkuRYjyWsclOHQ+EyuBd0bV
 zQcij/V6I2O0w0/CmqDCnREuNNS35w==
X-Proofpoint-ORIG-GUID: sdgD3j3ByPEU0LM_VbT2OVpb-8wfwcB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180056

Add support for the video clock controller for video clients to be able
to request for videocc clocks on SM8750 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          |  11 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm8750.c | 463 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 475 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index aeb6197d7c902098459c9b2cba75072bd519b0f3..2c5a0c86e01f0bf2518e5b78a9f50835fac3d019 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1489,6 +1489,17 @@ config SM_VIDEOCC_8550
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config SM_VIDEOCC_8750
+	tristate "SM8750 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_8750
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  SM8750 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config SPMI_PMIC_CLKDIV
 	tristate "SPMI PMIC clkdiv Support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 98de55eb64026a12d89587db295f8a6ac59ee2f7..fccb7eb5135dc4df3ccadf711f2c7b9ce0459a83 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
 obj-$(CONFIG_SM_VIDEOCC_8450) += videocc-sm8450.o
 obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
+obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
new file mode 100644
index 0000000000000000000000000000000000000000..0acf3104d702b69eae8fe961c7f85f93715fd271
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8750-videocc.h>
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
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_elu_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x19660387,
+	.config_ctl_hi_val = 0x098060a0,
+	.config_ctl_hi1_val = 0xb416cb20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_elu_vco,
+	.num_vco = ARRAY_SIZE(taycan_elu_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_elu_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2_ao[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1260000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1710000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1890000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x80e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8060,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x807c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x807c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x807c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
+	.mem_enable_reg = 0x8090,
+	.mem_ack_reg =  0x8090,
+	.mem_enable_mask = BIT(3),
+	.mem_enable_ack_mask = GENMASK(11, 10),
+	.mem_enable_invert = true,
+	.branch = {
+		.halt_reg = 0x808c,
+		.halt_check = BRANCH_HALT,
+		.clkr = {
+			.enable_reg = 0x808c,
+			.enable_mask = BIT(0),
+			.hw.init = &(const struct clk_init_data) {
+				.name = "video_cc_mvs0_freerun_clk",
+				.parent_hws = (const struct clk_hw*[]) {
+					&video_cc_mvs0_div_clk_src.clkr.hw,
+				},
+				.num_parents = 1,
+				.flags = CLK_SET_RATE_PARENT,
+				.ops = &clk_branch2_mem_ops,
+			},
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x804c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x804c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x805c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x805c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x80dc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80dc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8034,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x8068,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_sm8750_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.branch.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_sm8750_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_sm8750_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80a0 },
+	[VIDEO_CC_MVS0_BCR] = { 0x8064 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x804c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x808c, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x805c, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x80d4, 2 },
+};
+
+static const struct regmap_config video_cc_sm8750_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f4c,
+	.fast_io = true,
+};
+
+static struct clk_alpha_pll *video_cc_sm8750_plls[] = {
+	&video_cc_pll0,
+};
+
+static u32 video_cc_sm8750_critical_cbcrs[] = {
+	0x80a4, /* VIDEO_CC_AHB_CLK */
+	0x80f8, /* VIDEO_CC_SLEEP_CLK */
+	0x80d4, /* VIDEO_CC_XO_CLK */
+};
+
+static void clk_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for mvs0, mvs0c */
+	regmap_update_bits(regmap, 0x8074, GENMASK(25, 21), GENMASK(25, 21));
+	regmap_update_bits(regmap, 0x8040, GENMASK(25, 21), GENMASK(25, 21));
+
+	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
+}
+
+static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
+	.alpha_plls = video_cc_sm8750_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_sm8750_plls),
+	.clk_cbcrs = video_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8750_critical_cbcrs),
+	.clk_regs_configure = clk_sm8750_regs_configure,
+};
+
+static struct qcom_cc_desc video_cc_sm8750_desc = {
+	.config = &video_cc_sm8750_regmap_config,
+	.clks = video_cc_sm8750_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sm8750_clocks),
+	.resets = video_cc_sm8750_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sm8750_resets),
+	.gdscs = video_cc_sm8750_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sm8750_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_sm8750_driver_data,
+};
+
+static const struct of_device_id video_cc_sm8750_match_table[] = {
+	{ .compatible = "qcom,sm8750-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sm8750_match_table);
+
+static int video_cc_sm8750_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_sm8750_desc);
+}
+
+static struct platform_driver video_cc_sm8750_driver = {
+	.probe = video_cc_sm8750_probe,
+	.driver = {
+		.name = "video_cc-sm8750",
+		.of_match_table = video_cc_sm8750_match_table,
+	},
+};
+
+static int __init video_cc_sm8750_init(void)
+{
+	return platform_driver_register(&video_cc_sm8750_driver);
+}
+subsys_initcall(video_cc_sm8750_init);
+
+static void __exit video_cc_sm8750_exit(void)
+{
+	platform_driver_unregister(&video_cc_sm8750_driver);
+}
+module_exit(video_cc_sm8750_exit);
+
+MODULE_DESCRIPTION("QTI VIDEO_CC SM8750 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


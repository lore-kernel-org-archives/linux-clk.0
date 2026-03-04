Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2281372ED0
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646090; cv=none; b=TP+zPunuJId3g4gkAAx27BbngUv5/93/7399tSJViXQ2GXoG4dalMMhSdi+taNTQ+nbk+wHF3EDEUGdHT3slSQbjtorOD6a7uXv9gcN5EV+ZBTNCsYqy0bgcKjl3soXVqXqpvxEvKrUi5sw7OGX34J91g5msVFb9G1zUZDDf0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646090; c=relaxed/simple;
	bh=IMvEmRZnLYFBrlAEH5OPstxhfn0EtSOOsaMC/2JLQXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbiAoTWr3hldhEiMO2tzYXZT5cvgcuuGhMd8okUIsPcOcwpt0ZRljzywXT0v9zRehxO+e89yUeFvf8Q3xKgm+0UdVXbt8blnQ693qXp9i9fi7FAZ+vgTzyZDc0D+DYogqZ40lINeFF9EBkA2b05llc1Rn83S3/dALy9USS7WvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj7jK4bT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOqptkwp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj7jK4bT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOqptkwp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHrOl2495066
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 17:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gt0+N3+n3ip0Mjii8q5tGVuBri47r8/V1+HeHsU7wkQ=; b=Cj7jK4bTLHo1MI2D
	xzRjXkNegsf++zxo4+Ub0jtWAPxIvzDdTFE9iMSxxa/DuvfJa1iHBZMjTgKNenbG
	JrIYb8TiQ8CfrFLUuKwICZ/P980HIzahalkY2rxC3F1avP4ZvYE31qN5v1R5Z3xw
	ytRVo26MPOnXB74PD1qGGw57Fn7viurRqWjJ7X+cA7y04UdVzDRJYHqfGDQqdgtf
	wxvc6LWcDfMBow952vWT7PlX3+zSgEMr1u4ECXSIyPsIrI/k6hH0OtKgmLHzwKcM
	YUKwnIwseaIrDwuNnJiNSCzrtQfSRS4tqtwQvbuyrVALve7YszHX1c5EY85ULjnK
	/uXJcg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wg2de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 17:41:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae415b68b1so43838935ad.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646085; x=1773250885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gt0+N3+n3ip0Mjii8q5tGVuBri47r8/V1+HeHsU7wkQ=;
        b=hOqptkwpuYOg3gzF0S2wv1dyd9o4dZLHKth1bqUgFjXjqg5RNnaPtwUc3/lTdRdYd5
         iAePQ5BGJVcf0NQxk4oV0TqslTU5Qj0wmERj1FCRiEiev1Mr9LvSUd63AfQS6de1Y0IX
         d+beEZX+dmTf2odOfrrP2De6Zb+BeVtW5Gz7iy+vG1R8wtSagPwwoUcB3467JsxIEGGc
         brtRLl2Mzj9tjCOTrDkFFfaIirWxzniVjZXoOexzcejLY2vIqjTuqN4Pzbj/DuBdDYCB
         blgW6thChZjGJV6NA4LQ4Uh1+9mDnu5WkllhjY2se8GFLsE0Eg8THG1m5LQf0QVMtvLy
         fNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646085; x=1773250885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gt0+N3+n3ip0Mjii8q5tGVuBri47r8/V1+HeHsU7wkQ=;
        b=VQE3gQ4uvZBxXIOm4QDDE5sU5WIS3AoIEK6mdI7Dfzg4teRfWoT78iHQBSTPm12xAT
         pLslWookZneCG7oh8pZ9p1ORSWprBbP9dn5nylEb6wuJxY3WN8BkFyzXYYdfsYtlpRIY
         WSD3ju6CipdkduyoIC6WhMh0fgHgyA/kTK5wnuA1A+Cxll9dupYtHmx9ilrthgmkkvWr
         MvKFZvIlg/0znUnPpifItvwByt65pcOxnjIevWyJ5jfDUkAEj1iHNE2HtreplR63oaXF
         hpVbz5WtkbiRLf1kyVOBHSi8VWcd4TYWrPgjYhtl0+Vq+3NCUvQGZynBZUzzP8s4Vh6V
         4g/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdluGEap8ZoX4V/JXSHw6BZK1EMcAAkPfDUQsXOEvH/XeEqN+PA4AaFcwffmxnBmqwACmKqH3KlZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7n/7OuNGoU23AlnquttiybzB4DScBIUxXLOFF3ePw8oBvVpN3
	lXM1lWVSjtaJZjDuxqceMT++qlDTSIx8woEKAykQ7TMCe5io2vKWpP5zGD6s/w37XWWtc/K2vvN
	Ap6PndQWJ+rZ8Lq9QC0AhPNgwZMlvDVmGO10bGfa1uRioi8YOotzY5R07KdO5QOA=
X-Gm-Gg: ATEYQzzUucSznUM85VXuKBjzv6yAGmN2fqBXDzOqFGT+TOYi/xmP3mWWYBp1J3CNOo0
	T5lq/XHVq7wVHtW4TbWDwoQH0vPw3oyR7jJJWJLSUSUwAJrVuQl+2ROxUIEels60/akyCFG+mJu
	P94yYVl/wdFV9rpWETunffqcUwd+GC8iaglW9KEA22kpOpWz0oYb48lM71RSJj+AYfQJzyhDnwu
	gSk3CL1eAnI6I9DSk2x/jXucUz/Mp+7Yz2vWgscrC7kFKAIDStcJj9nBBm8yPK6IrZtCue8Dm1b
	NSJM+YIQsjOvF5eUk30wfs7OPe2ffVGbU1QceQAHIsLSnlQGBnfCZ1cB18TGRuiqwxL/z1lmW1v
	HSFGwd6afD9X330kbtQTEde2mda7bGJVCTbNGbof9RYESkcEK64qG
X-Received: by 2002:a05:6a20:258d:b0:38b:d93f:b45a with SMTP id adf61e73a8af0-3982e258125mr2550180637.58.1772646084663;
        Wed, 04 Mar 2026 09:41:24 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:38b:d93f:b45a with SMTP id adf61e73a8af0-3982e258125mr2550159637.58.1772646084091;
        Wed, 04 Mar 2026 09:41:24 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:23 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:53 +0530
Subject: [PATCH v2 3/7] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: MLIdET5o0gJ9pthNXJ2rZYdQIcwT75n7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXygZGFrzwhj4V
 rWThXnwhaV6sszhPcJsP1ABcfLaFyh1hcU9esHLC1p6iwUpABIie6d+1ZRrR0S3qKfFZw1+bXb2
 v4Q6fVFERyeamk18enwfshD6hRrIl1tDPeNNAXUM+OQlZky/0iKb6WqI4W8hR63xCtUpNQvqbn/
 llWg7eji83NPvjWVEu5ugto+/T+u/4gumvJUipMnHMHG89fw61qFIu5pF/jd16qdIpp2ZSF5EQT
 08DMO2TK0lxYArlmqD4yZLxR5wh1yF5B3vsx2Edq0MAKDiWb++CoBlSE2DCFM5bwKHjas68gUUe
 EitVn4q2yKIHHTs1JfwlSyA0rBVKAePmJKYNHCldTd9SieIgyoNci1SfV6fnMhmfmzlnKPbjUYY
 y//jhx+F00yWOPspp1CP5DN8mtW4bv0liLOXkEy2OsGSJxakDBfu1t2sML9PQ0x+srYZZjWPMv0
 pXADlFDnURvwkKUNN8g==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a86ec6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RKjULyPvNO9injS1lHcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: MLIdET5o0gJ9pthNXJ2rZYdQIcwT75n7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144

Add support for the video clock controller for video clients to be
able to request for videocc clocks on X1P42100 platform. Although
X1P42100 is derived from X1E80100, the video clock controller differs
significantly. The BSE clocks are newly added, several cdiv clocks have
been removed, and most RCG frequency tables have been updated. Initial
PLL configurations also require changes, hence introduce a separate
videocc driver for X1P42100 platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig            |  10 +
 drivers/clk/qcom/Makefile           |   1 +
 drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
 3 files changed, 596 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb7445e396048a5bba23fce8d719281f..b1b1ed70871c1b348985d6f5149152e57637d904 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -155,6 +155,16 @@ config CLK_X1P42100_GPUCC
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config CLK_X1P42100_VIDEOCC
+	tristate "X1P42100 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_X1E80100_GCC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  X1P42100 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config CLK_QCM2290_GPUCC
 	tristate "QCM2290 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..b746e5046774259cebe3da8dad1f226561268a8b 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
 obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
+obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
 obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
 obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
new file mode 100644
index 0000000000000000000000000000000000000000..4e92f0ab7e4016724af1f31aa4896655b1dc8308
--- /dev/null
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8650-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 420.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x15,
+	.alpha = 0xe000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1050.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0x36,
+	.alpha = 0xb000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
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
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
+	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
+	.cmd_rcgr = 0x8154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs1_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_xo_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
+	.reg = 0x817c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_bse_div4_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_bse_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80ec,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
+	.reg = 0x809c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs1_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_bse_clk = {
+	.halt_reg = 0x8170,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8170,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_bse_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8128,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8128,
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
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x812c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x812c,
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
+static struct clk_branch video_cc_mvs1_clk = {
+	.halt_reg = 0x80e0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80e0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1_shift_clk = {
+	.halt_reg = 0x8130,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_shift_clk",
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
+static struct clk_branch video_cc_mvs1c_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs1c_shift_clk = {
+	.halt_reg = 0x8134,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x8134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1c_shift_clk",
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
+	.gdscr = 0x804c,
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
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1c_gdsc = {
+	.gdscr = 0x8078,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80cc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs1c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_x1p42100_clocks[] = {
+	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
+	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
+	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
+	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
+	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_x1p42100_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
+	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
+	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
+	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
+	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+};
+
+static u32 video_cc_x1p42100_critical_cbcrs[] = {
+	0x80f4, /* VIDEO_CC_AHB_CLK */
+	0x8150, /* VIDEO_CC_SLEEP_CLK */
+	0x8124, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_x1p42100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f54,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
+	.alpha_plls = video_cc_x1p42100_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
+	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_x1p42100_desc = {
+	.config = &video_cc_x1p42100_regmap_config,
+	.clks = video_cc_x1p42100_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
+	.resets = video_cc_x1p42100_resets,
+	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
+	.gdscs = video_cc_x1p42100_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_x1p42100_driver_data,
+};
+
+static const struct of_device_id video_cc_x1p42100_match_table[] = {
+	{ .compatible = "qcom,x1p42100-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
+
+static int video_cc_x1p42100_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
+}
+
+static struct platform_driver video_cc_x1p42100_driver = {
+	.probe = video_cc_x1p42100_probe,
+	.driver = {
+		.name = "videocc-x1p42100",
+		.of_match_table = video_cc_x1p42100_match_table,
+	},
+};
+
+module_platform_driver(video_cc_x1p42100_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


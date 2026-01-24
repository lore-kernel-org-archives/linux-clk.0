Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D4726980F
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276142; cv=none; b=fY8hj1fBdjKImFNQ/wd9bgKvPpRFVkn8+cm5fHmjcTj74J1BsrAhrXeFWv1fgQke7pVKetMHEjtVomIp5wQCjqXV/RAtoTvmpcG5XB4ILTMDNVDG+OsCthOKYGnHrQX2cvNj2s7A/Jf2v+pxfB9wQQHtA3hPSAlV42iBI/MPGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276142; c=relaxed/simple;
	bh=NkM33I6/BWlPGiITQGeqDYuHBmseKnyQ8DisUaCUXkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgLHbGLqyoGTzQvAIMRWT6Z9WlmUyM7dKazRMa4IuKk5WgTCOCW2M49qHuiS2W7mbtMvkjYI4/br7GJu9umNij+n09RKndJy2ZC0C4kBvTXkLlqZcxbe4YKhc+V0rocCxGTMmnBMonzRvrGDABLvJXGyB4mlXq8fFpFK9NXNKjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxzYq+IT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOqphdLw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxzYq+IT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOqphdLw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OAoLDR1672805
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTssUYD0YxBzTE13WmbtOn1PKJndp51cFtaBi5mjY2E=; b=kxzYq+ITDGI7KyD7
	oIP/PDG+3yr/xqsjKzp1/yLRogQJqJTHIOGgGflZlLoj1vXu8R3xZ1897l5FuUBC
	+uGCkw0om+Mhqk7qJ3GCbe8QMZsl2KY+ckI3udL3vWtSqRg1piPQgQElBcQoDGEs
	OA4LSRTgv7c2pFxeOKd0OsivuMo2i5oQrcWmrtbw3/crCEeV6tBfhTZbBdLXezwa
	53ZH//hVyNl+DOT5LPbCeobNnKhcp/VrfX3MeX2vsnIW3mw7vibWlB5PrEBhsNT+
	opf6Xxg5gwJuV6Tj6gNcAQGExukKp+LmAWL7L5BWCWxIrHhBR/4btI+StOvJaRvT
	x1Yumg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q0x13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 17:35:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a377e15716so80630475ad.3
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 09:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769276138; x=1769880938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTssUYD0YxBzTE13WmbtOn1PKJndp51cFtaBi5mjY2E=;
        b=bOqphdLw4EnjMsS+VnjcX5k2en7nazIjGjZ1LqzJHN6MrICXN66/3qdaLL1MjTLmeW
         pkyfesqAkUgJKQb2uBybn5WsTIuKmdxZ5WGOdnioIt82n0DHjsquF61J4nU+/8kV7u99
         nO8BV+6EpOhKSLM6YHyKD73hofMjx9GGGv9IP9Ut0FagxpR4o2gDVeNMOLAPGGpCojwW
         PXR144ynWrTVxerl/6NVhpjpi/2RAGb5teg8JkS8PNY8f16RlPvscBQOjxqyZSmgA4jz
         KlP3fiTZFWrzOMMIuMQxQMG8/oVsDkJzAhkBHtBKUN6BrPH4KiZTN9AQvHcAOqtEJFSA
         2O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769276138; x=1769880938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTssUYD0YxBzTE13WmbtOn1PKJndp51cFtaBi5mjY2E=;
        b=JoAahRSvsz0pE7zlwM9HvwFauSTY+8Ds+c0GIKayFEcPZQsp7b2uzrOgffbGJHR5Ed
         S9WRy8ugiKTb4aKu6vRBFdG+i+f6s3ZZipW53uWOIwB+Ub6m/aqhsS7qQXE/Mpgv23DJ
         /kne7zwhHr03LsKpiaYqBDui8EO8ok69ueLL6dHwTAgb07ByAVRLas1zfjyXlSGr0cdC
         ld1VchOrI8kK4l0FXJMoHjXVQIHSWBFuMx3uyHpT7SAAnXVhVk3V9fFwQkdibTk5yzh+
         76bCuFX/RM0brtGSwSFA6nUXbr1hR7v774FNYsniyo3oDgowDV450cNmkPpqg7maBQG1
         NbUg==
X-Forwarded-Encrypted: i=1; AJvYcCXRrV10Rdc7jz2zIs5bxfSQmsKavd9W+z/Ix7Zw6GHPPSleXBm9toeUkBLPMeD3nZfLsHrw+pM7veQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YznV6TtiE96rznBrDJpoPH2afXR/Wv23m9prMGzr9xdKOWrgrd7
	+zCVslEpW7I7FRXOCNq1YbDSk4BVgVrcmkzBJinZuncafTEFeZjI1NCPMdaq0q/WX5jaQFuVWBC
	FwYGCTP9RfkbIzOJgaHB+sU0QLMUfPfY7m9cX8Koj9URbRTOPTxEBbCQWChdSGnMXLpOpMpE=
X-Gm-Gg: AZuq6aLV0FGo9s4Qg15qcp1toH7U0/kpvZX3PQVV/tW7xl1k3sZhKyB9CuJVp/US+2w
	AKjsmQb4EFwXbiZt/m9abgILCneFNYIUiCu+/7A/4GwGw5/XvhD9PUldNvdeDEhALDEU910aMUv
	ddffLzSidNgzB1I6uiHUtbVHG0J0g24bqoMW2Be8AesHp3OlpwuPJ+s0fOlzRrIM1U41edKY3U8
	62ascqp5tzfsNsjmv+mMHhm7b/xziLJ7Ex81cB7x30aNN5/oTlLIvic2lAt3iGjMeTl0EjWOnnF
	Bhlm7rHtguvRjEE2hbnOFQgrmTze1cD6H36nberqNbkzZTkLxHRGud9WzWqdzcI0J0jOoBc+R+/
	xiK+7pLFOZxpH6i8WDkH4m9N7AHY83jN5vQ==
X-Received: by 2002:a17:902:f60a:b0:2a0:a951:ffe4 with SMTP id d9443c01a7336-2a7fe757078mr69439945ad.56.1769276137670;
        Sat, 24 Jan 2026 09:35:37 -0800 (PST)
X-Received: by 2002:a17:902:f60a:b0:2a0:a951:ffe4 with SMTP id d9443c01a7336-2a7fe757078mr69439165ad.56.1769276135788;
        Sat, 24 Jan 2026 09:35:35 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm49036765ad.3.2026.01.24.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:35:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 23:05:03 +0530
Subject: [PATCH 2/2] clk: qcom: videocc-glymur: Add video clock controller
 driver for Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-glymur_videocc-v1-2-668f8b9c63be@oss.qualcomm.com>
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
In-Reply-To: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: hIZsGDvAjv-QYYCCS98FIea8W0C7v8jc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE0MSBTYWx0ZWRfXyjGmLvK6Sktq
 ecZxSi3wneyv4KIDpJwa6CfMGj6H+7PBmhthDDnacUrKaBwWMiqDcGdCMbuXp8ZapLMhpFM0/BS
 I0DNoXL6vSZaFMHoKB0MbQXbzI6V+ca7/AoKcMwHV7QOFJlhFcQxaVmQhAODHzkptBcreHK7gEt
 aCp47CB9B7JJmvP/88PysVcCOfmBDOizTWNfmtRk7RFd3Bb1R9JGIBbBXlH1ElSgucfZk3Ym3x5
 5EJAJXsjj5ImDWutxtW4KIXOzrCyBGgc48qAZoIxFnhmcr9qYxEHH7EX9X+vko+cX+pFFcFtqkd
 KKCOE7DAFaG2t3hPJrlRlh31Lp5lhd+PJ8Jp6pneAVEHrbM2nC0nU1Ogm8xStLlq+oXx7vicbM+
 7LH39bc8R1LDVVHQRUujXpX+XIlWBInea0ZN++3mqgsgvNeZYbfntu9+jArNZ7l8pr6Hpfeoib8
 ZJKbDcx2EoVsvRBuJ0g==
X-Proofpoint-ORIG-GUID: hIZsGDvAjv-QYYCCS98FIea8W0C7v8jc
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=697502eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AGQeBkLEtNaMSr1_6oIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240141

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Glymur platform.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          |   9 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/gcc-glymur.c     |   1 +
 drivers/clk/qcom/videocc-glymur.c | 526 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 537 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb7445e396048a5bba23fce8d719281f..20af4340b08f98773eadcc4a97b1669f51277eb8 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
 	  Support for the TCSR clock controller on GLYMUR devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
+config CLK_GLYMUR_VIDEOCC
+	tristate "Glymur Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	help
+	  Support for the video clock controller on Glymur devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config CLK_KAANAPALI_CAMCC
 	tristate "Kaanapali Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..a71dfd0ddf5122d91b5ab4427a9e36cdd57f7bbd 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
+obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
 	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
 	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..a5045866982554ea46a9d75033537e7771df8fd9
--- /dev/null
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -0,0 +1,526 @@
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
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
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
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000008,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
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
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
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
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1965000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
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
+	.cmd_rcgr = 0x8120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x80f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
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
+static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
+	.reg = 0x80d8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs1_div_clk_src",
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
+static struct clk_branch video_cc_mvs0_freerun_clk = {
+	.halt_reg = 0x808c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x808c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_freerun_clk",
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
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8114,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8114,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8114,
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
+	.halt_reg = 0x811c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x811c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x811c,
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
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
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
+static struct clk_branch video_cc_mvs1_freerun_clk = {
+	.halt_reg = 0x80c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x80c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs1_freerun_clk",
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
+	.halt_reg = 0x8118,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8118,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8118,
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
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+};
+
+static struct gdsc video_cc_mvs1_gdsc = {
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_glymur_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_FREERUN_CLK] = &video_cc_mvs0_freerun_clk.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
+	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
+	[VIDEO_CC_MVS1_FREERUN_CLK] = &video_cc_mvs1_freerun_clk.clkr,
+	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_glymur_gdscs[] = {
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_glymur_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80dc },
+	[VIDEO_CC_MVS0_BCR] = { 0x8064 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x805c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8030 },
+	[VIDEO_CC_MVS0_FREERUN_CLK_ARES] = { 0x808c, 2 },
+	[VIDEO_CC_MVS1_FREERUN_CLK_ARES] = { 0x80c8, 2 },
+	[VIDEO_CC_MVS1_BCR] = { 0x80a0 },
+};
+
+static struct clk_alpha_pll *video_cc_glymur_plls[] = {
+	&video_cc_pll0,
+};
+
+static u32 video_cc_glymur_critical_cbcrs[] = {
+	0x80e0, /* VIDEO_CC_AHB_CLK */
+	0x8138, /* VIDEO_CC_SLEEP_CLK */
+	0x8110, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f54,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_glymur_driver_data = {
+	.alpha_plls = video_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_glymur_plls),
+	.clk_cbcrs = video_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_glymur_critical_cbcrs),
+};
+
+static struct qcom_cc_desc video_cc_glymur_desc = {
+	.config = &video_cc_glymur_regmap_config,
+	.clks = video_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_glymur_clocks),
+	.resets = video_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(video_cc_glymur_resets),
+	.gdscs = video_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_glymur_driver_data,
+};
+
+static const struct of_device_id video_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_glymur_match_table);
+
+static int video_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_glymur_desc);
+}
+
+static struct platform_driver video_cc_glymur_driver = {
+	.probe = video_cc_glymur_probe,
+	.driver = {
+		.name = "videocc-glymur",
+		.of_match_table = video_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(video_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Glymur Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


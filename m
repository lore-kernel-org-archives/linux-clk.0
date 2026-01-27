Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455002BFC7B
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498330; cv=none; b=YSjr71JcWgPgu+cNR7DXlFFqtVevisS0UXRgeQtcdmJISLiGUUiLxMVvU6PfChvNh0TLVXLJPCXynyy0nPb9xVZP4sM1oplfdrkyAHqcVNHJhdsyuRP2Fgq1nKxpwZoPqGzXR87uZuzHKZcYV1XjXYJI6G1I64IqieopoV3lmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498330; c=relaxed/simple;
	bh=nZplnpYtO7kBEgpVaQBdyLxixhadm5l3M+uKBgDVNa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hnmv7rEmi//rSM2n9birJnC2KT9SNrSrfwX/n4ZL52CUclD00NTkNPDCgTWLxn8nCOjzOTC5rBgmDj+65oNGYyYsS1mVpTBqbRf4p5qnNnKYreoBd+4NN0Pn9ynjV4/lOGlkiMSxNW5MITFnCBI8KszkvdZl3YWs2sQo7k3UFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQbIGaoN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tfd9+OQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQbIGaoN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tfd9+OQ1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U83F3914949
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GlgGyD8o8yv86mAJe5cy20CUP9oeh7gOvh5D2azgqM=; b=mQbIGaoNUKEUC+/I
	u/AX09Nm+zYkLByGWSlbmSi+jPz09O+G2L1knOPn/leidV1dxAmDZ4kG771h1wWb
	r58hIy+Xi0zD8srB/bUYOOpH8L49qKsU7TgnjTVlngNAWGYieILEbzWgXessqb7X
	3JniuzOxqGySCEuVGmNphrzrGtMUSxjgGkmTMz7uHcFpyx/JTiRSFqEZCxAAx3SO
	EOID3Kfm81FcK8nOoJvzxHrtrz63DmqG3U0ZC+NeoL7AXtFW6bxBmSJWhO9QH6g9
	K+p66tE4ykIwZiR6wyGg9Yt2+G1u2Dr0CW06E0LQSL2gVz137xO9b12sJ/sMfMLN
	5aWFcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx26842cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7b7f04a11so10874255ad.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 23:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769498327; x=1770103127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GlgGyD8o8yv86mAJe5cy20CUP9oeh7gOvh5D2azgqM=;
        b=Tfd9+OQ1vSBSBMVZm6/eD1zKOMZEKCxFzg8GJoyW1WP/cnLgbMcuyFw2DKYbrIreye
         bBkPH9aCVJ/qBOaxVLNNv9ZYlncAgtJStzJbjyQ9FbSBwwK7BwBjgrUlJL+HPAAVgp81
         LhRFsrNILFtkI+L2UvUCz3rZWOpcOOGQQEjyOkTqjqkH9YA/zlHlH26NmELZ8rNXfD8b
         +f4RYIw7X2NI83KA0mN+HBsN8CYlWqq4Bo9B22pG0TR+DXM2RLjwfPzKOeI0fYvyxeWW
         Jaa1PqlDNuZ73WNFlmb7vrkQ93mA7Kl+3OAfNPQpcFE48ZFYL7BohjgJ1JoI/jC4PbO7
         TbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498327; x=1770103127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/GlgGyD8o8yv86mAJe5cy20CUP9oeh7gOvh5D2azgqM=;
        b=JlPcWZF1DrdQlFK3HPiQnZ5MmuDRAxLWIEPdT3F6ON+y8WlZAauaDcfLCEoRFGWZvw
         kQ3C2ArAxPZjDBPmmR/I/qsufAAnWqxnQV+J8ka6iRMlQmaXZXx7XOlrdr/FLuIgwI7h
         zWhAcGezYJ/54qwV8Hgt/Qr0Kra5d2f58FfIkfIP06gzmMA4V3xtWm4FlVxeMxHQtvjf
         j62jEewc4UwwJT6cKVvI2ppotrvs4QnQl6sbvHSiNYSFVpm53ODmKfkS26gonFgxvRMO
         rFmFBovsFZIpCKtuPb5w99pirwpbMpsB9ONOGUQ87MBkzS+EfRNdY7tm+1/DcLssdUYC
         06SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6DNHIvGr3iCLw01YsoQHH2jkWaIg5C4RAiY714yACrGmaceLSyZlsP4Eyf4dz8Bn8Y/NNSg/Mt5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIC9Ilz8duNBF/tTccYqNb1LR4MQssDzasFTsyopFWsiAs6sxC
	WDrUWmPHZ5hOWmvSU1BHWcCVin9EaQXzJI5HTwnHFJ+mseIQn5swNCXPGY6RLkI++HeGK0+gdsu
	XH64w3juN0UaTuUfvyUDqSeknujBu879LFG7bTkWaIeXFof6jo0Zesaa4eiiBsto=
X-Gm-Gg: AZuq6aKiu3XheoQXpTsbIGjBf6zARmyFGXL2QpGNyXDEigrmj8l31tRIfEwQWOztdeK
	zEx5n+wa/JGzSoLwuIulC9fUjM0wbvcG3onO0wNqttHBN4jdx1QoVX/v2li1cWIqmMiA65Nh+2u
	MjFWxh4j3tB4j6vPaH33iLLHHTNajoHHgqdzUL29WDKFnjOg/RWVYPH/v2zHfykDVxDPmFm/krI
	UpLCse3beLYS3Ufn/OgU90azArqJLTURnAdel0cHJomKlGTniz3YLzqUXlBa4Z/Mzfg5oClpf9Y
	3UCfcuDTtExEFJs36GPhK4ToDNb8bymLnolwp/f26vvyy5AQZofVhi/nLBmYIgeKYLDevJXRim8
	S9fmNmN5HiaBo9X+iEGfPejavOcyVDqx6yg==
X-Received: by 2002:a17:902:ecd0:b0:2a7:cf36:80f with SMTP id d9443c01a7336-2a870e76155mr10477985ad.55.1769498326569;
        Mon, 26 Jan 2026 23:18:46 -0800 (PST)
X-Received: by 2002:a17:902:ecd0:b0:2a7:cf36:80f with SMTP id d9443c01a7336-2a870e76155mr10477665ad.55.1769498326046;
        Mon, 26 Jan 2026 23:18:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a817f21707sm88084525ad.28.2026.01.26.23.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:18:45 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:45:50 +0530
Subject: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=697866d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EdUCV8aCvkqpeWA2OMsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1OCBTYWx0ZWRfX88Ran2M9TkBu
 5HFlU6Jdrd5TH1rsGGEur4QeERKndfGhiy7zbAZjiBb0pJzFCGnR138wwNQQUh8kpt9FRWxc1EO
 fBEwjwZ6+Iu1NVG13S/XGo+6FgixttpqPdN//8ywa6Oau6pdyMWVlEyMd78LBjfk3563BZX6N6V
 BnaI7yKF9wRD3SP97dxs2WKAIqiBsVevBCkvXnCvCHuGulN26HI6B8NwsZ25LGdth6auPuLe3iL
 7EbeHdh7hGYI4VPkG5DeNPR0K1aidW//O4/aL/CxrzMB3xBQd1srMGVQDPshQBmhkXp3ryUmk+X
 jYH/9W+SEOoMFTeo5JYx7h7MVMGajlSScrUof26LVU1NCpzd91jmQQcgTAP5w1oqQd6p9N1DmLN
 5YuxgBkfyqWdEudoK6n2OZesk/YLEfSoKSoU2O4Nh/Y/5N1tNfeDwakfc750qwYvRpoLwrzx1q3
 Axlsv0c+jP1Cic59X5Q==
X-Proofpoint-ORIG-GUID: FiWaHl0Lho8R_B26cXMJT-CH6OVcCsy7
X-Proofpoint-GUID: FiWaHl0Lho8R_B26cXMJT-CH6OVcCsy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270058

Support the graphics clock controller for Glymur for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

Update the compatible for Graphics GX Clock Controller for Glymur as the
GX clock controller is a reuse of the Kaanapali driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/gpucc-glymur.c       | 619 ++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c |   1 +
 4 files changed, 630 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb7445e396048a5bba23fce8d719281f..10dc697773ff79c78fc4bffb72a12f7c467ff06c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -38,6 +38,15 @@ config CLK_GLYMUR_GCC
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
+config CLK_GLYMUR_GPUCC
+	tristate "GLYMUR Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_GLYMUR_GCC
+	help
+	  Support for the graphics clock controller on GLYMUR devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config CLK_GLYMUR_TCSRCC
 	tristate "GLYMUR TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..d871d21b5dc9060ca25a3e82854495228f46fbf5 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_GCC) += gcc-glymur.o
+obj-$(CONFIG_CLK_GLYMUR_GPUCC) += gpucc-glymur.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
new file mode 100644
index 0000000000000000000000000000000000000000..6597ded955363f95187b1aafbaecbc771c5df119
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -0,0 +1,619 @@
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
+#include <dt-bindings/clock/qcom,glymur-gpucc.h>
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
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco taycan_eko_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 1150.0 MHz Configuration */
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x3b,
+	.alpha = 0xe555,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = taycan_eko_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eko_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eko_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eko_t_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_ff_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_ff_clk_src = {
+	.cmd_rcgr = 0x9474,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_ff_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_ff_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(575000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(700000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(725000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(750000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x9430,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x9108,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9108,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_ff_clk = {
+	.halt_reg = 0x90ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x90e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_demet_clk = {
+	.halt_reg = 0x9010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_demet_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x910c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x910c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gpu_smmu_vote_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gpu_smmu_vote_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_acd_ahb_ff_clk = {
+	.halt_reg = 0x9068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_acd_ahb_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_ahb_ff_clk = {
+	.halt_reg = 0x9064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_ahb_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x9060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_rcg_ahb_ff_clk = {
+	.halt_reg = 0x906c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x906c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_rcg_ahb_ff_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_ff_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93ec,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90f0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_rscc_hub_aon_clk = {
+	.halt_reg = 0x93e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x93e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_rscc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_sleep_clk = {
+	.halt_reg = 0x90cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *gpu_cc_glymur_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GPU_SMMU_VOTE_CLK] = &gpu_cc_gpu_smmu_vote_clk.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_GX_ACD_AHB_FF_CLK] = &gpu_cc_gx_acd_ahb_ff_clk.clkr,
+	[GPU_CC_GX_AHB_FF_CLK] = &gpu_cc_gx_ahb_ff_clk.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_GX_RCG_AHB_FF_CLK] = &gpu_cc_gx_rcg_ahb_ff_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
+	[GPU_CC_RSCC_HUB_AON_CLK] = &gpu_cc_rscc_hub_aon_clk.clkr,
+	[GPU_CC_SLEEP_CLK] = &gpu_cc_sleep_clk.clkr,
+};
+
+static struct gdsc *gpu_cc_glymur_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_glymur_resets[] = {
+	[GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+	[GPU_CC_FF_BCR] = { 0x9470 },
+	[GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_XO_BCR] = { 0x9000 },
+};
+
+static struct clk_alpha_pll *gpu_cc_glymur_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static u32 gpu_cc_glymur_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9008, /* GPU_CC_CXO_AON_CLK */
+	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
+};
+
+static const struct regmap_config gpu_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x95e8,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data gpu_cc_glymur_driver_data = {
+	.alpha_plls = gpu_cc_glymur_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_glymur_plls),
+	.clk_cbcrs = gpu_cc_glymur_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_glymur_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_glymur_desc = {
+	.config = &gpu_cc_glymur_regmap_config,
+	.clks = gpu_cc_glymur_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_glymur_clocks),
+	.resets = gpu_cc_glymur_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_glymur_resets),
+	.gdscs = gpu_cc_glymur_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_glymur_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_glymur_driver_data,
+};
+
+static const struct of_device_id gpu_cc_glymur_match_table[] = {
+	{ .compatible = "qcom,glymur-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_glymur_match_table);
+
+static int gpu_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_glymur_desc);
+}
+
+static struct platform_driver gpu_cc_glymur_driver = {
+	.probe = gpu_cc_glymur_probe,
+	.driver = {
+		.name = "gpucc-glymur",
+		.of_match_table = gpu_cc_glymur_match_table,
+	},
+};
+
+module_platform_driver(gpu_cc_glymur_driver);
+
+MODULE_DESCRIPTION("QTI GPUCC GLYMUR Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index c209ce5fe4f003aabefd4421eb4f5662e257912a..3ee512f34967f1b165fdc5481bb28e1dadee133d 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -52,6 +52,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 };
 
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
+	{ .compatible = "qcom,glymur-gxclkctl" },
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
 	{ }
 };

-- 
2.34.1


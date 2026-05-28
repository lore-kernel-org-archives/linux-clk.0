Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6613B47C4
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962875; cv=none; b=KQlMQ4FVV012KNXekCG4ZOfF2ecJHgKRdzTGM2B5F6Uzdgvfzybg85rSir1XJ1tpJaGM0tHk8TujMkqBw6GP874xcqDt9AcFjQMzmQ6oHKJp1jx8n0JI1SMuPZNOyCECo/02T+STY65hbaIbcwzAWLtKoadEXX/CHTYhd3qMilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962875; c=relaxed/simple;
	bh=0bpujqBXj8ybvFop9bYyotPQK8jlJ2ekGPANR3iA7ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZD/Ln1IdoUFQbpmXoQOEA0f9At4CfUymQBiqEBJjbvp7awZomrxzO17C8jx+7yKrlyxKswAHFPCKB6BwEsgrCsTTbFEKru8igQav0U95u068/m2SXI6kgOO+VS9sPeGucKn/vKsrEYoWmOV289rtMlFGW/ENmxtmQl+5fvyzjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgNfazAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zfp2DRtS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgNfazAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zfp2DRtS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vKJN1562576
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RwriUHLcTIRS+XdQpTMw9i8MGJ5W63QMAIYPHkoS/4=; b=VgNfazAL9a6dxoEP
	Fx/f1rsvXchmkI9lIEaBLYbFRrljnbAR1WP14dJXYeSaX/6c5wSKiS3mhjO2MG2l
	pMPK0RAhC7G+Ie3Vc9assFs1P8adNqUhBQGdy89DxJMWq0ezhPJjPTkatgWRKO2l
	zOWoenMt4FVDoKpxpFDA5WKJl1m742F4Mx3rWmjvt9xrSwzSBioKTiapEHCi5uEE
	BN/yRZ/cVa4CFqg1QpeSlGUobG4wPlU5/nQcEivDKVl5kiuI8nHsua/hSez5DxSg
	UW6Z9EwLIwE8XuJzvQDBccBr6Mlf+aYCXbF4GiQtweFO4nAmvYmYzk2Su786OOmi
	Dx4kLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2tada-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:07:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3692f395339so13018041a91.1
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962871; x=1780567671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RwriUHLcTIRS+XdQpTMw9i8MGJ5W63QMAIYPHkoS/4=;
        b=Zfp2DRtS0R+ajY8J51pQiJTxLaINyz0NhVlL3+ERh4FUMg+RDN/otOFbAxfE7Y8Wsw
         ptHOTVtbso6fIUJMj/6r6MPBViIKIESSmjb0q4Zi/zMaT+MGSocrSjrgHRxydEN3eobK
         SwQLuNuM/QdrGdGLF657rDc/V88anJMGJURla8R+1dSiFmY6fLOUr7N5ElO3LafkpbIb
         yvuz0UsAOaydM2eNzDAaDq2SJzzOwO6VkWceaDb8mE2VuUT91S3SEmgnxCHe0pbjDsB0
         YRxaK3uVcptOzPHqEoGjCFILSGNMmNflYNQwAy/c1pM09cefrteiqv/Mxr3kcAo7Q6cc
         QNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962871; x=1780567671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3RwriUHLcTIRS+XdQpTMw9i8MGJ5W63QMAIYPHkoS/4=;
        b=rqOL6lBDnhcfun87OrO35w+OysLxn8VRKd0cx+bVv9dH+RnIQ1mRIFGyOERog2dh0l
         HP0DzsY3ECH8K1ihdoeJjkB+6P8jRQsQ0j/LtAVG+yniiPJn2NCtcMUlISvi4xzcxVNt
         5gsmqS5tdb8L8tVf+i3xM1eYFP2SZu/uGeDNt7sa4Mi58K4w0BMt00KFJJ6REMEQrpyC
         sINcQFWS7t23GIRyOa3XfQLK9EJkD3XzXEWbCqciyxQ84Md6sxY0bXoSq2UsipQ4gURf
         2BAONUiHORcPNg+2+3+Q/vOnUpJk9wDmTwWltaFTKhOmTWg3uZYMmnFIxcXo2Z/5jkLE
         VD/g==
X-Forwarded-Encrypted: i=1; AFNElJ9L1UoQTcxf2MwyXuf3jxzz8VwU20gb5jp9Xhwz+AHYrxOt/KABl5W/+ZJw0Pj2rLNsjh0CpeoDBzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbqHjwh0LnypKxz6yKC0XIi4mXQ3njCXA7p2rmjJYV+DNOura
	2Gz7AEzruwbhEfWGtQUpnRmSv1htOSb4xqdQkugoheZPvqOuww+VNr8kYddE1MTbpJiC8degX6N
	xUaa2Bm+xAQt6Ui9Rz/67e5MlXIYxTKuW76QTYStd4XiZOF7pxA2+7bku5teFgzw=
X-Gm-Gg: Acq92OFhFWZHxtRLNVkmvCOZi9LYND6vqICJOslL8eMScqDy7C0iHe7XC+/iGU4zxIV
	czZXWDM4K3Ou/iWTgF6NNcpmSvsblbd80aK7/KCrDgyEAYQmYZlrNMjD3ubNU5LjPgjLNxocAic
	ntxgraliZEBBZH9HXw1o0En8ywcEqd3ZYq2Lq/Oi3jiMb9lSotQbmcSAQD0Lwuh3i9xTQjFOTnd
	JEMPBCtHrucvPQsMf5wJZbUUs7sbUyAiRNkDLT8WDz7ba1uxXX4ULzBGc7v9B1Ailm1eT9TSnx9
	cfaD1RPTeYMGDiwGQLAwcy6GFLSDr179sgypU0JAdq0BfP6ak36k6EODKLXJCfQw/BALoxGlL0V
	efL10ENrmWGLzsL8wC+3n4+UAqvlEiV5EUEgRHBIZTHJk2i/SrZNf3+/x0qB9PoI=
X-Received: by 2002:a17:90b:2f84:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-36a674f4399mr26552796a91.16.1779962870784;
        Thu, 28 May 2026 03:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2f84:b0:35f:b714:e516 with SMTP id 98e67ed59e1d1-36a674f4399mr26552726a91.16.1779962870174;
        Thu, 28 May 2026 03:07:50 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:49 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:06 +0530
Subject: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a1813f8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h4tiyZWTG5MJAiqrTW8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX1JJ7ocbw1oOu
 nqC4VLXsUMwTqBQelBDel2i5JZQJGM6Mig68m5tIPN0Ert2z/faRa73RhFau4SlGUhW7Uo2ErHR
 oEtSj8AemzOMYYOhpqyc3A2CyyzIZQYp9DPMEGZiGc4pbIMydDiITmQvPDhxOyXuNdfvojBKdjV
 Vdz376czyOTEiARVwcjHHgNnWpkIkOEN3RzIYy5QycmEhER2/QtnVTgYdjLgaXKFvjqll44FHk7
 PQG485vP5a5sGADfvvEcakNdenOnpg78EJSNKa14UvcdowHwi7tPA6r08UUR6gJGYfQQWOseIyi
 d5UWawbs3uEI22xFnyDFaqmqrstAmy/osnuhHTfkZCJVEbQiqaodHk3Lf1x6C1ni1QeTNgGx5AG
 PGscuvsHTpkXURMJU4wdzonJNg6gG5mYud58YlvOO810xNzLYQrfRl5oU/gQWyQMnMzRoJ/9ZM6
 VxfFMznSQFemQtlRYWw==
X-Proofpoint-GUID: -BYhAQglNX62PKqWFqnuoHA4XygyipdQ
X-Proofpoint-ORIG-GUID: -BYhAQglNX62PKqWFqnuoHA4XygyipdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Drop modelling of critical
clocks and keep them enabled at probe time, update the QCM2290 GPUCC
driver to align with the latest common qcom_cc_probe() model. Update the
GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index dc369dff882e69a8c0acd260953d5fcae9453120..296afcbfe0c9e4e147dcbd8bca807e8e4c50e185 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,14 +2,13 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -20,7 +19,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
-#include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -46,6 +45,7 @@ static const struct pll_vco huayra_vco[] = {
 	{ 600000000, 2200000000, 1 },
 };
 
+/* 710.4 MHz Configuration */
 static const struct alpha_pll_config gpu_cc_pll0_config = {
 	.l = 0x25,
 	.config_ctl_val = 0x200d4828,
@@ -57,11 +57,12 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
 	.clkr = {
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_pll0",
 			.parent_data = &(const struct clk_parent_data) {
 				.index = DT_BI_TCXO,
@@ -80,10 +81,10 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
-	{ .index = DT_BI_TCXO, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC, },
-	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC, },
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
+	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC },
 };
 
 static const struct parent_map gpu_cc_parent_map_1[] = {
@@ -95,11 +96,11 @@ static const struct parent_map gpu_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_1[] = {
-	{ .index = DT_BI_TCXO, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .hw = &gpu_cc_pll0.clkr.hw, },
-	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC, },
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -113,7 +114,8 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.hid_width = 5,
 	.parent_map = gpu_cc_parent_map_0,
 	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
@@ -133,32 +135,30 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = gpu_cc_parent_map_1,
 	.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src,
-	.clkr.hw.init = &(struct clk_init_data){
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "gpu_cc_gx_gfx3d_clk_src",
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -168,7 +168,7 @@ static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.clkr = {
 		.enable_reg = 0x107c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_crc_ahb_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -181,10 +181,10 @@ static struct clk_branch gpu_cc_cx_gfx3d_clk = {
 	.clkr = {
 		.enable_reg = 0x10a4,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cx_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -199,10 +199,10 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 	.clkr = {
 		.enable_reg = 0x1098,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -217,33 +217,20 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
 	.clkr = {
 		.enable_reg = 0x108c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cx_snoc_dvm_clk",
 			.ops = &clk_branch2_ops,
 		},
 	},
 };
 
-static struct clk_branch gpu_cc_cxo_aon_clk = {
-	.halt_reg = 0x1004,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_cxo_aon_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_cxo_clk = {
 	.halt_reg = 0x109c,
 	.halt_check = BRANCH_HALT,
 	.clkr = {
 		.enable_reg = 0x109c,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_cxo_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -256,10 +243,10 @@ static struct clk_branch gpu_cc_gx_gfx3d_clk = {
 	.clkr = {
 		.enable_reg = 0x1054,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_gx_gfx3d_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gx_gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -270,11 +257,11 @@ static struct clk_branch gpu_cc_gx_gfx3d_clk = {
 
 static struct clk_branch gpu_cc_sleep_clk = {
 	.halt_reg = 0x1090,
-	.halt_check = BRANCH_VOTED,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x1090,
 		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(const struct clk_init_data) {
 			.name = "gpu_cc_sleep_clk",
 			.ops = &clk_branch2_ops,
 		},
@@ -297,11 +284,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -309,21 +299,22 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
 	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
-	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
 	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
 	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
@@ -342,14 +333,30 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
+	0x1004, /* GPU_CC_CXO_AON_CLK */
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0x9000,
+	.max_register = 0x7008,
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
+	.alpha_plls = gpu_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
+	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
+};
 
 static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.config = &gpu_cc_qcm2290_regmap_config,
@@ -359,55 +366,22 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	clk_huayra_2290_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-
-	regmap_update_bits(regmap, 0x1060, BIT(0), BIT(0)); /* GPU_CC_GX_CXO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-out_pm_runtime_put:
-	pm_runtime_put_sync(&pdev->dev);
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
 
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1


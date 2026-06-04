Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CA3BFADD
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550817; cv=none; b=nrMKRsu4odxy1buoLHRmFj39OciquICi4duw3HrM9HRE0FoZGsywgSGp6M5UPpAZPsoZZISFPNfcjASkwJJmMmiPHK4nAEd/Nod+/JSaAiT0I35LyHMqq3uxuk197MgEW9KvLpSKvwQnRweSsa4GdrxJXzesGzEZx4ME8c6x8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550817; c=relaxed/simple;
	bh=42ccGag0WOj0/GBe2dVH9h3Tap4krbtNxLr1X4sK6N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXONKueuU6LMT9hm/FryxDJ9G+tiu223aMfSeoR0Wc7dbgN7kXkfEl74d/idcQXCZAWFOeNLjz1YIDNr+EC11Fyvb24stTxd+OYJXHVRvJkrg/ifpztJiAr2J1TzOp6SyWFxLMHRZvZx8ky5sgXsq5qLSvnGm2O2gChfz9rQkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWL8E5H0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITK7Qq+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWL8E5H0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITK7Qq+p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540o2dO313888
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=; b=OWL8E5H06GXMGVpQ
	gZNN8NmWWSACqYGiDciGdVRvYiNSm87VHduLObObTWSE8svhb36AJEU0oTJsD+Gv
	VUCw4wDQewRtqRcXjGHJJtN4R61Pp+1WLLnz4RJLckU4tHLdXXxNpFV+eeGJgkcd
	G0zc45pO/BB/dhaDvkXSgra2wEu8qlMfhILsYSONpQeao2vZEn7L9M1vyqs6k9Bq
	6EimwlYTiJRplMj5995yFZFNKdQrl6Hh4bA2bxrKNXfkJHW8bZjYjeB4vlA9/GiE
	Hud2RWWbW6wH+cSaDJvNnXozAi5NQrnsgwOwJ910jqWGqaSpm2m66WGy+Dd6pvUC
	OPLfSA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0stj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:26:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a366b61fso201533a12.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550814; x=1781155614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=ITK7Qq+pdggMnF5wijd+YrcwKX43ze+EqUSwOrMYaw2OZiknPkAoyZ4SnSxvF3lp17
         xfdcupkv11hPaoRIDaonsYnh4UTMPudqnTdCIU+GwJUOdyXqX5sDcxZh7D9fM3tH2jcV
         1F1Anq+DT6rkjOrn90iFA/X111RcolBMGVA4VdCpgUrGWvuukz/gW4Oud35YnrMs8WXR
         PQ2+3skIsq2gzA4ocOVVl/XWvv9wDLG0uQ8AtXJN/mQfLdNAC8kWslzS9Uk0wicG/GkN
         2rR3pb5B/OGIldhav+R79/5RGjMi9YE56plhABfqRqCuQshPpW2ktYdltYZw/Lho324D
         4pPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550814; x=1781155614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=j0sA0Sko9Edh9uATC81b07PSk8zTZJCiTLoc45nbhNp3JvO9exkgy0Tv97RtH4bYgw
         IQnoeZ9cFWSH+QS789aXgUSZ7EkMFISI4yFrXRmOGweg6icBjN4R4O6tqbn1EpjJIXSG
         HW2IBh5rSfUeoOND1dwh0IlKERkLB17mc2lYTpFu8rNkzmVq0S7mO59uXWm1iJw717f2
         ve/sA6uHrMoyqdKTAfwUrhM2X45L06l4STWqc57ZpwRLuK7ocNrPIliQWQeJYTnfPOPs
         z3pepCIqXguKFW1T/63gJWnD6utztYs0nFZ1yTFsVQ5IS+atyHUJrd6X+U/GaOur+PE/
         IoDA==
X-Forwarded-Encrypted: i=1; AFNElJ/gALo6ySPwmF4gHrLqqd12dO1p/D8UVJZneBNBLcqWlVMgOhUWZdhbwMQTBURAud/YL3U+v/WVHI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/ZbRxPwpdCEgdKja1MFSveB7SZ+D9pHBZ7E75lUB5ksXLYZ5
	14GYZygNmgQgepazGSfuExQoSzJID95GYhoHXYeUiY5aGi99PpTWPF8qBQ1FOQl7ojGZFor4wWS
	jwQOCurzv9NT+XoXxpIeC6VkJqwXZN/ZcTnlSn172FOUeI2GI/tqk89IerwsgdEk=
X-Gm-Gg: Acq92OHkh/IdTSRgM9Ac8knAZzPEJxz0A9A6OM6TTc+dyNA68E86489M8BszVVmrl2T
	RAlhpULfByVIW8aAsdIqSkAICGMywHYXOGHWZRM2PT4aoXIvF2xLyHiqtKCTyXnczyGj6OPtfyc
	drtX1rZNYmb7IzIxMwxczcGbKtBTDowsXbvRyuXhuQ1gqSUbtbyEEtJDQMybn6pKHJPpxzPoiWG
	bqtoQmD/gQCqJSIps7nk9OC0CMbuXLS1L81ev8PuDYm79papADfJ20PJGQLlDV6KO0aVaXPTNZ1
	3RUkPvXRbfJ6AJYXwg5Cm1MU6cvPdrPJOv5UcoRstMl9hk3+fte6sHdvvB8y+51M+JwtXWfkANg
	lO6760v42kkKpues8JT7QsnHiPtOsPYcXb+4RBsVXPhnEF6DCwL3755lVHvxwHhM=
X-Received: by 2002:a05:6a00:13a7:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84284f78f88mr6408283b3a.30.1780550814210;
        Wed, 03 Jun 2026 22:26:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a7:b0:842:21f0:5114 with SMTP id d2e1a72fcca58-84284f78f88mr6408266b3a.30.1780550813795;
        Wed, 03 Jun 2026 22:26:53 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:11 +0530
Subject: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX7DRWnvbaf8MS
 FC74DKicLGPyXDvrIgwk0dIfSgYcWNCTwyktcw2Ne4O2wvTo+ZJgDZt547p/JVU/CxiURB7rboR
 l9vwkMxZ5wz3gkMV95g22/gvKGt/6yUtP/LUDVzcXnoeqig0ETjwotahASWvJztULEsz8JyF3m2
 jerR7UaZ23oRaEUGrqw69/skl7v2J0ZM0KgJ6+saYoA1tq0iY0dZc4VawBHGLGrksXk2yewziUK
 wJrqQyfhXlRGndoGSlilrhxjjVAMhcqDA+/e8/i8Tb592Ib5Ae4UMDmSHTSE/zAn3xEi9HqTapd
 RA5cbD2esGHVTsEiMyvhz+CbtmKg+tG9FDIuOrqWcFiyDq2sP+dcg2HrBGDlQOIz655gweCWbG+
 w7EdyQ7/oEJ1d+h2fQIU0SmfB5go4KXWc138g2H1GifuIjojQsS0tQD3PG1lYVMn/JVKUHSRhCR
 1QVGF0tihRGjR1E8lFA==
X-Proofpoint-ORIG-GUID: 4SrOVJ7blHvpv13MeXiqiqVHkYs7BJfz
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a210c9f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 4SrOVJ7blHvpv13MeXiqiqVHkYs7BJfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6d88d067337fa132114b0d8666931b449f86de17..1c21267ae0f7a86c1de88e888c2a990c35f0a0e0 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -49,6 +50,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -483,6 +485,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
 	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
 };
 
+static struct clk_alpha_pll *disp_cc_qcm2290_plls[] = {
+	&disp_cc_pll0,
+};
+
+static const u32 disp_cc_qcm2290_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
 static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -491,6 +501,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data disp_cc_qcm2290_driver_data = {
+	.alpha_plls = disp_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcm2290_plls),
+	.clk_cbcrs = disp_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.config = &disp_cc_qcm2290_regmap_config,
 	.clks = disp_cc_qcm2290_clocks,
@@ -499,6 +516,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -509,25 +527,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
 static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
-		return ret;
-	}
-
-	return ret;
+	return qcom_cc_probe(pdev, &disp_cc_qcm2290_desc);
 }
 
 static struct platform_driver disp_cc_qcm2290_driver = {

-- 
2.34.1


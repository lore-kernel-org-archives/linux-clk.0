Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A93E92A0
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338150; cv=none; b=TUcrOkOgki0xflhwQNCTzhqma8lwkBhZ9radvE7s+Y8quVX45FwnQcf7BQUAXcnlp6Rn1Ta9Ve8f7jzHdfxjSHCs2ZaIgkpajQWXZHlJ56O9wMrMPaOkpoloo7KQujhyyXjzcYbAMWvBYJg20ZEjtj6wa4sBpDG+oB29RIDvuIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338150; c=relaxed/simple;
	bh=42ccGag0WOj0/GBe2dVH9h3Tap4krbtNxLr1X4sK6N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ct7pWZZDHYjp81QlqG9sXDZ9It0mFpaI/jkUwrgKZHJ7qgURS5hAzv9U+m7GQb2qibT718O3jqKTO/Ry0BfQnpt6LZHjgpJWfhK9d8XPKIVCANiTpUVQeS5jULdaOVYdBailNI42ee+MhYmGAGSYbyak0VH8aLbEICgmAy2bVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iS6EcdVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0QiTdzI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iS6EcdVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0QiTdzI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651CcUVV600463
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=; b=iS6EcdVEwfIn6cqf
	E2fDv6Mpexdd/KIU9ZH0qOPMx24YbWeSiAPPCS0HSECub9IFDc7F1/+aW193+xyJ
	8oI4X31c07obV0aeaQXZdVtc2JZctAnlBj40BiBgCQRVOAxkCSzwYCYzphgKhRwq
	Lu8G95u4NCNdUr1lsqcnTv9JlLH3ZA9TU98zRCqcaYAVZNojpw2GT+GIVoOsViXo
	/cwKhfAeXOwllnS56Mobetr7KMWNGC+m6z2pv6CzrDFwiUwCV9zQsY5Pnc3W2HpF
	SgCft+Gnaw5wodRY9VY7O/LrkrNBxJaQeqIo7qwSwqfJoQYyiu553BTMDsxmHLYk
	Po4IJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r9jbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so1210099a91.2
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338147; x=1780942947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=D0QiTdzIPvX0+kNvU6+ZSv4/Crp/Y/eK1AfWk+rTIPpvmJtH8gvoOpNDTqTz4ax/wI
         cO81P9UKaV5bxg7v5EY8oB7aMYtTXMaJJwXNCQP1Ji2OptvQIe0xeiHe9acVtIpmd2oa
         PGMoH/1E9leOaDT8832RcbqNIHo4Dpz9ezZg76Yg+XD9XfL2d1ncHlYtEh4tvkHg1MbL
         i/g+SLELauVtadd5r872R0HssFRs0TwiGRuDDO1d59jww8QELGO7+wj20WRKwa5mGD66
         9y16zhoy0qQeVASJ7WNtS9VHxJoAgVL8jCegI30OtQ4E2195vAsaxnwPlKznb6Ttvi18
         d4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338147; x=1780942947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puZDQSZbceIaT3uro2Z2sNeQm6mU370uUUyIBgl4Q4w=;
        b=CZl07ZX0HXNZpyn6+60x19dsOIKtuswtMMmmcRm63bSPtxfuUlSaOdY0mGAyG8h/Hn
         CqEagtElLwWC8RmYqKyKPZail1BMFux4fQgyJxvmTINlUZVd0iFlEyUbMp9DJI/QNTQG
         7g6McrHqCrdeYAdkhzcb5kHoNALOjF5+mtZsUdkEJIEnz9Au6JjFm1br29j5f3fRds0t
         WgC1eFwHoR3OyIRw/8+87qzxd79M4PS1rYpb5CP6qXZdTEYEFPL7JC0Q5gGYK+4nqVGZ
         CyokU2q1Kc8/dszH+pHAcEV9gTBPYfAnvEOg74PRPSS6ghYLlZvRCbKBqXW4wyUecdQC
         I+SQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jd6AdOpRtUFSIdrhZmWOXzpDuBi0cSVsshIKc0DPHTetioGNC1hbAeVyKpxIUZDj9/+9PxgftfoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/vDPEdHPdxDuFdsdEjchNkUIEXYKlmEzzaX56+aVv1fNXguU
	R+F/cgv3d8kxQz7hpsdKCIRKHXmcW3EX5i38g8beEOXrnYcKo+4j7ChNCBglVah5GRTxafFsP75
	UrXZW1YMAwF99ivIhuiiKrziSI8l2DKXD04hHyN0d19QdSuvAPbMLIfIu2JhEHDw=
X-Gm-Gg: Acq92OHVNNBMxHd9RsFSOVuYEZIQ1mexGgYuz2G9mhHcMtp2IWqiLRyIvG0ZR9lmAzw
	K5hjadpXr58iWFIyQIMvSEXvlp+b6ZeqHJX0P3Fj57BURT5FKZ8zJe7PTm9zD/dOGgIouC6bG5+
	7B7G49zTwmeGdbXgaY6Cxtossy4jrJinatu9NNW+Zm3YbuqtA/jIZV3AprCzKwnvnsIqvBZs35e
	ZqXhQpaekdvlN5+vadGL0sMEj7gN5C6CdnByeMiwUBcji3p0N5s/fYKI3kG4kMmgEq8/8kP4LQX
	d9p+xcmiFhko5AWeUKlZkm6mcciKPt//Xy9/gMnv94tTTa1ozsRhSGFjXOe5T6Qywz3I69i485w
	fc2PnBipQ+wBcstY2eM9SRT0rgeQot1ftt+6ENTLMHgIE08KqhfBRQnquUGRU7wc=
X-Received: by 2002:a17:90b:3141:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36c4ff6456emr12830368a91.10.1780338147339;
        Mon, 01 Jun 2026 11:22:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3141:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-36c4ff6456emr12830328a91.10.1780338146828;
        Mon, 01 Jun 2026 11:22:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:27 +0530
Subject: [PATCH v3 05/12] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-5-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1dcde4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ovrrbF7tBzFuhgtGbFCyLtGE20Mp4eS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXzj7OFScoN2sO
 0GycTr/nHTKYTzM/2fMYppC0KBdSFBkKYWfHqhtima8BVRgN3oaeJCKjyG+LdsIhJ9arNv4lYNw
 phkGGYQCptAZHSaQ0sWs84jZgB2lLQidt3Dk9seQhCrsO2buNeq9UdlJ/kaaKk6FFwwS7d7AWLx
 zYF3GhN9Zhqb2NUEz4ZXZFx7BU93y1GVihv/YKyDLM8rWIrc1an2bz9Qu8xvt2W5U6UwzxGW0uE
 7EvmfpKsCCY/CPJNz4iylR2BBKoWY8WToP4NhRByZwZHkbcFvLws9yampY1WJvOpfn8xe3CTDbL
 zF4U8KSFjEoBzEDFN2bx+97u6QV5rXkSSi6+HxnNjx9LZMhDes0PgbCkWXRbYdZYHO6whilZCR9
 Lx0Ow9/L5lSPAbeVpJuy1GUpNbZtx8t78CP9hiNgY/T0ExCj637iqmUYYfcKOWkxM2WHE/tWXSD
 dGLKkcamsHa/HkOnE3A==
X-Proofpoint-ORIG-GUID: ovrrbF7tBzFuhgtGbFCyLtGE20Mp4eS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

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


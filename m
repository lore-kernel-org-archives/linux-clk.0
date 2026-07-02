Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9836B061
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017252; cv=none; b=lE+gyHy7Fr1EPNZpsoN+oQCvO+VpaxyEaMCrO/ql1NXHT3VagnmAeEUnmBoXtQ2lL4XUjptLm9SHfyx0DXx6U4pnd5y4j0P734IaDpIDopoN9uERvmd1pi5Y+5qvm3NsXgYMFAJNOZIdwjtpQDchIXmDbmyHqow+L5vSS0JkYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017252; c=relaxed/simple;
	bh=8Cq6VbOXS7/Rq/Lq5G3WcmwMpks7f+OcQeIRzlpRjxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjCsURfzzNYVT+eU657+oMZvV/dOA/97hVFyBZSghDyu1LaZZVeVC1chC/AxxYAjPRWuwh8DFV0Eg7rFbJ+XOLgyhoIXPemcASI+5P+dutv/XHIlHEXZVtbd2ldf9bZtA+rSjGc7p7PT79hsw0c9oQV3Ixu01qybjPtP1Sw3hVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIcpgaCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTFjLmOw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIcpgaCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTFjLmOw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUeqe866109
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpwjBgnb5ruoqiefAdfBFuhL6uaS/x0MR01hksH1x0s=; b=VIcpgaCGBPIMv3Zt
	qw8dOjXgCULrkSQWOiIfp8x+xCtHifsfe9kMbq3fxHvqJzg5GKNkwLtBA3gPsw6F
	3hp4/Uxgg6D2J/YytqxM2/c8BCPmHGRlefd8+geOyfL9PKHBcUyXpQHpHkbFIebv
	WyXipnMWGEyC5X3ZoDbvwkRp5NQi9WAqjtqinH+n6PcjPtoVzr84q9P8FZ3V5aSb
	WRiRmyb7vJWvkDsaFBYRhqErTaGkZbvJsCYdtLi+FZfNeeDjjTkiTdVE9gnY1hIg
	2pHks7HOLnypmAOR9UjteraXZWoce/PkMPvrtapHAvAUXL3QkehVPYJPt9FRW12D
	ZNwqGQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3025479a12.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017249; x=1783622049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpwjBgnb5ruoqiefAdfBFuhL6uaS/x0MR01hksH1x0s=;
        b=XTFjLmOw6+ZGTGErniO3XLe7BW4zRyrHEHgp4yuYNovaILRPkgLzj9LogaqRJV6THk
         lW2RtNF/etbV095BrmJfntVY2R/MgQXUmiItJsp66ECdcIoOKrzu9hzXVRTh/ZRgLUtn
         9wxT5FmKqXDzvSUbxI8i1zHoMYfm8Mxobgy+tUeh7c1vFa8k8NDjd3Jo5HBi8o4b5jDk
         4i/+7xJShXJ7HjtnCrkEgrVDnkwCUW7rJ3rfcz4WcOh8zBelUR62B2s2BO1IuJIekQD4
         FQQKKA9vMoGJpFcszh3OD0o6+gHLOQsrLmctY8s9fK1NA4viGpOmopfmd1l/Di2dx73p
         urfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017249; x=1783622049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rpwjBgnb5ruoqiefAdfBFuhL6uaS/x0MR01hksH1x0s=;
        b=J7oPGRh68nrVtzgqrwkNdh+vgYWSy2qR+U7rYFYXBlwQ6CfspPA1Y8w3n9B4jx5HhA
         U2Jw8odIC8Af9w9hXSjSwId6QnexLnpLX2ELRS5d4KlTD1J4LDP2VFK0bLFFLp6u8WNr
         L8H5pJllvRSeQt2F4aZdXJNkvfycOkZ0TDtoguy12FydK9ySMvoqkf0t2n+4KtCTvwnJ
         GHAH9YDyjz73vZYjqNtrq0SKC/BLdxT19DMeSh5VZeYidMbjhYM0ub+SC+0rYAEg+qWz
         YnhZCcsFG0SIj6aQ/TjgwG5vDRM/+Mg5723FBWX+SuIXu7eCk05FJKikj3IjE2xYEEE8
         2ryQ==
X-Forwarded-Encrypted: i=1; AFNElJ920LfEsJ4LZEf5mPYbEMZsAo+B+rwsVw1xSdfyza+nPxCCyoMbhrftqTbTKqORKq8Os+Ee2CQ8Dbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMy1HoHlHTy67D/yxFRY0s7zds/DI0aCRpERGjh36koM47Jo6
	CT250RAdpOmabWlwhjaZ9REPrQUKNPKt1M500pfe7xEQUtII53KhEYupwR9dkNKLBcCcu6SVJAi
	W5dCRUeeD6bCJNSaLQfbGZRIYjNoQZx3quQQoVGMbV2UzHYKaQUQU8thoE2TdLoM=
X-Gm-Gg: AfdE7cmzlGhxb2XCsvdABJDvYCx10syMQkV9ML9+ZMeTQpTQRPf56ncKxZg5hAHAfWL
	PE2dCxVyRsnKlXnmkx+Nj7QHhG4hfoJ3HsoRxF8iWxegqHKZJM2YOuWiWDZxF9ZuKXUet4n13Kc
	/mvR0quL6MUxyHDxx2D9Yivm2FDtJfbw2CSpYeb5C/Tb5hZ4XS+HhyNeIjKi/52Ua1jdT3V5Dh+
	YP6Pq+y5d6CfJdlPMNMxRwMED0TM486geRQ4afcw4C3t95BfvKXPYI+coftJGEv8SAijT7Am1uh
	MV4FhWFwkzctVOGyucnKT9iJe7EwjjlxUREaDFIXwvSeKCffaFl8//5C7u+zZIkvMjGJbul4vVk
	MUisySsSexzEFSa9wTQ7C7PQzaTHGvG2C/6141OwN1w==
X-Received: by 2002:a05:6a21:7016:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3bfed472b94mr7711395637.38.1783017248959;
        Thu, 02 Jul 2026 11:34:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:7016:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3bfed472b94mr7711350637.38.1783017248481;
        Thu, 02 Jul 2026 11:34:08 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:08 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:35 +0530
Subject: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: chQLBPMDPjhm8fIq_-_U0nkK4Z6wCmaN
X-Proofpoint-ORIG-GUID: chQLBPMDPjhm8fIq_-_U0nkK4Z6wCmaN
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46af22 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kfuAGOiE8AnRzSM1rcsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX2V5UJppFdCNu
 qoEjo30dTzHOZFmyk9Q7GBsuKs68i6g7Oo3F8JRn5GHEsJaIM18p12uMS9UKgFJbUag61QiOwQl
 ZAvnJRV6PfX4qY1yk7ALcELOODHcrPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8n42ai7kJiHz
 JcGrPrAHzP0QFLzvSlbsnF4oMxFs5mO8IK7krkJPzmtSTVc0VJtyVmEW0Wt4dMCOHGQ8JraKdC8
 18m0JfRXqw1X7wfQ4oVidUmnCPIEdgDZARpXkm5hmuNkNRRASMrCho6B8ZL3ptSOAe8wqlGZo2r
 4F3wp545nCEG+RdoGnhPfPJB+ackPBx1HbWr2WZ4lwiLVCGSpxEGjtLWTuA+hF2KvOAuf3GIZgB
 +Th5GOi6C1jIve4K5r8OFxm8BIjDqAO8+1sg+dVijkPbD596xA5rKE1XSATsef6JIMsDI4huTF5
 Le7jTq4g/3J3WZ8US09Josaw51Xayp17Xi14IZll6FRO/wmvKG2Ik7ufXmvUHXIWcAKXQNtCoEx
 ibf7J91m1oF1sZTrX7MLeaGCUGDQhs5PDYXq/iVM02iaMGkuLkf9FfSjenwOiqepC0CRiY8R+md
 62rqosydX6iYeVNpu8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195

Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 50 ++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index f14b4620090efea139316ad833e034536caa5199..b19e8910931d85ceda079c2745eba37e18112955 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,12 +2,12 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -19,6 +19,7 @@
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
 #include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -55,6 +56,7 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
@@ -346,6 +348,14 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -354,6 +364,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
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
@@ -363,6 +379,8 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
@@ -373,35 +391,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
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
-
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871BE3845CF
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379442; cv=none; b=Gko80SgONeQcY7fDqrPhV88kWLcHdRxlJ9TxPPFM94YFIWWmjXUwpaATzemc2I/3CgHhtu4UG8YVjUc9dyqGGx7dE34NpsRqJDxTC7PbPMpWa3JvAJLAiYXcr1wyNpjsQvcwh9Pa3sLlkbg00lCtcZ+aNoMAaJdqP/t4unCkT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379442; c=relaxed/simple;
	bh=ZWJ95M6B1VCiPvJgQ9SGRpljn8Sw8iTIOMV7PBjmKKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvJavmUiJ9evSnnyBDMq/vsFdCLf1+JYPn/1QGAm/prZremgYULUgu5r1BqxIAl2TR0HrnSdl6AwrpQ7gHk6l9nMtcH0NnlxD1kyMWVdmHl5l4CbcROaXx2jF9QONjYGFlkDLrXKw3XeBXRrcDkGiXqftPdqTWRl+RyUv4NSyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMqauaXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzFd7Mey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMqauaXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzFd7Mey"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHZcr205873
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gaYOA7qW/i37mH8yvBPps0hB4BrYN0dKcClw0K2ECg=; b=YMqauaXw44/yu4B2
	rxV1v1TMo8Q2GjzWALxTkDYn+tL0wDoxvAFr6sntQYRoMGgHJHyQJC5nk1xfmOP8
	lOsuK6qNTO+4MnQV1Bdr6DzHn+OowNvNNAq4qQFKjPK+Crlan4/FupKlH7qFHlDH
	VLjC0eWDG+eqrEtlOhR10/8fCNnSofyvtNyn6W3I0EkHAWXFbfSqLjUNsck8Rt9u
	Nj6P2g5B2+jSvBX0NRiLspl0v0NUQ3z2XHpH1p7UHq+a7iOCbEOdDV+I+a5lZrQe
	iqDWNTRe82L1/dR3gvWNjohZ62q9k9e+Yo3PDfinAjAPl6amgLvzCzzLu0JT3IoK
	m/Byvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrrnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e667368f0so596053a91.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379440; x=1784984240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gaYOA7qW/i37mH8yvBPps0hB4BrYN0dKcClw0K2ECg=;
        b=IzFd7Mey/Wr7+jlPPARiL+mc9SvuWHcj9Hg1Utjri3Yzf2eUxiKhzpm8lZefFwFvS+
         ebepNR6A2sgnGdoGHMJeeOKXnQLDVGkdYWMIPxxxz9oNgy3AeQZhP0WerKe13ToZroyk
         MeHVnV5lHYFh3zahIG+1GB1n1mVDjH9t6m/k48yMywTexPCxh6pA3qjgDMLSLXiUgHFP
         74Kt+S8QOpyEjj/+EZPKXrajsbjrs1n/B7nwzwjSQFmEySV6CfOJ4Hqr+4PI17tB15jo
         3xNQLYVM0UPvnmtOhbAT5BzbtyIkNnVz4ZqspBE89OxezWrap4uyMLtkyHtFD9uHZXHN
         o4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379440; x=1784984240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gaYOA7qW/i37mH8yvBPps0hB4BrYN0dKcClw0K2ECg=;
        b=FjzRYUHuxqfjFmwphoGmACeJtNpSj9+NUCpeHgw+TvPgf6Dqnp7MOOSq6HjImfu9T7
         +xeLupV57HMjWvuHcOboBdHo/06K402TavQXVb9Mi+nTBBrps5dHoijxNg4qoXyDHXuD
         2v+IqnNBg0ScWCOE84o34mZOaWszGXgVUhHvFvj1bzK/ICiinnLPdQsMdEmgnvsVxDvf
         s9+Kr8jTzIpLf1x2vXpg91ndRcJ6WSbLh+lfo6yzSdm11//8HGr1SLNkULm3FU1J2/Wi
         nL83t9ehHbNYP9S5FKLSUC5bOOHLBJsvCGstSeqGEYDH9CV3k6TOY78DGwFM79HRY/Be
         DF1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp71ypzz4Sl6s5M+06HCPSLN35D8Bb+SHfhTjqXj6zU668mib2+9sws4wJmSRdkhrIjak4OpmP378c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTGSzSLVk10MxI5xNQzPxHgogNKq7hZPSETzll2CsM4uInckXe
	0dSqUk0qFfJmmwwAJOIWQMB7lhfoVxdXMB3JFG3XiFz2rbfzeePdhDWmX4LCWahHXHWoC/AeysV
	7qPNj4nHdK5BFlXNLWqohGajHxygofcpIg6VwYOf3DBnbEVeeLdsYi1sdEB5qOW4=
X-Gm-Gg: AfdE7ckC6EaFgx4M/hYMz6+uNLB6+i6eijc4hNbgzF5ZcuuP2yMI1Rmzlwa+Or3TvPp
	RYzrqRmVhlSlbMrmy0nWAkPFsJ/wJT0YbsLExx/GSlf5OhN1+ny0R3L1uGh0/HqzO86DXVht/Ku
	6qhZnGZrMZX42nxxzhy9o9SNkEeRA3nd8MnE1ioKGsp6CTPYRMRTJix0dOHWqkN9OEYZNwP4Bpe
	7GcqSjH3v1yppYgHf5K8aCgMiwrBvkSDNmqM6vF67wW1ifsfQfXcvNkuhhpr/XFN5AwAV1l4wAJ
	TyYofvCd/rekDdVA+rOnc6PwBXMvn355msJv4i79uFzXkh96ZLr2Aw+0mftwTRSg1mT/uS5DxZx
	Rd+6Sjov6sew2DynRlhXaYFoQ7PdOKPM=
X-Received: by 2002:a17:90a:d646:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-38e4b51be59mr7597116a91.27.1784379439835;
        Sat, 18 Jul 2026 05:57:19 -0700 (PDT)
X-Received: by 2002:a17:90a:d646:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-38e4b51be59mr7597070a91.27.1784379439343;
        Sat, 18 Jul 2026 05:57:19 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:18 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:16 +0530
Subject: [PATCH v6 09/16] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-9-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: liCnTaYbgIh3IqHx6VrDGExIhQV5TPAf
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b7830 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kfuAGOiE8AnRzSM1rcsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX7mugNenaecI7
 PdIvu0nbm2teprvH/VMuh2ZHenGpVNE3i422c6Ks5ixG33bqo1i3bemEBEFs950kC2ICC49S16N
 J5x/qZrrjiHjXHxoQFIbwqFzUeTRTfEUJnb8PYm3y8gY4PYqtI2dBTQa9QeW4h9LBQZj0v7DbVv
 V+jP8c1BBIU+LehuySOhm4Y/Ndt91lwsfLKZC69fUEUJRbpqKSp2cJ7aqYoy/WMK9vo+jvnitJy
 mhb2FnjHDwFw3cb/JVBnDghanKc/gh42iu/al1Z1wAHe8WCoZQpZMv+QM5fz/aUunU/RLas9/bY
 ugI9AJM2XadMXNs3O4/Z5Bc51fHr+AM0ybZiuM3hNm3DwrNP3rQ0Iqrh1eXEQvN5uCO7vbTBx7a
 +KGIrPdRGHmFDsi6D1QO/V/Yl1cnABWhsxPImQR/fo8EvIf8WvJLywHi8M+v91W/jPGa/cQx8Bx
 Gp7EJrO/FlTP7G/WEwA==
X-Proofpoint-ORIG-GUID: liCnTaYbgIh3IqHx6VrDGExIhQV5TPAf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXzBfztW7NaBWF
 DbdKfLDjbN0y5wdrD2ZzGKeo7X45bJOMPLAUGyPHw547pml/BlxHPKxz+XwB+UvUjTlZGScPR70
 Jc+iLAK9IJCjxP25SgBrXikQ4ckU19k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


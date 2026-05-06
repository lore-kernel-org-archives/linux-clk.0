Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F34A2E20
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086301; cv=none; b=oY/jI2KuBTXan8UhfPOWrX50mWzoMEY6zgq3uxD/bXGEJCmmPByJJraLNyVfQlF9C1t5nadPnIpRQVtrI+w8GTU/rVEmQr7RaQ1LSVC4pC2VGFdg4x1koUH7KemyX5P16ToPQWIzdSg0DMQAmy2PlyFUNdikgCgWCwSp5XHE6S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086301; c=relaxed/simple;
	bh=40NxVXovUiixWCXyomPxXiMim4vp3tig+MiKVM0oErA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejBCDRCTgGi26UW3QpzrEtIUjhP9Y3a1bAxagtiCTxi1kK/dgxFg392DAfvTL4Y8r1xDKZPUl/Nl6IXYEB9wAYeO8jZrEg2uQkdd8aSfKjADLsrGI9v2FzXnsPd+2OMJKfEjTmo/ttNaXHZcDk3lQAk1nPkrHSEvrIwh89MdjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4GuygyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyYryf90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4GuygyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyYryf90"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5PR83036600
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=; b=K4GuygyQva6PX61I
	xQEL8/0NtzhsXP7i3SOXqrGXW8baguTS6SH7A2a0XUdZLVEPDdnNv6MuSHXfaKmX
	7Wd/aioOwZ/aBZRXyB++licGlu7XzaY6JcBOhNObeOWoRVFCxUnhdBKepUowUZWf
	9YKN1SRulMpgOipbACXr4v3ZMOb26sLD2CB0pBz1eo4D5RG4q6GBalz8wS3K6ZnA
	1QYx6PFsRYzUDo1G6pe/7Y4CNBCoZQ9pYObQ+7YVqDQ2HPZm12pHWB5Sn3S9CM1M
	Ich/tQ9gb3xT9JYUr+ACHI6yYmxTj0JZRxbvNsq3zyDyNn5ZKwjpBUDtRU/WfWtF
	8LxsGQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf14jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso1080855c88.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=;
        b=TyYryf90ouM9yxdY6vIGOsqcBAvhL+oOJbqheggO1pe8xFRuHid+7mjA/NezIzRrTU
         aoN2V9tjYCg5mHyKwSXzsXPJlwriofTwFpQDE9KtC88j2hLgZcGWj8H2AWx9jCG3SGe/
         7kPOfpLjgCWKbUtC8sb5uXG0i8Vb4tRV+zu6NdSCgByAF8jkEGGThuKArLqPo8VlFunX
         aDHqVqPKrizi9eTaIzvkRpytb8F2NJwrpi+uLaPnxfDxbpucoqL/VCegI/Wmqvylb2Sl
         ulli7jpTBC81H08y0hHj7nT9PR8ej1iUAKouRrrjkM2duvwvZKpVya5nUQw51tRdcpdK
         F2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=;
        b=LFhNOlWy7uZsAvVx433NHuykxKz1oX+EGOXmICg1TVOy/nIqqqIrsDKFcMH8wFGnR1
         CrrpS/HWsu74IoMQVuVab7MRDWRv3I9qERqR4SWK5stnm8VaUQ3hJ9LSyLRzwT4lbGD9
         ABhVc6LRagpn8bH9SXXVDidyDWQORzBKWTqweMQXm4TU3fshpKRW877NIj8AFhp14XIZ
         QtqPkkg1xfnYWnJL9JE+xtZr8/ueWRuTzd03AyGb84Jp60RY0kSXIjn2RCxcZYKWZ99Q
         A/dl0IRx3KFTM6fIFmSUBY2/GbR2T4t8O/J9yOEGLgSgCKwhFZLgsGmX2HAhjSaHaY50
         e8zw==
X-Forwarded-Encrypted: i=1; AFNElJ8qO3SW97DRkggC+/cYneg7QbL0brTPtVA561x1+FqKFG497BR8HokakRJ6j7l1eL9LgfyeV6dSJGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxjB75qQk2hZwPEEVA5VYv8ZaK42xCPBBQUCuxWIXCkzNmLiB
	hjYPoqzPuyG4gpULsdJIKBBbooNQNNFiohT058KwO720L7IiArYd8DHTvA3BIwRF3QCnZZt8mjY
	1BobzZNFQ5b595woU92qABxMKi+jwhsCfHp2lhYe/6t/vWGCngcRP1V4i4ucIjF0=
X-Gm-Gg: AeBDietx2TMLSLniKTj1MGoQRJkUH+ZORX52u6Jehc06WI+0KgfLJqGfMA75tFP/ygq
	+ViP4mIgWb/NXKs+bml2vLAHJQdR+YIO/HNQ18aWCjWjuEYslRjdlLHkIP9+YaHkEzCfxmi+SV7
	oeEiOZEspB3HbdSz0K5g0ls9hHUVvMKeF5GZiqwNZ3M0unU219O1FOYpvl2eVlwgn7T2m6q0p2j
	uzDVqL3XWgUuZIYrnIINqNhDY9eACxQ7EMbPJsVEQ0sgaVz5PZrGJAWqRJ7FbMF3uL2AuhVsY5Q
	XlBL1Jlpl1uNjXUogXxAQ5AdpiODJlp8RkYjvfS6aVGPWdgRJ512FxsICFxS2Jv+tlpmNXx//nN
	GUBGAYZ+/tSoOxS2ERWbk2vjC417vEAVr56obcfLRtdWzDCQrkSfDC9Z81LEbjZcprHy2CisA00
	xUN9LiNCTn8fc=
X-Received: by 2002:a05:7022:6187:b0:128:ceac:6db4 with SMTP id a92af1059eb24-131acfeec10mr1995902c88.6.1778086295065;
        Wed, 06 May 2026 09:51:35 -0700 (PDT)
X-Received: by 2002:a05:7022:6187:b0:128:ceac:6db4 with SMTP id a92af1059eb24-131acfeec10mr1995832c88.6.1778086293088;
        Wed, 06 May 2026 09:51:33 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:43 -0700
Subject: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-4-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=3051;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=40NxVXovUiixWCXyomPxXiMim4vp3tig+MiKVM0oErA=;
 b=c+XjCtSNJc7nTfD5N5hOh1UxYyN1MjW9YZnKBJdKoT3KT1btu5w/rV3cZYHyqMrigGOepk9Sp
 Bv45AU3OTYUCUcCDBup/23udKJtQGIElky4t+5gLSD43FiJlG2Vj6zJ
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfXwd4x4kLlZJyL
 mVZPKS4IEhcJiYkXNO7MXNSKSp4xXJLHvxk3QyT8ak7lOfGza906RyVWP4LFULKF4+0Dd8jruzW
 l7bXdFTrpf8RyRs1/04R19Yi2SpUUQtHKp/8NVampC0OTnprD/isBAof89AtPRdvHbpCx4VbEeQ
 cbHfiP3QOy1EaFRqd3UNf67lA7EacqTocU2RG6jjTBDT9m05m/TEMqSgrCjSVGK1LWOL8yiASY3
 3VYkyT7mPJ/0U1nKehbU5mfIEEtxcEICgZaukI5BXPlK8uJ7sstdFwTrYPtAVpBJfA3/4CYANsD
 3u3vBDkB30OoCZVpaN1RHiPsRs9GYt93FZTSUCw/vOIkweY9keSB/6VhDWQn5DjJzcOVlOmKHpX
 svXI3u/xhUmNfXDFAbyu9Z4FXmXxYwhprjmeILMlCZRmSJof9lff/gxl/wi+1H2xb2CLpwmr/Kg
 V60ON2D1Gr8IsJ2uobQ==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb7197 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: _xquCR2lvNeREi42ZgF3cKE1G-6XP5lr
X-Proofpoint-ORIG-GUID: _xquCR2lvNeREi42ZgF3cKE1G-6XP5lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add RPMH clocks present in Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 339a6bbcdc4c..8eae6fccc127 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -409,7 +409,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -984,6 +986,36 @@ static const struct clk_rpmh_desc clk_rpmh_nord = {
 	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1075,6 +1107,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},

-- 
2.34.1


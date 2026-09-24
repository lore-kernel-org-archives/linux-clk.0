Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14CF47F3C2
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251768; cv=none; b=ZLL4Aozg3b2difE7NF2Yu2GTyJ3a8SDoo0xaxg6OyVJ8slUCq/FXj6Fj7ZSq4e7/tNdHD4MRtougPQIOmYU/nz7zs9xwa65x8TzmCPCGkr9I7xiLRXdALvr+0T3ScgKFXfotHivcgPhZRYl35Q4MyldoUNAlEYeRabGPPhjk0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251768; c=relaxed/simple;
	bh=+ytC9NAkfv9kbIOKNH8ea9oA05pxToOL3Hy/iiMk/2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhEqPsPxnT2GUTWJpCRAcVxRpWxT45wpdmScVZoRiKS6snTUM40YvTguGoRbkeaWPxaZ1Mcpxp0V5ROQ5OvI3jIOeAgwxeYipUXkd3BiLMKEi8JGfDp2JrvRZSeieqPEFOaQz7aewSFFrURl+VmMTnrCK79PsEH3VIMyRgfGo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFjVNO/J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaH/1oPi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFjVNO/J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaH/1oPi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4lbH2385824
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhL8gol76EjqbZDJ2aFsY87OiuKYM8j1uxXZhsgz7vk=; b=LFjVNO/J3eEgDeCs
	q1bj0CZscLHrtRYGK1TQ00GLMuUKdaiCvyrUrAUuQ+tfdWlxUKgRuLdovlzN0PU5
	MtlS96WGhDAwqaTILvIXMh9xlQzDnmwksWVAeKpUgNf27PHIAQ4hpG8t0C8NfWmf
	qxA7a9CoPOfXiydaFr2f7PnJaNw5z8TXH3x/Tcxg0GnjH9MPgjOFtRm9s8BQxwqJ
	U9Iiw3F8k1rMSh6T9Ts0ZnFtOumLkny4ZjvgjViHl1ckTBInqzGlz0vjDYTBikHo
	SyZn1f8bhf3rNdtfMHzLWQ65zghftzBcQ10IzftoCAPmA1nbnNMjiPg0Qb/C3r9W
	Mp3XQg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtcp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78d25a8ff32so616668137.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251765; x=1790856565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhL8gol76EjqbZDJ2aFsY87OiuKYM8j1uxXZhsgz7vk=;
        b=IaH/1oPiNN4CsWAM0AwV7C8X7xkNsnoMknE88JKS5/pjA5amVIMRNTC6PF09TRCk9W
         ZsosCsRuvPfcVUkkI/IM4yEaobVcUxeksgWFdmT08EfKWuxVy5O0ujp8bnp6dA+AFo/H
         bOe9DveoCNZW5vjZqHpmqbzKsLDg9S6hMi6FtJwz9diaaI2L2XwvN5dvlYuPoqROq0g8
         UTcOMDhWiTSsUOZBChn3TDXAEYb3Kcn2mutLOyvclwrf+LHseCjPzBKtjnlQQ4x7GIIV
         j7qYI3/uTRiRe7aY0J48KlWFvUAKWdSNnjfcr0RX7kEkAnet3qIjIkp6oKQ6dSTPyiw7
         g5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251765; x=1790856565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhL8gol76EjqbZDJ2aFsY87OiuKYM8j1uxXZhsgz7vk=;
        b=hk4r4RqgTfC/0IGzWT0+XHJk5I0sdjDZfIuFSjSfjnN72YsOfcG6gTJhbmHT9EIdJV
         E5r9q1JFpLWGc7hyg21Fnf4O9X1upzPGf3tEMjh04U1SSV5oQK7GSvysNKPG9sAnwFZp
         lxthN5ShpFgXvlUN5KJMpxNUAdEG2HTjyRsVF+bsZDtpo+sVuFDqeFh+BKc9U5IcOThy
         C8BhYoxP4YiUoZY4yAe6y6kuf1EkKe7v69y1sHzrxaURBM3+FvypR96tnL3/pAOBnaro
         38QMYZX96m02ZriPHm8jjV4F1CYmGAO2/NHYdNRWCc7Ivrd3jf9nFN/u6y6kaphQHELN
         jQeg==
X-Forwarded-Encrypted: i=1; AKwUvBz7ttw2OmI+BX+3fQuSmAGZWbvtzF3O4J4k3V874ohB2FDY4F7NV3On509lo/yetQpRNRKCJWHiiE4=@vger.kernel.org
X-Gm-Message-State: AFuF++kagxcGPHlANxOSGx2t242NWirn13VzaDlHaMS4X5S5KYE6MIOy
	yDQjBkiYzLRUwRpqyx+8cNoOLiX8x4SawI7ipvzmR0/D8Y0xgVHWGM1JNwFbhJo4Evpi8gcNUd1
	pX40Ebo9l21tuiph0Uvc/igujZSDc1HTg00yjep/Vfts/AChdLd7LPkuQdCf013s=
X-Gm-Gg: AYBFou2v0HvPXtcjhCWFcWCRU7XvPP6pdZ6Q4MOn9aZRMfP14UZYKCazBrdgdsYSAXN
	eGz01fcxjelhMXHrvUP+64TGkKTSJO2resbB5+SMRFGk4l0EWc55vycOtYtcBtkYNmYZed8gBLz
	lP91FIu00ewZmAjS1YTyz39Nl3SnliXebn35TXedGfJ/FB92frbdZGPIQIHFY/9zYQRSTCBSage
	aaKGmBXfHw0b48Gj7iwjo4Yx3llEO3oJbxa9VHVnkR3ycr1cGluwvYowki29JNLHonYsgc4J3q2
	Gs954qGeSSzyf6kA8K9gLSUZNOIX04ubTOs1o4mFxX3xklboJFFRXFhvA9Sy3UU0MM8MSe8EzTR
	ANaET8ZyB
X-Received: by 2002:a05:6102:32d2:b0:7a5:4d80:a913 with SMTP id ada2fe7eead31-7af1c58fa50mr1049642137.7.1790251764547;
        Thu, 24 Sep 2026 05:09:24 -0700 (PDT)
X-Received: by 2002:a05:6102:32d2:b0:7a5:4d80:a913 with SMTP id ada2fe7eead31-7af1c58fa50mr1049621137.7.1790251763861;
        Thu, 24 Sep 2026 05:09:23 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:07:00 +0300
Subject: [PATCH v2 48/48] clk: qcom: videocc-sm8350: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-48-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3128;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ytC9NAkfv9kbIOKNH8ea9oA05pxToOL3Hy/iiMk/2Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJwXy91zS9yygq1H9Ixamvn29f+Oxzyd4Xqz
 89FxhThUf+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUScAAKCRAbX0TJAJUV
 Vq84D/9MMfPToI5LZ0550ef17dvpTVe873xiGraW9WRVWvVDFFmovlKFL9g6GW7tmjTzZLG9yfy
 fYT6eq4hl2cEDBeFmYHJdr2qQGmb1hq9LXVvSdV7FCWrDm6Z959WxJm7tWk9VDqkYUl55nAb9oU
 BGj6pHfYBAB7Jqho6Bidb/cIW7Y2uyGeC/WGJ8CqZ7Lksd+ADnsr1GSiPgN3IfTlJcXjsbL5/4i
 DjdgVyn7EQcOku1lvDhRjGfRbekNNeVLI0B0rGq8BOampVQVtZA6SGLHnIWRkc8jMcWYn8UT0ZR
 vb1pdzpyOiKw7gmuzX1e9P9aYEHTSK4VIqvCkWCLc0GPJP3gi9Wg1MAewYS1j3Hu8xLGzr2R5nS
 iI8cBhp/oId/E5thWeAvJ9kiPZbMNGvy+0UDjgLpB5bVwQ75FclaKTyFcJ9sO7mV0sF783fJX8l
 mxQAlRpufEQ11nRswMHrd9w3tHx/gknmz9/6AX9lac7o0GFREMnSAdGihQ/IgH14b5Z+la9BbDI
 GXfJY5yiMf7vjiEuik3t3OvdpVaKEcGpTR4sRC4YD06UVRbzvv2s5rYBEJlt7QvMDK/P6T+pvCz
 PtYlgCUU/o9GxKH33R1n4WxBUaY1hb0Ji7QVFtvs/W4jlT9TJB95ammKPetI99BeA6AgU5q9mV6
 gE/3Q/qzmvDRkHg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab512f5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mIQC-RI9wbHEycrXaygA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: ChUgAjOOJ42KCNXiApTVWX4I_Sdwhng_
X-Proofpoint-GUID: ChUgAjOOJ42KCNXiApTVWX4I_Sdwhng_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9CSdN29BmNOk
 o/ZY/MwhVQJxVWcIRJPLWVafNxHb4CSg13XleBxQnnS/PpsUrZjQyrReDAYub3xjRO3neQ+PdcS
 Gz34ajRzjfLqZR4+pxHXdz+ZH5wzcbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9LWUxQcIF5f3
 ABgUxWHW3t84LIU2NGFa7rT7rulvMQgTZ6YPJGcGGjEOb9TYhZgq9GjMecz31yzIdhALvQfnVKf
 jmUoUZQoHJ2ppBmrqYYAg46JU0gVu8K3lCWomtnebdflzo/x4HwhKFrsjo1eOSb/IGQLpE5DdZN
 1mOhnA1YoRCgKYwlBYcvBuglmavlfEyZK0HGLEyypCMpssWcVzc9tmARgeXnsoiyqGDy5UnwDAP
 XAmpdGxjwzkOzKtu3+fgHDTTs+17sszEu4ltPeuFUo0Z9/daxGtmqm85gPdYPO99667GLQ6pE70
 WqV0Ao8WrcnMcSdSHki/pHSwXaszfSFrSTXIqduYiJSavJRdd6hmi0OkbMLUWSaSaZiZDmUEO09
 qT7Bm1K/roUSZTbK4iZNjb3D8JfviZ70veUloX9Ed6k7HYbX0E1+Rdr3rvnjeaMsxq4C/Dyoj0s
 9D2sHl+jVbTWfC/ddwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SM8350 and SC8280XP to preserve their
different XO clock register offsets.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm8350.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 057a9474894a..8528aeb3a342 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -510,7 +510,28 @@ static const struct regmap_config video_cc_sm8350_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm8350_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xeec, /* VIDEO_CC_XO_CLK */
+};
+
+static const u32 video_cc_sc8280xp_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xf34, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm8350_driver_data = {
+	.clk_cbcrs = video_cc_sm8350_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8350_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data video_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = video_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8350_desc = {
+	.driver_data = &video_cc_sm8350_driver_data,
 	.config = &video_cc_sm8350_regmap_config,
 	.clks = video_cc_sm8350_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8350_clocks),
@@ -522,7 +543,7 @@ static const struct qcom_cc_desc video_cc_sm8350_desc = {
 
 static int video_cc_sm8350_probe(struct platform_device *pdev)
 {
-	u32 video_cc_xo_clk_cbcr = 0xeec;
+	struct qcom_cc_desc desc = video_cc_sm8350_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -539,7 +560,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 		video_cc_sleep_clk.halt_reg = 0xf58;
 		video_cc_sleep_clk.clkr.enable_reg = 0xf58;
 		video_cc_xo_clk_src.cmd_rcgr = 0xf14;
-		video_cc_xo_clk_cbcr = 0xf34;
+		desc.driver_data = &video_cc_sc8280xp_driver_data;
 
 		video_pll0.vco_table = video_pll1.vco_table = lucid_5lpe_vco_8280xp;
 		/* No change, but assign it for completeness */
@@ -558,11 +579,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, video_cc_xo_clk_cbcr); /* VIDEO_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8350_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 	pm_runtime_put(&pdev->dev);
 
 	return ret;

-- 
2.54.0


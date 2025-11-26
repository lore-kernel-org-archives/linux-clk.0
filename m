Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030022FD69F
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151057; cv=none; b=m3HTHow8400CoMHaOXvn2OS63R+ZtGDwmubHmjzPwtQDcfyQu9svd5mr9iImbcsUNf+2qXOMQTMgPCKzHDN2Zf1Lv+wGtT1qH9RKUhH4Sb1RTktjmNsugqBGwoabkwysJw1KEKq7hRtUSYeDslYCu5Kduz/v/IUag+PAFUfq7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151057; c=relaxed/simple;
	bh=Y+rAUVC9CBr5o/QXLpwcu8BGidazuogzO8irrnrlFoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LE1iYYgZEAKB/+uA4ck38qL8Vrup/lHkchfBKhDvJ0CKvV2+8FpHwBjg1afasgmq52LwYSAlcxr1PFxeZ1xOYXOpbcUcBxZj+eLvualeuDpRa+7mFogi1SQ8NdFNeArnz0s7soqoCE+TMP4vwV+DqQ3FaxFB1FjY2UtelKqO4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhO/tPo7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQbuQDif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhO/tPo7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQbuQDif"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2fhfU3706636
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGHjkKvGZrbPKQ+eUxHkHgCcBPCSnBCoeV5uc2QHR8Y=; b=UhO/tPo7gAnhzWrj
	yDRMpsiKOm8t6zW4bIOuNIOhlFoOF56yUTqpWhvW/dT+A/l3RqH8puajXAKZEBzS
	MZeQiRWioVN1lKspB4KHwkNS9nHmtQ/Ed300ywWqCfyIpL+dGDARph9B3+OPcTx7
	BBOdlhGWV3qrn/ixjcFwEXnB3kpnahLeKSLKfSJ1U5AUURT6JRGsx3dYSRFehxei
	Ny6Zp3WVkBJYUNs8Bkm4voFqiYZ02+17V7+CDzB9bGRwhPaaxKBfz6vKYiXMJZLB
	9s7La67Bi52qrtKzgGpMhVgLsIpoNjh10npUW+p+HJaNvOGBBAIHEVkd66Tb/fUd
	rEktZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufu0at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343daf0f488so6626898a91.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151054; x=1764755854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGHjkKvGZrbPKQ+eUxHkHgCcBPCSnBCoeV5uc2QHR8Y=;
        b=CQbuQDifXH+O9jX9TX70wJGW/rDpOKz+wV+3pNY2fI1n+8sGkP54bpR9xMV9qlk4yc
         bFJf04fYsw3YfYTvawEyqFjD0XrmEtCwjGA/6nlP70ZuoYI2xl2CoMqmMGaxgkPPGAVW
         szyzoKGcOm/6HSvVGxAklm7cNnS/1WF1nidp0kBqY3szmxPfvWqsqPhbXvqi7g/HLE6I
         pm7MK//sXhUOmPaWAGhX5wb1wpgg23AEYy1qmftwCS14ttUEvuR+t0iyA8p7ca2+ykM7
         Q8iK9eQ3qUG7zvWhldrRDeTdnPugTcmPNOYzPrPl/vSQTsPgTwtZxiJWS0jGevpU09lM
         Czcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151054; x=1764755854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UGHjkKvGZrbPKQ+eUxHkHgCcBPCSnBCoeV5uc2QHR8Y=;
        b=AZ+6XaPffsBfUiY4Ctg8tG5rw1uoGPxF+NSQHqQZ10qpri/+Vsko1XtRZNY6evwzW5
         JsuTgP2ofOHHhph/fNbSoFcAGcZ2ZhqTryqlg7I9gBqaxoD/nFkufsDB4VzWZlc+K1w2
         5jl+2rINjmtaxOMz2QAhQZNUcBZxzcCYJby9HFMH4v/pHSe/aE7ApdL0H0WlvTR2UnPU
         qQZAtXkuYATwrfJVc9YuKDgA4lAVtXoaE6jiMnMoue7N7Br9xSzFrk/8H8CCXI/Q9K8l
         kKWhLCADbMwEb24xZ08MSwsQIvib+Kch3B1iCsFl5IkXzAK7ce3UAhnGyzX9yb5SAz8v
         K48g==
X-Forwarded-Encrypted: i=1; AJvYcCUSIuuJ3JyCs6cBC8+gQsIY61o0wbBv2McNb5O/IGguauliu97ymP3zvfUgYvDo+hLmXydNJ+j/oLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkp38QGMXduA4tIP2+mTPpwkysaYlP/kTa0vvU1Yjr7H7KNBpp
	taUAzv9iDVpwgVZOMAmgAdcroSPRRt2dvLd/M0Vn4nBsB7opOHhQnL11qWg6B/HIKs1EFcKm0mJ
	dxPx5WQ2NeYpwSkGp8VzkTrkIDhUqZb5IvT/UM9Dq5gE23V8cKTF9kM0FY6UqNjY=
X-Gm-Gg: ASbGncu5IuB1RImUKoet9kw3Qe9sfIOutR+ZjGvP1/lquIF1BeCuO2TiLiv66sOeRZs
	hP4JVbptK8vaAFSclJtQc1R0OpZSgqkhxI3v+wEE0TePVEFB+mek7iGv0YurO0hzaKytktDOzYG
	Gy4H4xQagiXDiAcu2V+9LPhsCd1gEXAgPwP8LiNXZ07enOmJrc522+Z5CqeqhMrft+ZNExBH87K
	Z7hwjD99kpq9BDzD8axQAoTsENIAO3a2juATbmWe2F1OWd4PXI4TasA7evTZWjXC8f9rGKgNihv
	w6UKlgx3uoBGAwAN2oCuXbwvuBu1B67dEGDZ/Teuc5caafDjBOTchwqqHV/A756K6g7v3mhz7VN
	FPAEfVrwBWX+eJSwi6BAqA6VjzUOFWprdDg==
X-Received: by 2002:a17:90b:1c87:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-3475ebf9b44mr5834219a91.12.1764151053949;
        Wed, 26 Nov 2025 01:57:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtEW4LRYSIRE+IwudztBv7bzrzGEOoIeHULVff1LCTLmauW17WjnamV0cOKrTkHkWcFEpCEg==
X-Received: by 2002:a17:90b:1c87:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-3475ebf9b44mr5834192a91.12.1764151053462;
        Wed, 26 Nov 2025 01:57:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:33 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:27:16 +0530
Subject: [PATCH v4 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926cf0e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gxflGWy-rYv13cvyobsA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfX5DZ1kKTl1xIM
 h+kg2AXTWNCpxbIu6ZC1Z/x22NIYkjua8Vdf34a8oaLvU93W8Xqr7tDN2oRyPXrOcSR63ZOzwJA
 CtzslZWGVf/91fnioWonb73peCt9QSTqCi3PdVzvg7BLbsn+8sXWG1SmuVtgrr44wo4aymMAMQx
 kL0uh2IyyDorOrcHsbzn9+97RGmxM00Qi0KKo3ZE6N4ShDHcuynN38j0fSlAAChaM7BIWYpdUXv
 CqrtHx4fqasuszpYuQ/VxgXUoNAZpz6zfp+hC8Dt8V6zmnw2fn0LCCuD5TRMDe2tK35NHteA2yM
 5Te8ud4X6dLk/ikyopybUggOcRaG6D9tVRKKf4/LeV4kTS7H7ZGjtj3pPyXAbrUUC5uk6pnn+cD
 uwTKkyzku9n3kdLJlmLIEFJy9qwYXQ==
X-Proofpoint-ORIG-GUID: qsdUUKwCeou_yx_f41OF2ZBiLxUogIQl
X-Proofpoint-GUID: qsdUUKwCeou_yx_f41OF2ZBiLxUogIQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260081

Add the RPMH clocks present in Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a2185a6f321fb60ddc9272582ed67fa9ada6535e..bb2cbd2961d9aa1e4475d5876c1761dbbffe5338 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
+DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
+
+DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+
+DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -901,6 +913,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
 	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
 };
 
+static struct clk_hw *kaanapali_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
+	.clks = kaanapali_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -991,6 +1031,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.34.1


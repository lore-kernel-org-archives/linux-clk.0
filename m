Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD94D98E9
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554661; cv=none; b=DAGu9c1yO1QxiVmNUIszC5mjJnTap/zVNP2fCn7cOL8jCWk0/gR6xSK0NpvD50sfHNyr/m7ilcwA2wBpyAfweeFZmJ3cN3IYOoNbS+hZMNYcQiOklhsLwJiporWgn9qhVUlWZwwq1hHZZ1L5DT/gJ5qXyBWnuZ/mVBkMD48UXus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554661; c=relaxed/simple;
	bh=U+9VQRVM4S7Z8VJMwjV5ugP/YnxuxuAFNy2XnC0w9rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnYEdHOMAfrptq+ggSbQtgC3lxBMnjz3OpXt7DfR3E0BZV03DzgTumhTWvfadDhdJZOSmOEEk1g8LbESaqs5YMKIykyZBrXYUyhSZypfCIqKY0zc40xMdjL0Zy+RwEfaqJYcsXc1BbZtY0NAr7gKfjTy86Vj+BFcEw2Gljxango=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijOEB+xU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/vUmvpV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijOEB+xU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/vUmvpV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G9322J1587068
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=; b=ijOEB+xUc1ldJsYD
	8n+G+Yw4K/CXadTfC1v2d9tDp8YkHjYJgzAUKGv1GfciAQlybUDzrdzK/wJBJ0Cv
	A3oo3mgPZDn2NoDxgOrONE0lQ0IkQiJ7GACLcqZUPhoujCVbGFDkjBjQCsh5vEeJ
	LfA7BhlCn+KXms+Yv2TjouIVY3nd6p1s7sF/aRdETkjVk15Fx/v1mGuC0t65jG3s
	PLGtaMUzCHUr5CzA8LMW423dEDnveU8VkTLTKTBJjIjv5SvR/uUI/52pcnpN7j82
	605Wtxls8vBgUR0aRxa+Fn38+FsBdh2fAjbSdIYX2ZtFI+j/b/ou4W9Y1NCM8rxr
	9zBGbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageksfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939062ecda9so853030685a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554637; x=1790159437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=;
        b=d/vUmvpVJAFt9w8anmnXkKWUTPYE1wymokPmvNupDtXQkljok/bzgHFalA3KOFPjL1
         1hvSWD+5pKJdpuHgKmkqyRitrYP6+QrpoUftYOO3hIL5A9cWss5aG+aY92JVjJdid3fI
         WIXXy1V6YUlrB4y9rQSo13p5pZ8pT7R3Ks6LkAHuoaJrpCQDuE76CV/P9ZYz/QFmR5yy
         ZryMJ9U8wY2R7MRhcXrMjIDC4T2x8VkzXUj9AFdZnGXaCYRby+YMZ57KysER/3ZyLw+n
         pDdLpClr7frLOu58QudYlQuU63L/HEuRk2aPs00wSbCgw/YfJA6iViU45ZHztvrUmsB2
         i1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554637; x=1790159437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=;
        b=ZsCCJqbmYMxdJ3SV9yNRpGKIql7j2R5NYWvlW5nagY5dTC2Mb75UwOvJ758BljqwST
         TtiaIJe3Z2+5ia8PI4lki2iEJwvfTjBy0lDrCaWo8xP/D5WlM7WK8qkW2kqIDkeiPoHH
         rCWwMistpuIuVJncGYH/JXsU+AlEoylVN1rMt0+SU8hmn7tVknX3cP5ccW8iX6Ypp30Q
         9ODjhGIH6jCbqrWKLPHrJPp0u+P439QDCEQ5jDbjW6tM1cX2jRSjwGGcWP1LpsaoPD5t
         w4ikVP+s6f+eddHkvWPv2dybQIai+ricf7uTYPtY2G4+BLPdcUaMVvibpEZQmLJjSqQI
         Dirg==
X-Forwarded-Encrypted: i=1; AKwUvBxdR5xvJyNfqS9Tf5/0/3N3tbHtsLZ+vG9S2eG143yfRYDZVjsMwjoYWFF7rxpuvAeMoTCSfd9xNQo=@vger.kernel.org
X-Gm-Message-State: AFuF++leMP3M6o/0geU7qdLLdhGnrDIoEcAWxH5Hblla/xTslMbn/i6Q
	pkrb7jQjWysSXp5ISnExSOjwVRwPxatlLJlcd4iyoT6S0ailXXL1xMFjOT+duj0bQNpPZx4SVa+
	HrfPuVlI2JThrTSIb70Stv4zbUhj19tVuvwVjWxDuZ6LY3DGIBjP9mfNtf7BgoBc=
X-Gm-Gg: AYBFou1TIGDu4g8X3rqIp2ydICW/aB2Ngk8URE/5kNZeDWwBgZeHsIZOiiiGN2BbOnX
	TRREx1qn9U/AqW7KNafizgkrguM0yWlDIjyUto18oIdc/5YhwYPtXkPPhG1Z5aptNzebhCLeA9i
	8Fvgy56vMktQRe0cvLersWIKRq49AUAe8rNb5tb24JYJAxWoZX1R2VVsUQ+yQOUvU20Mlndj5g9
	ag8wLlfbROmuXrau1Uf+u0fZNKUL+CYdvniDEULgj7PcwoMLTW+o/yi5hYHQOP1yxy2D3ao01k0
	5a15/vb9wJ3MVlLTFxAdUy5ZdFj0n7IV7kWt7tZHiGb5hcRycC+h3G7rEq4n6KMPXOf68c30r1M
	r/10ECIo=
X-Received: by 2002:a05:620a:2618:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93bb76bba90mr333784385a.5.1789554637137;
        Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93bb76bba90mr333776585a.5.1789554636547;
        Wed, 16 Sep 2026 03:30:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:54 +0300
Subject: [PATCH 38/48] clk: qcom: gpucc-sc8280xp: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-38-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=U+9VQRVM4S7Z8VJMwjV5ugP/YnxuxuAFNy2XnC0w9rA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9vNtZ1AAAaxGDuuEJBhH2VfyTKPfvGCdG39
 L6eSxuqyMqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbwAKCRAbX0TJAJUV
 VqucEACCd9UTuZo6IC2p8zfCsgUYsm6g/49ObJnDkUBIIltUy7btBOAu/DBjaFkjQXTiLl06L5R
 AK5qdzCX7vuAXFERVajKMjGbZjBlUNsOf3LgE1IZ2yqYbLMh2IiXspWKeEOHoAAu2Grdi2MCf1J
 DQErmraCBnmR2gfZliuOeQUrLm3GsT4WlA22Ny/SpCrNRxYHukEb1FqUAsinNhjBeYX2Z9O2sxJ
 HbjsuC2D7Jo0hXfJQ8OnrKy8SrdtgWdG7TK2uGkZ28vMczauC8jca6egqhWEuP43SgfrWyrpqHH
 ik3X2+pAnvmYm57wl5pPODYuUJbGtLvkoHpt/4Og05WGMF/MW4u9GOXhxeiRus3QkDdfuCTr7Xz
 558A2uZ20rSRu6KroTwsGRScxqgxKaa1Knvg2u+PXzENUixAiD5VH9FM7ijoeI72/umaJ36Xnug
 GQ1QXOnEKFbPUxGWyQoNfPd4bm51oYNb7nDQl60wPmOisb2qGfeg7IgcAdWZQv065rXFYa2sf4e
 WxcDpI6DY+wsyKmDQRcCHMxTCFQdP4HI7G74YAHujhl28Gc84dZshqkmZHoxjh1w9bvN3kjngyg
 xi0PXu8QpxjZLMRngEjEqLcufP/TZRXq5KKwrzoaGtxa2F3ago73qEQ+TC/KjYrnWJ4pC5ZbWWT
 8FB6lXm7wdvfuAg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXycAlMt3Uj5VY
 rtAbhofClphfuYdlPI3tJV15sBg/u7wshGMGJgsqnbsCHfnUZijo27+E8MeqpEaor2A7nrQI++T
 3a+MfGmS8jRnroFPDBhloM7dNFmk44E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXx/NLPPmKXdxg
 DZA+8G5dREQDCoHmTbJiDbJygIxTx7zfYLpB/SR7xmaiWgZEKw9L/MbsmvRSeEkShzwLG1vmT3v
 Bxm4h6QczFubA9neZGUcLJ4N79lSGt61LICsuryqM9g5O9usJ77DlTaK2Zkt9a7INhjYpzyRzpT
 izzBTO22g2SFd5nRH4WJePjvsQkroiPMOG3vpfUWFXCtvsJhGTL+YZ/MupXj97LXiiLM2W0wFjb
 NqT6F1zEKoAJRSTDDu+QCzBcVyUCMgNZtgIe4+CCinRLaz5oMWa5w0l95Iv9/hfjO8G+V929hH7
 MGmV1d1+3BG1jeQjULhdy5FPQW1QcDbG8Dn9KlOJv6lkQhiXBb/xJ5BxM6kKwp60OLU4Hc5CWjD
 gxs7okLnOYrelGbgLQiirNqmLAm205RfuPsQ24v99g1RGo3wRxMrp4m73ugUqWGKpWvfoFxhx5S
 LQIOfq6xn0QjyoyHSNA==
X-Proofpoint-GUID: DBEIc9Z3ZAqugQ7IQigd5R_W8LUCF278
X-Proofpoint-ORIG-GUID: DBEIc9Z3ZAqugQ7IQigd5R_W8LUCF278
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa6fcd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tHUDbLQnBSC955iDWYgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc8280xp.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 5dd90b854afb..2ccc083a4f98 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -415,7 +415,18 @@ static const struct regmap_config gpu_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc8280xp_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x109c, /* GPU_CC_CXO_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = gpu_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
+	.driver_data = &gpu_cc_sc8280xp_driver_data,
 	.config = &gpu_cc_sc8280xp_regmap_config,
 	.clks = gpu_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc8280xp_clocks),
@@ -445,10 +456,6 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x109c); /* GPU_CC_CXO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc8280xp_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0


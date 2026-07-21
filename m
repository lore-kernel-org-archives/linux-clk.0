Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECE6430CF4
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617665; cv=none; b=hjSE6uCuObawZ9Qi83bJapEAK4nEZ/chPs3WMM4AnGLE35zjTYQRkQBRXb0JXFVSFPmqNnxp3qdIPPFXipIo7hRwJaR0DCWc2zxG+O/g5T/ib4D3zCVw5siNg/N+1lIbMzIkJ4TQut1hAfbjGA+fymvgxRDtGtQEwg+sugfzYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617665; c=relaxed/simple;
	bh=2a++33aM469XnZzzS5BGkmVVbu3iuQpcGt2Hao1R3TY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2LXEMF+1Nzhsbvi1wyda3W12sMR7ztOzqcps4c6AgLaLDorv9IK2EN/2SzWJ4ItOI2c9aKe2Bo2/p5yzvDiX8j6hdUtJaGoAhUs3oAKC68n0YEV39oxyx5dvJBXjkbNWl+FixhiR+GFvhe5nqUpifWp9n+ubuxJcynLVX7zAuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+7DtxFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffhznSjs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+7DtxFV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffhznSjs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L460MI037529
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 07:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzfwH0XAPBamSHvSsCSqTpCyEf1L8/KqEGfaFE0INd4=; b=I+7DtxFV0iX0O1qs
	uRDVlGcJPbGxXvBVoDEjBrwtpQAKamvsBOb1uukyqjc5BOjke3pqu+9Wx/upZfxH
	WGR267/cn46Snw+77KrEarTvlJQtjYA0iYU77drH2RMvubFoO7KCcH01d425PDjI
	g62m8SuZTVIDYGAECv1RzeZm1L0PnsAZ1jOXijmd0GoMl//F9oferuoUipGLxfVL
	uVFS0bTWuTEitfvppexNZNik/QLiFngmXYT2rjUoE/Joion2rVlXLRoNDGCrPi2T
	c8wfdtHP7kTIutF8VFhyG5gpYHXEMVC1jWtXGgK1N7r6x1Df3XecFCj70gAnVZnN
	ZCGLHg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es0p6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 07:07:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84865f326efso11510320b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 00:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617663; x=1785222463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzfwH0XAPBamSHvSsCSqTpCyEf1L8/KqEGfaFE0INd4=;
        b=ffhznSjsLTFrkEFanGRQoOVq7bA0k1X5R9VhmRJ0SLKXAiNcqspMGPUbtEnBflxNOw
         lz2jCWUSBkYP5q1BCv1pRqVCVX/yrXYgcgxEk6HgHjMoJe1DP47vwtt+GalAwaLmocJS
         4LNcWW4CvS2NyxA1Y3xYHpwKqigJDY9wUCIIatPBd6RSM+0l1R3vFaP4N98PBm6U1tr8
         iDw9zdnO/p76pKxuhtcoewmK7edRivzDc4sra54RIk72ddxXx34J+vsa7e1gFys5Ajjo
         YLXYBaSzDle4z2Tjh/49j9GCensMSvNRxDCtiuAC/zRid3BuNh7prt/S5rjtmjQM4m01
         lcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617663; x=1785222463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzfwH0XAPBamSHvSsCSqTpCyEf1L8/KqEGfaFE0INd4=;
        b=LZt37SuvbDCpcDeicakEr/U/5TVjqUSkljyTbsqmQvZIcsuNo7iehpi/nkii6bjn0R
         Ku/cmf/dlBG0crsFzmhaCAMJRa39A3YrkGGWFEUqcyyTfksLQ9mTphK7f7tflN88Mdie
         4pUJ0FRyLLqgYKvSPqvtACtI4xkqn5h10/XFyM+mBidpd0SP9CSR+LJzXo7Hfq23tfs7
         72B+57xKf1TNvncdTe4/Hjri/cLKQO11NPqXconEhePWZXfkW4XPwxgXVzu4S01HF8iY
         +12yCgscgDS7ynwaiS+RgOKezgFBMf5Z+I7iZ4R8mXx0+N72V+9VasKucln78S8N8BrB
         QnDg==
X-Forwarded-Encrypted: i=1; AHgh+RrI4iu5KJ1iwX3cTy8Btp6nB+nV3GM6lBbEMlnJJUEdVMVsfFq+AjflWWx8DXeLHb9kGVA2/hpA/hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR+CEfbJjkFXbMbXcSNDwD0cNTRDiGhmUzyCS72wTsWAEI8jf
	fTmKCqq/ekiT54AFTn1YwVacYkswyKybSXWH7MQ6n47Kxne59Y7okIKFvlLUo1Zxy5yzALsACEu
	Cj27KwPBXIs/0HYYhB1li8LXrlPt8ynu43YAHwcjCXDAqzWZPKrVziJg1u9Yo+ug=
X-Gm-Gg: AR+sD10DWjx7qPR1ftjWsv9ougIaOhObGResL917oQWWg6FORXCrjQ6Mh4kfTwR9C0y
	525TVpNg/x9dDy+VE1MrjCKmTIstkVDlzGx74lG8Sjl/OZoDgb7oTE/is7p0e47bJyOK5w/iHd8
	3f/cjiHDGjNoUlLNjmGGs0oEziHWWV1HkhEVowLJd00vVCKH/FGEclqWt2As3zIG0roNNtpH1cV
	5dzTEWoJtIBDniSFtNVT2u1kEPQH9HHpqYvsgeFkER5oTec4E2TwlZy5lhB2H9KdldZ6PYvdBV/
	l759H40Nq1bnDDs1xMJQmH5mFL53szvRUf2S3SWvy1PBedsm0CpeXkMyS+1sfcnU1Omz4Kxbuk5
	3sjARh8wFrdmJOaCVafRON2K0
X-Received: by 2002:a05:6a00:928a:b0:848:65f3:23c1 with SMTP id d2e1a72fcca58-84c2956f89bmr17945745b3a.69.1784617662926;
        Tue, 21 Jul 2026 00:07:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:928a:b0:848:65f3:23c1 with SMTP id d2e1a72fcca58-84c2956f89bmr17945720b3a.69.1784617662518;
        Tue, 21 Jul 2026 00:07:42 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:07:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:37:17 +0530
Subject: [PATCH v2 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nords_mm_v1-v2-2-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f1abf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mEVXwad1GdBeBoogAroA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Pa8RXB_ioX1yyKh0vKp_QwZ52jnkgB1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX1yi6CRFVIi0a
 xUK1EP3YjMoO+xJp+BYa6kHsLxfcENNJiVats3zr15YdCoRKfT6KIMwjLemvaSkZI1aD/zU1n1q
 9YQRG9JqdA4xhxz6hAFxc/jnyIvwFDpZwKFq9L/fMTyi3j1cBMQr59cmkd4H2/6CwnTyj0RL6kL
 sTLB0V9DcxM/ZiPM3rn09BEkUR+DFbUmkrFGUiRFQ5H+Wc+ECCg7KL3oPT8t8xGmDBvkGGzANRM
 eLr7C7S9IynF+uCmjwkdVgb7ArZymhhnfTEB1H4ZFgbMEOlBaSdaKiyC0t9fBm3Py3c1YOr1P5r
 XsMSx3SKKm//FJe4pFFk6kf1VRvUDSia2LCS/uBn7uQGAZD5C1xoqozCbfDhJ4H0aNduTNwPL5R
 UEpKnpQRxPRrH9xoxlNowxYftbXvOByM1+YbZjo08ysbOQRK3vjfOxqXtXG9/VQgEQiGzznuPp4
 H8a/CvSGyhVSDaT6zuA==
X-Proofpoint-ORIG-GUID: Pa8RXB_ioX1yyKh0vKp_QwZ52jnkgB1p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfXxMOd712SjMSa
 ECT3XwNzHJPSYvLKBS7V9US61RjI6a0oPQ/iiaCiUt1YtNvkx0O0Jzs2EVKSSOdavklWh/Dl6lz
 ACSt4dXgiTbJklN8phPtlG9CZiJJWGE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210073

The GPU2 CFG clock must remain enabled for correct operation and
should not be exposed as a controllable clk_branch.

Remove the clk_branch and mark its CBCR as critical instead to
prevent unintended gating. This follows the same approach as
'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
Qualcomm CC drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
 	},
 };
 
-static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
-	.halt_reg = 0x34004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x34004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x34004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "ne_gcc_gpu_2_cfg_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
 	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
 	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
 	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
-	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
 	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
 	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
 	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
@@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
+static const u32 ne_gcc_nord_critical_cbcrs[] = {
+	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
+};
+
 static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
+	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc ne_gcc_nord_desc = {

-- 
2.34.1


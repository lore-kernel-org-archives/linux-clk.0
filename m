Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA34F6463
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554646; cv=none; b=CiKKh86aAh5WW9OWWRhf/KgN55Ulyp1c7AWZ5JduhjiTrYlvO1h7XB7OvVCtOkj1jjP+kZ6pENWX/VZEOz/47TYl1J9airXW+4h7O0aQ9hPf2ngtih7ukYAyuCA2zj99DjHHO02+v2rqjxXDYzvZ9OonRUjWO0EifwRjmmVEeoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554646; c=relaxed/simple;
	bh=2FNtl6FgL6swZmbTyEzvU77vBhEq1DWGMQXVqzNacrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAb80mnrScspUesH5Y0JV8yNUP42qdeiLp2fOYvmoCZegYtZI34rBn5vY/Q99uGeEX1lV+2TdXu/wLRas9fXCgYs31/6SSI+ByrUDPC8y5ZbQb8xawvd/aWqNAROEMF8UkM260TjDHfAMK/EQthODqrxatzc0u3l8ciSxCqcY2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdRRzVBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OasBkZz+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdRRzVBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OasBkZz+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93C2X2658365
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eDSg+wuxm2DvPHbiPGZ2PZRKDFr5EuuqL8y8q6hc+0=; b=SdRRzVBZCYEIfSXY
	+nn4gy3M9Iglev+t5bfNv16jrX8iEDW2P0KZ2LLLOrcPZOq3vfhM0flK0pAUto0h
	hvsbtFMm1FOZVbe1ryAtg1ky6n3ZxCkiXxLRtFiRzTqJzFldGCNJJ1sPGxXgFDc6
	AE1YShl9Co2u8PpAF8H3H8cakOCt0ebi0GqdHlN6/YYa2EoL4KGYZpvOkiKGdy7t
	LMCCmJsluGLo99EwmB4gVE87mqQJAV7e1NoJU5E01yNfooWeYoBqgqakhYfnUvdB
	c6KgitTvX8WkNJY7XxxKOVmpPUmrKXFWSLgMnq7p1WboyS7jjvDtD/hNy70D7bCS
	gk26JA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujarn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so26934785a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554618; x=1790159418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4eDSg+wuxm2DvPHbiPGZ2PZRKDFr5EuuqL8y8q6hc+0=;
        b=OasBkZz+xBnaBJjXReq8zVwSf5emieSKdyCph0Ng2SEl+sKxtNaCZNjFVzTDrI0fSN
         +63GuwmOF5satvCLhTkpw/1xCKvrta/Yo6mI090ngKlH/HrOqMtTFSFrjwdMx2mPr0cQ
         xHkdGp6BuCren/Xov86QLCqrrzaclMXr5NJMWcgPRcT9tOCMNk24LCyLBLwsVM2fHoL9
         PWN8SMPUqW6b2K9ssPxY5yYn9c3+6q1VU8drvZQ6yhC9p0RARhcFYcb3uamOLDtBSeZG
         Fsjolsb9tXGwS7RhzSm4pf20Xp20M54KcXNkFMlngBOVTrh+CD+oDvtQF/YcRbsZiTsg
         pVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554618; x=1790159418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eDSg+wuxm2DvPHbiPGZ2PZRKDFr5EuuqL8y8q6hc+0=;
        b=et3v34l0p/JLEOFsiSV6ipWDhedKc2PIKJWAxASTB5cy1qPi98sfHqyb7F6f8q926F
         pthuWu6MSawnduMG4wd1M4oAju5RgHzdVsbZykB0pG+3eEeas5/4vsB09X1byTm3/0Ap
         hfAY+NMybFzJKQ3j4pALjV+BKn4QO1KEz6qJDigKe3bvsbZn1di/Bqzt8z0rc5TU9iM1
         Lb/Xc38Ja9NOULtOnzU/OOzlLvFcsHUuuPzy3wSxrAVayGHt5k40brmnhcohK0YU14LV
         eSC2XQ4YOzFmyBvvfkIdhX1K1f51se9KHPJllSOGRoL8XyWRePtx2BRJGP8Ev+tS56qt
         lDpg==
X-Forwarded-Encrypted: i=1; AKwUvBwNnYjA7iP1YkeV0MT1VqndVjpFB33Tool109/1CCIMzfYRij17ovX64EFAxylF7oXq9s2LlfyjYb4=@vger.kernel.org
X-Gm-Message-State: AFuF++nU8YG/i+F2MA68+xPqSs1nZGCZLIO8NytWPz4rv2CA+aFT919s
	l+8BdRj7a4sM3VY6FBWtnk3pmSQPznlM69VTaZFyPVsIop8R6XAZgpOCDWO5BPWhO3UdZFBZ/2s
	9IWWTRUTgv3U+rtO7g5/SQp/DLC1si2B037P7llR+3js4aJ/a2AeyRJPakuo/hsI=
X-Gm-Gg: AYBFou1F+B9BwcMKiEK4vrw50yBZ7h7EnCI60Z7I3DjtnDPDF2NfcgqTg3+g4/iIqQw
	d0j8Px1mdD0X2PWCSNa3ByFAWG+/41EXz1nfDaZ99CFI/BSR2X9RlFmCTZM+PmNYwa7tkQ5brbU
	EqKgwy2GD69h6S1p57R52eCdBOW1HGwLrU/1KF7rRrmZYGSJZWbM3M4r3dh+2ZE+osTOUD6W9dZ
	xIAMB8VMUA6S9zR4vC9DcW7sIGuE5iim1vd6lmVTjo+I04ev95npTifAWOZzwk5xN09RTK0FaaX
	Jlquwl7+U0elSD5an6uzT2U7IJpK0VnLPS8A1r5sg2GEwBq36siW/rx6i4f+zIO74xswLiNDiTn
	LChc9xBY=
X-Received: by 2002:a05:620a:a40b:10b0:939:f89:3688 with SMTP id af79cd13be357-93bb79005f6mr202504785a.42.1789554617896;
        Wed, 16 Sep 2026 03:30:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a40b:10b0:939:f89:3688 with SMTP id af79cd13be357-93bb79005f6mr202499285a.42.1789554617397;
        Wed, 16 Sep 2026 03:30:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:46 +0300
Subject: [PATCH 30/48] clk: qcom: gcc-sm8350: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-30-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2FNtl6FgL6swZmbTyEzvU77vBhEq1DWGMQXVqzNacrk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9odCKknZiAbQ0hlhxlFoWscJNVjABibjsw0
 LefSxMKTyOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvaAAKCRAbX0TJAJUV
 Vr4KEACjoCkzSwXYdAaOV1fzIFfFziIJ5pWwvE/JwsqIXSdB5LAYrvmWeU2sPji82x8nVvYvony
 DOScEMIVpnen/imN1OcMatEJf0TtJA21PT1Mps90R4sWgF7zVmvbGtXbzQRQ49ztQSEXjgsD6EY
 sk1kG2q8cq2Kw9lA0EqjNehhPPn99MUIFWOpG4NSPWgjfClow4hf0IQSxAxXOSCTSj1L5av8Pui
 IljgIbcqb4+2SkOcNYu7RRIk8QnzccydwuqM3fTTptJDKURICdih7N72GLjU42Nc2Y1PpvGv6qp
 sEHkvviuGWJMLp2nIgsH3b7XL6VFPxglQXBo/+Ily+dU7cpHxpgCxgy3Ho1lzXRK0SY2mfvElMU
 CXajHPXsAKP+rRwYXlDc8l56Z9/5kAxrFT6/sp851u73ReGubGA1EqFdpPcomJfWTsH3n45mP0a
 61XTKM4acqIRpcuTnDeM68gkHAdcMp3p1+McbYeU01qNG5QziQrhEF4/Ws6a1n/Zt3aoRZ3bVh3
 1DQV4isf0YUl/j70BPqwWyLJZWEXKuvFmTFAmposppZ4q2ELt9AR/ELFwTNktLNC6tSOR+metk/
 0m+jXHIHtEgPcqZ9o4m8foWMyzWK7HPspGVF+rlNBrAIPcx7INJInckTqBDkSC9hPuTB7hKz1il
 KYISYoD1CNojM1w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/BjLmIvrFUdH
 q22aRGepKeIjW8KelxbD5ZJoY72UxhitKG2lTb0t0+dZuWgBMogjda0DQ6iIRG4BHhtkrdamQr3
 qVt/Y9Ar09e7Tz7nmfvrPXM35Ae0l2aEpBUi+vfEK+e47YggHA1Hr3q1Z4t92l8beli1VbY0PtC
 glLKml0eTYYtps9fruOIiFckzix/wGTY68mIEvNnZ6sj0a4GxIJPt7n0cy/U0o1Sl19pXoZIuiu
 8I0XyAWZbm6EIBQzRc+tgDQEK8ay7puDL8OOFmYP2dLQO+NYIhbmZ+i9I4vsEF9kT/afGgweyfg
 01o6cI3aAWXQIbv2Q4+1vU7XM69pFTa78lZ+m0FcGP1/DUdZgH6ucBHMZKRfMU/2/KoAEtyP5YJ
 XJSg7Ewp0KfzPNI24s9wZtZKAMBuI2rC14bI1AsR7bqBpIeSdXSEJto+2X2NgZh/dYtpMgJl8x+
 lMAGwyb3VQP2z4FGHpQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6fba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3ZTVbdCCGpzc
 mZ4zjKe5g7u1A+WaEjX98V2MKlJf6KeCKOv6nnke58wwXRXSijKFYfVIn7COu3+nUtsZNF1XPus
 MWEq4G22tQHm/cRuPg6cJGk6phwyFYA=
X-Proofpoint-GUID: 0wr5eMG5kS4at8PYIXZWOP57o6x9OoGh
X-Proofpoint-ORIG-GUID: 0wr5eMG5kS4at8PYIXZWOP57o6x9OoGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..850ad9f291c5 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3779,7 +3779,32 @@ static const struct regmap_config gcc_sm8350_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8350_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26018, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x2701c, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x28004, /* GCC_VIDEO_AHB_CLK */
+	0x28020, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8350_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+}
+
+static const struct qcom_cc_driver_data gcc_sm8350_driver_data = {
+	.clk_cbcrs = gcc_sm8350_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8350_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8350_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8350_desc = {
+	.driver_data = &gcc_sm8350_driver_data,
 	.config = &gcc_sm8350_regmap_config,
 	.clks = gcc_sm8350_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8350_clocks),
@@ -3797,32 +3822,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8350_match_table);
 
 static int gcc_sm8350_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8350_desc);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to map gcc registers\n");
-		return PTR_ERR(regmap);
-	}
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26018); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2701c); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28020); /* GCC_VIDEO_XO_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8350_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8350_desc);
 }
 
 static struct platform_driver gcc_sm8350_driver = {

-- 
2.54.0


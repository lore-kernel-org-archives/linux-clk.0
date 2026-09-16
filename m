Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06DD4F55CF
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554628; cv=none; b=fEclGclIuxxk11MTzj/385cdlNt/eeT9UI+Sz0iKleOulxz8IehAc6CO55Dlu9frT0AUJ5PKir5MhqEZ2rbo+6u6A/TRUqRobe0ImDxaCr1egEG2k4Zug6a6VpZtt8RcpLR9NVWnG0PzSIM+mCJicPiV0pjKULIVEcg3/tX8fhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554628; c=relaxed/simple;
	bh=xux2LST8xwir1FkQSENASfPbgYAGg/mYsd8LaSFevs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fud1qJ/ymojSSBWlDZeGyZn6LykMDOtKonX2ojukS5DKJl+QAitJyjQCuzewifYHhwLmcYQPZUh6WZFfY1Fg+8Jjf/wObpPrP9EAiJEBqSML9BJj/ljplqaTnxmElsgceXb9PenmdX8w/V6bxVLinKWFLb7d7d1DNTNgtTu3xY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEPzxi5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3OaUHDD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEPzxi5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3OaUHDD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gQh2477689
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XX3EFpvysfu1gUnUdLZB4FxWj20d/RsepVeR0k7x1g=; b=BEPzxi5oAxwgb6Qa
	Avt6EHSRfKIoIhjx0obrDH0EeGQOiue1Md8jGUdhs/x/5CNYUKM8eTxe4ubyNEgb
	DRqsTA/i2nvjD/t3hHGEuXXyE2b8XYuvALsecbpnl7E3TaLpEk0nERySOzL6yWtx
	nSCOLXuBoEEtiEwtsnb+LTOiVF06um0YmS2cyG58EE6cw9aF2Vc/L8IQ7RKpY1B/
	6RjJAN/1zn2r41Z4px+0Y9g788ZpDDigD8urONIkJqItOPouC9s7+9P/3oVIjRIG
	STZEsIJvDVHwxJKp/cf9//7+VvUTI3GMuTwBTTbMCAzfNJ5MoA/OLq8DcJuvehX/
	MfbQ9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so1095259185a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554620; x=1790159420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XX3EFpvysfu1gUnUdLZB4FxWj20d/RsepVeR0k7x1g=;
        b=Q3OaUHDDAToUJ0u5qsmqikkqq1p5lBNgULgMzAfR3/j5bxqcjtic9JMI+EX+ZbzhRh
         DYy8b1xsyBbLXphp6zkrGzc8DwmzxjGwPj6vZiNT4t0cMwVb8aOtPY8S6PVYScEHxfob
         dZoVKZ65RaeHaNLzoOBWqapSKOaYAk3j5I4uO6q0c5f0eqr6LSiiYTyeqYwT6W46ju/b
         A1Uuhh0iAJTBmm5QL5v/ZtzspPy9MSRrXwzhDRtOXzrMFnT2BZsVj2+puynA2rz6NZM/
         iWCvFbaBbwE4NqeeQhFJ/3ofA2N7wCxdCVdhsyn6rl32zeGgPGA6/xBTVVRZ2heviOT8
         ZOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554620; x=1790159420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XX3EFpvysfu1gUnUdLZB4FxWj20d/RsepVeR0k7x1g=;
        b=UD5reo+v+0KU8a+XVogyd7iP17eKHWLtZuda3KiuHHk1K0cRzztPH3qGTzZDk0f/wa
         ZTPRQK/7v3hSUoxRBkvNU/DQUN/mASBBlpN2XTQ4e2V+KSHSzYyE+J2KY7tySdbvHrHQ
         Wn5VBnLSnLLw7GmI/J+5J27MWalqi9+ivU3/staamyNecSvcgbx1O77j/nrmrDDm5CFe
         ZGOseYyohlAbSjiTKZxe7TKqLxzOW8M+kMzSRhd8sK6qQHuEHhTwRQ7QncN7kpHvXszV
         hSVezN/lL+HJm16f1UYam/+8fzIh5NvJGXCpuRCNMnGZg7l/Ph6+tvcUZ9epsa9JXIR8
         g5YA==
X-Forwarded-Encrypted: i=1; AKwUvByflq27sUod6yIfwd3uR1du9dBeH8B1NrkttgivGeY96s0qtKrFSXnoyyGkMHLgEFXd+M3CxR5Np3s=@vger.kernel.org
X-Gm-Message-State: AFuF++mtIQyoBFxOywKNCYDUuS+OT4ELNFKBfPWCAfyb3Tdnz9wMiZDJ
	KzJE3NH64tqhlILi95c2nZKkl54gFfJFuIbx8QH9C+qD1xwF0TMG8AhzaceSVjt9R0YShaOWP/C
	y5u+i7S7sDAlfm2M4EUovVkoIMw/UG9Um/x81jOvTUjq9P9Sp1QL4hGbPvtzB5P8=
X-Gm-Gg: AYBFou1wVYAPF8gJyHbvVp9jrvxyPO0lNfA9GWnp2b/RXeL8UvgSjrM02MMIyTQJTyz
	ybiUXx8s47j1p+b9DFfBd+MN3O3oup/y9BHytcyXmepj1863zJQQmrTc1GhZwccjdmb1EBQwJcV
	s0OjsUMcTILFicSBbR6QJvRBU3RLfiYFlfBmr9dN9ZRYwbtm8tMM+XFn/a718SDalrWNJ+nwepl
	lo5AJsd5oQz+SWYnUp4gi55Lq3OVCq5FLT4WkiwOgDJ6LvCiwO6liBo0mRpNwC6JV+RNEnQaPvM
	+5K26Ms5zUHX7iW+GadNPP6l79Qe3D6IRPFtOx9Px+pZwW/ouyThh3UEFAbu6JpRdH/LDp6KNvE
	GY5Qd7V0=
X-Received: by 2002:a05:620a:6504:b0:93a:48a:171 with SMTP id af79cd13be357-93bb798e710mr289695485a.51.1789554619974;
        Wed, 16 Sep 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6504:b0:93a:48a:171 with SMTP id af79cd13be357-93bb798e710mr289686185a.51.1789554619271;
        Wed, 16 Sep 2026 03:30:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:47 +0300
Subject: [PATCH 31/48] clk: qcom: gcc-sm8450: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-31-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3821;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xux2LST8xwir1FkQSENASfPbgYAGg/mYsd8LaSFevs4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9p5BLy09XicihrlHUF7+8+oHeBaRSdMHPyc
 MFEg2S1pCuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvaQAKCRAbX0TJAJUV
 VpblD/4ku3RgQf5az/4ylh0bSX5w0PZtyOG9uiL4N4LmbPhrZY/NJfj1/6Z0MbJYXCGWlEMrqdL
 7AX1yAHakLGfoydlS/NAQOuTxPQyj/DwPWa2nMa4yxidd7oP2VsJOOkOPrcMqgDtVPJT6RTtWz4
 /AcGguZNMHVQnLxhX8x/ECugUFHxvutMrEZuTdbVuvsmhkHzHKWQcHT54A+Rkox1b8bvBfU3Iws
 kDjz9MEoSxmcQtVL7vVaRVyANT2KNHXFbttdYPDImmq2DZw9HhRzqit4fbi3dKxx/EppbCeA7I3
 kqHX/SssGvPBapTIvYVsRho7I/hfZlDGSVA+4+hOiZ0VVOTuPFYvAkavut/t1Yor8QTUAbaGhx4
 PovAu7aOL1B4NQyZxvi7cbkBw8XOMnGJ5nJhh7hD0RYFPr5PAPErHaVjTtzocRq8R6kRVNzfLPt
 0tdA11dLnX15DUqzKml798MTrF5yRwgToJXihTYbCrGaWT6e9Ha1Ezo8OuhH4uL9mPzQ3aXJhgH
 UtWfsm8gYZHsqzdZhRdbKVDb1Tkw1RfpEFaNDCrE7LdddV61uTuDGPX20R8EMBva+u/1wykDZ/x
 nk/GsdwU7fGAOw/QqR3V2Az68sVxQdRloc2ERP/v+PPOpOp5bEjwOUWB6Ck0pmlfR9iTovJ7dJR
 U1fxZV0YuIM24LQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6MU/+xoLGATM
 8X6ReXLitICPx+DgyRiRTW4QY7oA/whzirFw8/PdV1RqZfvGxahk5hSOCBQYx4N4UlFyICoknrf
 kJL9SdKZ7+L2FkN25S5iAyjS8oa0gTw=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6fbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=39i0T9gdeGRrow2g5OEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cARLek-E2ZvxRjxTcKbv0JBOtrnUwHzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX2QNCm6FSSxW/
 p4Lytv4BRENRpb8I4bLxAncQEpHI9K85yXKi6dNj0DKLLml96wWFnXJtKx8CY7zTLZ/eYM6vLDg
 JEg5eZbglk9mn6/LeNPZj5Ej33kuJ7oa2YlmT/WVxEA7JW59/4HTCE/cZt47RsRoX2l4PbX28o2
 0fVZtqzlouO404ueRt8YBln2cGFGf7kB1Q7XCqezjK8d1a84djHeVcIdupo79zqwpGRY8KSPKpX
 MouuJO0s/SZjG8+59gBZbn49RYVh85RVDR6rYPlkh/j9QVqzvzCwmNfm4JYtgxkyFntXGJvTa7V
 ksPZrZsy13vltLfPCLzT4Q/y1yGQVl7k+Y7pwpoAKW9hTZ+HvJoieGKgIH8Lty7mU7/ipdJy8dZ
 ktpfZaVEPpypQ5RbXB0ST18KoJ7OgaHEn0MX4Ua4aae8K6c0L7G535u3gl6LIhrYwB9v5oqcPb3
 MHeKmB+KJPDorUqYHfg==
X-Proofpoint-GUID: cARLek-E2ZvxRjxTcKbv0JBOtrnUwHzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Move the UFS PHY ICE core FORCE_MEM_CORE_ON setting into the
clk_regs_configure callback. This moves the UFS setting after the
always-on branch enables. Those branches serve the camera, display, GPU
and video blocks, not the UFS PHY ICE core clock. The UFS setting is
still applied before GDSC and CCF clock registration.

Keep the SM8475-specific PLL and RCG adjustments in the driver's probe
before calling qcom_cc_probe(), which now handles register mapping and
the common initialization sequence.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 51 ++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..0d3ed24628fc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3392,7 +3392,32 @@ static const struct regmap_config gcc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8450_critical_cbcrs[] = {
+	0x36004, /* GCC_CAMERA_AHB_CLK */
+	0x36020, /* GCC_CAMERA_XO_CLK */
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x3701c, /* GCC_DISP_XO_CLK */
+	0x81004, /* GCC_GPU_CFG_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42028, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8450_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+}
+
+static const struct qcom_cc_driver_data gcc_sm8450_driver_data = {
+	.clk_cbcrs = gcc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8450_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8450_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8450_desc = {
+	.driver_data = &gcc_sm8450_driver_data,
 	.config = &gcc_sm8450_regmap_config,
 	.clks = gcc_sm8450_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8450_clocks),
@@ -3411,18 +3436,6 @@ MODULE_DEVICE_TABLE(of, gcc_sm8450_match_table);
 
 static int gcc_sm8450_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8450_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gcc")) {
 		/* Update GCC PLL0 */
 		gcc_gpll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
@@ -3456,19 +3469,7 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
 		gcc_sm8450_desc.clks[SM8475_GCC_GPLL3] = &sm8475_gcc_gpll3.clkr;
 	}
 
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x36020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3701c); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x81004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42028); /* GCC_VIDEO_XO_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8450_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8450_desc);
 }
 
 static struct platform_driver gcc_sm8450_driver = {

-- 
2.54.0


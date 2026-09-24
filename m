Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98068493D32
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251738; cv=none; b=rehSs/iwkfe47to8CIhgg5H0WRQZvi0199h3ESbXozSHpPU3kkTvFHom5CA5zVVCQD+MfTes69kucjM0sMETnITLgCmMF6X+XJ8BY5peIMMWVuXHjGKgnbIm5lDoMFMQhhHlpOl4Jpt4CUyvH9kCErP3LpVrBRFi8xO3Iw8vmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251738; c=relaxed/simple;
	bh=/32dUnX3Y9hTXbE2uhZLl9TmWEKzN+ZFCsKbbZqUQEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErxxQCmA5ugJhGeXadzbqQrjaUxZrhaaIAXdn1qbeL2Zz3j1//kLMsHxK98gIntH9mD+fmgBiw200K6b53uiuAIbZpTdY9BrOOIF1eYmSiJuN9ISAmpYBrPIAxbyCTzscj3HjuRIOYq1MY08VEBaFIFb3fAuk2Ht4LnFQC9DkAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIyOuFip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dx+F4Bl2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIyOuFip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dx+F4Bl2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5CdP2751081
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBI9qtvaAApgbw1L/VNeL4X9l6h2m9dSC8EnLdiU09o=; b=HIyOuFipio7G4vky
	IEKsm8sM6u+/PBDlcoY5ptujHXReU6kLD1LdmFD3c9qHRVW0eazNjY6KzKvLCK0i
	WekM5QXHgQmAOpGpjZxOg7s5QmNIvb468kSEHwoAOP+uqhpZdXHDdpa5Gayk76iz
	FGjHV56Eo1jO8fId06IfQYaTiy1GRPRayT6ukr2T5/J9F2dz2ZamNJsvr3nMTn28
	XH/wBzQdBRvTOS1oSXJ6vPuXfBvjVTDB+J3G8/eGEyexJJzTmHtFN6+A+XrbKUzE
	5sLEfLcJosy+lMeyZu2/j0ZrwUdBxV9L6L91Y8gh29U3/26ndPSh6aidojopscbe
	unyE1A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90eur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a5a291af3so1819942137.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251735; x=1790856535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBI9qtvaAApgbw1L/VNeL4X9l6h2m9dSC8EnLdiU09o=;
        b=dx+F4Bl2iAWFgmDJw90/KwU36BxqgwvRdOqL9Qt+/OcOyV08cO6Hr1B36SNjsigvdT
         K9+DVwjTjY+oA9UetjU5ZLcAI4Pssb2D9ttf7cRoSX7jteC20ROs28A7b17aWtbkelzP
         L9Vu5cTA6xXnCt82NlsLgOcwVWz8aOXvQ6/S0oZHC6x5uqe71XRHYrcEbMF60acBsEcZ
         jN7TKJTNe4mvqw/51a5LHFcPR/G6M4912xF0yW4dqKHWRiIm2RBZEzYdWtJuG3VBdtaZ
         2Jzb7dj8HZMBetTnC9vk3qKy7onyXiiaYJxXors9ylAISM2VJ9UyrQAUiKa5Igp/VOUE
         lOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251735; x=1790856535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBI9qtvaAApgbw1L/VNeL4X9l6h2m9dSC8EnLdiU09o=;
        b=U3B7ksGDj2ggvKY4iY9QYAO60mG/YGx+ZGBSuQauPPpXoqa6VHwZGoVRuTFDlb0FSa
         Xr969D6voA2u2jr0btOHQoqg6z304bDeVl6WJsE746hxCGQGlqRGLdZW0Hkfbofp7ZS/
         q1wVukgjWRi0DsqAaWhC/olEoC3kXqw/DKwiytGGx59+zvneqFWtzGlMsrT1IoWTdh4X
         bnhYjm8V7C35VppdeStOScm0K+TMBJbs3IUfhWx5raJ24UoFKycArUNeQdLExolQurUZ
         zreaUP5j1ZoMulnWYK6hapTRDYeCxtFq24QW9Dtz/g9RKL2SqQ32LlWKmY9kTSDzz3cd
         Pa0w==
X-Forwarded-Encrypted: i=1; AKwUvBxJa5IOPI8cWCG7TwHjRTkXTWuHxAes9VS2An+qJo8VzCqRVMZUUyJU7W7LRTC+ebugYVfP4U5FqlI=@vger.kernel.org
X-Gm-Message-State: AFuF++khQ5bX8+74OdBYBG8wtB+87kNoxYvM6Lw4pcZZrpelNY+nPIB5
	x7KhCU4Gg2Md/j+daLEf7NMPPswmqY8QXV4W8UIRwgiJUgMAlsR1aJRWg6+6weCRhsxHMc+AQ4h
	5bKYS2ThGTgbxf3DgvbznqDBlg7lWgTKQ88S5rKFuu0UAKwF18GgNPTU9QBWlFDo=
X-Gm-Gg: AYBFou2VLPQeA7mHBeIYGN70Z755t0S0YK0qJeUMaSArckT1xtZ2nNXqO0m/YrLR3Jf
	zizaoTZ2HPlGzfbklAqIU52Blm81ou2Gn3klb6kw/lvhybKtIEGxsGhYkOS1SrGeFlMbL5kEbhN
	xrzJY9jOrd9TXqjKDI8Ra2pltd/IKzK63+PF80lU6PtFDGRO1Ypl4ht5cEHiLq1a1pldNOsODLs
	UxZrwQCcnvsMeI/2hnLLrcfrIqNizZ2v5jpumUzwE1U2mRwRvg98XvDBwKu3vbph5M1yKTlTGga
	CVnG0S/p1PisNaXKL49Ir6hDfZQcn4ZrVpgNSZFktfF8nBcoS6/fcgprRFKja70NyT2DdVfXA93
	Lo89pkHdS
X-Received: by 2002:a05:6102:4412:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7af1c7a3747mr1255670137.2.1790251734555;
        Thu, 24 Sep 2026 05:08:54 -0700 (PDT)
X-Received: by 2002:a05:6102:4412:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7af1c7a3747mr1255652137.2.1790251733980;
        Thu, 24 Sep 2026 05:08:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:45 +0300
Subject: [PATCH v2 33/48] clk: qcom: gcc-sm8650: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-33-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3624;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/32dUnX3Y9hTXbE2uhZLl9TmWEKzN+ZFCsKbbZqUQEI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJhvC43UEci7S/KeVA3AovARvcS4pPa/dbjq
 K/K7LtlHEaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSYQAKCRAbX0TJAJUV
 VujhD/sGyZsgYWSKZFQKQXmSOtfWLs/lQfJMSnz3/f58Dw/X1RIvIazEb6xWhMxqj5yNxMP+x4r
 y2OlhvVpplkbi1UXPjx0A8Ry3eHcfyqPN87D4OVcLQkHyIquDtA+DmarlwwrnYC+HaXJ/aCYmlI
 zbENp3fzCL7qHlrZ5XPa3L78PWSDED6Ffq3b9mXdWOVfjvyz6p0IOT+oj4W+OWyW4UiC77w8aDu
 1GD6GG9oEwZiLWOUsUpCp/FXlxeZy4o08TeO89exYgsn1h3noDc+xjYfFXDIAUa/64Y8bZ3yQe6
 RmZ3sQh6AhrX5bwojKBVk4YVzPmk0dYlb45zk/q0tX/Pq7jExFlRxSxbW4o0nm9HT/7Eiwe7BbI
 pdp372b51mULs3TwqlWWWc6JxMkgUpBAmORC7+ZrACe9IQPLEbtXBH8lpEI38JK1owEEutAHRx4
 G9R8iaOB7w8OfitIyfOR/8a66wL3jKVORQ3x54Sy3kNso42vRtDXK/Wb9lwGQC0W2ADS9++heBk
 nA6Moq8VFsD+tVQCLnA8Uam86gSGdLQb98lMLAW+lQffviExWG9sUY1Nb1GXbp6x/hoLzsBi6LJ
 UOOxtGE1Q6oddiDPSMYFxWOm9lwaIQ1n30iSzMwCGp76TD8ky67Gx6//+g0+u4BE+LxnDeoNfNu
 Rr3xJvBmrVnI4zA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+3KOS8hjk77o
 CzoxoXsvQj+hqyYDfeWdG/pq+VkD7NxptFRpj9QhP3WRchLH0i/V2tZmpQSanBq/36p1Gf/tqXW
 anZmyqsgEwJcjo1O0sUL0FJGDWbD8aoSJGYvEuId1Td6u4dV9Izick/a6rdApDBYQ//JKKKAgA4
 8kpYW2EnPnu9fk43+4qk0KQhlQmRLsxBbcIldNxdyM3Jl4IfZi5WVx8/1z1SBy+lRYmnzylNKq1
 YJQrdU+Ln4l08D1kIg3nDLsIuYTNCNy9WXEIf18xE0604Cy0JiQDb4YMOl8QWWcPTNWLr8drSB4
 AKQpJCQmRI/cIDVT97b8NXoMURtiXI7c8WJri9Lq7+yLxd1pC5nXryOdJ2JtniAw/69ZX6svC7r
 XcNjW9RMa8XOgwsAHTxuFbZbd7wrobmi8hxu/3ZfP7qr4+N/fZnnI2urpvHoRg7y+pLbXNTB0PZ
 OBIb8X5KavfmVoJSMow==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab512d7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zVTGKPmrq-ksKY0k6ekA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1/hSoNyKO4Mx
 Nk+Ff17qTTCqKfVYcSQ9AS12MkB62ZYK34NZaUDgktxCrRWXw5pyZuf06oGWJch/PdSddqNoQkv
 qlASa4ka7tyDcQyWiCbNnmp6Mz6LKvk=
X-Proofpoint-ORIG-GUID: 1HzFzFOWEFvgD60c6qgaq4-QBM7LSq21
X-Proofpoint-GUID: 1HzFzFOWEFvgD60c6qgaq4-QBM7LSq21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 59 ++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9fa362f0c447..fb006076ea79 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3777,7 +3777,36 @@ static const struct regmap_config gcc_sm8650_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8650_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8650_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52150, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8650_driver_data = {
+	.clk_cbcrs = gcc_sm8650_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8650_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8650_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8650_desc = {
+	.driver_data = &gcc_sm8650_driver_data,
 	.config = &gcc_sm8650_regmap_config,
 	.clks = gcc_sm8650_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8650_clocks),
@@ -3795,35 +3824,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8650_match_table);
 
 static int gcc_sm8650_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8650_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52150, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8650_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8650_desc);
 }
 
 static struct platform_driver gcc_sm8650_driver = {

-- 
2.54.0


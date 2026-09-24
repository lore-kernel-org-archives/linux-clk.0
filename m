Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B9486BBD
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251694; cv=none; b=LS0Fg5qyQrIPJJewrml11KULnd9X7MUp5L++w5BXPYOIqlvSf9rH0cjU4czTE5yU5EM439S9qVEymMR5uu0R68vZVl3/RlVhEpBPx9xbITswtD0OWrC7/qtCP+FaBZttl+xEhoDM5COEN4MRBJIbcnvFug7+F/XWjXzskN55Vvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251694; c=relaxed/simple;
	bh=ARsbxrH/Q7WYwpyJReSEhO4CvLWr6uo+1CRyqPxe4FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWvlGnf0XgAOv1ba7nTwtQoEL4TkTXHbWbFrMHJXRWj0UTY437zLialYgfPRHZPy+BDat7MkTgeAsy5R1jdMLKb5rK9iAxbB+6E5EqH+68Z45sc7VCSpxSBqUgUBUo0k+q3Cv1YYsOIwDRZUrabBCxWFWiVsbNexBk/YqAe2uc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNvodxdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALYeefc/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNvodxdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALYeefc/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4pPq2134221
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87hYcWFubNegLgmjMiXeWDlEjaezFx+NSFVdbN0rlZw=; b=eNvodxdHqoR4CxK9
	YqqlDGraeY9NnEYa8YxgiYfkg/9UF8bmQ8FWiJMh4Pkb7JEZS5VxUqoxntcCFaV1
	vFX9FMjvY7qZseBVlQoI83Ga2vAJ+WUU7ljkMu8y/RdxYAzCIHlZ0EVSGLNMXTu4
	55jO4w2v+p0pZW1JPxkXVzfCT2Yj1pfph8tY0w4CtAWDkyOear0jHddwIK9NZM/3
	luHr4vxLcuZqa/lJ/QB88sxUjW9ukrt1DhJdORokyFV9gYH9/m3OYjvb4O+7CHr1
	Wmw1bw3U5Y2hW81GqscHanl17vBMOJfOZhuLcEwvyepR3Ji05NPNugXR5BKZMe22
	+zvk0g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb4buw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-984fab5187aso780924241.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251690; x=1790856490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87hYcWFubNegLgmjMiXeWDlEjaezFx+NSFVdbN0rlZw=;
        b=ALYeefc/Qmwmb8QfDvGmbrnxudCBfKWkdNJ5rMAlVTpWqP+yKbetdbUV3b59+SHJw4
         uqQlxdj+xLFpbvkyNUyjch9cMaT/GCMO8lXkZY3dh4lBiAQ/C9VmLeGpuI4kQr6pkpNE
         uw9O4Rg4M66lbPzFl/trvSrjSE8/v7UIuyhLF9pygTMc+FFoeV7qlMech/vyUm7jDDsq
         R8eYrDMRThXUSVYIYPXnpjkJadbDTwMhjiwI03IAHpzgdiVEFEZbXurpR0biCIcbMhCW
         Jk+mm1yQGFIlJvK9dKLS18Oc6Tx0rQMBMpYmNqKwmmiHziyEu1pn6gXCGy2yUtA7asDE
         JxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251690; x=1790856490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87hYcWFubNegLgmjMiXeWDlEjaezFx+NSFVdbN0rlZw=;
        b=v1di9/r6bUK+rQmlA0V38ZZzM70okiRAvoxv+Zm/dYonKT+OAU81UUGrR0YzigG0xX
         PREHRk8QasOXcy2LMjRn0fzvwCihsJ2hd8MZmoe5l+YOlYSoG1YwGaeodFrzwueegIzi
         TsOQNrfD43WlrtPy2CJE8WusFd/dZr47jL5fYCFZFFiv41RwXL7joF13bRvkG+WRKVIA
         BRSyWA1E3laNM4Zp6j4kSjWyxmGLmjwFcMl2UC6wZnpANjP4LXe784CCq/rDc7JikbjP
         zl8F4gw+1wdFfO9fngyTRIcqlsbLDypV8jLEqRjGGFQwXxNIR2a0Zp+uA7VhA9shwNNS
         7V/w==
X-Forwarded-Encrypted: i=1; AKwUvBx9ISrfVzd78LKz9ODGUNvhAs37VOcFUq+3cvjBHy7cS9POPuWvhF8yaiUu9z4+oaLzMwphmq2u3lI=@vger.kernel.org
X-Gm-Message-State: AFuF++k7bQeY0tJcHhfxZ0JJQNiqaGBSvqmSxvlQNsbxQmfirYmpAaK7
	31b329c14DL2QdvqVLwKo/kI/TU/w/Dhd8YpUDyJzqB81ePx2iPnhZ0Pb6NKXNqy59xsh3j5GGj
	DL2D7aiUk7NLGujADV4JT/a1dADuxHLtsS40O6we+wXSmS3+na8PSsvXFmvFIvBY=
X-Gm-Gg: AYBFou2UYLqFYbojGh01/FCLNyCtrwywcoo5QS81axaR9YFjViFcghgr/Q0ScxHZ8r2
	qfWMjd6EeeuWf9iuvqc2KXXLxnGCnZ1bdYs3Ar0xTVaOf2IvBJX/xwWF3Bddb5h28hWQ9QcUi++
	3d1C07mN6+BaWtlQj+G+boPs5Wd4jxDSEC16JskOztFKweKSAAJqNZSiSmgbcQvbWL7y8GsfJxz
	Utd5vtyjpS2SM65wpgj3Tnsu133XE1ibXYl2gJlIiEYDLREeEACN6+9Q65pgvUJGGqwZQs+IHZ1
	pE8gsFw0Mkrm1Pl3IAU3Z+fgxALBdSd4ILtVL+4ZuitxX1FKQaYWNiK3mSAop474Qyb6JZ/Cd1+
	3sHkkhjon
X-Received: by 2002:a05:6102:a216:20b0:791:40c:a2ca with SMTP id ada2fe7eead31-7af1c692a3emr669690137.9.1790251689725;
        Thu, 24 Sep 2026 05:08:09 -0700 (PDT)
X-Received: by 2002:a05:6102:a216:20b0:791:40c:a2ca with SMTP id ada2fe7eead31-7af1c692a3emr669683137.9.1790251689066;
        Thu, 24 Sep 2026 05:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:30 +0300
Subject: [PATCH v2 18/48] clk: qcom: gcc-sa8775p: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-18-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3431;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ARsbxrH/Q7WYwpyJReSEhO4CvLWr6uo+1CRyqPxe4FE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJSS5om87WcIhDTC7qf1gzvcQ7wAFHW3Cqkc
 061PURAv+6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUgAKCRAbX0TJAJUV
 VvcREACBmmog7zmvfyXOTZhZb9dhZTaioFGbQD3KcIaPS5vwz2AMsPQMC6MgzJCrKHJ5PZJ3zoq
 Tc5SGSVtg+95YGcXIWXOcYJ8pDm1S0tWGIA6Of/UcQ+0fivQJaftnldHgLPTlUrQqbAQ8fVDImB
 awMLHZPuqr9TM09hAb+c1A4wQ6Etd2hlmnG+z0jL0z8OWc7YPEEZUUeacQyMikVe8YAj7iDBAhG
 KlcMSrr+z3tyRME8UHH968a5n6imO/0VSq1eoum4R43a9zWi5Rbn2lwm4BFM0xeYuechKHfRFQ9
 d9TFDO3t5rVQTdnk3DYUgI+z6wq+mz3wHT4lJXn+GttY7Iy/ITSaEXowBGl4hIJvm+EKZ3K2q0U
 sn5uq1J3m2xyINib6pM0R5Kwa+gJf/WzAzjS+l8tImU5veU+RIQ4awQwBccfN8oxVR20D3KFLNd
 BdzborU5JmYmGJwxeotMr48xZZopfnuBhvt+NA54eyUTuFRgZ6u377cheuZ2kuesba+6NmbArEe
 zR6AVR84JxBjAMqOUMITdk7W7XRzDGt+WP1XcCa/czt7ytxW0tl7NAzVbBkqByIh85rxxztLQUu
 CkWXnvyzKp2PkcteFpV0+sP0ubPFJgGfPanAEWnLXOvpPgYop9twhPqLikckIokRDhAZknhdT53
 zv/haOm8U1CMcgA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 2CVUD3GgR6ihEU2C55DYzb7Z3snoyP1f
X-Proofpoint-ORIG-GUID: 2CVUD3GgR6ihEU2C55DYzb7Z3snoyP1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6i6dlCGWbqkD
 l+uo/gHZinvSgOXWTYVBUOAVeZC0QGb2+/WDIkMVALC7Bnn75UVe8l9pBVvJ4taz4s1vk+WQNSf
 nq9YF5qOEyZlsTqHsd8Jq7qLr4ng8iQvGUFwFbeZySEBkiZCB4L73brP4APLvMNsUscKbqLXImQ
 /kaoqv51ktEXPTfKnZlCNRd1Y5HhBfD3hH2MlcweWOQFAHsx1NGWmwk81CeLWKsGWKaHtGseusc
 F453WFwGVBAjndR7h0W9fUXvoCa2h1QlPnLfZj4E5kiRNI/UTciOabQWoDIRw3YIg8z2HnWDip/
 G1UqyNzuj0Pqh6lj1To9IfGZD7T+SnjKYeD6EdO6WXtzj/RG2zkVEeYxzLoVSnDfofyqJFM5N8l
 1EbCq5VLt0J8+UAQ228iMy0x0oHIpGBeX2853UpKhWTJSJYeqzqc8Ns2IIt+OLjlGXmfYWyXNTq
 qbbcGcj+zUTIHya5wXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1tjJ1qD5E6JL
 V6QSDvKj4CVWnHYNCA/BSvn8JMfloB4p1UwvF1781I0E6ee7q2a9NtMaI9vNprf1/vO6+H9j1Zx
 5+yr9wAu6CoI2fMAb3BBQl7U9KX3YM4=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab512aa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 55 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..fa31710ef557 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4644,7 +4644,34 @@ static const struct regmap_config gcc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sa8775p_critical_cbcrs[] = {
+	0x32004, /* GCC_CAMERA_AHB_CLK */
+	0x32020, /* GCC_CAMERA_XO_CLK */
+	0xc7004, /* GCC_DISP1_AHB_CLK */
+	0xc7018, /* GCC_DISP1_XO_CLK */
+	0x33004, /* GCC_DISP_AHB_CLK */
+	0x33018, /* GCC_DISP_XO_CLK */
+	0x7d004, /* GCC_GPU_CFG_AHB_CLK */
+	0x34004, /* GCC_VIDEO_AHB_CLK */
+	0x34024, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sa8775p_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sa8775p_driver_data = {
+	.clk_cbcrs = gcc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sa8775p_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sa8775p_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sa8775p_desc = {
+	.driver_data = &gcc_sa8775p_driver_data,
 	.config = &gcc_sa8775p_regmap_config,
 	.clks = gcc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sa8775p_clocks),
@@ -4662,33 +4689,7 @@ MODULE_DEVICE_TABLE(of, gcc_sa8775p_match_table);
 
 static int gcc_sa8775p_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sa8775p_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc7004); /* GCC_DISP1_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc7018); /* GCC_DISP1_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sa8775p_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sa8775p_desc);
 }
 
 static struct platform_driver gcc_sa8775p_driver = {

-- 
2.54.0


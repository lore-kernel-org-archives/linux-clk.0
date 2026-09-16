Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED4D4E66B0
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554640; cv=none; b=QWgogJMl2J4JLQOgkX/XxSK9Y4gPzyPLmfk+BzWFzpgVJKn6aK6j15GzbkVtZmJdPH/tM+KGBw3TaJpLP5Zy3VYP6TU78FufdNrEM0sSu16dzw8Z04vr6gm22kVYOR68j1PNBNlAU6xwjbzNQeuDpIgEcpDaWkH0lqC4HGGm5Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554640; c=relaxed/simple;
	bh=1xxZF/x+vvknFqcI4/E7SyLdAmvk7uNfuS5qhEWDuak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtwN+8Vwey9tcus4NZ9I45hjCPwb+OclEcxyZiYodDbbgZZdPue0bqUhC9axghsn/SzCWaB4kxn9soE/sFI265HwQHZT4675xhOMFzRfbhP2X6yrHfl/s9e0c5G2VH4PbpOlW/uw15rmoOXluumJpVJ4rSTghY/vqzEknCw0igI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFKXqX6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxgPiE5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFKXqX6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxgPiE5m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92snR1552924
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGPRPUC+vD5SbbGdAAxZ6wkgGEtlllFZCy8xvEPLSNk=; b=EFKXqX6Mzbka4fyj
	+SZr0lRDQRLLBqDkV8rhc4QOmJw9Rr/EhWagmK8/b1QQmKyXDZa8tttOLk+fcABs
	gW4AiloV2BtHjUSUlH4WKaTUUC5QiFjDoUVZgac8AwSjL3Ebi27O5YoHMuvaGw+k
	XZkGxfD4A0FmWDBn79MqUII0LMvAyMf31lJbcyytFApvRFK8rx8rkx5mwqasbUSx
	NNWkiX04IwujJv0gB5Wp/T1bJcLpmBu5f6Fj60KeX3hB+Wy04HM06WNc6JoOv8UB
	5MZZ4QJD475Bc+S2GvMO8pN1N9fIQjKLJrk+aIUn77BkxVFA6OgQ5A2tQtAm0BF8
	LSgvqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n64503-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso868189185a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554614; x=1790159414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGPRPUC+vD5SbbGdAAxZ6wkgGEtlllFZCy8xvEPLSNk=;
        b=BxgPiE5mA7N4gCRA+Tr1u+bLWrKPFJBS8/mqfn0+OAww0l5gOBEO2ttdLHAdOmy1Eo
         S3prZen2P2Qy0biELuDo/5IK+xfuFr3SNfMvxtgp+vTcc7Jyo+IyyBRMLV7L0Hz1AXai
         wPPtLZiqophratAKqT2gzm/6K4v+VaE1SX5wPP9ZUsTv4PoJzvJAIKuEXsnlIbAh9FJ6
         ZAitLDb7dO3q77rIuGs0aPpKv1qyYNnPq9xrIMvcrCj+AQqOGgISgyp1HuQQNpaRktEi
         chZdAetiO/DUXLpAjc4oRCkjj+evQGLpUtf+3jZhybsyAXNUYTkkjDMFtKDQW/KYe2AN
         GOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554614; x=1790159414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGPRPUC+vD5SbbGdAAxZ6wkgGEtlllFZCy8xvEPLSNk=;
        b=S3AcoO5W2ly0u4PrpJ1DfdeImZ3fUAKf0ZDAxaCUu7/My2R/ueoqeaVPB9xX81u+G3
         LQr4bIGbXJWuYYagrVtZ2V+Pf0DqHhKdmg80rKHXhCM44vjASkiNx2tRA+KY/78HhhFC
         1l9YJA8hX2oy2t8KstqRvZ/bHRh3kRMCfy0ZjQHMRfE2dPkfNlYtTguDFfzDBsdrvyZy
         aSEcW5dIb/vlXfElSlTbgStz6yNfUGSBf2oNmmCHLmmZmxN1oz7YYDPxBZQox1LRlGFJ
         odvLSYELcNX3wsAzzrxCrLzTYa08bUN5BPVbDDAeOwwG/SNyuNxLQldsHvBrbGQWtwk6
         MlTA==
X-Forwarded-Encrypted: i=1; AKwUvBwvQBE2Nki6o72ZvOXihLrOnrgRAtdEqKEaDfieN1hpaElEJ8mowznI6ik/I+l+a3OSPu3HVTGlpIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++krHgWtV/Rx37pp5Jbexy8gNqW+XS7YP9VnBj+HY/i+rHH2qLnH
	dx0fdJU2v4uYIpPDkQdOz5tipaudrclGRtip6qmw0WyW/hOLYtD2mOUUt5r70NboD8M9/kjqkxL
	h6QBhv/h3RaUT8QQU7TqDcLdGhKyl+fO8GMYT5iD5ozTRCQXPSH8XoJ2OWogLPY8=
X-Gm-Gg: AYBFou2xuMg06n5s0uxTQdNRx+nmvyNfhtQpiGup89QfDGaCttFrWdnsFcGUF6Be7li
	eLSbQRZYYTGMXOMv11hGlkT0gebSu4PP01EOVJdhaf7Ol8nN6mBQZFLMeha61pBer3fyxpFZOaZ
	ivovJ8h7gM5U6FQXijZ95RBb/MtMzuMPQpx35bMWGJVdZ2o+q6lpp00bAajUK/4Z9TTcxxPkfaT
	oldvzK3mIj5SxPUoejpvGD4Fy0KLfcWVcRVy8A1ie0FP96ShtT/bwr4rbXONSXl0ha+rV0q1ctT
	oGnfYPvgIjpBCTmzkO0o+Eq4Oa+oT7AfngUwcCvkyUhgVzKM5d2t9IatJ8CXtEzuHBO4Ce7Dy+E
	wQaKeSr8=
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id af79cd13be357-93bb796a4c8mr310222385a.50.1789554613935;
        Wed, 16 Sep 2026 03:30:13 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:939:6dfa:48fc with SMTP id af79cd13be357-93bb796a4c8mr310212385a.50.1789554613258;
        Wed, 16 Sep 2026 03:30:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:44 +0300
Subject: [PATCH 28/48] clk: qcom: gcc-sm7150: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-28-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1xxZF/x+vvknFqcI4/E7SyLdAmvk7uNfuS5qhEWDuak=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9mDcszbdyEA9dPE6tA+RBxqrLA8reSxhRaW
 Ta3PR27F1KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvZgAKCRAbX0TJAJUV
 VqkHD/4mx+8LFptJEyEJnKWMn9ppytOGfIX2OeFlzGUJl1YsZC0fy9Er9cjR1iPN4z+6hrq1d/Y
 EcdsCkhK6mBnX2Uu5U35QwILKklKfbI3FVQAFVbTpPq34vVxkYYeqAgkoG30rtH7tkcTW6U+blm
 RGR6lHoAhbE9+nhFyF1y5OYyWoWlhib9TUSLBjRX4jZggdYUqUJ9UArzgfXtm6gwC3jhKrARDJM
 lstQeKKPETiEsUubkGBlgphVDt8aLYjuKs5LWpys72KAlms061W25JoJ7+uyD83WBsCudYykLdF
 dTljINDH1srzQP6nU8+IKqrGgj/or1x0Z6rtjxeWGFq39aNMRoMVW+gD61jXB5VQjpQPACLioUR
 ddR2inyvl+fhndPjIPfhmOhgWsAYpoft5nlsnZmuX4wBeCzHOhz3WRjhDQ0CD+BJqCz4X2TNoOF
 PzjUwTxqsYnfGpSJhc4/hkzguM7daCvlpJkmk7V7TLCjxmGp5yeLXVo7oBABXePQjHyf7T6ccnt
 CGLV7AxV3W44qW98dEvB6KcuU/KrHlpohdbvpfygAsPFIz5SyfS4FLXINFFZjHK3pgrSQ9BpKWO
 HyJZ/ZaLVLWbtgkmPsK1Pg9kBj427nHbE/YGZDim0xHtxFCy7TzOWlp+uO9agwAfJfCCPk+PpQd
 mezpu3PDDv4pqtA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa6fb7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXw0Cqo+VmJVay
 6LJeNCmV8UsMVNVR8dgnet0izYB0SwyZrLP+6/KPT+M5NYsOrfKPGvJa1Vy91wgKQLPWbdb27wn
 H0CzBZcstaLNE61tjIhqRVP3VAv+W0rSOmiNzc10q1IuYaTgJddfp/40moYFlWGfSHu6N/LZwAg
 U2IB8ceE3Q6S5c4rsCrwWHjbcaL/Io/Gev5fgDCKlxVUQPErerfuUShKOAZd66QNZD/m3GACCR6
 3bprbUI/apDtHMFS+gHzjY50y2Jvb8ym0OyNBLn7JX6HtQ7249+pQRaJKlwl6DCXwmIyx4fNvzh
 zH/IB6oSy3Y86KZSedF7iN10p1HebnNV3IkA3gdt1OqFr+HuoOqWgQnzxCdjc6Ecp6AqSXmXMG2
 WN90JxhHF3YxFmeVsUAuPi18W9qYKkxR9Z7eKIV7bHz9NS9Ai+ltpdcL2yne1Wg7ZsF14dzIwB9
 wiibKdHqj0hFMsQgquQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXwAB6JBgWIylF
 sQahz5rWtuQhs81Or878njNSqnC/kwgNIpqXZQlIl9a6RadzI2lNSzzOnSHUXCmSdvPLHQeUcjU
 IKJNaH6r29tGjzcUW2ujTGGI7RGbuH8=
X-Proofpoint-GUID: xYHYicLV50HTHWm1Q_gIchkBwfDOQJd3
X-Proofpoint-ORIG-GUID: xYHYicLV50HTHWm1Q_gIchkBwfDOQJd3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
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
 drivers/clk/qcom/gcc-sm7150.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index dcb5d82a1a31..9fec45a4837c 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -2966,7 +2966,35 @@ static const struct regmap_config gcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sm7150_critical_cbcrs[] = {
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x0b02c, /* GCC_CAMERA_XO_CLK */
+	0x0b028, /* GCC_VIDEO_XO_CLK */
+	0x0b030, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sm7150_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks, NPU and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sm7150_driver_data = {
+	.clk_cbcrs = gcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm7150_critical_cbcrs),
+	.dfs_rcgs = gcc_sm7150_dfs_desc,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_sm7150_dfs_desc),
+	.clk_regs_configure = gcc_sm7150_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm7150_desc = {
+	.driver_data = &gcc_sm7150_driver_data,
 	.config = &gcc_sm7150_regmap_config,
 	.clk_hws = gcc_sm7150_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_sm7150_hws),
@@ -2986,37 +3014,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm7150_match_table);
 
 static int gcc_sm7150_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm7150_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to MM blocks, NPU
-	 * and GPU via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b02c); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b030); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_sm7150_dfs_desc,
-					ARRAY_SIZE(gcc_sm7150_dfs_desc));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm7150_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm7150_desc);
 }
 
 static struct platform_driver gcc_sm7150_driver = {

-- 
2.54.0


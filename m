Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9D4EE850
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554605; cv=none; b=VlHjKTLu6Lli7q7D8sVN4+/hJxpaISNuGXexsDLXFqozb1nyaOOw8kVF/w4vVyi4z1w/LCia19ldB55etkuV20nhiIUPQ3OZ3z9+yPdkSmVUd8SSNYaqwqv2fU0spl+VpzrEq+AfVuFrQ+bWtrwexPkU8beKn0PPTlKcj0isLIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554605; c=relaxed/simple;
	bh=98qvKFowCzLFQ+OL+70mkncTytIHj+yglPqQLHeXZvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3MB+G+i+w2kQTBqGhzxXJnvGRnItNfeqGj7fQo+723UESo/RgDge0q2RFovXmQLZL3sZ8HAVUCHOXeOp80Z3V1r/dXGtq9hHspWM992bQCG3lvZh97fykaSmBpwCDocx9CZGxMktVTiTaKxLUU/xYo1RUkkykn1XEa6X4z+iTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYHlT6ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0symaWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYHlT6ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0symaWH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93Ahq2823494
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uabcToqzU7G8MyF/ZyucZ5HGCRyjcYDOkFYtchesHt0=; b=jYHlT6ueMCiGUqgs
	FXnJcwF+9OUe7OZSvXXI8c2zDegDyqpKQVOgRQF+ZPa5u/uEcMm2XAhZrEFikHHH
	PgEl50pjb6clXEhMoMLUgjT9a/bEhLCutyIzIcS1zZHMVRRhmuoLZqWcWMzXyKw3
	/G0xIyRiW/ABMtMjKNH2z/TDJkj8oBNlQpmNjA+5tV8/2EiS50Sbq6lelcuyWidt
	nKk6EhrhNS+ixtJfOC8r2sb5XTmUSubZ01VOvxu5JN7orh2p0/5Grl3cJyLU34eB
	5nfNMEd0kTndsEMaXQmpuB4Ps4lp2Av0EfPciTCX6t0gT9OoM2XdzmSC0YFweXgs
	qENpGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so21387485a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554595; x=1790159395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uabcToqzU7G8MyF/ZyucZ5HGCRyjcYDOkFYtchesHt0=;
        b=L0symaWHJiHvH6yB7omsv7c6XAgG2pQTXFP+1JcsYfOaOx4rNKwxSlEKrQC5cumfpD
         qCYAaHfXb9d9n8l+kNJ55dopV6NfgG/J7rvtuhhTqVlRODfTbQeHX0htv4DtXIz+18d4
         /8PniCjX/vXGrtUkkh6uDsIU11OpqEbuZ7kq1AW1fbph0+1stK0spwvxzatPWONyti34
         s5UYiE3dhpI5QDmlUWIvyoEkrFnDJlN3bCubY5qEL38BCCzsifPcHoascT2y28PkASDI
         tG5Ltzu2+c5ABwcZ6k/34PFQL4sT2M6ffoifh9Nstm7n+cP3mQF1hGh961qb/jCRxpCh
         IZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554595; x=1790159395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uabcToqzU7G8MyF/ZyucZ5HGCRyjcYDOkFYtchesHt0=;
        b=QeKPdOgvgq7ECcyYPNd5xpL4fu7dHePe2PPWkoikRnBC9iIPfNvxUa8fy9axrrt6l6
         Z7Uc29Htg/OjWt+FQxfhrPTVy4InArE5PttLzInu1tt7IIwTfJQvYcTMSlfAY5m1nutU
         7iKlC40CWFZpwmhGJBcly89/JmKSqmT2kzVGw7Qxnb2NsfQTVHVb5FxWNteRRL76FkJS
         fwfVvm82Lsk/bPMzKGi5FEvFt/lbNpOd/a+BxX35REzhEvkFQc9IfE6kGy816GjU0XVx
         Np6cASH6oXm40CSEOHqQa3g1SXrnJ8DcKdP0lo0SxiFbOGeDRHdigIGQNIhshYRQnKkx
         8pUw==
X-Forwarded-Encrypted: i=1; AKwUvBzYLez+hRF+S7GwVpJqy7DnGaB4Z2kNMD9JIIWZrVJVyFtnOpFMGpA3RTj3S6wWj8c0pyJEoD7+PQI=@vger.kernel.org
X-Gm-Message-State: AFuF++ny17Z7OrqFQToelo2VQbHB5r4fwSxD4aPKUMvRufqa98sFRW0l
	6HVDkp4kJ6X2B7l3t7m+TWQkXq8M46a662XdeQbcXwGyd+JXcUHIEI3hObh+0YcHUd9stPRBjNw
	guWsbA+nY8UcenfYpDO2inW4KRVBhkPf17UKG+kV8YPGKFDKXOUwpT+AsMtc16Pb7UOpCIHs=
X-Gm-Gg: AYBFou2jlFPmtmLFQyHhY7q/i+QMvRuv9lB2WkIAxFlxgNLsyH7I9qnQYQxJsOZruwi
	HFvUwnDHbfhbMnC+EaTRZsjQ3ZGsV4VJQrfWHWvhbdFmjF7uZ8HeKQmrBdhf3A3KR9EUF/VfHVl
	mkAPsBYiHsOTcVVfUNOkk9/DjXcRTnd7p04r7gPGxGtvKJjF7ebu5Y+owEbjfOtIZYUYxSmkzZP
	Gx6TyRRMrPJOxJ1KKOMC2dXC65hMO/s+2snh1zpnZO5x9cTO9SULJN5EhG8/efiz8f9A6c4f4f1
	WyE68FzyIeW1yk9ln+I4ACc/1P5CTA2kuoWjJAKNWMHEUZ2wxs0lNJJZ1w5qLlvSnxGyxk/5U2b
	XDxQ//rQ=
X-Received: by 2002:a05:620a:1711:b0:939:e650:c80 with SMTP id af79cd13be357-93bb78f24e9mr282380585a.39.1789554595204;
        Wed, 16 Sep 2026 03:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:939:e650:c80 with SMTP id af79cd13be357-93bb78f24e9mr282375785a.39.1789554594641;
        Wed, 16 Sep 2026 03:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:36 +0300
Subject: [PATCH 20/48] clk: qcom: gcc-sc7180: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-20-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=98qvKFowCzLFQ+OL+70mkncTytIHj+yglPqQLHeXZvQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9eZunXfqqoTv/+m9u1H682q4890hsdU4Uhl
 MyZS2XpxcqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvXgAKCRAbX0TJAJUV
 VuYAD/kB5+JRTlHJWxaDs4owOZPuyFU40Lf0Nmwo5xuyE9PxFCYJjFAttruJhuCZMjGNymr80Rr
 Qa6KC9IT3A6j95HwDDqgLKkLMQMMM7NK7bsDkQB148Rmwqw9BdSrilYvzwJrRLTM5cGEeAUzR8q
 6K6Wq3wFI+lFtmCNof1TqbOXTRhKa/Onl1LNRnGa6Joe6GpIpmHAuPcfLZbItOD7HRRJCxxp4Y/
 INadloZ6UboHsiuTzuxEwH/LYrvIPPNLAFZIs34CrE4lcIGEeJp+qSpPodC2iiWZ6Vk+4Y2Na91
 jVeingaDBCT0MEf70bNQwCcvjL4DDoY0Mneqvos4NBoRrokWLbCoRrbrc+QwJzRkr3qG5o5eYni
 8PgaX0saTKrr8u3LBWjBZRx8uFF7zlcWYBU5bmGkZeut/JbWRf1IBy2NyHsm31CcKgWddmoMjfX
 jIysKJTbgSIPSTHP4bhNE3Cq8QBSvE1/P4Rm6XEdkAsgWGue9CaZVzzmV9QVv4kV8A28ECgu/EX
 mXw8yfwmTLHdFI6lLptQXbJAq7YQQLX5mIxLoOl26/W3w5CrGE+feRWJDmsKJR+v26FjFQaoUQq
 C/qZIY/2Dz2shJJbzvLnK5/Fad5Pn62lB3njDV1MlWbZNs3AcQIY+prgNYpkHfAIoRPaH7uNhte
 m6SKL26FhBeNZMA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6fa3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXwlHmpXfRt6g+
 itNb+2pLaaF6jbAXZgJIdeX6XMQK6gfQ8lOm5tL2F4iwr+vAxPvY7wxnrxu40Dn1j83IkZaX7x6
 NiOPRe7sPSfXgp23Kr0LuuPPyllsx+FIniJcWxmcTx85ntHYamygQFPUMqH29iUZjT56OUvabf5
 KkTvu2UKXTI2lGhE5EyFroR4vsuL8Lyt25ceUYG2R7GOtIjQ02u/jFcAVI7qRqsyhslTyO/S6We
 17TtXEoh6tuzqg6A37X995YvMlKHBHe2zHDdsXKSxmQs52n+4F2HdBNuEjGgor4KmGXD6FbbEij
 YC+FejX7D8F2pOOXYyH89SvNZgP4g9xrK6cnc0+pj/EIP8d9QTo0I/6NxSastZSv9Nsebrjhtex
 TNkC8QuMczfbjA0XwrS7lj6a44LnMY0MuRvOqE9fUayFx27sfWNl4mybGsx1DYfP6H6RPreGlJN
 ng+cGo455ikrwpwTW+g==
X-Proofpoint-GUID: CDadvyNcy0BMwoSujGTX-XL6ghk9WH0z
X-Proofpoint-ORIG-GUID: CDadvyNcy0BMwoSujGTX-XL6ghk9WH0z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxR3b/K61qfFA
 KxDpZYIAcxHfqU19eA2CivHpbXLvUyvjiyjLsMEfBCif3zr4ohH/DuOyl/onIiB79pUv1llfqhV
 c/VZFFpzD5g5xJz3ebBqkdig3BnziQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc7180.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4a49ad7a9e5b..6d9ee31044a5 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2408,7 +2408,35 @@ static const struct regmap_config gcc_sc7180_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc7180_critical_cbcrs[] = {
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
+static void gcc_sc7180_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks, NPU and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sc7180_driver_data = {
+	.clk_cbcrs = gcc_sc7180_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc7180_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sc7180_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sc7180_desc = {
+	.driver_data = &gcc_sc7180_driver_data,
 	.config = &gcc_sc7180_regmap_config,
 	.clk_hws = gcc_sc7180_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
@@ -2428,37 +2456,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
 
 static int gcc_sc7180_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
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
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-					ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7180_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sc7180_desc);
 }
 
 static struct platform_driver gcc_sc7180_driver = {

-- 
2.54.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301447D92F
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251726; cv=none; b=VFOUxDDKd/AQiijyQuqwFL+wbCqpocABICc0fEfcaY2BAiEzqJxSphfscNkyjCTc/0NV3IUdkRqXX8WPDB2mLrxZSkTqUya63hqetbM6OrqEIGf1npOwwrrCkOIn63GsDLCMGNr78J+ZUcOapYQp3rbSf9gDpilB/tQ1OcjRXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251726; c=relaxed/simple;
	bh=+dgVDoyuNZIJW/FkhRhEZTCDcKbKOL5pIR7Lq6zXtMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0L2uDs97piv/nOGUBr9NumF7DKPC1KWrZB2kLTUMAglRFZ0WaaHvGfA8Zwh0MSxSUD1abjZ3e+ZX98KmgqsZGr+7dYCVmb/nLESww1ntjLp/FTMJzY5scwAG5wt/EyGPXiSZ0lb7QK6ZHsH4GWdIXVp7jbIi2O0nklQJnE662w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rjd4ibLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0jhSfN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rjd4ibLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0jhSfN1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5Beh1430342
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqzuSoKOuC5OpDZ1aiqB3JN1ideQiCOXQ+R/xa0Dz5w=; b=Rjd4ibLcnVFjDnEw
	r1v/20USHfsauFW6l9VcreEWfgvosymNt4vpJKzv4ddIJU6tdYoS07Oc3ZYBWY4I
	jEzpfPlrpu61VdHXyoH39BiQH9Bk7PYefLCDIAl0Az4HywLZ6J3pghs5B2lA7hAi
	0dnUG1zK4NRVB98nsUhtvUOqZ2tIXq2WQ/r1I2xVd3SqYHOtymQKsXxs8dW2sMS/
	hnyb7T613HBG/H9nAbIucYi4MlKQbweJhf1L/R8ChUoNy+B02VsuZ6hQZBa5tZ+T
	DF/gFbF5TlLg+kEvO1lrlYhMJjgBPiX2Zt6OxRBf2OpCfQFs5x0t3Qk8YCucmTme
	2xxaeQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9vmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a8e3cc28e6so758223137.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251723; x=1790856523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqzuSoKOuC5OpDZ1aiqB3JN1ideQiCOXQ+R/xa0Dz5w=;
        b=G0jhSfN1kL9efWpzI7U1/rHGTYH2cYAEcG2v4AatpdKMq8v15HeW/sEz+YQLT3lqJ5
         PLprs7Tl5RibtDSBFT+eipW+d8YtdHnx8x4UQNlppYD7wYoZLjWY+XRXPe1ZvnYhBYQx
         OFp6qHxfr0fmHzRhe7gbnj6PcfZE7O6GEFf8nn8dh6Daae24NxxZaCIJS0vFj6cBNU9o
         gsT8SUtrMqIPAxlxmUejrM+1kjy70/8sb6n9K77de2czKhh0JrsT5gYco8+YGEGVncbB
         FtF7ZV5PLq2MApdgcNlvD3OjxheuU9JfUE7kD5P8f4dSJhRaGcjIJ29/bYcP5CupmANG
         SVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251723; x=1790856523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqzuSoKOuC5OpDZ1aiqB3JN1ideQiCOXQ+R/xa0Dz5w=;
        b=NKxwReaLqFBDEmNDmCIZeDw4GGNGKXtmzEK99X9GF/Le3BESsl8Sf1uHUa8QfFDpK9
         KSQAkzD1bpdEsVA7oUZ+UoeMC8lkHB2B2R6EyNNfRpUvnCutQrmfGUsc+jARvTZgkkGd
         CGEbR9hJEuTNNGw8iu+BBSsdxdaGL1u4FEAASjwwnrK9mvoZrVfrwEasJohFJlC+62VJ
         QbKnWT4ZaFjUdD9f93lAyInmOmNW/Fn9onjQeFA4t0SoYIfFmgM42KwCtMBMCa4XUJFg
         3iPFRjNuZfn7FKKfWMEJdSuAxzxZoxjmvp6D7YSp9d/xL/c8dOg7sjD4PHnnsdRBR9bO
         BGkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCf6y8kZF4HgruYq1DvXmKsg5Imm0813uZSiZFcDJQ9eHw9iIAZRkOowIEZmoV54wgAFr9LjlTfnY=@vger.kernel.org
X-Gm-Message-State: AFuF++no8rl8j9TWNIFC9BtHZy9e50nNDJ59tAYx2Orqv1w3ge4z4S/A
	TEJLTCw7NjHQlxRCjzS3RcU1gsn+ENMjpfqox4fvUm4Rv6RinSDYzoIg68BMMZVoNNrGjJd4nW+
	O3z9C5JgRBevFV6PGFtmeRA0g/+WG9QdHG7X471daxVlRMf5DuJt6LtzFE4jYkyY=
X-Gm-Gg: AYBFou2YlO333Zc1kNgq5qoE791WGe++dMnGABTc7hkmJ42Nkx0K/W1SdjDNJmxqOeG
	I17tlZnhfWcbykNRwcV1lzfOy89/b/O0mGRkX1hezSoB8w9c/Tu++ZOeQm1R9FvpqGsHlF9Yqaf
	0fT8juiNPqW8HoPpM1uyceqwyCqMZYHMmPIp0ZtjNHan9+6VEGrV/P1RZX2avnz8jYuM6wXtjzs
	ce4nV59abm5ruxvgsK1anUECgy+qrIWtl5BTsWLe3H82HiWE6HxnKZRtjeWZ9fBNH9kk+5yZCiy
	JK7lqJ1U2ti2k+T5KFbK66hX+qnr7TW9uak4v78MdwzJ6lqpFpCF6K4emh4/TcCQhZE4r9u/Bzo
	bx+mEM3TZ
X-Received: by 2002:a05:6102:8681:20b0:7af:4518:2084 with SMTP id ada2fe7eead31-7af451825b6mr486968137.44.1790251723381;
        Thu, 24 Sep 2026 05:08:43 -0700 (PDT)
X-Received: by 2002:a05:6102:8681:20b0:7af:4518:2084 with SMTP id ada2fe7eead31-7af451825b6mr486952137.44.1790251722792;
        Thu, 24 Sep 2026 05:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:42 +0300
Subject: [PATCH v2 30/48] clk: qcom: gcc-sm8350: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-30-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3273;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+dgVDoyuNZIJW/FkhRhEZTCDcKbKOL5pIR7Lq6zXtMs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJe7Yc9vi1dJvukkcXGV1liFr0y/YlGHs+IW
 EbvJrNQbJmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSXgAKCRAbX0TJAJUV
 VuK3D/9u4TkCpaYeg7nqbUJ34vtBumbuOrtB9OWGHSA0GB22ghIPS0ypd1tw3wGJZZm+nLKei3f
 pv3A20nZmOde1l184U6gWYJfON1HEujD1/IQPAZOKQJHtfLltiXiSIU23Ta7nk5Rwa0041wm5vD
 ob2TcXOJscq7Reb0b1vpUAXbgPjqQ5y53Z4luj+eebHkQuAC99kMp15+LdyulJo07espq/Gt8fh
 hiuOBWoezL4Za14inT4FPEH6o7LTPJ45MyyKM7DH5OaLIV+FdQEldHIezum8NqYyn7S4z/N0LMj
 J6/9MDwQwFGsbK/8h0t3Rb5t9P8c1MBaaKS+i+yAMW9ElYiozyLlGX8ZMOm3V1GEe2OdNb6dDnK
 c9xyVJGHhG2WbI36oq4AUKD1b/WV2fZd0dWgVpidqigu7GsQJBr55ASUaQpr2xFXBWicb+/wWfh
 ItDGookeI4aL4otr/P3Cqanib/Btixmf4l3mvBiM3+0OG8Cc2ap1WptPXJDrpE8l24s4ZXTuC2B
 oLu+Kg7aKycMOsRdxDk5d01ykJJCghwt1d2udFWkHbwyIh6eTcCWN66Z39kSmWHsmqB0j/oiE07
 7z4oLXzq1BHu63CXzcg3cUns34Tn65/itxF56JJpENubCIxsPUdNVNXQlzrgtK8cWyCqTdXZ1pP
 QsJZefuM5Z7OcOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab512cc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 3M8EJmBlJV9YspvlgubrQqsekYR3qvRS
X-Proofpoint-ORIG-GUID: 3M8EJmBlJV9YspvlgubrQqsekYR3qvRS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXw+/1v4mJ1m0r
 MA6FN/oSqHT9lVYQT2vIVbr1DGBOi1o0BBzq7JvPqpiX7Yi/9fPed54TEh0VgZrWwhozrc596hf
 FnTr73Qnv6n+HcU7Kr3MxDyx1ZZoYFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxHrYPdubexea
 WkuHPvyKDlq15Iz6tYwu/FGFogLj93qJ5C2dzFBBBbpermHBSrNZvKEH0v7B180ittYWqa0OldG
 P+bR1RUWsnxStfc5+Lu75nYmKnEDVLe0TaI053OLMjDisOI4e1ORNBi/+cLpRmMFcRWJWnQIq7W
 O7ZaRtpvgvFrCiAGT7v3Wbguf/rnu9QmItb0vKxCGQZ5nWkP0ck0JT4uDUx8cNc61dc/glSr+fx
 /OJTwID9317THZix2iv+NhqefFwrokIC2uyebA+9GGYT4F4HThWvXunC0S/rnyFrl3y/FIBbnlf
 +0JufpXBu6PbinJqOLDMHDA7xxY3rVqktqGx5JNYMqNANlYKdEOwnH2oxtO8Of85wSfv32Orzk9
 NF9X/hqE/wbl9Y8kZUeLW64eUf3UenazLga325wzBOlA4YtkZl/Kx1IP3gRq5L78pWvmCCI7Q96
 P5eZV4d/DAdOn1s5Msg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
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
 drivers/clk/qcom/gcc-sm8350.c | 52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index cc6eb7ca9c03..10a944e679ae 100644
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


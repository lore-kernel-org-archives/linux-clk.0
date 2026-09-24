Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E085490C13
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251721; cv=none; b=nD+MPo6sMBQvkWWqApl57ZiDIdgZ3pfb+WHH+L13MyfTOh9yyfQZ1DyDa9u7//z8+077xL7hFV3KjoDEYgaUalosk9ZfQbNjklhvNUlf7cWA90W1oB6YJusHDAcc3n+SinaDYo2T0rcqv4W24+yLltlSdOhzZztP86T0nTNdrT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251721; c=relaxed/simple;
	bh=930j+Yt2IV5aPts+d6X+P6nNn49+MTBzgKfv23AxygU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8HGVnCWc5ycO2qMKyMZjdhTCIgsxkEOZIfnxMugm4oMeNfyj9gFI7niH1hK7KzGCVuOZQYnI3GzZJUy2NKrwqmGPlgP48hAL4sFa1Raa/X5r4+U4Jcol7glORXruxhceZp/6IHSFYjsrPedKGpwGBhY/BROc63wpF0vhkdt21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FT3CwevA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QF+mxjAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FT3CwevA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QF+mxjAK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC52gC1430181
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pEaX+hgn1vMihkCpuYdkI1lXN1VpbY/l6gRmgJPZHw=; b=FT3CwevAgxUEqcuu
	TqEfZULKCf7c5g/WCEjaVQKu7TdyZO33S3NABjvYCoX368i0lelEDjX3ylFhOq1Y
	hIrXM2utwpiXUed+6sXAWCWw39/DT22p7fz14HJbWe6e5UTniRHJystclzsCwL8M
	ZTRYWTcKOO4Drcy48yT7HkYwBtsvQ76TaaW6JQvv9Y2H9tfqNoU0DN4cgvx8VOv8
	wCYjKlZb/2m1c0aRxm8OFv17ZI1FhFDljOYpzNPZtEqZ9foOr4Gtji5uwbCbweVM
	O97VpXb+Y9Yr+c/LiOKB72KPci/ZX4ui067+py5cdcltma0RPX2TIpPZzo/ZmEUd
	dLRGsQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9vma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980989f5030so1690423241.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251718; x=1790856518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pEaX+hgn1vMihkCpuYdkI1lXN1VpbY/l6gRmgJPZHw=;
        b=QF+mxjAKw97pLxlOMiIHxwsEEEDc1YTYrrBarvR1j1aa1awK/engwD1U0RDKK6dHXn
         iXgg5D0d6TmdfQb+XarwE9TkWJxUH0dWLJcZ3ZDvqPAu8cDrW9PuHrYhWnMrafhHNzpA
         8jWaDA7DDZxPEaJ7prljAKPtXZpDb/RPDHdF47w0vmmI6iu9B3ydkxRddZNAmyLaBl0O
         PZItA26qyuxaXVcT+f7nOYzFGCzoyaN9JOG9XJlkJ7jUD5nr2yEb4fk9YG6hb0XDMSNw
         QUfgxlcU4eEcECC8aXKOMJ213pvppOgw9lHLV/44iPBHo4Pon7JjoIrwlwQXBUnV1/ZO
         R27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251718; x=1790856518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pEaX+hgn1vMihkCpuYdkI1lXN1VpbY/l6gRmgJPZHw=;
        b=w9sNrO0bdZWdKlsW9zyCHpUxIKPkfu8RNKucTwmHuDEkC0HhXGPCfmqaM1nrxdeuTj
         +q7IKqFm7uCDvZOeVFfM+jhnxHFt/89GnWDNeJUeRHM47UDZqZu1VrmxiGcCHocxb2Ap
         ofBRAGMId2X/5FnD2Pa9qze3yDdh1zpW4KtxJ9EKw70+ZOY916Pl/cnYsClDb/QqPzSe
         vKFckxeRLtua0rkWRqjxy9YmVHN2TXAYv1AgoXuwCj25xabfAYj8cdB96g67iL33HMBB
         ejydqfyl6W+yEdQF+4tXhgtqOknoEx5KVgSWhoLkR+17U58aXhIQNO/83xuZuK0YqzFC
         gZFw==
X-Forwarded-Encrypted: i=1; AKwUvBww0PQGtp099qTetc/nMEM0eeFRA0OG+Jsnqa7P/645arGyDei75zS7QGOannmgaol7Gz1UbGsPg24=@vger.kernel.org
X-Gm-Message-State: AFuF++k5GFICXiTc+HoDINx4NNluuJ9hGOLyAqjThG2GT9AIgwMl8Eao
	IYpIcO6dUpuHiHEDrhXZcFQxDBIrGLwcls+ik6muy0ysidB/GbJ3s295kc4zi9PS6CHgaudyAlj
	4Bx8+iD/Lj4o8b3oSUavi3/iqM4/DValBxhCZgbScAoc17CKz5TZe7TOz7eUC5MQ=
X-Gm-Gg: AYBFou1mIo90ghHEzstgYDLa+VjSrAsMJpZO2MYPvxflPOnFTf+OwePbb4k/VbWfqTE
	CniPJFhOPcTrzCG/4FQQIFQZTr31tqM0jWHH7XtALoVZ2hNUX54GB4NVYXz4n6LgMR6fTMBF5N1
	4wsPPR2DRQsVUnD44+Um8eVpOEqJe2FzwWzEhCy8MtIDrAt9eZTXFDwnIi0dWPJocq7FBliSWJX
	WcVpP2YuCakO9EfYlxnr+dvGQ5s4J7iBk0RHUyl9RARuH97GEqxXRYfj5GfFTdeyokjB7D62WOF
	7y1WJdQ4qVYvwdfo99Y7R0kT9Mk3qRwhhZANnbfbaMr/GR0m2UPz6eVzD7RjNpBFKJP4YHtL+fo
	XfX3qipzm
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1144000137.20.1790251717575;
        Thu, 24 Sep 2026 05:08:37 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1143982137.20.1790251716962;
        Thu, 24 Sep 2026 05:08:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:40 +0300
Subject: [PATCH v2 28/48] clk: qcom: gcc-sm7150: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-28-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3551;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=930j+Yt2IV5aPts+d6X+P6nNn49+MTBzgKfv23AxygU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJc0vLQPdDyaZ6dZPF0Av3pwuTqhr50eTxGi
 nt9fK28OsCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSXAAKCRAbX0TJAJUV
 VnJHEADE0K8tztCP/AHg05VbvHfB+NGQ0P/lcojqj37YIoqEHibHyxKYeMFWe3N/mg7fF6c+Bj0
 cDsgwKslPrmGXaw8g4MTc1wLvUQam544VJpQpXMz1sYOTh7oKE2hTvvX2AO891qCpwROmmvT0fv
 LzM1SqXLr5CYoS/yIaDWTmdMY+/g1lmXYoLgy3a9gswUKuxblTIB/PyNEGpVOOZ4Gw53fhVPZ/h
 DK6Kn+qk0NIG5dyezfUMiu7hXtVeK9ojw2Xn2itWwgcNA+H5El4d1tOTJwtn3fP0F8tr/pXmA//
 vQqkJ1LRUFccKYHKgYTjtu3JPyfkY59DD6x/ATKEWnuzwuYR/cW6vmYVKxLbuSfW66uS6KG4PzY
 H4+LxoqLqghZLGa2UDSW5g5Jcxk1Qf7iNmEA6TlCPCedcngmoZOz4a35daDF0N+Ky6OERYlru6f
 Rc9PEuvItRuTHq0MyeVs0m+Q+RV2ymTWTv+oWoEORKx/+rTGIYjlI8/POn/jYX0eTVw7QjX8RcK
 aYxkGfLh4sgMMg+AyOVI+7LSa08d8THJNBEA7EiyWTL61ClyUYGx39GkwXj5kgM+OuNLYS+t98E
 s5Hy7/0qG/RaMNwWOh1eaGdCtGouVUXGtKOFW5BpU0+tDu2tu2TN3uxxMaqULJ9JQ156Vdy+dyA
 F2m3nihhGAI8gMA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab512c6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 9aw8X5kbJnTX4_fJ8Ns8bFFJcsRX6clw
X-Proofpoint-ORIG-GUID: 9aw8X5kbJnTX4_fJ8Ns8bFFJcsRX6clw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1amgn7Y0BZca
 Ym9jF7k9lhLQBIZU+xlsl0NU/yyjtHte+LwKO7LRUOCmQtARG7ACD/hofbYzONWg0v2kjPp4n0w
 0IqLe1eH/TF8vvw8vw4ajXdkFt/gdio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyvUIiDhyWnIH
 2Bi4iCDhTLGwpxyYZ8Gpd5R7oMIKqat1yCgaSaQJTQiLlwZNqF5qd3LIWRlHDCSNw4+CuOZh+vH
 PaKL/eTPx+Ctjm6LWAGX3H62l6XzHB8WePPSnA6Bdm6FQW//D9r2Jc5J4PgmReO6qTPbWSgeJIx
 MkTyfQ0h+EwGdkdKXrZLQzehjJUHl0+dIxqK8YFrtxo2zwNLCj6n/jkwkbFmU13NwHUsjiF5Rmx
 Jk8MTT8OgSjp+ZVtltNCjyIg8EyU6ST1/dmZk3HZcteWuzvjO9ztNuUR0PEYM+zdPUPocIejV1o
 o9eMREzo5N5+nukCZEAGrk9J/svurEvv8Cc2BF0g3YPomzov5Vq8lbjZtQEsYAeoScCdBAavXk/
 XpH+ypG/0VhesUVieEthtE+6bi/FlFvfo/pMtqfRroA6DkcyycXvHA9tVBGDz7yL7Im84y7m1d6
 KRSo5LgRSSHScJTJeZw==
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
 drivers/clk/qcom/gcc-sm7150.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index 2ab3e92eb3c7..169aef61e749 100644
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


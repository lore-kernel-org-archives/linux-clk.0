Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76749B5A5
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251757; cv=none; b=PUVakQVP3hcg7Q2PGygZdNz0lNs2mk6rGFa23HuGNm8dCjLD+JGMxSjJX+dbMgIZgnS8Nb9+L3kzO9oPLtzV9GzbHLKIl2Cmikc4PkjUulvdXMy1CSt7deqfiSTHPdB9VMo5Bk3OU3K3Qk7fdL/af7n62+CGpZFLIVvkNeR/Cjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251757; c=relaxed/simple;
	bh=hSMBCUSJLODBj/QMnEWIHI6W2J4kYwr3G7rNE1Tk1f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ky3tOTevcyjDYofhoGKi2COcTHXHVkm3Jehq8CsqpsqaNNTvLXSekwA1U34Y9cfjX5FcW0InaOM4bY8H3ta+TjFVS3n2jqHr4nnrZh8h/bNtD4jCP6qPAclzAo2NJ1hVRcGPGbFuNYM2lNI7923w3hL0LnMy03x1R5xdyR/yayQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2devIni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G18RN472; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2devIni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G18RN472"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4sw5803921
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdEyG9Ski0zk0dTxnSTkOQuUEfWwpxgZdeJl7X2UE+A=; b=l2devIniKxKLE2Kh
	uJxfNzezAcOWh0xdLm1YoOqIotadNO1P7+UqrUlJI7oJ0RfpfQtv7WobImAloG/1
	uE4t3H9L02I17E0XSEm8MvBvNkZld9Nl1J3URIqwSqNX8CLBEbWFu6WeT/jZ/Sgy
	qL7HKho4XRg/96OjlCG6PIm808x+TGxzMRJwC29RNv+D3lEujfsO3kXz4sHWd5Ii
	C9sB1FkYQgqzRHbnGhAkMfOv3geKVX+18hNuH2kNWd3sWfIgE1RqCTsodlxd3NDY
	pjt6dz9U9uFOief8LGYadG0K5u+Su6CUs+m4WC4E1CkUDydQxdXh8zvRrvWNHPwb
	pTahag==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8f9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980c3b71002so1541643241.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251753; x=1790856553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdEyG9Ski0zk0dTxnSTkOQuUEfWwpxgZdeJl7X2UE+A=;
        b=G18RN47226bDG3/T5oI0M/hmiJJXgvKwF0c7E6+RUrjz3AlAkXhbLaVdqIBOOQ1HVO
         zeh4RbP224VamhsB5v75nR4noiFyGuX2FyIPIjw9mM5B7c4266PKHcBfhEM28WdIvsK8
         +3QzUPqVv6gyO+Utlu+VvsO/xO4bvParGAQe5Zj/wW8lQOZlqM0CRUW2N/DvXwXvz4Zy
         GaYNLk6Oh9vNY5YK0G6xMNkUDCGDYWPscPoYinpeQJVouHELy34xX5kwTg1aGFX0y3Un
         rhUtvwBPG2D14RbGzY+2N9Zvy0+PyHoPbmY7cS1X6xbJWsDwpVV1RS24Cg6iOe+0Rwdh
         t/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251753; x=1790856553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdEyG9Ski0zk0dTxnSTkOQuUEfWwpxgZdeJl7X2UE+A=;
        b=PDiV71ScZ8lTyZEi9xN1TSeV3O/TbromtxgTWNDfxSltQ1ORt1gQh7fV7CxffFKEKp
         RwLontoGEXe2N0CRe09YKqHFV/lIPXFvtyYvulvn8hMthqaTzvStNeahmzZ4+0z7Xmcw
         rIxnPzqJViAVBJwfrsgluF/16rLwTjVQpVixy3/oOs2UoVjP/MliNGn6MV4JZ/mrd3oK
         kfztluGSKaOALYbmglBQw8VEecdUjCQxfrxjCRY1WUYZg4sAmHB6kHujGASWcPUGDd3P
         s8KWUyEPSJKFEmPUqvf2o7Nzfn/JKEwgj+IWFgnBhx6GGSwra1AsOE+SR45vva5HWiee
         tGmA==
X-Forwarded-Encrypted: i=1; AKwUvBxfqM1+6DNMWuEm+TaBgetXFpWc6nbhwZ1EQZ9LfJmvWGBt3ZWbQCdy0f5ZGiQN3nGwCBbUap2uX2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mSOJiS5+j2/Ezk6KRLjlh4/YzQyvbih1F+cSb2lrQ4ijpUi1y6
	4R2w+zX8PNADvmcR12p8PIlB4AmhltY4W6Y6sz/Pwxb5OBDyXIeF0gimvE0bUsaiR1JksdqdCni
	j0U0tC/XsGXQAyU6oGW53gdPxOTLJpcyOOwyamhMrVbdxsHsBhOnaCZETj5lwXK8=
X-Gm-Gg: AYBFou2fKZcFMEh4CjDiq+dpugyMqu4J9u7cm3bV6SFz413LI4lsTgXurrddQpbu4Sv
	MCGm9UVqP26iprElAVRS4Z41OakrIs9Q2AcOUBFNJjGhILfu59uOIEHBf/SfxInogvdPS9z1XVE
	f6WebXao0lyL9mUv9siBrap8wTptOfHdfa7VjM3iSA+v8ZZohIdcxuQN/BKpAzJENu+bsEYyzvN
	GsWQTD200euqEYYeqAF2It0ieGS9jm8UomCM7+U2mi2K5sgrTpWIqo6Qum2jDCK8YZxl6s12331
	41vvoDvhiQI4vBYODwwAuYDZiAIRSbx6cvLI6xEKnnCwE4FR9HEIJBrY+s6dozwqRXAXjx7VIx8
	0z1CkG8R7
X-Received: by 2002:a05:6102:8099:b0:7a3:2e52:1163 with SMTP id ada2fe7eead31-7af1ecf1936mr1330047137.26.1790251753288;
        Thu, 24 Sep 2026 05:09:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:7a3:2e52:1163 with SMTP id ada2fe7eead31-7af1ecf1936mr1330017137.26.1790251752432;
        Thu, 24 Sep 2026 05:09:12 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:54 +0300
Subject: [PATCH v2 42/48] clk: qcom: gpucc-x1p42100: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-42-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=hSMBCUSJLODBj/QMnEWIHI6W2J4kYwr3G7rNE1Tk1f4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJqNv7IznQ/cpDJBdAvBO25U3BTH6R91Tn94
 Lx7R280tuWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSagAKCRAbX0TJAJUV
 Vqu8EAChyb804l4SPuVNavT8pYQWWC3t0JkiAbdEcg/W4MEw/zvnQRRJ1i5XPKVeYsNWSHC9sug
 3CgRk1VOdFWq0JQCweyxHr25H7Ls02wjeNHdEW1WNovmeJocdtNrr81VCPRHD1Gd8aJxgSBpgW9
 uoZ0jKyLcFHoxO4QTAQWGHYLnqJHdNwDOa+ctfM/9/gAAMUbHtfMlX3uN6T0AIX8/oYA4iiKS/m
 8D/jVSq90nSHP3XTQtuBY9ZcvZZxvpcOBAiBEy4oF5S+4OpyyKx34mxLEz32zF5cardFawfBs3C
 fHK9Ct+RM/tDr2lb1ifN/MaYyz169QmG7n/8VPAzdsC33EckJwg7Pmhjtn/ncjkvYWPo3udpYdi
 4dO8t1XmJm8OHf6liFwYh1yarw+xaqIg1nL5QdQut7v/QN1xsBQ8ZvbryvnFbyqO/9kyeyVdYgC
 gGW+7BI12CBIX3oAmspzeDZlaZRC5+dLh6wZ+g7jOruTFZEfTFvVLTEKMGdZ8MuNCA2Wr81Bytj
 oNFpmRiykw6GvV1muncKRDjvg9/kYE3hxrBwBWogYd/zyZc0DZI0A8sP9DInFNP3YlB2AKTKvtB
 ygshBq7q8CbSrFjyfJOyrmoWRzVnt33mjyBHbFNMWATtfSLXOGFZOgqH4Qhj95AyNitQDNFBmK0
 pXPyPl+C/qRKa+w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: xUZ9a9eePwPTaDljL-qGzqtIuS31F2BX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9O9VlxP3XpyY
 tXjFEU0519Fx5RMihxIEx9RdkEltdIgP/1sq1160xdjG9RVOS2i8lTBsmNmNCbx3+5rhyYU2vcQ
 uLHs8uRR0wQ62LaniXiwjIOpA0glP6VQ09W6YbZ29/yjAUh2sDvPL5BAnUcf1VS00t3cDz8gIXV
 Qd6P02DDlMhXyO+hCh7f3WvwV3c5xJ1dPRiXSfEZUJj2Y11c/nIPG50lnBMYENtC4Zb7O9lLhoE
 yFTuN/U6tIriVpxVcE8nyPmrma5wDjiE0ML/l4w4epUBbzwdt1XyjeiDohbXXWwWdYsOYbFbDZF
 hgZfPPN7OKCNodqalULtsoxCLOPiAFjbDnhmbXqhNY6fnPWPMeqmSnorUzWXE5Rc4+5aUfjvAis
 mEZZKWS3KNnWm5rTk8dtAlQi4GIwbNljbvwqqJfjH6rOdA+2JBJy88sNL4SwuCBQx1SkuUbcK4n
 D66ybg7yGdzjDjmxiLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/TFf6AS9vczL
 dSp+Mvd3X/55X3LM76eH4maR98V/A7PYrukXiVYCSmbgeqILPaK1cKBROpqeQYaMff5IN5WeuJ4
 xuKCX9FJXOaGWsUlU4FVDFM+9Eu3O+w=
X-Proofpoint-ORIG-GUID: xUZ9a9eePwPTaDljL-qGzqtIuS31F2BX
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab512ea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-x1p42100.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-x1p42100.c b/drivers/clk/qcom/gpucc-x1p42100.c
index cfc34e0fd290..3f3fec257f2d 100644
--- a/drivers/clk/qcom/gpucc-x1p42100.c
+++ b/drivers/clk/qcom/gpucc-x1p42100.c
@@ -522,7 +522,19 @@ static const struct regmap_config gpu_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_x1p42100_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_x1p42100_driver_data = {
+	.clk_cbcrs = gpu_cc_x1p42100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_x1p42100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_x1p42100_desc = {
+	.driver_data = &gpu_cc_x1p42100_driver_data,
 	.config = &gpu_cc_x1p42100_regmap_config,
 	.clks = gpu_cc_x1p42100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1p42100_clocks),
@@ -560,11 +572,6 @@ static int gpu_cc_x1p42100_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_x1p42100_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0


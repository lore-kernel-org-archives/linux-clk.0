Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50C4908BF
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251735; cv=none; b=bMQoyKn0SaYvGxSehNBrmHVgQfHxbH0DrYHY6f7s0AvcKiASLfvjYdBkkSLPWEwVUCL6PTpBYc07wYpjuJ2rjk52L+NEFO/Z+HksR+Y+7qX60xPG9IM4GZiJykb+JCbHY6Um+Wg9xBrkCm7w+2BXHmfjAro+/URA0dsQLKYpRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251735; c=relaxed/simple;
	bh=R+sa37Lfp9ZhGnL08+LTmFtDPjfO1VmCypsEThPMfME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTF2794kaUNK7EUJ7WQ3h7tRLjH44zHBuhENlfE5sidiPWA9dnxejPs06//2jQoydQ0K0INDsvtjgfRqX3rhLgBMHL0b7p2uOKJq/TgW6r3Dpdl8fTdvWnkAi63QTlqj/5gJe3qOVZs76M2csG7A11shhTupXtWvw/9uzsqAPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNMQPHWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaPomw5O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNMQPHWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaPomw5O"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4m2x2285773
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PWjAwHkd2fIpK+WJk2FO4ElGGZUOCTPP5oU6C/yT+Y=; b=WNMQPHWElJtDhu0f
	IDIHMOq4wHKpUKyFYxvE7wbENVqTHcZTLl2achEvevUeOifMjrd6CPh8/kFpRKia
	CCLN+5RVLWqQhKkxFt1LUBfFiGe/u4FxuwMDoZOzxBuWc4h8JoaU/RvFUncRI4oa
	F/37WVxjUtJHQ5o7W3VAX9Q2gk7HZ7WzSZn2OXcqhX2OPZJqvfiB24lGEAokBkaJ
	gDU+cG004nmBGPNfNGZ5fvBoKF6hG+iJaM0Oy3CNEfNS+QGCW8qZVCQaiHMVoy8y
	y4eDs3vaT4iFcRedrQo+Ugy4bBRNF3UTl/Ow9qV001mTpjrkP8dSJy7/3on1EbQw
	exhcdw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78d25a8ff32so616480137.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251732; x=1790856532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PWjAwHkd2fIpK+WJk2FO4ElGGZUOCTPP5oU6C/yT+Y=;
        b=ZaPomw5Olx46HLIkyc2g197KMu9j8CD2ZIJhg8RdKarLUR/VETptnnuAFhVIwYXtnF
         dKWjtBeYGdPXioCPH6nTX/jZ0CXKM/gFpTgBYPHEZqnBInd36ULf2nwq8V0nM/7yHVeW
         SbeDaaXZaZOQpav0GCqIwahMXNxFEnqFsMa0d8PQmBg19neIv+hoPY45C0YX8HdJKfRu
         d+uV2F10N0GhNLLC5D20Ssg8VHWhs022zj5ggP1DSPO69MOdm0Ddyl2i53i2KidWTv62
         9vAgfJKYrWLui700Y6kb8BnaZXUf/xI9iAW2bAJ8rFenJD3sPPOJX11Fh7a987+pa4AR
         zfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251732; x=1790856532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PWjAwHkd2fIpK+WJk2FO4ElGGZUOCTPP5oU6C/yT+Y=;
        b=W0QY/aKvICb5f5acavpyAkY+0z77HfbXAQM3B4xIoPqNSjV5446MGGlQF66W8/QoyS
         ZupOIgnMgClNzAmGOmKAYqxWlVYrnT6VAX8lRgTmibAtkdJz+5lTd1GAkUHg9gFGUsK/
         f7oL5BMtCjsIxnOHkJOkNeEaBeZpYteiSJ72qC14WsyVo1NLObjTOFpUptzSjcVvFMgX
         NZgdXx080v/0qN9X9YvJHdrl2XXavrurGSggxzVW1yx5NRXvy/34RFgQXJn/Y+viZfDy
         eGJGof44ekMVfIY8C1C6/4n6XWGcBhL9/ksA2WdjlGtk3V8h6O81s1EF48LeVWVUkaJ9
         KFLA==
X-Forwarded-Encrypted: i=1; AKwUvBytLW5AEjrvGoaEpx6iywoo/qWqIoVo4a/35pdrMzBLykG38XMayLQByiPTByPEPVcXAYChL6ci93w=@vger.kernel.org
X-Gm-Message-State: AFuF++lqwmK4CNS5F5cF/ndniO/wJMp4M26Dz6+z/E9kM8Z5Rx33cLYH
	p44Lxod0oHtX2nDb7Z5QlLdPhbVZLg/QLkI5+LqSHRuKNNm5d391GlFCq4wyzg3G0iRYtRVPD/S
	NWxom6ZL06Fhhu79S5eg02InPietdAB4xf8Wx/MYtGrRVPmWi+E8YNKbTfQUj9so=
X-Gm-Gg: AYBFou0hRj1aBFhYjnfdq4yKb/xhf2DPC+b/0Lsfh3NRFikLK4TUh2/tYmG7PtmYF0v
	ESEmhUa4FKyKDDPNFJkwEy+2UaNh4vEOtokHea8RBneNvCNThCWSNsn9Q13JQIhStivAJXUMJIB
	8cn6vuCVDaaN75Oi+7HlexUafUtDr75xw15YSetVG6Pmh2jasDsWAWbc7Iky28PxlUi44hr8z61
	CP9H9bdgu/BQ8Of+YyPrcpPNZkWp/o0STJPjkQmcxtazEjffpmSuKNrjQ63yyKfn1pvmaStOdxP
	trWQmE6lRvXhAVmfCAfOepv2rrF5H4tuhKroCpGddkRLpA0nrwaZ/4aUFsoyvuxTUaDUs2jtikV
	ueZhfSjtH
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr994216137.17.1790251732374;
        Thu, 24 Sep 2026 05:08:52 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr994196137.17.1790251731765;
        Thu, 24 Sep 2026 05:08:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:44 +0300
Subject: [PATCH v2 32/48] clk: qcom: gcc-sm8550: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-32-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=R+sa37Lfp9ZhGnL08+LTmFtDPjfO1VmCypsEThPMfME=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJgpIBZVCFgwFgGC1sL2LQ2A5ZBdfZjxrv2/
 1nsA7faXoeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSYAAKCRAbX0TJAJUV
 Vu8kD/0SvAzIswWMbPOgjJ42QiltEQ4oraXFhOqLVBNGqGKVXVXX7I3Ge49bPrWz5AwxVrMKoYD
 Q9VOHF+NMaVZ67eHYTCvgII0lLJOYhnc/KefvvuOuDz7Zywm1YLgv+ouMYUd0wXlwhVOe7slYZj
 +ZzCKzsiWzQUa2O7yOsAZeBVzsecR/w6PigMK+AsEXeJycfZgbVBaNCUz5EtklLPYOvYvYc7Xj6
 XOOyTI3eq7J/ZlhnbwTs34WQTigU/STtFY/gj0SGwFq0OLGjlNmeQKd9Tju+NCy8DErLWveouDj
 H9DGW1nMoMbuhS6tP+uazqCPacp6lWvbjhhPVqISdqJtr39jjgcgd83kZ4bBjH7EMZ6TIaRCHJn
 zfBnbDse2UgVmXZCySDLRQBCxXBJbK2bthW+A9dQP1wJ+T622P+zmZDYe1tcOnkJDMGlEQ9US7f
 9FjKro3CZ3K/9FcF4/x2NqI+8mku8FAIoBBySLXr0QH7iT9o6r313FTCoN7sFcO3aPITrL494c2
 2HH8bKvH4yGNgVGXa0EnIqQ2jpDwv0lEPkGSdngiA4RXTH/3MHW3n1/B3g1N+kWL3udDIsZegY0
 xrsW4aHojI9gXkuW20Y+ZXytYLy7hpw6brvfIdIdpKRgcvdv6sbtviltIYZbgNsJNsJagIsBlHH
 WZ3gI+Kkb4eQVkg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX34yx/NOLKSnw
 W+E7K5DnnEmSqZjVDmzz33CFUwlDbD5Je83Utm2FlaT+k4DrLqKVoUq6G0hUZevBrlfbp3XtBAW
 fbbrzBE2QeqSQV3RTOwK3Gf6tIRl2QM=
X-Proofpoint-ORIG-GUID: I5tMH_xUe59xJjpa7vjcO6v7wAUWQ9Ix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2ZcHCY3R/isU
 0PjW5b08whYuRIJMlG/uvc91EqXLXUWCWcUw1Bk2WiY6ezLudqC2uZPnnVVESr8SYQMuKgwTZap
 6UD6ysSBtNsDM7gQu7QymrvDaEXx3666H4EDCrN6+FKEkBze8V8wJNqmmn+nQFN0iwGsP7S+kLT
 Ocxp9sIfeRY/K4sVJSssVUpDtNHFKeKegItnJoqOQmNPM+E9PRHr64l1RxwHlsmLyXjMzKY0Fx0
 OFk5aj5DLDrlWtuenU+rQNjK+5/ESC/4CvOkLTja44f0mixc7owQHUU3/qeU2c0HlcyiMrrZQuh
 JWXHaResXyOOwaUbFnJ1fYCAfc/FzOf6NzUSICr3ryawQpNWqzpJ2aWmeAG7NNo1eT+bZ3MBJZw
 r/6CV/UP8cPXoEjSxUVtrcPYfRMjgM3ooZdSyXJzmWW1fUUJVVR8rm2u0MmqEYnuVaq7+u4p5zK
 vvxwszWwj5OA4T6CHjw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512d5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: I5tMH_xUe59xJjpa7vjcO6v7wAUWQ9Ix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
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
 drivers/clk/qcom/gcc-sm8550.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index d83a7bb5356b..2bcb37f27025 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3319,7 +3319,35 @@ static const struct regmap_config gcc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8550_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8550_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52024, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8550_driver_data = {
+	.clk_cbcrs = gcc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8550_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8550_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8550_desc = {
+	.driver_data = &gcc_sm8550_driver_data,
 	.config = &gcc_sm8550_regmap_config,
 	.clks = gcc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8550_clocks),
@@ -3337,34 +3365,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8550_match_table);
 
 static int gcc_sm8550_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8550_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
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
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52024, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8550_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8550_desc);
 }
 
 static struct platform_driver gcc_sm8550_driver = {

-- 
2.54.0


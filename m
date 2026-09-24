Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4B47FB1E
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251647; cv=none; b=EdmLNp4eWzatHXfayDD3N2CYmTXpFB8AQEdMTs9BE5QTu9uqxzXM7vnSpU2BuFuQOjjx7BmGg6DwnR+gouzjXPfo90H8pFLOEDcV5k9xsqx8TaadUOSiNeYdEboiXtp4a9DJSqAsGr9JaxqcF8cIE/zl4Fnb3P70SUA3dP5hSBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251647; c=relaxed/simple;
	bh=1aJTQR0dA/sog7qGkyQAgO7NJrtOYUMQUHZCG6mJu70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbieETS77isnvNQakWgFXIqRWXAIiULk4e8gb69lDDAdbBARGkeI+ySxVWT9xevnIzVLgVOKTE4rkLzDr2GnmTg/T52ZsrTbOOhQ3GxHgNYWPkCjTrv9CVxoU3RY2tk7rUN4LEAayDD8/+wuaJP3ml6x7oScSELKC0HFoPAMNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcWt3mEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNdchNGm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcWt3mEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNdchNGm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4m2W2285773
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=; b=bcWt3mEM36QoZyH4
	h2WTHRQlBDaiDWbRAUpngPfZl8MsoOnfQgKft1WTHQYfaJwSTOW6o6H8Qst7mwAm
	e3VbFoBqQsnm/yY4hl6oXdGMkseqyGol+0dj0yz2R3bYq5RShu5ITxRMK4nKDZ6x
	b9vtikJHwuZxaQkO9Fil/Gtsai81bOW10GpTlMCMfSSbI7Q3Y59EpHBmdGqfz2N/
	3akWvrMWnao5ofrYLacjspOOwc1ugGdJRr0V6KfVKha6FLYvYtIgJBhx9w8WNkGB
	qFrsybytfXUErJw5Jjh5nE1mExRBkw76hDLRada2DprKMVLneOJHsHWqMLSkER5t
	vyVkyg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so368600241.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251643; x=1790856443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=;
        b=WNdchNGmZWTaEI1wSK6dzaajBM0JgPxdrZC0sU5hoPsLYc2pAEnjKk/d/xK9kebj7n
         suyMCVdApE5WGVFEcxPROlDwq9oHWfwkxKyRQhsRJ/5LjFOAWRcpbr2A744rYQ4KX/y7
         q5/5diVb6M9Y/G7XWtL94My6kogiKiOSozmgyDJi27SniWKnlQZaNS36lKemKdMvPT1B
         jbuwe/N8gJ3w+j37JnXlWfTV8dnSqGHxFgMKo1FvVFT8MLEdWumTovlRYDz2E115CBuq
         OJQ0FQpzUDwVzL+Vz9ACh5WmcDaMQQKFMzvSwFWIHPoFyWPo8cREgacmKhwEbcGOG9on
         kugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251643; x=1790856443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=;
        b=vtTdQSKYWUUr7eIBOFNJC1QBHULohrA50wTayWcAckD1l3g/x7jnOID1pIGK5TPnW0
         ln5RJ5ao9Zx8AZjfDpA2e2rBMWEmVsL6GjDs58K3khkg4a9+QKlu6mGm0Yl7kFcVb4iq
         PpQ7QrUoD7o2pQ+O0z6/BcIwNrFyF8OxUix4e7rHdU1ZgY2VJ6qAXVDLWNCwpLuiv/px
         0fe9Ot0Rs8hkIK1oJhM8dkZ5KvdXEtn3nWDHk4h1wec3yYbgi3GJBOm0LcmAftTsdQze
         cTfVPW9+uzw1Wm44RfMFZu5PDB9YNPEdiUo105m9HWh5G6oUoO5/phGR4GLQzGtyK/1r
         gKRw==
X-Forwarded-Encrypted: i=1; AKwUvBw0rAqYZcp+iN9VbsBJS7YEY8TvLaItT9D6vl1RsOlrCgesG96KYhDPrfBQ0NP2MnY/j/mKB/a9bnY=@vger.kernel.org
X-Gm-Message-State: AFuF++nnLYiA5r+eTlipnSkJkjEr4SP9Eh02VM831w4drqnfUiRLblY3
	0z4eX5wdFj2OKnXfr0sja5LrCAPDrhF6IP831wpJuUxuUx0J/JpwXyeqyLfWVmPH8sMqDFb4YGv
	AV5mIgqDA4rdXJWRd5WTY7x4E9upbAL4DS3TbfNH6eo87ZdJq/XMtLbRwVElEzVw=
X-Gm-Gg: AYBFou1cSZwvMJtylWnAJ+xv3KKTN2+fzJcFGeliE6OeqD0T3IBNF1u+z1y+PWtL8AX
	N5JdKSECqdsqGaPpDnzTz9jFhJgDEMGLlcoU8aVw+jMCI/r7gESKl79k/jcUNxj9unxUKXP6abI
	Z0QyGWxvX5YsIzNZIcMTD2fP5PXs5+JHy1LpmXIT/w6CzMNxbRwgueGdkBnGN2aKTeWE7AC4+d6
	fpBwoAwzVtVYBHTSNrY8wC0onbb96BlkuJc3Tc1QDFG12zCN2wkDyBJrfpJp/N7sdOy2aUvLI2U
	vcePrabAm06lzAOYANdawm5475VlI3teULRD0HPsa2TMcgYI23nDANizbkxnXa80h0S9nqcf91D
	EV8QfBWzN
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr864925137.36.1790251643310;
        Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr864913137.36.1790251642656;
        Thu, 24 Sep 2026 05:07:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:16 +0300
Subject: [PATCH v2 04/48] clk: qcom: camcc-sm8150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-4-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1aJTQR0dA/sog7qGkyQAgO7NJrtOYUMQUHZCG6mJu70=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJFb4HQenFLnJxdJ/q7QI4+Y4zfD7JGYTQRe
 62F+epUN2eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRQAKCRAbX0TJAJUV
 VqnwD/0etOKnxCGD+us360qFyiorQNjy5DIMBJvWAEKyTKVYIy3hnY/dQI5FJ/OsoMozZXywoOq
 lLoJSH141B4xE1B6YaqCW49KE0zp2EQuTxBfmGChABfQwnsYMJUrbnXq2QhrxjIcmtp2izM24qo
 aJPyPf7pjzhEMPadbxQvoiJ8rDMjqnk4F+5jSONEvyySpkn4bTyONJCe4RCvtu4nNBosyJUsI13
 6dnIBN+bclS4BSTuxSjf2Gvnfnc7v3K2vAN8DvC4f7lWlbqJAO+xYqXJQX+lv9jJdA1fG7Cp7Qc
 tk6JyXzLu+YN/Z2QGyy+SXoxBmrf+dX7YNzTNh9fDL3vLbjj0vw1HQ2hE2zrENwbyKZ34nJXpzr
 5Z8B7/rhi85tNufBojyftt5u8eQLRpYXChHfthwyhCdUe5dMG4otiHACs6CvIWJob/REbJ9iWYP
 HbEPHi8IlnZIjQEY5+9YRwIWmezEi1DntEKNeaaHVSBbxUQ8P7z+h1bMtEpMkHjN3B2MY/yTdZ4
 +kFTH7ovunHS42aecASCHKC+EV9buCDfAFvrT7FhfTsqTlNY14tVcbe/blHxL+4gxujCA64MbP9
 u1ClBPADqZEJfz6a+G+H/pSgnzZrGUz1G34rIIEfX6W8MlOnfdc96O5DBhyH1S3K+xbuGyhjfuE
 KGYi5CXQuxz3Kdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX56Cq1KpAj3ur
 tL6RCTwLG1lW710n2hieIz6W+lLODoKklxJy/TIV3xNnZCBK+1e7d6acavik69KF5VMA4kWi3Zq
 2C7FSXNGWrVjIwPdarbwAbg8G5M8Lfk=
X-Proofpoint-ORIG-GUID: RQzdJv3pU5Hp3D7bSh-sigVoXifuK1OP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXwYzRboFDZonw
 7h9d7SkmrsbAsUboy8WDL4pq0wlKbOWa0IYxJO2wUOFD+mc3UQQ90hA0Emh2LxJnH0uZNZZirka
 TvYRd1IJYUH2MqmTFHucTBqZX/tPD6WO16l/Xf4uKa4CfJE/1C5kcO3813squTGe2u/1Z7IsspK
 VDgbSaWZ5Sowb8OrO2JbnU7XodZ/Avxp2IrTuM1t6sjduvqm9ILEHEY+enFx3wWecSIBIZEopMw
 oQUI219Yx7kkvf4FD7g9qtQVVAbcPH4fiZvyCXAs3AkJZ/xIhO/pHLuIEy/PWWyWuJFh4zYStUj
 /0B1GQ2BwXo3nusRUNJ8LTJW7wz+Aa4qONysY1AV4Gn1URQYGi2FcC2JRuo6qIm6UfDndJdzPWo
 wvk+Kd5vKzkfgOzLjMGpSrPjv7wFTVAAMTnWGICr8Ad0HvsPJ1gcxbw0AKZWggbD2zo/2liFAhV
 eOC/rGOvcc4asokxvGw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab5127c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HACHd5sh_oZ471OAbCoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: RQzdJv3pU5Hp3D7bSh-sigVoXifuK1OP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index fcbaff55fc27..27a51abddce2 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2093,7 +2093,17 @@ static const struct regmap_config cam_cc_sm8150_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sm8150_critical_cbcrs[] = {
+	0xc1e4, /* CAM_CC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sm8150_driver_data = {
+	.clk_cbcrs = cam_cc_sm8150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8150_desc = {
+	.driver_data = &cam_cc_sm8150_driver_data,
 	.config = &cam_cc_sm8150_regmap_config,
 	.clks = cam_cc_sm8150_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8150_clocks),
@@ -2134,9 +2144,6 @@ static int cam_cc_sm8150_probe(struct platform_device *pdev)
 	clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 	clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 
-	/* Keep the critical clock always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8150_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0


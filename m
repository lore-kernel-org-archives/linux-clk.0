Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5649BD9B
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251764; cv=none; b=GUlRMy8rO2QQg9KNE43Vfp2N2SEgRX8sGQ3PXoeuhBq63Iu9JE/iSzKh8UcEur/haP6BvLSNV138i16e9VbJjzbpKz8lM6qr48zcmNVHesbbhzyXhVo4hS2CJwuOHKrkYwLFIdqGCUsYXsmvpW9A92aB+z/mJOt5yT+pTWSwwl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251764; c=relaxed/simple;
	bh=oz11M2wrwKFK3+vSAbicVJWmbq+jkXzbbamqOEjW/JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eB+hFIEfP0VIiMdLcTKvlLxl1S1KdB0Zm/v2FO9/VS3v+LhXGZzmFhh6iHl1Yj+uH/mJ+K9WIQQcCcaMvIY+fteJl1oMni8iN7vBfeK5Q9eKR4qLadh891TIqS4ey9maz0xIG8DbekBLoudBrDCletJvXCGjUdTle8jOTjSV0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVHTlYZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDoNBbDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVHTlYZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDoNBbDx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Y932285544
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeKdsxYcHc+Ri00U0V0fl7QmJgNHnzJocuSoN1PXB/A=; b=lVHTlYZpYPwWBtg0
	h76lzVi8u5tNVaHgSMC8Ubi4CTuDCb2ZHmgxm6sxIr/y/cDwL6qD5MMg8Grvt+/Z
	yM3uE1OfEcJolt130av69aF0tN1e2R+XyECXiEvdMARSdr9O5sjZSGIke6bQWHoS
	nHMhoTYP+zJTOKwYzTz4yx4Dm+IqfH3OQUisxjLZK3OiXINIDM9qspcYCveMBKZv
	DKesEyPrjroMPwe59S403lfFkRshriXBf22fGj7MJWjJy0xmoI1Opv3yu1qJW1WV
	AwIdELsHVtroyKfCn65Y6DPcEmJpDwv7IxUx6JeW5OslXRENAXNz76Tf19dnUJzw
	u5eN8Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c851df59edso857965e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251761; x=1790856561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeKdsxYcHc+Ri00U0V0fl7QmJgNHnzJocuSoN1PXB/A=;
        b=gDoNBbDxZMVLcgXE1opdkB1VBxxTsMvUm6LDIzscyWdA2URE5Nh4JgOM1LIgb/9EBI
         SrXCqmrUx2hYmnwuSXSC1dlO8gkJVJlkUGXkoaeMOj0lbTdSzBV97PbsQnWjnzVXQDaS
         Yf96MaZXtKh4M0kcvQLpm1N3z6o3T0FsHgxDlCxzwiZkWTMeWrLGaKIQPREQOeP7En0C
         c6FNATO/neYFBUbcWa6fq8k0z8GmAr8Cz37UuOfHE+LJ8qzUpjlf528iq7kzn5yTjC2t
         krEzwHWlgQjFQPBWkqNk7+ApdP/cal9w4yuhFDZr8+vmoOHf4HGx43sshtddFUGKNoQO
         /AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251761; x=1790856561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeKdsxYcHc+Ri00U0V0fl7QmJgNHnzJocuSoN1PXB/A=;
        b=dSW0z1FakJK+VkKlTx8vXPQOSiRCoDGEzOBoqEWttWet/aLEp5WLhCV8aZ5L/Rkced
         Fp1h0qnO0i96e0qXepBpGt7I/LhFSHBeJaJbagC3+9lppSVigTAvH91Gkvd0nH9T+HlL
         0/DFJUgqJEfz7cBMkoTi/7zKUeEk6FImJ31+9SpH2GgbLPv+eLiZ8cfVnEmhaSpikcgm
         0b/e+sm56J7KAiEg4v2xWdr2dUSDKYtwY0VYJzSX7mvYjP4l1TOdKNw+b1q9A/HL2/om
         TOShNJkFDukr7EkIT4okV5R8innWr1SIvxdIGy6vExEVHE4L4HYMrpTh8nFWyNF1eW9o
         zizQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFmG+yPQxFFTI0+CX/hNtaG7vTaeonsAUq0xP8vJFXtBhtnPUUY3Fs11gH3fCZM0Vz1J0h07Y3CZA=@vger.kernel.org
X-Gm-Message-State: AFuF++nVPw8rrbJYxuUeo4fyZLdrUvURM9ha9ykdVqcWxUDCtwyPxzu7
	9uQjIJPJaAGOwJbBuSNT7zlxc5LFgkHORPTjdYNCIMWzYMNjmKUUc9jkfCuZRtPG+CeVsaonqgO
	rOv/18prZ+09mboFcbTx0jxwIWqamvZfkWdttgRwWfDNksKDpj7vQY/g10OjihXc=
X-Gm-Gg: AYBFou2Icl0dnmfKWgYRDE38oMLUA9rt6gsih1kwvFNB/iC6pV1EJiC9XNgF6HYr9q8
	CopAhysC9TEfBff3HNbTpx8r5xCZvi/2Pr0mRiwQpQjl5+3bwBimBcPqy63n1KHJbxuyeqNYXOm
	HJ6+NNjJKCkhSBOCax1Dnv3Yo6zXmBceB5solm8Hc0tgzQ+4EWTvyuPYciogp/rD9SQEMyBPdTV
	/xekUiIznirx0cCTzOQ0tNYDZEOX+8DmKeAqvAlRELL1F5ruEXPH/8kZz96XcJdE5zYe+GdzcdW
	qucvm/PIjxaW/uqGJ4E8HaAP/F70HasIhM6LoUuZqVeOyrCzKNXt9ySmp+AmPLIwj7TJ3VTqM/C
	I3OUlxU2f
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7af1f0ffd39mr942352137.36.1790251761000;
        Thu, 24 Sep 2026 05:09:21 -0700 (PDT)
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7af1f0ffd39mr942343137.36.1790251760445;
        Thu, 24 Sep 2026 05:09:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:58 +0300
Subject: [PATCH v2 46/48] clk: qcom: videocc-sm7150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-46-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oz11M2wrwKFK3+vSAbicVJWmbq+jkXzbbamqOEjW/JU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJukCmS3zbBLKoTV3kwTEq7qEhAABav+F3To
 YgIGjKeUsWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbgAKCRAbX0TJAJUV
 Vn+pEAC461z1qg3HSY+7RlWo5efVcPefwo8A4fyzIsqLCxtNLjT4vNFliSiSMcz51z1etRa/+w3
 abWjdAWAuOn3uylyoYPRLRac/D9/FN++qTiNvkHAkpvIDxycYYdkhWJZa+iRmCwnq4PV8rpp3nC
 ERaDThmR8k17WLxLX5uTNu7D9VCQmhJ981HYsN4tYFufmBV8QkUE+Z1FYj2fvFtsJo1vwmhbxyi
 FyGXiJ9E4ihb1kCssBS8I0GbOObFCPM2OT51i8JVSsXcrybL53qJMzFKxqQ6H4iwkOXWjhTiWxR
 J5mcRhryrsb6v41bcprO+tWQdJbsK9XwkxPVsQHRzAks7XTtl2UpAgQGzl6V+aUixIm8VCnuldE
 PSA7eq+e+XltnRapoClAEcZpctJx5S7+WFk0p+H5LtJAGz30X2BwqrWRMBRfZm5Z/BIqTTOBsJw
 ffVmiZS1R+XTmhHdVM8JMm8uIAAbrdpT4uE8GAfVQgKWiKWR91K385ZO1wzHBgVZ9d2UHQ0aQmw
 LCXI9ZZoPsrIuSq9LfhwVevlWBG7dj3Lky04w6gR4SMu1rPfsMapkepJsrjnMfNI7sFCpcok+45
 enTqPPW3g6Ph0aPM1licjBwI0OyNQ9le1vdlymm3T75nS1YeZnmPMVYJcxjICt1lAxeUZAjkh1g
 011S6hRACCcYfwg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0/wrw+dABjaW
 3HPFeC48TxDHaBVBRL7SXDfASVyFCpKWljntuiiScFMs50CHalkNzKpaciJOzwT8wDa3qeC7lAR
 LFCzq05gj9v9T/7qzgRB1s3/fBvAxCU=
X-Proofpoint-ORIG-GUID: Y5mZKQUMLG6zxW2lNxEi1W0Q2n0QQJRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2UBVdKfrqJnt
 oJqKnrGJbGFdvPMsEFeU89/MZVrpDAMOJtjRGKgvwN7Jd1fS8F8V5DRee924ZDPQX1ozGyHx6m4
 dewZ47S5OF96GVeU/++7JD2RwhfvtpHBm/62BUzzWH7Vo5uvzYPIrQc0ZawWiuGfGeJ8CnuBSN5
 FPqUA8HoSQMsuh0CrhIybakYZCPAoOoT5MwHhFjqakyiMQ7f0auiKvDH+YA7hQMrsN2JrP1cY+L
 yuo3frVi3/uHEJj9WND1w0gw6Uk8WJ6akFONrrhheLyhI7F1h4ccFJf8emMMV9ZXLHV9zwJt4xo
 q3pNbND6BJCM9fgWHtgq9YB6NmN7N5QFovQYSzI2XJ2BWAGECK/9VZyfdM3g39hjJc+j+FkVfGt
 uNwdZAVj39Eoe2ftYC9hTtC1jepJcaeCDzPkqQBBUQJ96snCEGlgAE9Bt8LwP8c54mp+ssqj9Kz
 5sdQM7sGW8v/xStZB5w==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512f2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sYFbF2zXfO1Ub-DH1h4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Y5mZKQUMLG6zxW2lNxEi1W0Q2n0QQJRw
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
 drivers/clk/qcom/videocc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
index 8d2e00799f96..32bad5e09056 100644
--- a/drivers/clk/qcom/videocc-sm7150.c
+++ b/drivers/clk/qcom/videocc-sm7150.c
@@ -313,7 +313,17 @@ static const struct regmap_config videocc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 videocc_sm7150_critical_cbcrs[] = {
+	0x984, /* VIDEOCC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data videocc_sm7150_driver_data = {
+	.clk_cbcrs = videocc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(videocc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc videocc_sm7150_desc = {
+	.driver_data = &videocc_sm7150_driver_data,
 	.config = &videocc_sm7150_regmap_config,
 	.clks = videocc_sm7150_clocks,
 	.num_clks = ARRAY_SIZE(videocc_sm7150_clocks),
@@ -337,9 +347,6 @@ static int videocc_sm7150_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&videocc_pll0, regmap, &videocc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x984); /* VIDEOCC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &videocc_sm7150_desc, regmap);
 }
 

-- 
2.54.0


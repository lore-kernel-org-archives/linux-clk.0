Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033E34E8E13
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554681; cv=none; b=gLflUueWrEfVtOWRPRw2QErOEh3NG190pDQT8tKWfcrozdyYKgqm2mzDVSvzXC/WKvkQ6LnnJ9J3DqzOG+0dsTsqSqI/3U/fTC0juiC+ufOlOMmDCYEJCd0fNo4KueacwC2MGgH4tschaclW9JvePeazzQvb1GWP+cmCtmQfETo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554681; c=relaxed/simple;
	bh=iz3ufEAKkkYlJRxzb+jInn8jCy6Z8EJIEctOZKqgVTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnkUdhyAAKBX9/DLvjFcIIO3/kLSSKJbZsxTWHQsmCRBRyFWb9oX+yi3P+Y2RgMDnCToNDLrfFSUHCaDyGTPCALC1s5t31Kj1Qz8XGQ6pA0wGT9kTaBCVm19H0nfVfuLIgJhcp7UEbcGfTm9MLCks8vaH99YIG8UjZgPP7M0+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkUz9txc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfbDXT0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkUz9txc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bfbDXT0v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92oI32348305
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNZ7T/K1K/h3C/amGLynz6dtFRmOnZ0U+RH3dZePgE8=; b=IkUz9txc+4g7/Z2V
	cXzCxvVZOIDkj5pPQvUVOVjia6pJZODID4H3Vw1vriFiwW2SKEIubvMmX02jIm+p
	sMBy1zhRH3IINJR+VZfI742XvWvibFlVn2uDVZ9P3Mp8kGywT3szAWIX2EtwxkzO
	W/qHWSTsa776RssS46FH1Y83SkAzABjcUXmE2xJESP8mL8vyg3lvuN1i9FmAHM2t
	j9qOzhUBQNKK2F5apCHgCdcvcw+xTAj8CJXEPdDlySXYcynaQ4iGzB9hDAFP44Lt
	IES3tA4MjKn5jjrP4tltzrqOSO6kU0anoWn9H7eerDpZIIBvD3P1TiFtKVqlpv6K
	AbSe4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so379584185a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554654; x=1790159454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNZ7T/K1K/h3C/amGLynz6dtFRmOnZ0U+RH3dZePgE8=;
        b=bfbDXT0vjeTBSGZiay8XgvCYtINYzjEdnt6+XSO/ycUZLzRrwUk8BevzNLAOIjrBy2
         tQ1HTIvlxsjQ9WhUw56igJvwp/9PZ7XUhDYTx/OaASUAqgbV2nPveSslS92lBKT5pl9a
         sRdHn67EcmYmF4sJwPBEcRYBzyUGId7YCZCG2BteVpgGf44xDk9M9R0MbDp9nbY9xCb2
         XVwTLaDxAcXIY/gWPccdLQnbT14ar3W+jPulVrSz+thMzxILv89/3+g3jL1IKmUxnDIK
         kFcGWXKRN3PXi6nj222tlWpFibGGyoj8uCkk36CnRL8DggypHGnt2kLVSahjzijuHiry
         fciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554654; x=1790159454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNZ7T/K1K/h3C/amGLynz6dtFRmOnZ0U+RH3dZePgE8=;
        b=JZlv0sQOge1hIv+gb6mvlucyFOA7VwNbtwlFQHGpCeS/cqhmEZ/mdxXHlH/j1Hqxd6
         k5RNkdS+zVxVVmAfBknzL/amrbQqRt9B6ObsmBR15qxuYQJQVPPbk50YQtBcE0U685Bd
         hinzq35KU9b+k1kD2lmGpSMB4XzXwYt0FWx3e0XXp4+Io9bMLpIlPORZhg/Ftk0rM9NF
         kXrnV9slz53a3mpLe1V3ceyjAsK12EuIYpgO9SFhX427+P7n2Rive8OVwijnd7w6yh5q
         BnTuc0vecU0jszKmjP6yppL965Kc2aejvAScT6XjF+qmNc4UJGKGuTQMIAp8gYzLwEMA
         xH4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4CM3ROivxvQ39v+Fs9BvbSDNX4g4TK4NHBJD+nqJCgJqThYqokXGUiHVP42OCipO3PwtmF3ry+m8=@vger.kernel.org
X-Gm-Message-State: AFuF++kYECK6aZpn7kMoLMo6jI/ncpy/cXpF0tR1hr1QwZ1hzqQcWuUE
	W/3T30UQ7E5TbrMvjofxhocQuFy0JKmBkDLgFYbHxDL4uuNWrJObDNtZbMbfxQ1AX1Ckq9i4Bpz
	00TcgbQhMQ5oclHMuGgVWXSP8U+EIf02QE48DmD35q04U/FqlbP0wETbxKez5DQM=
X-Gm-Gg: AYBFou3BkyXGbZaAWXxTPSk5sx6qove3jBUGAqi35zs0mvl1dAWVi3joeUFQ5tDaMtP
	BD/DaAvBybv29fxTm9rXRGFMQYIukRheMhGIECrWms7kK7iXpEfGFYdA6TRcdM7O1DMFmlfjEl+
	yfwZ7RWRNUN3okq74M3yhPLMifz3Y9MXaFeHpySYvNfRusR2X8XhRmVYq/UGmuDi1qndqpS42tm
	ZlfJSYXcq7+ta8i+HIipUjcmdBtTp6EPkwEmmQzyg4hoRjdT1oNPXPi9sArWcEj32yRaBPkVUrF
	Ivpo5ZjU9zZnlc37Z7v717F9KLxLwADSSaabqS8WqjHQsnnsRAKIVS53+Z7KK+4nzpGdKN2O1Ob
	rO/08it8=
X-Received: by 2002:a05:620a:44ca:b0:939:db29:4c11 with SMTP id af79cd13be357-93a3477c99fmr1003070985a.46.1789554654136;
        Wed, 16 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:939:db29:4c11 with SMTP id af79cd13be357-93a3477c99fmr1003064685a.46.1789554653617;
        Wed, 16 Sep 2026 03:30:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:02 +0300
Subject: [PATCH 46/48] clk: qcom: videocc-sm7150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-46-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iz3ufEAKkkYlJRxzb+jInn8jCy6Z8EJIEctOZKqgVTs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm93T8BN4//sQDc+JC+1958KF0tw9CeD0HByz
 2SnsgYqwGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdwAKCRAbX0TJAJUV
 VspbD/9IGQ0GrBZx7Fd6zDEFrSrBT5WoGqwAhzcN18I0Vo1A81GsCEf57KuKITJZGhZgyeXym5/
 GlhyHz1w4IoWWoMmt8D7e1edaBsmwb3zeq4pyb9wWneldHvPlF5+nMPgCSTJUUhvF7rilNp5olL
 f33af+VdEmro7Z94w83y6tZAy/y1mH/pZgNMbIbHDi++BRJSlcRAxLi0a+OpK8495dBc80immXa
 L3S75uebT8oX+O4E54P3KOwWS4cHu8adqVxzTzw0Duayeg2fQ+bDFIjMpOUNyviSm6EmoUzGC2u
 OLElPWo4vGq9hY/76OTIzxTCVURWTNebgVZdHunoUZR8S9Wkitfaxl7qGTqokszwTwESUKlQtKa
 /eHe8ByGbfCxTYULj2SqF2INz9tV1hrFnEaD/c1eCvUWPzO1AjXZ1SbGFag/Re/4526raTRyyLU
 9lD0GrYfUmWQWCmthqW0dG1u1u870KiWWMTjj0sQu/UAsUtCTPIvMUR/59pGYYnJkWwEldBHsBw
 cChh/SHxF6Ud95ajWI31I0ypbb8MISIlRikfMvLWJ8L9Ta8Z8iN9hKuOmMJX18Ykvp9yqrEsEJU
 MNB3IZplnJiJpEaE9sVQxK275wzE7alh9YMYCu7fS+ocBgjlB9XuE+itG5QMxsb/v6HGJKSCaFs
 rxTZK3dxQuH0Dcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 7RgRt046qRSApsdT0F6knEg_Y64YbkSu
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fdf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sYFbF2zXfO1Ub-DH1h4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxKAFYD7jsy2T
 aU8igysshSO3EGupKHype0UeV3m9cB+CjCvbff0L3u3aZNsbFW3oKz36o3DCS88UQ0Qpr/4nkQd
 8E0Fo6Sfnyk2F4OQAGpmoR49shwOx+WGVQgVxtGDMSXW3Gtvg4CZbY6Dnn1qmQI4om4QG+/DPdJ
 iY4XYnVm/Ked95gm/pKG79FJTXycTkIepk1v7PoDjtztffqAkwryYpLsbI3sc92laSmnxGDHErA
 fQ59isQrvQc2K1wIPXXgRWVo0tTtSVmJ/ED7bSsGqletOLO88RK98d4/3Oa0f6a7aEzmoarDwSW
 eLLoFaIqOe8c6rQqwWI3fjkdSdRjIW7o+lNtjLOkxX9HexaIH49caz1gJnHg1lmZCL3wrAoWQNO
 MALwBlb9zr9TGdfWRj6ooIUuy9/r+MJ+OC8b/NeJxIP63rruo3FXdlXHFzZkz5MpI/4UT0EZwnL
 sqaE4Yh2GYKCsuL65UQ==
X-Proofpoint-ORIG-GUID: 7RgRt046qRSApsdT0F6knEg_Y64YbkSu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX94YxAxOhDgTS
 TR2rYTXngwzcwMPS17hkluhJfBjV+SGa5PELAyosYdt3I/WegYzSnWC9GY0VaPCOK2FrbG32Q9A
 KHOl4xm7xVkKgVN9DimyvAIKHY56ZiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
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


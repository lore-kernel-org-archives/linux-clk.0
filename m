Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C394E80B3
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554594; cv=none; b=pqjNkQwK4YoqpQz/hH2/aEewdfb82ddj2ayq+zxFxlgkqWhX3n4b2JnvZ5ioLbyZf5jIdJb79cTFQ33Z1/5uZpxxmjCzSgoyUYS99VmeMpzXmDB8jShMn7OtANVOtHINwFU9HFilcaAiljf9GVnLopyOsmCL1dz/H1dJM6Z4G70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554594; c=relaxed/simple;
	bh=NEcyM91aSl6BFMYhR9y9z9Qnf62ZfDA4T0e9hLBaXio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUG1rsnl2GJqqmmstG9ZFsj1qFHFSpUpZdCnl5SQaEiLbjj7fYwZIGDs/+9+5yuKxH2LOKY48WEka/bCbVADDuQYbQnGjkxjMh7ts+h6GxMn58i2ckZy1x9sPkEARezxya9MKULujFQSlqbbqIhEr8X1yVBmy9MVc2TbVsdBIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of0R35aU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DApK4BKO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of0R35aU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DApK4BKO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AOT2658235
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wn+EokI8YmyHqDNQRq31MkrfGIsBHcrZ0BrDK7mrilc=; b=Of0R35aUkQxxQPqi
	TgLhC0j/0u1Hd2Ll4fzopU7INhYBVIu/LWxc4KN2yGhsTfCaxAIC1yefZozJkQ2o
	LvLwy3BdWY7Po3H2NJNR5OKSz4MnmLrvL1z8/GZGVlrgV112Q98It4Y93YnmM7Tb
	9gsOhwwOEJ+SAGV2NQP220G9Wt+2ju8+Q6unWGRjQ9d95mHgaFNn9FUsKQTG4OMu
	hYge2u6vloDyDIhOX0m+K49nBZWyjgjQTc3Cx7taPoReuuDpYwNm47bD+Kq0l1yt
	6slPYSKmyyqEpCBGCsKzznD3HjRtKcWpzZ0Egy09OlMNTA43Avj/TRWC4t7tMen+
	WwjPGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujan7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so675019485a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554570; x=1790159370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wn+EokI8YmyHqDNQRq31MkrfGIsBHcrZ0BrDK7mrilc=;
        b=DApK4BKOa6X1KBmWB0P44Pow6M0ddb7oUyOMR8AxFzk9TnT7TxW65YZS70t4FIx1AJ
         w3DfpzASaaH0uRVAZL+mIAqDDiiDW7D9cgttqcqsRQq5dz3KY3l2mTgEOFZ+inbBvJ7m
         abubPw0kyLxxyBFN13BBRF1+wfNUctyix9k+Z5SkDmfzUoXwnIoCZk3o88Amn1hRWLl6
         Q8A/zhBvYsXh/FiIRwko3MLhrg8TIaN4G26m4j5pzwrMWrySDgULFSPKFLPsOAgDOyKx
         /a4K5FTdMP8x4iAMIKimO3gBbm1g4lWix8zEq8b+n/KYdviQGo7zyF/InNKO1GH70FU3
         iGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554570; x=1790159370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wn+EokI8YmyHqDNQRq31MkrfGIsBHcrZ0BrDK7mrilc=;
        b=lM6xLyI5stsTR9KVtduE2Wn6W063N38QmHbeweUKoLmee0ZGXLFvnA1CShE4XnKo2N
         czyjoT9lNiPnSHf6ZAtn034lGnytM/hLe8c0FV0YE4O4FfGPiGHirLswVO5uYO6jpeGc
         tCwQtFQzJc17DzwA0INud3Fd5+QgJKBRjjvwlIplzN7Oft3KlAhnc6JUZMY5ub4ixiXh
         dod1O/P2uwC3gNpt5aBKi5pzudgk79RZmIrZAf5BfWlLuGEFonQpjBfAC0g+3DAFvhcM
         ky0rWoMJQzPYn7lUBDUeRjHr7Ux7LibGWv1Uvh8AS5v9VX5YR1LzIpW4HR6M4MsTVVTS
         1OEg==
X-Forwarded-Encrypted: i=1; AKwUvBz18qYLXPsPu5+zYJGQDIq+uLYjwxYJOCpnf6g4IM06DP6fU2VoB7dwCtb2qMS3YUIbBBgZUKd94qs=@vger.kernel.org
X-Gm-Message-State: AFuF++ncxC375eAK7dlXVN0FCOzsQKBhWu0hSD/TaiKu1kB9tBK4Gu2g
	q65oIozi/dfQdlvU2f3LttyuBqkY1+AkhsFZMgkkbz1bKM5w0YIFMYpqwHgx6EqkUMTgNBreSy/
	ptfXd8QGIAtQOTjczAWIcZqcLxm7F24gfkIMSfkPsI7QKBVPC5+2KTL41IyJHWvwLrvZUl7U=
X-Gm-Gg: AYBFou1jjMbljI/D+e3zLRnqVnAknwCxveFYjmTVYwhMpG7TFDfX8m9290LT9hfK3rh
	+V+l5Vdm2YuVlW0445c4RZ+KngTy6DjnVyECv+qkSr1Ij8b6TW667fo06rFC54mWIycJ4FOnYqV
	QwctVKi8RpwAN+3rv1UqJeGuP0VyUR5+oLOP3VjP+2hZn+vf6Kg2GWCm+k+0VEUKCPQv+qJ8rdG
	Z+q+zlssYAvsGd/KH6LsejDhnvp7ttXzEnoq7w+rw/ija9qo1Iz/2pSTvBQhjs6XE/hr6zwI7Tz
	i39JEbsNmkzvzi2Cr4r37Tfa5EuJ9Qk7xmJGsdBOcTz6voJDves+A7Y1j99nOTLNCLMR9hInoza
	1i1ukPog=
X-Received: by 2002:a05:620a:800e:b0:939:993e:bffb with SMTP id af79cd13be357-93bb76fe856mr274693585a.22.1789554570233;
        Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:939:993e:bffb with SMTP id af79cd13be357-93bb76fe856mr274689585a.22.1789554569663;
        Wed, 16 Sep 2026 03:29:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:23 +0300
Subject: [PATCH 07/48] clk: qcom: dispcc-sm4450: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-7-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEcyM91aSl6BFMYhR9y9z9Qnf62ZfDA4T0e9hLBaXio=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9R79Wm5q30jug0+rTLSP17OAV31T+NhkDtd
 RUktM1VI+WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUQAKCRAbX0TJAJUV
 Vv9kD/4l5uxc0MkkntUSrqgCdg2bGsXBI/IyOAgqXRYZ1104elJFfZaqFel0H7IPp7BV8J7QFC4
 veTkrazPG83YTUp1Lxa0bHse7+LfN9aM8K4f8l4tAe3/pTKfQ5C+c1AxtmAkE6h0sxxxQvQ5SGu
 HqdtAjRz5rey6pPxvXT8rJrMfzxbamn2owsMGjfw2krphbEqrmnde/G6FD1KSo3sbf23jBsPsI9
 27YEzSoxBED/gaWZTgR6TSvDjCqQdjHBb1+Ycfiyv/gCtsi10MpklN6wdu1VGYl3UpVz6fGO2U3
 NeBZ2Wz6hZt1qiCcO8HChIUC9aiX5qiRNF59y0/bJjMIptW2bH5A/zA73iGEHEadjCoXcLJ71fr
 Naovtf+4hM5PNT3ihtzQZweRMj9z3C5MJt1H2Lung3JKobMXCmWmNGvyeJEIuRe+UsOkZciEbnt
 rdztF4rN3kRRygtoj+5mFoYMFVkvYODV210zgZb0izuMdprbkk6XX4S55l0JYktvxdGJSNPxvlu
 WYr3tB+ON8O5YLtLBKhgAMlSWFq7kjCbLIEX7CPbekNn42aK4dmcahJI152LWP2qPQvO41ISJcy
 SDBZGJkTsX14ta/7ocyMnhePBy9PMl6kM31h0hnkORyq59UHEeq2a2qNgIDtfYwSuDnVJ5Ddh/G
 VAaDU2CZ2rYRIjA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX5Gz6e0t98XqP
 7R7ifIG2OVEkgXyYuvr19KfU/SEcDXHT7ua4kXi1luj5b44obzX9IlxwqHfLdot48wBjQtVUD3F
 qdg+AKYVJQgGijUAcBEmvBFU6qvQbdPB7n12vRkWiJauJz0p1Y43BZTDhlOP0qhSRZDtvvsSVv9
 ccZy4Mz+yku8fIVIDdJQoGGOkbNNmZVKRXEjcb4WOejgwa92BUXM139marmqgCExriXSGf6Md6t
 nZjjoLCGY74/sTAqP4nKYlMeD23B2DaHR2af/b0qR5UJ0MYQKKHQjZ/ZhXuEFt8qES2pS3YrLP1
 XuNj8Yq6k1jnFupTjsmO8GdaQYoH7001tJ3juJIlTt2l5xBg9CtMbC3g7btwBt6vb6qjBVfuuxR
 aiDXMtGhgjdCwKw4Ew5r2hwGbsShNJbk1h9S+MMmjqZm1ACowgg3r0xM7x0bkbqWykwwN9nXb1i
 iZpHgzwwptt6nbcEntQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6f8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX/rhnCW486a7M
 hA25rYrz7Clv7n5IasB5cf3HOLNUuq3LszOXRvL5ajCGqqRMYbgjDg0cbhHR06gnIssOrsXkflR
 z1FXole4Fw8B8miXPdFlhq2fpYiCWgs=
X-Proofpoint-GUID: qw30Fc18_-KgPMTY0ciGRWUJ6Wl46gPJ
X-Proofpoint-ORIG-GUID: qw30Fc18_-KgPMTY0ciGRWUJ6Wl46gPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm4450.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 4a4811db55dd..f39afa067cc6 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -719,7 +719,18 @@ static const struct regmap_config disp_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm4450_critical_cbcrs[] = {
+	0xe070, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm4450_driver_data = {
+	.clk_cbcrs = disp_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm4450_desc = {
+	.driver_data = &disp_cc_sm4450_driver_data,
 	.config = &disp_cc_sm4450_regmap_config,
 	.clks = disp_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm4450_clocks),
@@ -746,10 +757,6 @@ static int disp_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe070); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0


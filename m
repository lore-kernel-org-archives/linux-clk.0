Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879F4E56E1
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554591; cv=none; b=Uc7vHXCFk2deF+QpavWy1OC0y5mfQd9AxFRmwmbon9YAMziD5gRtW86OB3clL1ts6vWxceoO/L36dphjWuM+w6TsHzy+BdwgJ5X8+Rndbbcnb3UQ+w0dff4714QGFmIUQ2BlYANWQqIcS6rXJCf/tkCBig/8vCqpx1tJdeh2sZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554591; c=relaxed/simple;
	bh=5kVvtWRtMetQrC301SdF709Q+ZqaylTFJGaMMYBiDNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lm3SYeJvwkwn3hAQvdLt8YQF39ecjJJrLGXlBrylNhibT1eIwLXwnZ0hCWlW4OjK98eev6oNOaMubgs6u5Ix7INx4r8ZpIanZZjfpjFcL00IKw08FEQebzWCYwXJpSul0OsD5Ce5L+UeBoTaLcPKOiTUvWkWrPMKpu1ghB3JpSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4EkMDsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSG9adKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4EkMDsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSG9adKs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92pv4978298
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCnUlcNtZPRsGZqWJYJql8R0YRzfm5KccrFhdBqwbwM=; b=o4EkMDsxqvIiUL0f
	O/O7FtyGvbXWh+BpnC/iLPg4V5ueAa+P4zMw7QLkudrPcWOZJF5jcRr8vyOt98iR
	Ixs1gC91jhdqI8mb1nhBA0XYtIq3V9vZnuLpASn92bArwL3ZOfBuUWbLs/SONYLC
	6R8ViNuJZfHZ0wCRoNcNfCJUj8Ot7w1LAUQDY3Mz3/Wh3uXExeUCehLHBdvRr+i6
	+OJ99ugNbtJj81X/jZvbEAUrwwD4UcJXAypkI/6wJKyBfgA5sG/IQTUjcOtRE04c
	rpQ0z3PEYjwIpnIpfoRSlEdNrIy4YaKPCn1o3qbVuGjh4qaYsI3cjQa8qLFIrzvZ
	g0CuDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso456674285a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554561; x=1790159361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCnUlcNtZPRsGZqWJYJql8R0YRzfm5KccrFhdBqwbwM=;
        b=aSG9adKsQ0pU5mNUR1qrAeBBFbJVdzMApQhUvIbEHAd6IBuuYTlb7sUP1Q68KhPAtX
         JUkiZld0o5BvyZU/sWjRzkburox8jYNBc6afKMX0g7q+dM54MgQ2xufZwExrQPinxFGW
         rhAUnN4En4GcT5zVe08TEhzlTdOY9HLQWQGM2JD6Qmkbk4gHRr9LCh0GRayjS5t8M5XK
         x8DZTPMtjwW5hfD+WSOS1oC03hwOCe+fbXcFXle6HZx1sN+A39cQobdje8w5m5K4E4pF
         K1CTrAjW8bbZTjI4QJPFHjeQqlrY3P4pQ05lijLye2SbdbQV5jBo5famqqQapgGNZQVQ
         0G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554561; x=1790159361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCnUlcNtZPRsGZqWJYJql8R0YRzfm5KccrFhdBqwbwM=;
        b=Mwsy8a670F7aW7z4x8IRqBWl3NybxBMTd8/Cp1xZ2HZPlsyaRKlOlRS9YSoLWgb+R7
         HLdeRdkEKcBv+8/YuyNcx4oOuKspj0MAJvBgddJY/GsRkwDxOFAfYoB0xAhB7SHH+YAV
         a3mXE8BiYEnNANBSX8nuvulaNuPEvUYEg9Ake2fad0/O69biaoQgzW0EUVt0Je/vja9M
         AX0MFGv5zY9FoOfqEAn6nUS9hcjlMZqGPh49r5ot7q7v5zblGaPK/tI9ch3wJes6H1ye
         So4HJoZIMJleXn7C1FOVQY+7RLhpV+gHtJrzVkhj4KAfVLwlwqyELODyOHDUb+IH+rGA
         rNDA==
X-Forwarded-Encrypted: i=1; AKwUvBwl8DpuvH6kHpo5fdur/bSjUzZdCgGRHhuetWL1gJM2c66WCjHMcQO2UL5ycEX96sv3NQjnY6SFqTw=@vger.kernel.org
X-Gm-Message-State: AFuF++kLkHyVFpylyadeTs88bqR3Z1aOdlWd5cduVLP1vfwGQNXCV8Ra
	2so3zJ9aHvZVpPhUYJJTZHnXm/dN/uytLzH+niyVLiA2/HlTPytK4aIFn983CdMEbY6HSoV1y5D
	P7EdteooQtIumFGICQBj675fsUhAF9JPnc2GpwnPqwRg99A1/fxHRilo+6gwocnY=
X-Gm-Gg: AYBFou3rboJjFzgo4S/BB3TW8SWiIiOgRFroMcqVfuL3D/MsP2tAGNkie5DymNcuuK0
	8rzkJ4o+paGWkoXN3UcZDr3OjmY0+OvyAumpldG9Rk2B1IMe5bE3m0Wh5ptrQUcsqwwp9eKzZwQ
	D71k9NaWmtsyej+xcieBHWEN7uBa1e+j8rzzsK1bqPr0b00hQh9gTb+MeYhYm6yaohcO7M0IGYw
	fapj+eH7uzKPTBgtVES1IgD69VDkJLih2NOBuUkEyvV9ydzOYbhRAH6gG524vA0dH2jIi+oQ383
	0AKYTdicxHYETl4wMkaaVeoQCFM0HhPO5mH6SVkJwm1OKKChezV5pq5yEpM1KswyBzJuHkYiOyU
	gb7+KIAo=
X-Received: by 2002:a05:620a:8399:b0:93a:ea:b00e with SMTP id af79cd13be357-93a346fa5f8mr866254985a.30.1789554560512;
        Wed, 16 Sep 2026 03:29:20 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93a:ea:b00e with SMTP id af79cd13be357-93a346fa5f8mr866252285a.30.1789554559959;
        Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:18 +0300
Subject: [PATCH 02/48] clk: qcom: camcc-sc8280xp: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-2-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5kVvtWRtMetQrC301SdF709Q+ZqaylTFJGaMMYBiDNI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9M8p1vVtXBJ8zAcoN/xc+hTsMvLgAkqRbZq
 NG9r/mZ/lqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTAAKCRAbX0TJAJUV
 VlJbEAC4iheZL+LPE84bMRPp9qeUFPeNlkZnbnz9/51JABCtbS76XqCiM2uKxiwogopFWQKopyv
 1GU+4aAz45o/oGd6cKXhdJAE3x4nc45Iojrfsn6X6L1obpzMZMtfnQHfef7OqaObDuiQmxASnBi
 ZGWG/QXHdOpYo4iqonOjcYuqcCJly+I3BDX4av42keaf0tuiHllA8BpZQQ46cwtojpS+/kx1Dvy
 5HKDXu0/PLAg3NWVFJBuMAkXwg2N4a9zfEOh9IfC4QIMSdeAsMDtlRbIgdGSIvyBrwMUZIDOcC2
 GhwxZAyIQGj7dX1qSwHKTehaybcNUOMnh/dOOM7/eexTbeoxx4YnZwN7OQ4b8BUwzJvt2V0L7jX
 DGhlpBjOqPOjJsNu6kOQM0VFu06mzE7U28YYS1+mWPPuMPFDx1olmofaOSkTtAnyYpIxCSmMt3u
 XL1LmT/qeY9lAtR50GzEIXSfKhUjhshYyI51eIa0xnzkhtd/zXq1Tpvjj0CnghFWJ9anwsraOGi
 PAxvNXnTmwyKuI58EtrGcsczG60s7UL/Ii8yMAJCCedX8KudjlgDPOw57XMBMEEQMS0e0oILr0s
 9HgPS/0oqHr6mffHSS6+J3OcSFv776NnefXt50+nqWhuG2Iwyw1AHp++0YXUwauMrfunPCO6AQo
 ZOB+fURZyVCGz1A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8Oiw8A99kInd
 ILREyDBLwShZNqFx4pVuqNisDEjEI97WIY8l4+YlcRd7C+ws2vvxWNE0F88lWR0HOcJrTwCcxQv
 rUSmMTidxR6kLsS9fJRwHQtvZo5/CLGmVex3muaF9UFQQ20qTrLeJxTN7LCHE1nGy2m9cipmK9E
 Iiip4wfhl2Bk+cu9O7+uKXJDt23fKsZSDu7Gj7CwV8s8tTkp8QPOvDDUyIbzpFHhPne2q1opx49
 5nSuXF69Pq2tj/HCFa3ViznPOtAgHMZJI+Kle+AFlhxtcpDktYMq4dSi8LBQH5Gj4W3L7RAc71u
 YuvwOSyA5qAaCwlkOnfeUE06nPhwJnkUScskGwxtjrcw1YbQqU/0WifaqflieenxbC1R2MeLnLl
 eEF/u23nnsvrAgtH8Av2HOSSRHy4YvIwmJnuhbWAy5R9PhNHAsjK743VR5F5Vq1KQeLsuAJY0rx
 bcwYLMvusxHxnRCWiNw==
X-Proofpoint-GUID: Sh5hCrv7Bt5kIbztQl2N-SLXz2N5frxl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+HV/6xKqAU7/
 S1oj3TmnRaKjVl6KbS/HxC5yjkQ+ZprjznEn2GquK304OTW5Fi9+cjIjkZM0AWNqACLs7umn9IF
 7MBNYTQ1q2vRR8METHeM5TDz8hKYAcU=
X-Proofpoint-ORIG-GUID: Sh5hCrv7Bt5kIbztQl2N-SLXz2N5frxl
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6f81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rrqsg2U6P9VQxLjfjP8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 660d8655d391..b0f1d40d1df5 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2967,7 +2967,17 @@ static const struct regmap_config camcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 camcc_sc8280xp_critical_cbcrs[] = {
+	0xc1e4, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sc8280xp_driver_data = {
+	.clk_cbcrs = camcc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sc8280xp_desc = {
+	.driver_data = &camcc_sc8280xp_driver_data,
 	.config = &camcc_sc8280xp_regmap_config,
 	.clks = camcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(camcc_sc8280xp_clocks),
@@ -3011,9 +3021,6 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
 	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_disable;

-- 
2.54.0


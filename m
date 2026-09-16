Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4A3B994A
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554605; cv=none; b=LOTAkPivnJmskcMkfz9RAU6GEyUq3h5TpFOFdReNsrJFemVGUaERpCX3Leg408V792ONVbmUBkona4/PNYhLL2hi4+Sg3JDvRWmc7UHXQWh4lIZ4hbcNXHiwotG3kxuz1VpxJior3chjw4Ivu7LmaIFg0oba8nWof4qyCoBJM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554605; c=relaxed/simple;
	bh=ddZpgrzvUbp1cuqzE7ilVSHV1084ZKP/Bw/rTPEw8vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS9gmBRUZ4G9y+uNnJq59co4g17HkoILaCYfDbsQwDVyI6nlk78mdvoOq/+Ujw+XrPxHuDMhEpj/m3RvNStewUkD6eSxnf36LuHKH40RbjsmFuMgEx3J6ldc5aZl/FMvFYIxYU92B3+6gaaH9uDGSF1izNQ8BRDz/30ARv7NJaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX0WYhW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3hVIdxr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX0WYhW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3hVIdxr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92f5m2477683
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsDN1TqVi6UMpuxEeMHRkj9cz52RGQHzM/5Tefv2JKE=; b=GX0WYhW2fprXUjrf
	fk7EjX63rRVrd5+rxYmhZ1jYHhUifWs7iZNMRzMYoazODzP9/Fafqi3YaZmORGdQ
	tlTcGMQLTxJUzrKKWG1kAqUg2H1A1bBYnouElNG2fIK5Hu9svJQHu5hQxt/1D/Uu
	lYg7TafIZ3KV509UEnq8VPAXjcnvHZfGmOBGrmudN/n9eXDrQrqYvf3yXusm1KJS
	gJsnSaCpX16xnSNtjCjsF+wu5Fend1M7s1KLeDHkohR2j+lLiQw22jNG1aM1Fi7j
	k+4kFGZDpsCS8avk1fDJtXxF+ZsMS2tQLi8VSbG0KwBVaF4pmfc48fGaLjWaktaf
	8W/OVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a00c70d28so646570185a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554578; x=1790159378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsDN1TqVi6UMpuxEeMHRkj9cz52RGQHzM/5Tefv2JKE=;
        b=M3hVIdxrS/26FFGYD6QN2/kKb+126YpaapGXTeQbqqjrQG46OtebjvLSHleXYVTK0b
         D5X0XtdsUgGmQFPp4Iov7pmIM9DH8tdBvDCbt0aPRx4eQtnC1ZmLw7mQsxg916pJCkKT
         w3XN/Nj0RnDHgZeMXOWeyufhDmLbqv7BGbuQMTUXGpmwlF8u4UfYGNGlMoGi2D9Uhs8/
         asMwbKbz4xbrxla5yyUZp9co4jRYhb0kI07f8xUD2F9woh5wc6Jd/o59XN9EsTCjkCQU
         LAf0puW780Te4Xm3eDmgPVVoS9Xat8n470525TO4QWoLPUZAnItcu9Hx0EIGez9LQCuH
         8Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554578; x=1790159378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsDN1TqVi6UMpuxEeMHRkj9cz52RGQHzM/5Tefv2JKE=;
        b=U3KyZrIt6KzCOkXLrIzj1uDTBd9WRwA7+vVqTnXUZzJQip/B7yupER7eFTriJhceIt
         ooKafF2yIv7tnIivLCMnjGdar1CEgWN0AqgFY8jw9vVMAjjTCKoOeSfjcEtYqgWjNmZ2
         YJqxWQqDRqE1AWgIsCQXl1m7DmxWi6HTffLMMuH4XoKS2ApquXmNLQZYWs5YVeyP5clk
         KCHovmfZwk84XCQveEKstc79ATSs7r721Z4I9FYi12HBfh/Z0OooqYlptKLv/VrtA5Zs
         8+QqCGaZK6fILzZPew3GlpiO6bST5fjgj0U/l14M4A9Rpm5AL9m6mFiCyUkjytko0neR
         Cv5A==
X-Forwarded-Encrypted: i=1; AKwUvByVoEFWR0jVAUnO/UTOI+KfOIK6xWtopdT+8h0mbSs+3H49sVsqhEIYogiqixqnw510Vzaz0GpFMqY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7HlNBPQt6PRFlN2KWXSCQjLhb/AZkDuZIZbg/LWy2fZX5Ryiv
	pr3M5fxG+Fcy96BAGRs/oiHrbBPmzGY9gkbP0uF/N+pzdaXE8Tfu58WTxXzdg8BKZ4juLGXZ1A1
	TMIflhD68RVcw+tCMAvMIMTp6f0vEn4Zq5T75uDlic6RX8ToyrkkEVsmghkjm+xM=
X-Gm-Gg: AYBFou0rfYO/Dd9DF4De/m1sjsEdFm7nS9zEVa+ipkd7Ye8hv7Y+HBmE9Y8W1I3Kfb/
	5MQf86T+r3/20grBYKqGRp+jZHJbuW1wOwkkYEC9VmNpH3eyxJKnFdwlsKDN8wl6rykn9RcJgGX
	7zmAjo69A6F2u6K8nduUBHfUMt/lLvyFVnJqj2SMPjmP6mnoqmSnU++ZAlhCYdw6mXA7ZGpWRQH
	OI93zSikqt4F6znCbT3GOKKKsHlFguprJL0QzjFocH3K8GvSqhrR3IfR7usx+41Xq/zqGlhEsQN
	AN/TD2GMTB31+NyUxFUpZc0CLFbfE65DZ6U5QfeECMWv8ckBQ+wPhF56tNaDJy1V3o0rw3j6Gpf
	u0+EYZtc=
X-Received: by 2002:a05:620a:890e:b0:939:896f:3d8f with SMTP id af79cd13be357-93bb78f9fd9mr264925685a.33.1789554577917;
        Wed, 16 Sep 2026 03:29:37 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:896f:3d8f with SMTP id af79cd13be357-93bb78f9fd9mr264921885a.33.1789554577378;
        Wed, 16 Sep 2026 03:29:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:27 +0300
Subject: [PATCH 11/48] clk: qcom: dispcc-sm8550: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-11-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ddZpgrzvUbp1cuqzE7ilVSHV1084ZKP/Bw/rTPEw8vQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9VsHE2iOCeEH1t3v4N4BWahVojli8fQWsio
 8KCn4HhNESJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVQAKCRAbX0TJAJUV
 Vo2KD/4opYoOYXrtFt/U8c88WiXbuwXm4Dxg7e5yrr8auaBFmrWWJYlFbfbOT2RKc27bU5IZzWB
 CSnkW2iAgXEYCeBD50ko8M8zDOEQFluHJZshQgO7boPAoHSEApz2SlzZy6nBVc3AGDf3m1LxZ0u
 mVEr1bmiUcFUPmol7nRdKXhyc+jeZZVjAVpwlwLIVIJE8Wx0AjJgnwoyWqqfuKw1+DCJtR39o8E
 xBVQ5XcSslEpWaANfCeSZ+GSLZfCkwKHv5sT5KurlD2E/1+b7rZ8bqS6fBE5LH+8ayrywhjE8kC
 +XkgPgJ0Xa9qsTshkyXLQhAjOtACakvRDnT5paSlu5hApTINp1N/hvngfNQCp/1A1uZGKvrY6m8
 n1GXyrbiXdtapzTqo6pgK5An46uY1O1CGbJfEjcy9uAEzvwhZQJJlIbRNdh3faaRq7zmh8cO2vr
 FdkNWgl65//YkydZjuomy24jm/aFxbR05qwC78RW+agCMXdt0HtxH13gDVmoobiodXN4V4xecg2
 MqjLHvN4Xkpoi6xfwZE86DMhgAkbQPStq0r4/Fd0B3BiVFKp6+nsgSCQx/KrSjAKIjhfKxGUoqR
 jQni9QgJDmZOxATdzqIAk9WoopDPaqSg0wzg18cwOw+5VgmcPp1sWXhu1ITmXNThM65ppynvo3J
 jz+HrplNs1EaKqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8Q0jmbSlMa5A
 CM5gOIaQhplI0/L7cTKwXw+0ejKgWIOVZCvlpab/YNrL6vacPGy5ChnoeG8SB9LQz1lL9lXFkqi
 kT1/dPA/ASe2Xx4WV0jSD2IdpWoCqeM=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6f92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nthQBZxuvAAEksVneFQRi2Srg4zW8gqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX9pZjSChj8KUq
 EUzX1rcuXM04MBssLhKLgqe7+gLZFp8QrO6RmBR+jy2yfWpOBGCbaO9JM4UZr4epnDle8YyiCnd
 +YM5qUP9fLNEpLozCSQ6I3L44QtoFGMFybUYGNrrtVKrzowZ7trCGAzXsEeEcI0qMNbLLeeojNe
 cMT5h3PjdLIJ3B7M/9rNfoEyNOJPWzi7KhltRVX90Mw0N+noSA7iTRvD33fzi0GMOb4jfbBLF4V
 Co62x2c/ibKmjJyZuf+6XH8x8AHG6l/5leq9DMPEUOEJ2o4WgQy7t/h1iQeW8hfAPo2aOGN9886
 4xRtqVy7h/6QFVmO1g69jK6362WU3SbWxJIPT6gBXf3wbhTr8s0ZAgQokaZw9uNIg12y8TY7Xmd
 8I2dfYGaTSfA3nz5PFQNmV0pzdSyaSbvVBrj++B9fGNoUtp0GSOxUVJZQ7U5Bn2wsUDMJTGZh3O
 YzLIz5O+Wu2jY8wO5SA==
X-Proofpoint-GUID: nthQBZxuvAAEksVneFQRi2Srg4zW8gqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8550.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 418dcea20f00..030fc7ef1fbf 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1744,7 +1744,17 @@ static const struct regmap_config disp_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8550_critical_cbcrs[] = {
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8550_driver_data = {
+	.clk_cbcrs = disp_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8550_desc = {
+	.driver_data = &disp_cc_sm8550_driver_data,
 	.config = &disp_cc_sm8550_regmap_config,
 	.clks = disp_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8550_clocks),
@@ -1800,9 +1810,6 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8550_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0


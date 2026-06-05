Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021BD4D8DAF
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658838; cv=none; b=C3RH28yuUeGfBjPIxdds3BQItuftYkLofrocdwi33k8SLvGE7+Jx3rfQNfnqWAvbp5y8h4BonxJd23igGZIlUZFatvrU/6XhakUzU97m23xBr+z92z+etwebx6ny4KC3W8JKvtO0oatclR7+faR7viRM2/wrLVMXp64SYUC5Jas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658838; c=relaxed/simple;
	bh=ChvYzcr2u4Fh++LD0E7RIxSbhsNKKHhS5UcQ0qLd8mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAme492hpwBeU7htkbtrrv3QjJFJ7aUg94d0GIjkAziiw9+BnwM/HbGdWKKW2bhi6Q3XFxndY/PSU6Og+65xX2pBUA+Py4OxYfKCVzEiIWHq+icGdGnzdcqJQWbHMvk3kZRWK+9Xd1RmVbEi0Mt4vLDVKB7f7PMnZsl+RlMg4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5ZFMUt9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmkmReaT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5ZFMUt9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmkmReaT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559nsw92975474
	for <linux-clk@vger.kernel.org>; Fri, 5 Jun 2026 11:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=; b=M5ZFMUt90t3O98go
	EJPDoNgQ1DMDhMw9iDLi1yZ9NWv6Y/QjZvAQFZ0gXizjUnVI5W/5ech4W7orsnSg
	bZW4QT0fkOb9LRgSH/z/0jmnyd9Q9uwQPacgP3ku5Z3CPjVWK55wydNakXhceXF5
	pmS9YIteL4TSHanIGZUYWVl/o3jrpYbdgAkBfVzVwwSeoMoePCTMnaKJo8nJzBQu
	fRWJ4klzb6wnB6TWGhRnZLqVuGelauJyWyez5RMZ0w2DW7rvv6kJA8GzOm0j8WK/
	Bmkh4VK3pWFaDhqOPdAhLhTzmJYd+p6cwKMRwPeC2IBt9yJN29B76cobRulN9nKd
	l6x8jg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9q6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 11:27:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1292976a12.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658835; x=1781263635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=;
        b=MmkmReaTfw2JAyioBbKdoJzmO/z62vZxnc6S0glkKTTnexMF2gqGWe6a3lMZYzemmh
         IV+SRy5OjDjgkujMyK9cTwp5fgnm+Gu3QPIDs17PVtWJx7M25CtzdkMlUSe6cosfNZkX
         fizz0olyS8XNBFtCR/Jgva7GOr2ABYOVwiuNk3zACDpjJP98PicRSvxF8fwT/ZBBC6ys
         imQUjM4stL1oV/+Fz6Wl6U3HklRnSU7/MNCixH8kQfkHUCC+Y2DRcaKtaHMDVIgeL4kF
         K8qzzxqdN1R09KD0AyO6dLcoGAXK2pqxlYfb0rqF8GhF6qhuomVgczTmMb2uR+GHUJle
         e9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658835; x=1781263635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhFW59SY3tfpeAz7AxtwTJfisOOYhI1T4QbgIvxLrA0=;
        b=ZORe3Hi6nWjUKiHV0iR+swYKvBS+aQ4HPMI9FftG5FMJPVq8l+nrezdePMHxjXcRmU
         uXgvjK2wHVpYt/UfUiUGz7bJD0Saa+0Ta3ESZL5lvrsAGFk/PqxKH2xT9EKb/Mu/tGBV
         +ulrdQ+1LEV/LpOvxNhmCstUQv754X1d84QLbyszB77qJxOQJOD6W2f87RrVEOySfy2T
         rAMmeI4I/pDnAMEZsJtpRtP+K3nnd9b98uIbKqkOlyX+dHQQi4njkw8hlJmM/dJD7I7P
         OUDXDNbdH0RM4zSSIFrFOAu4r8lwQxky+gjFguJqMGHNjx+64+t1kfPdtWTqQFAY9WjQ
         nhIA==
X-Forwarded-Encrypted: i=1; AFNElJ++9sroioi0NFRbmgmTg1JmJDz06otK/W+una3zsmmsrBw2RWAed7mZmAFLPoQMqqlxu9RQ0hruXfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRZXGr4cD9Ij06DblDUgtZEc50YUVOMkQ8fKheQrFgWNxBFg5
	1HDw738d/tmuIn/ywgfKYE6Dv7sY68QN8Mp0BW3a15WLBBnOHhCEwhYWKk89aYRc9zxkDko57qI
	53feQkmmajhsfb2BvZGYVVognlCUaLO6RtOMtumXsk2K2PvWKUw9AI8CLFkATFYA=
X-Gm-Gg: Acq92OFTDk+P0gTvXJgbD8paVJWw49mLpo7UZbd9+9EREgpAWxsmtN46BHWY4Tjf8ZB
	HUPnM1y5IZYvPeG7vJ+2nmhMq0kUVS8b2sMozHcL3wbgqgxrNf+NJG5eqP1q6LNO0NwrP96VWKH
	7XeLqReQ33KIJzNiUFTMCiN25Qu1Jtn+b+BiDTlhe8tnG3x5jTBfysKFoxhs6Rq/uqOlcAneegX
	jFLm+Dq2Huz4Q1yCivqhncocK50I9w5hNwnfPixikcJrdjco0YUHnR1TZMQExq47Zen5FUazcMH
	nYY0GA6bg/ZH+flwMs/0CNgLfQNPNKQLsLf75CzxUnFyZKecOpbLw7NVIGFmQSUoIGTG9Ojd3CS
	sJKEFqKkCfWLNlMx7dhjlDSEOqOBVRXigvTQkBQuWV3WIy202gjBiGlx103s6COw=
X-Received: by 2002:a05:6a00:4216:b0:835:6388:655d with SMTP id d2e1a72fcca58-842b0e6353amr3187746b3a.14.1780658835012;
        Fri, 05 Jun 2026 04:27:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:4216:b0:835:6388:655d with SMTP id d2e1a72fcca58-842b0e6353amr3187710b3a.14.1780658834458;
        Fri, 05 Jun 2026 04:27:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:30 +0530
Subject: [PATCH 1/4] clk: qcom: common: Register reset controller only when
 resets are present
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-1-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 57Cad3WsoRfXTDa3L-A_NC20g7JfbItE
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22b294 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OBZ5FNg4elHM4VKj2A8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX+HFMgAUu9DAx
 lPRwjWJwLMDLn5o7IVUobeLcILLwRsg+iWRLEI0OccSUvd59jfukVx3eboT/1BK7PPJHphvb2p9
 lag+94DQvrGaDolzSaII2KMLhRTlASAQJsS7NnqEM6gR/Sw2TnZWUVKuUy9IngMysl5r7LBsC0m
 xeGZ64OaLsmSTvaHnBFLX4j6j2BboVp0gR6H83CDnQXX/z34828CRHPZLE5LPN3unYbwEFk5QD/
 oykIzvh9GK/QhbuhqJe/Kvn2BGs2r3jATsMkiyc6m9lxgK8oihvgLHIaqrC0WP8M3BTfdzf6PKx
 Kn+vTh4WwyOfg5Ouvt3G/t5PSXcP+43vt3M6EO+JXdIWUQpWht58lkiy30cWrcyWgBBeVejy82X
 QufMrhWUHTsKnSizlX2bthsgP9i7zmOk7EiRDED9cXcjlCu6GDcA+wHnHUXgTIvHg4zqkdYyJtt
 tYw67g4A195SpkEtTQg==
X-Proofpoint-ORIG-GUID: 57Cad3WsoRfXTDa3L-A_NC20g7JfbItE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

Some clock controller descriptors do not provide any reset lines. Avoid
registering a reset controller when desc->num_resets is zero by making
the registration conditional.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..be9b6ebb2fffde05e3f209571c53b601d823d479 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1


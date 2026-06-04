Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A353BF662
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 05:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550805; cv=none; b=TnwYEVv5IzVjcCK3BM8FQK9pumSRCyW6XHTfjrQ0tx7ihOvc1kCQBPQgY78vtJYFYQ8/3kRsSseD7ZtFk1qN2gEsVgW+Skxsa1HrWyBNMdfwAN6gRBfVV3ST3JO5KJWZ/UMUZrhwqznRyl6EeFv9KkxL/40svSIrf9mfkUfGJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550805; c=relaxed/simple;
	bh=Q5+uO3LW2fHz7K6MzYEBqR1TRxqTCEKCt8vYU5DOE7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eb7J6uxua51CpbU7K0TBUfu2Tbm0+rJy91MVC0RnLyP4qz5X77T8XmYc0EIAYVt/0ma4PLhPfwa0G5jaYe44OvJ8Bk7Gop3uv5KSyp7/C8kSyvQoFLPnVewpVL5FruB1aaMksGweaT70EM9ZHfyu1PaYXBIWAe+yinHIu2N0wUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsIiTMfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dE69F1Y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsIiTMfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dE69F1Y9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542bDtg3552133
	for <linux-clk@vger.kernel.org>; Thu, 4 Jun 2026 05:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=; b=IsIiTMfhGPWECGDj
	w0d/K9g3hGHlcZ4XdwTMjkTuyO8jegjOmNSmqXdOrblKErYITlOjNI6M9/w+G8bt
	kszMJgDqhKNUuDOKK5fxF5S02gQkmbBz4xDb0HQU+jWCdM1e2MVi2x/Qhz5MPUtb
	pkthGCuvlVaWp0vYTEhDh4jJvoMpMDqMwmID8WFaJd4sJTFIsZgCEviDAxNZ95dl
	yYZvwX4CHe/qgwPG38y4gxq0T8vxOKbpmpKGyJsjB1f+08tFpq/GA57N7P4pi662
	oi63c78Gn/1k3EABUBKv7MCTgrKhg5GX+gg7EQJQNSu0JuRnwBH+ZB/f2EGqC7N0
	XJvTyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv539-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:26:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84256bee9a9so240546b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550804; x=1781155604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=dE69F1Y9aG/s8VK71+ls+hFgOmSJqXxhbIuOCskcyWufeI8Rv54yyl+6hNAm+q8xJj
         Ja4BzHIR42KWhJw1X/18flveTgjJmrLf3r/m6JAJMmmidOiUk/SH6gWiICGwzMrW61Z9
         +bFEZhlfy6QQp1kNJGF28p39TStZedYmojY1QvN8iZ1iqa9CHAWi/adjhQMX4qjqdaOw
         7ftyKSMa/d4nDiEZg2VyCn6L/2TN9qczQHb1MyJN11fZTU6CHnMCviawYt4gWHnp3SJZ
         qMfQH2kh+essHupiDaHyeIAF48LPpHeJ3C96C8HF4vrSMJVUnxk6UjJ6G0LBJAAdr0Es
         ZD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550804; x=1781155604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=GSv9cas1W0vRJluwGd3woeZT3iZAVD/33c0jT6breL7XzWmtnpLyXMkGbRrHcue6jS
         8iJder7L+bx4WOZx49731D+mSCabK73af5g4JFWAOJOw9bukjunT6hePi4nqE2SHRaby
         SMCGRPlaTCIImAcMmYTceD8qY7uEQtwMlbDWwhRmiY0ymNw9siz2jupsj7aTqxPVQIlc
         eSxOz3bIH5xhu+nWztyRVHWwiNJV901smvYIQLuD3WRnn02DtXm7OXzLKwMSiXJwgbLc
         UkUuXKVfO/3lLr4kkVr3mP3vJgLDJwQ2zHEVhxxtXqE0Z4OsoDYM/FAmbXEvR28s6PhN
         da9A==
X-Forwarded-Encrypted: i=1; AFNElJ8XQwIcWr55/b54nXTuNjnUPANldcHj/GCg0nunVRcGCAzzKKNU9r9N0+SCJ7cORSGDwHJLQ8Yk0lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSm6KsRHf9E5Ur1Gr5QqnDyQLV2e6F1Rr+YwqDg9c2BrX3TRrS
	iZpxA69IU+cQw/jbp7ov0nSUO7NzF66OxqXaOrsysvW230ZQAMn255/RSNHMW5mtLpfcjszGAwK
	IgRUSdIbZTYuc2CP7GdmgkpxpBUNwnwl4gj99u4l9F5AVpNj0LlcX0j7yLTRDWQQ=
X-Gm-Gg: Acq92OE4JuUr4E10TETVZPrY2V2HGikeEc0fZ9KkcACG5HqBsnNCfbxFbbsEhbzedfq
	9ltHbiUbsg3VuGguF93KNyvI2S+TIlQwdugyTMBn8nwzOGufsYsaDThvQ2f+mpvG8TLU22E+Uk/
	VCFpHl2g6ghUz4tpGbP4KYml+Ka/NPVhdxcrGktv9+OhL8s2MifoFfNgwvuN7p3NGxRuaYptiag
	7y/dwX26ONkIdAJHHRH/D3KzAx3JpbmCNSS6DyhErsWJNEQ0wJeQsVD7UHzuTY/ir0OMy1Pts8b
	5k78gy7CMbPXKtPin+oZ/rf+0M6tbNDC7SEi7dYJmmxR+sc5DtPdQ4EhPzaM2KJJg7YV4K0Qmcx
	Ki9HUr3K2XhEMTHN+nINd28MUKBiwlv0aR/RenSyTOJc/dGrQyGmfR1yB3vbFdVQ=
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr6194782b3a.44.1780550803647;
        Wed, 03 Jun 2026 22:26:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:139e:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-84284fe7c61mr6194759b3a.44.1780550803185;
        Wed, 03 Jun 2026 22:26:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:26:42 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:09 +0530
Subject: [PATCH v4 03/13] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-3-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 8G0guuuDjFo9eRfoI-nxwyz7Qs0ES4TZ
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a210c94 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXwdVRJCAY3xXs
 jMRtRw3xPArgjx+IGJxpCu+RQnMhDz+7MgTfhKM2NbD5zZ4d3EeB97OPLSX77XCgz/7N2Hiegy/
 QQP1svHgBVYm1j9MxrWwLyeFpKdkHd+EN2pN7waipARJ5xLRHO+kGRQxH62AefRaDbtdxwJ6QDS
 trwP213OPsGvBwIOppGs2pRSRKpt2VN35g3621zjlMeatckbi7Pk54apeVEKgzIOker77vIbAXh
 CijAyrzzjV/yx3DuDkOkD0fruOYeKamuwDtzqhq52Yql54FNnd1WDjZlqpo2NB0n2xBssmk0yLn
 P9hLQ00fD+kUqHPJN64Cs6KJbSVENBtv8GZVKysYKTGj3NnyzOq+qtoUahqN0Rg3qPt5lqP8yX9
 L5KeTxnbYD3A7wPfw/Yf5eYVZclsT0mG47zK+tk04jysclcak2EpxDA2jazxpvNQq/hfuwt+1FP
 LuWnEJfqM531R/xU+EQ==
X-Proofpoint-ORIG-GUID: 8G0guuuDjFo9eRfoI-nxwyz7Qs0ES4TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050

The Qualcomm Shikra Display clock controller is similar to QCM2290
DISPCC hardware block. Hence, reuse the QCM2290 DISPCC bindings for
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 24f2cce033f6e109b65a79553fba5295eb9adf3a..5cee033f2115deb392fc1deeee8d5aed4cbde052 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1


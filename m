Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1483F23C5
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328264; cv=none; b=gt1lFRISuSaHpfm+CjmGAbXMANb09J8bA7r3Rq9Kzoc+qaANpEXEbe2cYhqcZexmvd/B12est5UQcQXAiqV4eLxEwrBCiwQ3hpGMBkb7HKbZXjtbFeVF9pzGe53OOV9b3l0zDu0wKzaHnA2Vz+PCI+5OcwyXK6AuRluuCgYqRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328264; c=relaxed/simple;
	bh=CI6k72yT7p3oLTIjONdogZ70kn31jcn/ngorwqMG4/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWksSjA3ZV2SUUw2T+BNDYicWgySZKeK/4j5WRsZjkzqlHvGgE5KUiVn7svjpnSKQ/Z8lFkKHFjL19sfYoVt7fKHSxX+ELY3/cmkHtbmfiQ3psCWCQITJ0cjMjHheAz6ZxwyTQCXApm3DT+9tRgwfKRbgzIuLPhcyVkaYAd0KzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcV5UvkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jABjZTB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcV5UvkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jABjZTB/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66685B2k4007065
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 08:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=; b=FcV5UvkV0nhXjZMI
	aJU9N5HlxHQ9jYV22jcaj83LC8omXIaqmuG63oNPUqxX1fj3LBUEx4rdT92Y1zvi
	W5dycFCXaDvPn8sUwF+VY7zoFdvpSpL7kTWxockxVzaVka6K+vkOXgs4xWEvcnjB
	SSnUksCVWEF3ue91p6fIV+2YKOi3BZ1tjD3m9JRU6nwDej7lLfLVz73m4HW+su9/
	+4+t4TUWE2ZS4cryA/R3LugZ6VKedeKqePaNG3M2Hqt6qiulANaO4Z/eMnCuwhFV
	8Gccq7D6tqwCntd7FksRaDksHUVFRZ4cfmDiSsXCWScqSjbD8NI55pAbCC3UcJZr
	yX4KtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs87eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:57:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso1763035ad.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328248; x=1783933048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=;
        b=jABjZTB/sov+K1c5rUIEf/OCz7OreIcU1iQwoLZHvm73xlNFtF/wrq8TaZIHi1+ceA
         F0UU3AQBsKwOVgCRtXfUr5t4zbPwwTCF19MOLd0bAFZ2dVhs5fTu4oWcufjE/Ly/flK1
         T9U2azJm35B6FvCGzIvhWIkdV7Xy+6G0+r880NLf9Dpub1SZ7xoLb/Q29UFQ8Y1g8sXe
         DhrJXepEsOhbMMxqcRdWZG1IWydIMimV/KvlblV73s6RmIvQo+e1xnAP5b6MSA5Z+VT7
         IomDwBBTXk7r1d7bKxNo9q4FRON/rvclajVCHZhoWUuE6wPGqrdFk7Mi7QvPvQdQ9QT3
         46Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328248; x=1783933048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=;
        b=Tsl1NPKHYDRm2UTObViYWfKl/avrNr/kuoZsnzWtsY+YxVT41U2GvJrT4Kq7bZ42Bs
         3zqXOgBDRv+CpcVp0aP6iq9SR1nJhZfZlCWalLN1bQmIybtUSderX/VMLOmR/Czg/1hb
         nxaxz8EIjvTJPXiR0th9j2YyDieYqG6H9kD3k49W06N/HnSDH3enS8pMXYu7rKraIrqX
         mwa/Ca7t9tPPmIQfR5x71Hcijb2vp+Gcc9y+WG5Q8pQDtg/8mqRg8Vs1KHbBN1NGLjyM
         8FPNxxq5VqgdDkARPgw3oFOdEH1vkvUNRRVAun1u/ncbk9A0Wgbe7RBaNH6VHi6VM4qb
         B0Yw==
X-Forwarded-Encrypted: i=1; AHgh+RoXFY3pSANhx4T6bjjgcLjwZZWFROQCQ1wQvQrr74mukOmWZxGWDqBIS8XsNHV1P2JGzYkzKs27AWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zV9tQzqdWo6OwCS6tm395rJ1aXdUvnU2oiHTEffHOLQYUpsL
	VB2rXbINFIopX94N9bWRgA6xlV0zDSwz1pAVHjp7xNvUcQ/VGruGK0YU6NGMXBsItdS5EAs5hIZ
	kv7NHbrpPdG3hQiDOasysizmOGTUqCQt+Cio8g3VtJJYiFheqo4jcA5ng0m0rTCQ=
X-Gm-Gg: AfdE7cmxGRdosC9ACiH0Cl0NlkZWMIrEJ6TIpEPCch2Xnclw8h/KoYjlSOXroLtRH9y
	lfoRQN0pZuZgc26OdEZaLULsStJYCkSDjLVaT/17aVC0GMWOOUATPf3/m5nrZHf6uRkunX90QZA
	80E5mPomituTQjgdWk4ntBHobwQR8WELoCvQ3JgU20oOk+d1t2oNagL2nmQDsHcedwqkFa6yFo3
	4QcAzYZA9Rq1l2BGfnfwcl1bh4BwALyk6NRb5JMgezu2WW7GyyvalzUrLBTgyKcfDLWMZ9upv9h
	lO2HFbVLtd5I6h7+45L+iPU2MQKa2C0qm6dkXATIdSEHHk+9xZy9rqhNwfqoGdn/R7eT4f1U6He
	4ZevoNn0OUvuXfALAQoC95hU2uKcqk7rFIyI=
X-Received: by 2002:a17:902:e78e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cbb9ee02a5mr104857025ad.39.1783328248460;
        Mon, 06 Jul 2026 01:57:28 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cbb9ee02a5mr104856655ad.39.1783328247997;
        Mon, 06 Jul 2026 01:57:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:27:13 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add video clock controller
 on Nord SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-nord_videocc_camcc-v1-1-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: ShNFMTfB3-gguPgC1yHgBqeXStdlwrbq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXzY/bRc2hAjS6
 5QvhX4A5cU+jdIeuwjcox7IHkAuOLgXaMOPa0Od30imzts4vvrsF6zntWtjYrua3MWchSGk8xAN
 dW4hFdboW9YM9ZVzH2o6+lN0XQlREDJHoD8riEfTKGz/VEBfHj3mIXcb94gc5OZYv1BsrtwdBhF
 JX5aSRd8BTNVDdX9c44JilYhMnJrXGd0UKVr+4lWQmxtbzsk3m1uQH1w/6QbRFZdh9x5nFw/NME
 D3NoM9TvWQB8WWWDLDJoBbTWNGUqTT6h//Mqp50FI4RuKv6U4O22B+sM8QuBTmCQqB/jeTxuyq9
 A1MLO4gFO3Sfr4oDxOOb8Bj+MuicqnQkrWsz6b6J1RXoZ57vOWB2cgCXvKfG5DQ4+MyxYDs36tz
 JsjynGMCtupqJnZ9JE0dBSvknJppT+MGFzBO/Tbt8kWxdM4sDAp9YIz15+3TYvfkD14O6uBwXLq
 2VHbbvE1bmSp/ojZkBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXyGLG2R6QLjyd
 I9qL1MEtswYT+NwqqBgd584EtRJkE3irwAJtzr9lQoiP77AIhQFb1CbYCM0uynIcO3Llyq4AsO+
 ZT+qr+7Qq9ELDUoMBvHuE2W3LfGyMKE=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b6df9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RY-p5p5HfOYGDjfYP0cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ShNFMTfB3-gguPgC1yHgBqeXStdlwrbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

Add compatible string for Nord video clock controller and the bindings
for Nord Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
 include/dt-bindings/clock/qcom,nord-videocc.h      | 40 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8830e2bc0c3b8f323c818ee48dba2..9b9878e9b9cfc669e9b5f1c42a68e9e0c11eebd3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,nord-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -27,6 +28,7 @@ properties:
     enum:
       - qcom,glymur-videocc
       - qcom,kaanapali-videocc
+      - qcom,nord-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,nord-videocc.h b/include/dt-bindings/clock/qcom,nord-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..8d75460211099f3b2463c5c544ce3e85155c6466
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-videocc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_NORD_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK_SRC					0
+#define VIDEO_CC_MVS0_CLK					1
+#define VIDEO_CC_MVS0_CLK_SRC					2
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_MVS1_CLK					10
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				11
+#define VIDEO_CC_MVS1_FREERUN_CLK				12
+#define VIDEO_CC_MVS1_SHIFT_CLK					13
+#define VIDEO_CC_PLL0						14
+#define VIDEO_CC_SLEEP_CLK_SRC					15
+#define VIDEO_CC_XO_CLK_SRC					16
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+#define VIDEO_CC_MVS1_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS1_BCR					4
+
+#endif

-- 
2.34.1


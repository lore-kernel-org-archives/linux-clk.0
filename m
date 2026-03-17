Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A813F54CE
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767696; cv=none; b=h4dcdr6R2ee4ZdK5ELYiRGoTC+Q5C1AFY9AlLtA9Mr+cKYd4C+n9CcqDKANRm9Sfm43UuN0pPskVGhuYNtCl1M9fUWbV+R9I0CB5BfYpUXd620P50DxLQAvfdp7UagyP3rcW3S0i2gBNWdju0iMvnF1Rqp3//8c9/PO5OtXdeK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767696; c=relaxed/simple;
	bh=yUq8vA83pgV57rYPVhN1wFHNEzaLH5vSsRdN485+bpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrKF7hv/VRwcUOeQMsh/w1L/epgvIdZY94OjMKxU6+bh+id8DZm5awX4Typd73LqZ3o0z1r1aZh4OOSz0XO3BuvKASgE24QTJykdkG8FwBuqEl34XU4bpvmLbq3ifUT7giTs2jmeHSGmstd19cf8JJIIWIu8tHQDX6T39Q8B7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceaBeWjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OD+3xGDP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceaBeWjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OD+3xGDP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDatk83124019
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=; b=ceaBeWjswIg0qZfh
	ttRV6wLp4bBUgX2DsaPJR1sSLYb/hznOZjYQ5DX7mb0NS643YkAUjtRwTzoslQ67
	pnUPfhGTokViMfxrD1edIzXc6msnSKkN5oTpZdBjztsMXbmqjyeBQw3dLwvN4OQC
	70GKEHp6tDYliNq5GdUpi9zVjngwjtaGP71dRIYiIhsQlmrWsA//tcH5LL/7BUZA
	kVSmg7bm7F+lrBYiaxumDQFr4nmmxxIP5aeoXv0SP/rxP2yCOgO3vBNECMw2UTQd
	QNxgLWt1yKU6E63HaCRGdyC51GcoWcOOWoYriZVqlD6YLVp5xVBHq/jK9nzILwNu
	WkjVTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbt7hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso6877025a91.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767690; x=1774372490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=;
        b=OD+3xGDPQrIHclQQ2vteeYcqichojHnpivKfdVwA3m9bN4SFgWjqTOxyrHH12S0ttW
         stydvPoDa8IpB4reHA0H4ZBkBL0TRJce2k3MowaHE31FrSARBWpCBgx5Uu9mUwBT9evB
         dF7r5kdwYfnOr1av9Hn9S+CFJBSg5nmBQqK0YcWNufBcCB2edZkofTCTPUQ4PS0KjcO6
         XQW35xjSLZQq+oEUaYAQYX3O4xWW/YgmUETuW95W/L6znBYTPoUURibyD/k3O5OtRfuS
         bi0z1OAq50rFMjRIl+w+3RpK2oO2wOQpdSDcHdH+pPh+Q7dYNHYGtZ6M0oyIvEMfkyd0
         wAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767690; x=1774372490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=;
        b=fLagjydUBn/84i8r48TRBuoq92NckeP0c8nBHHNk5xJP9Xot3IHxcqV0yrJ2naQAh0
         hVeYSn77mK7UUk/oSIZCsSsAVBK34PX4Xs02ZbYAwi2+nYezvDgAwhE/y0Eub+1154Y/
         CUhB+/Hx0iHmFDsrqxWdtfDUWGh7vi6/pXPfQPqQS4R8mHR0IVFRZSi7uxiLuXVu8D7C
         qpwJKJ528a6ieFe9TDZtrbeBHOoM1d63A+veFlhe1FpaEoCiWK8BNQ14jjcBcVnwuLSY
         kOUA2QQxpS9mRd52csqGj/prZjcIOAB7NWcBXKSK+hPg1/yAQtFQPee/OnrBbIwcWPb4
         QttQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKuYwNzd3xhkmNUa0OAKJC5WSRjamnVjQ9OHk+ml3unxm1i4rrjxrlELStZU/Em5YtH7Rjm05I+zI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkl/dyth/AOlZIub/iVZW5Nr9ANnyCUxlmAcPrIUW+LfavQ72q
	odFYfXEH3C3UVXiYIeyO7IpYBqhJ1Cg8VBlZkflwP+MGytbjoINpBJN8/yFNG6habO5YVrTLE/V
	ppn9jrThLcx+dTSpBUZNfnMXZXmmX+xy4hUP2QbtYv1D6WFDVgtEvXjOMcoL0wME=
X-Gm-Gg: ATEYQzxlluCb+R+EGk4wAd/IJI5v0hmuUpE9nhZ/2/UR1XMScamZAnjaz0NPxSdWyMr
	+D70YQO6XJfWDvzYZf675DzsBKprTmF6H5KzoTND9Ojteqo6Yc8LlftzKQ3jLqcXsbIXfYY997c
	DZxLHKCZGZN4faXCSwU1xfgnOhmwkCVlxY+nOP1jQOGyJ3ZgvijfocImDVHwRmhbGy05zjSCsD4
	HG52Z/fZQnSfLQsfjJFx+0r/13IRE1CB1SK5cxNEaVsVeIRNXCcbAi4WrwQ/NFZ1q5V0wm56FbW
	8URHJ6kB6v4u9NHk/w+8oJQo1aempfrcw3oa3HfuTZUschoA3lf5Md390Hg7Ge35TsUv8cTHykm
	pfADTtgszrPwW8zsrfE6N0XWIKD+r+3hRhCsFnssq6UVwwg==
X-Received: by 2002:a17:90a:dfcb:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35bb9efae55mr168318a91.22.1773767689531;
        Tue, 17 Mar 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcb:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35bb9efae55mr168300a91.22.1773767689014;
        Tue, 17 Mar 2026 10:14:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:22 +0530
Subject: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: GSYf_oWy5CHa6e6hSu9JMi5wNXSwKjd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX4jPiG4vgVJwv
 Up1HWOWULmtGTpIOQoJOSS94vBPxuuPA7t0FLSmXpuTJ3dA4Gq99ef8BGHZ5SMf0XhUlJdHFDAb
 50Ap77qVIqGhSxduqqIqIeImWPwuijsPDK49nThRTOLlwz6Y3padslPc2fdcV7aUkPWRO0zUVWN
 Xtv+Sc5hwpc0xv126ra7lm5X3MEZ0X14dQnieA2P7RbwHa+wR3khFR3b9k7h1wNVwLsK6syu6wx
 rBl6U9ugX4ezPVbDAoFLmn30/CUrQnRn/jAlz2BXi+izmFztK7wtMNST/mUiT/ENlMIlvN3mtNB
 +QGou+XJYlDSgvlkZ+WqL/QT0htM/vaIY2F1wn+hBjix9EK8I83HK2XG6EMB7P8xd9UfRffQT8/
 DKSkEkotUCxtrKjWbyDcPseqyiKB4v3NNTEvoDQKwR89UsN3CDRW9kvlncckiUOaPP+azAdA+lY
 xRyrXN8UAvkRgYQBQgA==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b98c0a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: GSYf_oWy5CHa6e6hSu9JMi5wNXSwKjd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170152

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 7bbf120d928cc506a4f7aaeaa1c24e5da760e450..b75dd0896e194c5a2fd132cbe51c4706899fcdf7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
@@ -24,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-videocc
       - qcom,glymur-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
@@ -65,6 +67,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-videocc
               - qcom,glymur-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
@@ -73,6 +76,19 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Sleep clock sleep source
+            - description: Video AHB clock from GCC
 
 unevaluatedProperties: false
 
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


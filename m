Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE83030AD1D
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462537; cv=none; b=saf1ho23xY/zxs/xybFiicTWw8V5qPDUjB+ooxo7hK5K8UuH1I6r6aios4raCxUEmR6QCXn4cxQ6UuZro7B6jt06v7oULn5Npk0WXcvda/9S7bTI54AJD2YVr/R1ecPW3DwwSX7W4rf3jJ1yceUdp91Bey4bExW4il0XtQ+0lSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462537; c=relaxed/simple;
	bh=e3gKlIgcNEy2r9Mx1i7bMF3/Ao/g9nApBx5pbLsL/sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zzid8EvfF6L7JGFaKvxIU6rLS+PWfZCTMBNMekgnfTHuysBAUWKl8oJmWxrZZ8JqJkzzX2YeEyuszejI+PGYicFa5FiveT16LuyvLULR3/NelKdko39h3rAv/YkldCg5//49OjtLzqDon1ESnAOMwZc5aHEkwxClpTI1aSyxwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XB80ctCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XB80ctCD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85r2A030147
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spEKHx63+sJKj605M8Bf9cWcS/D+6tO2xX01XfJCvsc=; b=XB80ctCDZ/V39jPL
	2fIQJVIBWU15W4dToNmy77O87oVfb9XXISvxOWSyXJ85KvKGJjn06SWJe4gh/YHq
	k/a+dMYKUXPYogkE+H5cxjwCjVJwD4be/o7uW7qfQ5o8+J0wjcPM+aG6QrjwoVCj
	xPl8aBpKp1Dwk5p9gws22KbwVCo0mRPbJs6u/rvyIRoz1qoacFTnTrPZ297rGeWC
	y2/GuJrflthzEpuojCVG7Imlcqc1WJirW/rGhJPWRDyh6K55T+NF0iO6zTXmNnWE
	3CS3A7aej3ChsxHjqoCfSxcMaKwQBc3ZFeibBF1ZLV4XMTH5diRYVE0LXDKslahm
	eY7n+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5web8up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246cf6af2f4so38436015ad.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 03:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462533; x=1757067333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spEKHx63+sJKj605M8Bf9cWcS/D+6tO2xX01XfJCvsc=;
        b=jXPQriiilSt8so4f8gEMMUKTDsVTmaTuacfXc9zHNRC5Qq/0MaWNjWwZJAI31kk2Gx
         U3omc/kN3ZMn8fsgu00saLlA2FXOrtQ7LT6slyNirQiDUfbSBCoLGprViqTfRRfV47E/
         am1rS/eEGBsReUZ1N+wHXpiBpEuOPnTovd6fO97Gqxd1BS04a6a6m+A5ThOJtdy5JSJX
         JKyhsZxayPG3I/V7sDzgFY8v6Nb3ubi+Zq8OIZAdiPM2YfshT8ubyB3+NKFoL8Gjx8lA
         AQxbHC4V95ofo9pFp18SOomkO4Nr8p6crfIXDQX5RqBYHkvUfQRN6OXz+F74GJ/BV+FZ
         mdnA==
X-Forwarded-Encrypted: i=1; AJvYcCWWNfcyWtAWbOvA2+S5fOjTp1UgGTUzjJsDdu2ncCBSNX13trLlRVVQCJRhdDBxqzNqDQJlwn9pRqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUNUGcuS0SFlnIQ44/7xFh78Vy28IriqI5UbZe/NXsujGVPFu
	zm+7FaUlPwfQDxwEV2dReftY+O9ImxoDb8aU54KoN65jEreTLq+tbbUf61lQccEWHFkkJzjcmtv
	lyNlINkOL/EGQr0uXE/TticFP+GjQ9t83u50Fn1tYMWv6EzwVBCfHKF1mKWS9wEY=
X-Gm-Gg: ASbGncupftPoqZQmSrJ01s/P5ub9ixg76zNxEw1q8N2IgpmpBVjaQJAATgW5TkQUEC5
	9BZOaAidk5zCRU10E1rxSaqUEsV47CwaBxzk1p9gxXLW1NMPufqT7tUi2VGfb+mcUCQJ2D9zfN9
	+bnxhtVEFNEfO5U9VBWx8PhpBr6NRMbq/OtGTRDcIkH3JdoFDI3yW2D49ZFMYEMmG2YsxaM/DFW
	k3mP/YUY25aYg7kUezdFe6j8l91ihO5eW/fvvJzQvSwiLXXcHQK2epOLyoGYSOekBI1digOpajY
	nHCpLLwb2FYwNCC5oUvjb/OveBBdvI8uZA1v16oo4KscyGu53KHzKfHRiOAklb5H
X-Received: by 2002:a17:902:c952:b0:245:f7f3:6759 with SMTP id d9443c01a7336-2462ef1571cmr350083215ad.50.1756462532947;
        Fri, 29 Aug 2025 03:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA8Xh2vbyvcy6mdjaLep3b6m9rvTPrB3vfrqANTg067b9b8/FGFP60iDb4AjB5RBjfuPIKWA==
X-Received: by 2002:a17:902:c952:b0:245:f7f3:6759 with SMTP id d9443c01a7336-2462ef1571cmr350082855ad.50.1756462532408;
        Fri, 29 Aug 2025 03:15:32 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065d1b19sm20102775ad.131.2025.08.29.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 03:15:32 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 15:45:18 +0530
Subject: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
In-Reply-To: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: mMArjLN3TWFbjktWZ106mOSS1Da34N6k
X-Proofpoint-ORIG-GUID: mMArjLN3TWFbjktWZ106mOSS1Da34N6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9NzuDKgrtVvo
 YlZDdYgvXBf48VJvsbuqVLI2CqjVL3DjvYdrzyFjN8hbhhzVlEqpTUkJcuK9HpUP35yldhT+xD8
 0dxaUf+0sOL8o/SbJEw6TW8QXYpiQ1pDSmse1ftM68lFur97MjzYW4bBQABTGHX/WNyEhYP7by1
 Ym1akhuXxa6tS3DL5ZPXEoXUAFTTDHAW6hcjlkVS+SnhEDixXfawiWY9iesPjRtZPKFXPpn14eA
 msT1Jl6dd224QHi9cqDUfa8U4UWXTbjPPZ77Dk+8+kR/RHr4RFMoVch49KZXhZW0nUUqCLt8KHC
 /Pq6Y8YryQY1LQ+Pm6oHv1z4QARydjOpjzJF7inqDJWfAklpGh0vP4QAZuYGCW1dcchAhu6qvYF
 uPs9XRQr
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b17dc6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=1oqufa9daVNmb7UKLHcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Add compatible string for SM8750 video clock controller and the bindings
for SM8750 Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  5 ++-
 include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index fcd2727dae46711650fc8fe71221a06630040026..b31bd833552937fa896f69966cfe5c79d9cfdd21 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Video Clock & Reset Controller on SM8450
 
 maintainers:
-  - Taniya Das <quic_tdas@quicinc.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
   - Jagadeesh Kona <quic_jkona@quicinc.com>
 
 description: |
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
+    include/dt-bindings/clock/qcom,sm8750-videocc.h
 
 properties:
   compatible:
@@ -25,6 +26,7 @@ properties:
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
+      - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
 
   clocks:
@@ -61,6 +63,7 @@ allOf:
             enum:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
+              - qcom,sm8750-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,sm8750-videocc.h b/include/dt-bindings/clock/qcom,sm8750-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..f3bfa2ba51607d0133efcdad9c7729eb7a49b177
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8750_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_FREERUN_CLK				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_FREERUN_CLK				9
+#define VIDEO_CC_MVS0C_SHIFT_CLK				10
+#define VIDEO_CC_PLL0						11
+#define VIDEO_CC_SLEEP_CLK					12
+#define VIDEO_CC_SLEEP_CLK_SRC					13
+#define VIDEO_CC_XO_CLK						14
+#define VIDEO_CC_XO_CLK_SRC					15
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				4
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				5
+#define VIDEO_CC_XO_CLK_ARES					6
+
+#endif

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46003783DB
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705985; cv=none; b=GtTTVhh9texWvljxWGQ5QBZfiqolFneVaD0oBGO/7/RoztpQMUHOL8K36IZFUpt+JXQc6yVL8vF2+cgniWAa+uZak/WguaSkRTbwNjOd960ewAnbORyb8ldJxVe3oEQ85diBV3dlIMgIGqVSIYrYY7L/jm0I77hEfRzAu8x8Czc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705985; c=relaxed/simple;
	bh=SJXqLD1aYNlm1RXIuJnPgt1e1Zax5eUFUVWNuKi1EQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdOmxKgOQsGL89xna9hAOHiDwa5sg1bLzpAidb7kD1ZAS8Y+quGOu/t4+1VHSLogSKb4qMrmEPGO0DuuNrXLBq16g9DfSXNxEZaN+0UAGmJUrd4n+dHXMfExQTq3505+ymbE97KKA96XNnDd1GO5053As2gsQiqdEbmmJgWOudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWUOeg4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hc6LdCaM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWUOeg4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hc6LdCaM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P83swZ1861470
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=; b=iWUOeg4ViKLcqOYz
	3tqo9umiPdnH+cYBOwSmQQSW6cjcSp9VmNGiUK9QGqNz614/qpLq8e4W4pSid+uZ
	NGqsmNHkl5wVLnqhI20GRUQ3CSSYp1iEi9ilusfKmx+xIlNEYcItVIBMeRPpTzzP
	M1AG2JaDixtQ6MrXFFDDrL61/JD+cIJxk9gF3wNnfCXYgAyuTb5vdBrEkzc/XPzB
	tMGydYH8QNZqjjjuJN8e17idzjFKmeNslgsA+dLcHKVOx2aEj1i3oO5BYgaeqoWv
	gX70VFyhUfLUm/U+Eih83QgcWvoFpz0fH2PzFPMfjMaxeiDRublf7iwvQ0DeKLvd
	Po3IDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5s9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:46:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba718173d1so20919995ad.0
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705981; x=1780310781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
        b=Hc6LdCaMdzmQ23uXUozn36+04SWdfRlyHDtdmJwkfo1T9tukjb5NFgy0XGQ7OpG+i6
         EoFL4gjf+sRf8vdC4E8zTMArLltykKSwJo7NoDu78wOi5KTeWybf2hPmmJfm/xfm6BDt
         Xj5YAh4IAaXdrXhIO9FnJo2hPPVz7p1soTN45clc4hUZotqXH4ePWfjLboUV8RcXoCol
         rmn9eUJolo+1k6///TAbHLLYESitTpcYnoiepEdgbJhZ1o4VYuPj9AUV7a3EdQbYqgnV
         NwuiiP/wNdv2P/PYEa/6EpoKHcrbx9NA8wtmZHaoEWXTdm8Ccf2+yw3aulmug1V2GWw0
         MvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705981; x=1780310781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
        b=CFK6LeVx0P3BdF+zXpOFvJKLHcnmHyH/fn2n1BS19ymjOB0lLZb4s67/KLp7H2R5dP
         GUDpuHdk4ebhlEBXQ5Zp4NIwp26fB1nSwoT40qQz/KaP3Nid4+4JfP9Zmv2MOhDriVsf
         3yh07jrdLDDqyTSnjq6FL6k74NnnTycNvEjzLwE2Ji6d+pQrCkpreA2l+Orqi3RdhL+/
         HIhgKjFHOSu7aQ56aGXhloHwee42pnmhNxm62kxo+9q5KdCA1Wr2GpLIgIUHWyt4fPdx
         K0KNoPo9Qk/wcV/FXEk+AUuO1ZJLkOPHtLak70NmOBfnFpRXYMOT1ISK1ybLYKimfsI7
         ExOg==
X-Forwarded-Encrypted: i=1; AFNElJ9rGRLNanpkWbSN8M/0VQgA+n7HosaGFxHKXOBcgikFaUPGse3+7K5Pt1PzrWlF6nOc4lAi+hCeW6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JwhVD4pt3/l0JboOUYHeyMU7XGPwj34dLS1rgFA1WbSV57jf
	rJBFsZPksZv5b45ziAZXg4V/BK70Jv8Ei8UuNdcb3OzZ5rxojaugXOwc54JtZ77Ul8jMsrVmNZH
	dR+sfK3iN76QvIlbVUeOj0V+nDk2HOD/8lYnd3ph5LVsxYUKYVNezZSxfz8ynyCg=
X-Gm-Gg: Acq92OGDbVk5RzIPd/9dWt9GJrk99zBryx4pLTnUSot3fQCPFIIk9TyCbyEKKognGJp
	IVSEtgX45F/VShUvUZam1sEOlPi/lxLAndbWQgut3td2FUfODd08a3f6jKdxrxDT3zoBw8B6Mre
	mYGLZKl98YiPY3Z7UEvLmiud0UvXhfD5VTk+1iaZZ4RPZL54NI2b9+Y9tVRS3Bsn0tqlrvrlsnb
	U0USuevoLCJrQ1+GwjX8p4bsBD7/57TJIwc/BU/vzH4Kjfm2OC36thgz15UB1GN4w8dBsOzLAnf
	7274TWUBmXjcQogFIRHDwGPFB+nSwXMmgar/xikmRFaUsTzuEBWT3tQ2tIZ6wP7d0ggDYWY3XfJ
	+8g5eXKE5H0Ssn2lgdtXaVGBP6OkxBiFQ7aonXAJErte7dQ==
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2beb05e8633mr145799355ad.16.1779705980464;
        Mon, 25 May 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2beb05e8633mr145799125ad.16.1779705980019;
        Mon, 25 May 2026 03:46:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:03 +0530
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a14287d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=p7IodTP_qeDR1Assq60A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX/jX72FAHyrFQ
 sIgASMskwG9pQ4F2SGYDmvnXuO9WdQG1kLODDlIH+LDC5OBd47EhkVnKX9Iv9o4J5Iyyh2Ch94r
 sxtSmPZKmNVpfuMGDrpn2UAqGQe1JDK+wTq6Dq52jMYbw4sJFVp1S+iArsOska2S/3OGU/NCDJj
 kg6Md8R8NnEuMp7gqo7s6EczhlGcTwSDBsqVi0HBbXarHsV3CrLLeTKad9xBHbZ2qap2J3qM1WR
 x87J0Y2nIVF2v13iggGP0JZKaEIfk8r4QOp8HEyXP8l8ZVCuwVUixR/4hJ80Z3mer9DxQ/e7zMc
 ookENm5rhntq555ye7Nsh5TzKaPTtH1ucTKaL/SxgPutsXxC85fJ0COjDV3my544ie2RGOuXlkY
 5U10lSuAKp6enKCBIMUKfD862rHVx8+u3r2XvK0ZsvroSbt4wNu7f1vdRmVIDzfMv6Pftqq/ZnE
 yNIWcMdecwacw1lJN7g==
X-Proofpoint-ORIG-GUID: fbC7EGyeD1On8zHi6DcU27LgfvyJCKIc
X-Proofpoint-GUID: fbC7EGyeD1On8zHi6DcU27LgfvyJCKIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..c0c9e450b8cda53625b6f6bdb1bdfe5f2bfbee25 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -29,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
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


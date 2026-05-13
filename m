Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373B41B346
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682211; cv=none; b=jCcE7WW8uh1ouPK5sYkY09Uql0pQtL7Os8t+VjsnOdbyrCx0MuGbVvzk9bxz4AvtSHQSUPU8OjAujjRi8RcjQQNKb7MrVj2i1a5+7gCPk81fBaXa36X3luYkrw8ySkO0cbTxYpgMADIvry2rGqWN6aisRYV0g2QKjpCK8uXvGZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682211; c=relaxed/simple;
	bh=YehWLP7vzVkdqKiWVDK5gDg00nTbj62VF3TyWakSVho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckaKSLDAZOL9hBOs/dTkilu90GFGTPwB0geOxSJo+cnDlvolnipUBurrwF5aOv6RCS89M4wNAEvk1zz+R01fLCHNnnwK6XzGRKkw/SdKL5Niv/tumvBzCDKFMe9tt00Qsz2KRw89gN8U7KXIosNR1OCD7KzmqTl9WU7jKCNLzZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW1nN8Jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvdY1Xsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YW1nN8Jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvdY1Xsm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nHXD2887975
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=YW1nN8JmLbhEhtNu
	zw5HDVTkNvyD1k/yriEQgu4yHWefe18S55v1j0hE29Q8fraxlBVgYRYriMiZfwYx
	aOlPEI/ms5aVWueDYxaSLcxIGEwvRnzyShIoHJOat1CwvlNV5tGMvJXg40YpfAE5
	2NoNvOkWObVa5CenPoRQf/RwkDU/WjYdUlRXZghVd98L9e3AIrypNK9WxVo7W/p3
	HXNSvZ6EOCozGlR34ax0qrjKHFnlIUvIibkNz+hW6bZ020BWZ1564aM/2/ONVMeS
	EAD6yYyzp2xSdsZvqUCe2R5TK3Ej1ESVlIDl4/piTxtUT0ehjY1u3CfJNESPfoKt
	f1kxlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gh8vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:23:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc763c7256so96520015ad.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682208; x=1779287008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=AvdY1Xsm/YZf0kVAIsxfTHLMWKOusVfI7G+riu2jiiblaRHvdLjOtiJE2Ds0tQhaVq
         d4KN9iDAfvezYn2td/9mczsCUWg4OixkDCQQalfEQWhCP5FaAN0kahU8tfx9Z4Iq0Imv
         pMQoW3mFQlITQpcI7d5YP6ng3cZ40RM6u2U1COaUcsYzc4ehjUM8/qBp+oQ0WmWYkHUS
         /htNXAfbdaOgzOOrAi3ueLVvdJzRbyixQ1yL+wCm6dygmI/iYvq4bMmRlqsH2S60Wp+1
         eCcivYAbY1wOpWYd4iJcxjaHwL8q/UrlnrSlU5uLGwHV6cihELS7o/kMPbLVjZYuhqtp
         4e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682208; x=1779287008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=RCW4Em4m1R8R2nwrBfIZn/nhGTXatkZmlj5ml+gK2K6ubBraIMlYegRBD4vByJRmIA
         N9oCx9fwo6a5Uh2BW+uxx1fCCiOtcdpdom/Zx1KJ7FeHkmS6b1fjqiUP1BCnbRSi+sYg
         6cdTV3Do0X7xjDz0DG7UlPcq7+tVtZZVSLWhV00/rfU4UyONmonP1iaCdA46j52nhNSI
         +inOJRhsvDYKKJi7K/WnJMppmP0bDuHcSlVSVT39Coc7O54H8GEq4G1xJN2svSwmv9x1
         bZBpzTnTkmazhE2S8bJjbXIzdflQqjWiYr8JwfvcuosyzKb3zlu6P2H/PF9A17EyGRI4
         W/IQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vHaZSkhfVcfpzGY4fvskZ6E/rl797yo0jdawPN+q/bgvu1+u6jGH/EkY5hEZn9DCYxbX1k9RgzLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/8Dk/KYGz2cb8Tr12ssUbH15ZF0hQLztYME3Omq1+ZP8tRif
	wyVccUSPJExAx1TTFxiOJyUZ87DYhAHuVlsgCZmgSoLRDZ6lrNJM+H0ceGXGLyeybQdUOoVp01r
	ucntUPj1/7En6GsSwe0fPMiNLsfpQ+DhkLQdYNFX9ZI2J4U11aIa899fuPnIAKiIad21F5FY=
X-Gm-Gg: Acq92OE20oZHN6yq+dquluaavpgEZWxW7TEFy56sH4QvoiVk3U9+wLgXauZicTDqeef
	4Fm6a/9M+LdkXLlSspQCoDv7cHRrg0ucPMFSkBUkZFEEM7GQY6/TGo1OO9xGB+FnuLJfdwVynfh
	hGUsXF2kleIlPpQsN0GuWdWagZQR06I3iyPN2JF1RhefIJrXlBvnVoTCuevwiXnRWG/8rbB+Vq2
	i1H4MOE7E0j2sbT+pZbrXVXoEZpNAERtc7qtfCzUANzYyVSqRJe9Rva+nxRfB3ZzkfSWxfFiPBj
	DiLj9LqFbdymY+qtNZUDvTZ5YOb3jLBoLvLeqsle1jJnOHAwPaFcYysQB/iC2ha09WHmpnukk7d
	FUKTCX7RLKgJmr01mdFkOpMtzWOIXsSqxD79wfQDv+osINQ==
X-Received: by 2002:a17:903:1a67:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd27708f97mr39369305ad.28.1778682208429;
        Wed, 13 May 2026 07:23:28 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd27708f97mr39368705ad.28.1778682207795;
        Wed, 13 May 2026 07:23:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:06 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-1-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
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
X-Proofpoint-GUID: Wrt4w2LH2JQ3oF5Paed3Q8QMBWlX96jj
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a048961 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Wrt4w2LH2JQ3oF5Paed3Q8QMBWlX96jj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX6yAz7PijrnFr
 0Mac4JCzNGswKSmNO11lOlQ9AjNSVj3BrZFvURlg+YRkcHj0MCveP8BrKOA3ZkE3CJrpSLiUXAs
 uJihxl2DNZs1TGD4lZN9+bBdCPATjevml7wsZtWrkLU+nH7A7Zk8I8dcqUm857z12/Ud729hoDM
 zfno9aHj1q8gp86ZBwATJZ9hahNvIuzIkkpo9CSBQq68p98xEhGFkDrH1wxzxc3eEbI/RDQPmUC
 Qg3HyfRB8fCXM1cHDoS+PqhtpQenbeM73p+L8ebYSwS9xMBjjdeakupwbV6PdyGABl25UlE5hlt
 ai1JTQJF1R2gGl4klYn7DCycEdXfV4037F323sVB9wsuc149piPjsXycmMoYvCyscBCFH+LMfF0
 V8WKBwAOfEjcRe/YbdVngh8DEfLAxZ7LDtd6qattbAxbYLKUwTf/6XsvJq+kID0B/l1d+Otn55v
 umeOw0A/0OxJliyCjqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
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


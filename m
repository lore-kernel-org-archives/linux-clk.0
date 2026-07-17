Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD43AC0C0
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273560; cv=none; b=VqesX1r97pNwx9s4Oy25ugtVoCtY4ytadpKgpyA/D6092M3bNNiWR8Ebc+cWvDudyW7TrFeNawVUlgQYN8/Wt0RaSrjxhGCY/8CbZpIFCZWvv9Tn12K7xLR5tUQWZdub3yzG1FiA3PM0DOn+d+9glkeGF/8OQenTYXFXRoXHxaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273560; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOWBR4h2mukrxeBWvRZjJ9migWOoVNTf74aU7qRWAkL4cVj9bVmNReQ4a6XrmZ8ZEEBxwsxWUT1o1iaJaeW/D7J8OOno3K4XGClv6SacEjcweH3dU5ZjSTPEkAzFOW7RrpXUaxggMmBprIIGe95kXhMhhexpizoZTYeJOK29aJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzVaTHXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0jR1hK0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzVaTHXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0jR1hK0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cn5T1079140
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=VzVaTHXf74prcAeU
	DSBgbbdmA6hjw1hc6acb2iUzSr87Qaml5boUwtfa23hkMTlAFLEG9qjjXdro9+Vz
	WeR5tzOMyI54FhnwIv/6uCAc8r876pjTzf5k9pTs//bGmbkRhaL74CPdpketAfF1
	VjDwKIzVbHUxHwWIdNhKpcPwTvt0Nlai3hOs7srMAR6di2ASksiTVTuYTbHumLzl
	cq0+uWdh7mWnESq6Jp/s3PZ+VSd0gUX9w7+e76kiCbUOPwATu7dzK0iI42wyeca6
	BYXJ9kVc8M5QkNW2Kr5RcCfc6wYg6xYnE4OJHWyt+GTEFyEScdVmP58Aw5YLlCjB
	a8Df8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1bym2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:32:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so154529345ad.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 00:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273545; x=1784878345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=B0jR1hK0XtA0XeXGAXmJuZulGJLlO4pXDciRoJttoa1KfzdLyF7wL1NvCtnnfmbs3q
         kHtEOJrVNz9yq5qt6tjuE+YFZ5LfUEjyjK3JGjHVEbLZyixjcMhP8C2QfocOsTJpVlk2
         JovcG2xLd52ZO9kDA+FOT4oMhr3cdyJFTQqsC0FpCx3DYnwjCdMB4NP0EIcE5Z8UBpfH
         A2qxBjypEatOv10cSE7MMl//uROHz/iz6d7v/DwZdE3MeF8CIkY00OIWg/Xyn/fRQtIm
         NizKn9uDpCn9P7EFpU3RhRsItkcYhs69+fMrdgW8Z1gepgezqIayMqdvHzMukbD8wp1X
         r7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273545; x=1784878345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=sBjIfaP/uyJTQwtpEmOsc/QuGc1vhx5K5WD7KOdmkt87IJKvEoKdAwvcqV5/B4dQbb
         MTDLlWyd2xuJU4ArFjVUhhi85/6bmIE9Rihk4D032ypThd8ofNYeX6NAEMC2ocDOsu7Q
         gzU0qbEYGB9ZTj5TGxk8kSgOBvZTEOL6D8CrJbkK7ZwXUSjxZleY3MHxwWoE9PNtF0xg
         mWb6/Euu5djx62vNSj6XfGE5FIGeR8mvkHYw2tJd6xBSNkOJUpdCpjinGrPE1qbp+1kb
         kSkqEHVHdVTqfcaj49GsWoiSCqpaA5uh7lGF96an36WhKeOonc2QnTQCoSHHFWAAlkEC
         so+A==
X-Forwarded-Encrypted: i=1; AHgh+RqhTUbIxnJAQzbN1vqdsX+JbE0gkdgUA3SD7V78XHwtDzn2dBH8pd0f0zhlVb/L2ZjTh+aC/EGICGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0b3Hair4vNpzD5ZMR3lH7sencrTdtmHmRgd2oxNHJrcS4ZklI
	j1uMqUevSNdq3bcc0nZ0IdyplbMAxQ65NenfifQspLrWBxFwA32YkPRqNhVl8o+7JghXWVNn27g
	qWtz3Fw21PvM7HjvA6+h7tUZF+S1KbZblGQoTDfXzbQ4J+01Z3I2yINVpFZNry50=
X-Gm-Gg: AfdE7ck74sl4UPam1R+EOLn4TZKNdUGeTuNH6zmEz4BypZLz09Zyl6CuFahdFoEMims
	ohRIA4+m2ovtcROdsA1zqdPr5DGKups5LGpke2/qaPBjwm8ErpKLH010JcrGl1c5+7SbxsJHpwi
	7t9X6QYeMTSLFmYHFnPB64JCNt9ciTQWkY8943bsmQ5ABjbi3YU94ZWgW505opr7XpTNTgQJj3V
	m63Mt6apWIipsqPiT7+M0/GfUpO4Ybe73+/HzxZ8NSSFKYvCd2YsIDXV+FgpKH5PqCvsIGdzFlp
	PGX5yLmuNyKc82zvAA7UWhRJuDD+y59NjQ31SAfs/iCThIyqU3z8T9moS9XbAwgpDc5jb3Jogv3
	9kJ5RQ2pHyoVL+/dQSxR3EGGG
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16503105ad.25.1784273545158;
        Fri, 17 Jul 2026 00:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16502845ad.25.1784273544677;
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:48 +0530
Subject: [PATCH v8 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-4-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59da8a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX9thzz+gj+uQi
 uy3Qv7X0cB2WP52mjuPLFLcNmJbSNj388AH0Yf8/Nf30aH7OBVDUYu2ihfHCJasOQ/AKfpErBWl
 1ujhPyrGiyA6eS52aMbfwLjigwiALH2qyLgrmlkhocmKSqsD64VRLAEgVzGFckNI7qaNxN8aS6I
 sp8zi7bbCB9/PO7Gc9vIeddb2e/zqOZJwPONOgFnAMBjSaH3kQbAgjyRY+L0s2d11eSgFxeGf2x
 YPpKOjCgogWWiLhnvGVhb4cBnVllopHd5Bbv6HUQMJekfTH8IQQb14XU2ZFQw98MxlB9Y0cIaBH
 DxWsaq/xEPpwgQIILndRD7meOU5AD4nA77SkuMi7BYOeKOKsMls8/RYr0JS9EbK76taQSJq9P/H
 Z6ARcFqGo+aXcCR17oq5DzmZBhgJxQ/OvTHJw2J/Lpkh5/d+oE+a0UDw5rkdgunMkomiyXY+pwF
 mVRfFajdj554lqnoKOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX6brPz7kzeh+e
 LtNwa4p07WnEcM7Jf/y51LXVbX7zbIz8JZ9DNo8v7JzYEJOx0wxl76CNF0judgKsS/JVR4NCrBc
 8XTwhTs6bJv60wTwHs5HdQmu0slY0xI=
X-Proofpoint-GUID: 7zOMX2j1QZhW2cmkquOuHmv1139J3nSi
X-Proofpoint-ORIG-GUID: 7zOMX2j1QZhW2cmkquOuHmv1139J3nSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
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
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
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


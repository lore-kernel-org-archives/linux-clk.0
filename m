Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8730FC21
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679660; cv=none; b=Hhu1OhPEV/FpnFe4ZQPG9hdR1Q1N+v72Wum2ehXCkjr0rUZ/+Pi8pUv/YhMdDOo4QCP//YfzHtoGBDPuTP70nMlZR4hL6oKNo2QT04nYGP2QPnyxvSjM41NMviL8dN0cZQB4DC/Yh0V+BPN86ux07CoV2ghpamD4u8SjMgl1qak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679660; c=relaxed/simple;
	bh=zjHZlUWyJcyXeRZYOGVOkl/BkM9iscfpl/MqwmfdlXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKYIy4pqUaSs8z8+LRUxbezBAAd7IA+ls+g/n6l4RdzzXgXM9jCR3vj2o5Rln3p0WCiuLtfMLbO8Y9zprvAo5mfnVWu/MPoXNUqII01n3oVCZkvSJj97hgbIekBpJnHw7U8AUPLW44aF6y0MDmbizpIgojZTips162h4wZCjRAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJfI6FBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEwnQzaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJfI6FBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEwnQzaY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mI133474831
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=; b=BJfI6FBbIvzQgrQv
	gFGgYKG6uAnzo3GulN5rYMiga5c3sPlFyKu0wXo/CAopzFzlCR5B1GxsQwi5uonB
	gI+uaRar27jtLRi5WYln6+8eP83yYiZ/24Iv59Nj240yqx5Oh3WYV/Ue89BZFv4X
	PKQFJSgFm+Qg52IYd2xi/wVKFhkaxnrxaAMkDGFrvmS72xDaW7uC8dAGKZWzTAWU
	rbQP8s/jUv/iVRcIfSIN+WtjN6WQnugudlMvf6CP8PwH6gDDRsWWNUz7EdJ1ssgh
	zKYVqk28rqQUm7bRFMwGRY80LPkDUK7GXUd2GTXrsfpYPHtohHJWy7KVqs/XOz+Q
	PuyQxQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41928d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:40:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so3838030a91.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679657; x=1779284457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=;
        b=hEwnQzaY5b8iL38QAZPsim/YMz1/tgflZ1/cgX+ZSbciv3B8TSJRgp/9oKwdFvLPsc
         enIsgQBt3qG0hWsIfXhVf2FnOsEy50m8aHJzPyg5yK1Zsx+Gu2BTDcdHZORMAu8L8sRJ
         a3l2NmbE+rKjBiAaoa16dhBVT1jCG1oi3WR3R3RlJYxN+hQVuYNWAnq0NxuG6t1cleXb
         AUoTc33OvEdrE5qy/uEYUuiMEweveMc2aKWuwJPfVfTuYU6oyrPgTkl5o90Hekq/JtvA
         fSaw7X9AxA5aZ3g8XJlVwnrguGfJz3pdbBn+YBo6OLQr/07I0gFNi7Lx+MvUJZelyAWH
         r6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679657; x=1779284457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Og7zLYM2ewiyQqmgb9e8qK+45a/W/Fnm/o3b+5Pe1g=;
        b=Rz81wrl2x5/WEETzQk/xf9s3UKfh2rmKKBM9UK171zEYe8sFXlq72/k0WHhKzACy0f
         1c45PHUpBBAi/QWn36koAvbL0GXfC44zCfEnp8A5S3TG9Z1sFjDz11ykYYz/m+Mstcsl
         hyyLnjtsktG1HdBayp8J0C5CtN+6VPSFS8q84hC+eHn+4kXF8uI2ulWikb78F3meMhBD
         5bJugl1Iy08pMtxd2DWaYDejbvTrNcb67ixDynASky0Ah/8z8yBPyIzo1pEZVyZMHI1u
         LPYIlAysIsC8SUJ1N9hbgVpk0JqCbiDg7+rsNFjmLhRVBQPR0Hfbd3gx4BmrNY8rtE9i
         7tCA==
X-Forwarded-Encrypted: i=1; AFNElJ9kxgKh/CjUvx5wTCZttx0yE93g0QTKIHFbXHGdXAxUVBZ0vuhChR0Il6zpVA++4QJBSX6C2NnxX94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvLQddrrSFPyEUDr4yLKHn9DjnJUYsBx8A3WLQDR5XG5gKdDG
	5Zc6V6Ak2I64foKOZ2k02vu86KABlu5vOFqFiV8DZOvaFV1WQsB5VVNxOPDD8UpU6pSeJxS+lT7
	vY2HVidQuYuc8mvB6rEvgHCeZ4Pz6CQ8io9Jaarqhgmfn2IQkIpUVwlZWqiN1Ol4=
X-Gm-Gg: Acq92OETcOIt83Vwf58K//fi2aBxveZU5N469cxylOmGlbXK62yAKpztexoqZZBJPJj
	Jpb4gjLu6yyIN2kSOd1sKmjOf+o0anJNZXuRtMYMaRORHEnQhOlXWoUBRz3l5dhGHq+XhEvKy5c
	674Y9Czf5Tw7bpd6gLP9TKplA42/pWhOtK4UUGVwG77nXm/VIZj5ndfgqJUSrB4qQE7Wqu/UnfG
	T2d5FcJfQ4fXsrkcD1j4gzc4yzDdOLFMF23fzSuhufy5P7Nzwp3K/igwdsudNrjAzBucEcjmpG2
	pCZRf6dPrvcosgvnb2VVchAVsd0fHVhvlnCtQUXnm83ZnrZiJ5V7ZsAwlKSBb1WuRAklwvOIfJ9
	/ubUO2G4RTWdYvLwQhhNYCXUJvrN9jB1p5rxxalSylcaSdQJDViQb
X-Received: by 2002:a17:90a:617:b0:368:f7a7:daee with SMTP id 98e67ed59e1d1-368f7a7df06mr1778010a91.8.1778679656841;
        Wed, 13 May 2026 06:40:56 -0700 (PDT)
X-Received: by 2002:a17:90a:617:b0:368:f7a7:daee with SMTP id 98e67ed59e1d1-368f7a7df06mr1777979a91.8.1778679656235;
        Wed, 13 May 2026 06:40:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm4317403a91.1.2026.05.13.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:40:55 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:10:36 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add Shikra Display clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-shikra-dispcc-gpucc-v1-1-5fd673146ab2@oss.qualcomm.com>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a047f6a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MM9pdrEQ6VUtxjYSux8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX9Ux2d1KPz4fW
 0ZleAZkYDJQQHArv4kVPC2X5d9UMb9T0GJXlzDRp9dys4I7M/wea0/mIzsxQVlVyfsy4PYph0LE
 i7idbyQHxhxYmPFdmycbUs1vWQEHKJ7gN699ATy+TJWKEYejZ6z3rcsRg1B0AzMyC0lW7ZwcBPV
 K1jeD4z+xAKufTGJ9FxAWC8Zleg2wgvHqYqCCHu++IcxGEsTMkHsInRuQ8ao+qJ7hD/LhHYlgKg
 cQaFMui8ZJy5lbYLTf/0z9Fy512FWo1NhKwVNCeFvP/Ibkf1nsMwmN5kc66zttWDDc7rUkcCkpb
 p5rizdB5U6MosYhGiALSDTiwbTAllg8J3jjTZ+Es/4SNXLaHtW6slwinrqf1EVn3080hbuYBT20
 08VkUWc1tgA7wV7FWUzUmJfozWZgpoFKBAyaCs1si1MdUl7D2xx+q/xIPvdSMFiX/H+KqBKOhHh
 qQRhWT4jiHyLJEXlPBg==
X-Proofpoint-GUID: KU2PuGu75pWyNlosKcidTmakRA66B0dS
X-Proofpoint-ORIG-GUID: KU2PuGu75pWyNlosKcidTmakRA66B0dS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141

Add device tree bindings for the Display clock controller on the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-dispcc.yaml         | 62 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-dispcc.h     | 39 ++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..38302eda7942ebc2e4dfecae511b75cba0b09916
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-dispcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Display Clock & Reset Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Display clock control module provides the clocks, resets and power
+  domains on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: GPLL0 DISP DIV clock from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@5f00000 {
+      compatible = "qcom,shikra-dispcc";
+      reg = <0x05f00000 0x20000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+               <&dsi0_phy 0>,
+               <&dsi0_phy 1>,
+               <&dsi1_phy 0>,
+               <&dsi1_phy 1>;
+      #clock-cells = <1>;
+      #power-domain-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-dispcc.h b/include/dt-bindings/clock/qcom,shikra-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..088a7c692ad5d2bae38d2799ec1fc6e8ebbe6c0f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-dispcc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SHIKRA_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_MDSS_AHB_CLK					1
+#define DISP_CC_MDSS_AHB_CLK_SRC				2
+#define DISP_CC_MDSS_BYTE0_CLK					3
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				5
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				6
+#define DISP_CC_MDSS_ESC0_CLK					7
+#define DISP_CC_MDSS_ESC0_CLK_SRC				8
+#define DISP_CC_MDSS_MDP_CLK					9
+#define DISP_CC_MDSS_MDP_CLK_SRC				10
+#define DISP_CC_MDSS_MDP_LUT_CLK				11
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				12
+#define DISP_CC_MDSS_PCLK0_CLK					13
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				14
+#define DISP_CC_MDSS_VSYNC_CLK					15
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				16
+#define DISP_CC_SLEEP_CLK					17
+#define DISP_CC_SLEEP_CLK_SRC					18
+#define DISP_CC_XO_CLK						19
+#define DISP_CC_XO_CLK_SRC					20
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_RSCC_BCR					1
+
+#endif

-- 
2.34.1


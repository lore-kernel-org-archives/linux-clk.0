Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072CF3BB113
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955110; cv=none; b=QWN8lCezJRUQKKOJv/CmdE8TnpNkYbcNIq63WnZcycZBAB9+AxwK5ar8Fsy6ZVPVQA8xeeNNalUx5e0gYtnFAQ2e3vXyVFLmLI3WBkEUAk70bWfaiMKwBqzHTMiiF9RAv6b76M2feBreND7iSlybPFHdZafTzXVJiubIu09Az7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955110; c=relaxed/simple;
	bh=v4qYwtQ6sWyeR6A7Ip6Xn+sA+1EPP9vFY8mtI7ebyWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXBPrJyP5YYMi33coYC5XZkCNiWHo7Xs8ZFasb05g5QmXZjmfUKgidGLnOZ95hkw3VekNjtsd/7hpz4D1YuCVkVlYmcq48svvSM9vTnKS+888RDDGccQNY46TsROIUWGLCHg6R+owAapKY7wAjht9crnxKqnWTlXnCu+AugeyDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShlpLg8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bR75rG6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShlpLg8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bR75rG6M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H72Pn54059911
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 08:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YLi/jfZoIIZNxlal/IP9mmrMfmijrdt+JXu
	nslZnz+0=; b=ShlpLg8/r99x48Z9Bg8nr5WxT8ZnXaRKNw5v3JV96ignmsJ4Wl/
	YMAtpQZ6Q7RTn9naBnOCut+Ed544fEtx4d7dCcKkEyKEMrbDQHZTix3i0qG2qePQ
	UiTMVo2hSSIieMHfBtk0aCuesX6S3COeyshVR7eSVMQReaxUT5q9o7GKVzCfsszV
	LiBFxris1IFlhFJohDXxSAxb23e527jno7BULzpv/3gGCqlFIyCW6/tHGmPqk8jW
	ipgUJ/5UCZslpIc2Ndw9+pvYp/X+/vLYGQTqc9vGV0/ScUhofGJ2Z+TtXAg9IxIJ
	86QMqFXFU3jsgPn7F6s4VSvOpvuAEq77vcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7wwc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 08:25:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so326701585a.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 01:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786955107; x=1787559907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLi/jfZoIIZNxlal/IP9mmrMfmijrdt+JXunslZnz+0=;
        b=bR75rG6MM/BcdjrjZQUdZvY/y30x4EY3C4SM0uSS9wqsKqz60uPSNq3itLXr+byVqK
         IThy/7h80zI6syYOQwBmORDgFdaOczKQ+aa+6HpoEhzjZoVV7aouWqDmBFC+MH3UHJPN
         6RHUUzTsj1zHsn8q+AtEx3EyP/U5KpRd/HzO3yXBkZS+Scq42qtXBYupS0hIxMDwNrOp
         pq1byDH8/gl1BiONRZNALvdKKq83ECUsMuFdm+suZN5pU/LzbI0JOkY56+SWDn+Fqko9
         i3aiG9FyAf52GWSL850vULvqOXAFx0CAyF2Olb+9LfZfCLPMYHaBzn1cjegTFRPAa/fQ
         r09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955107; x=1787559907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLi/jfZoIIZNxlal/IP9mmrMfmijrdt+JXunslZnz+0=;
        b=Moy2dNNtsMaSYp6+Gxqr75imctQRFi34HVcyUOYW5jg+qQjZbM/ebXjRTlS0L1ADrC
         X7D4rUlPXF02fg4onHO8nnx1KiWg/cy4y/OFreG29lxRglRWIUlvj9E+dce8XgCByg9q
         DIoknb+23TXNkbcTz3Y6cbvxYkSoR9S1bp5FAJsKH03RxWa0qbb1JyrdiOKZxH4fEH/x
         ppctVu/yjFlDrfrBpNOodwmweMc3EHO1jBBuknaD+sDuWUKqzkzVM7WqsdKoW+TX/t/G
         7wHsTS1yvzH5cicDel98ud0e4cGxZAKJSdo6akpjnUezbuFlOLtdq6IbQsMRbkpleiBA
         L9yw==
X-Forwarded-Encrypted: i=1; AHgh+RoVzD1GVMbpIVJuUDvjB4niv6APxTwSwalXmhELniIKOBSDZA1Qza1L+vH8s5DlDnX3V+ZkXvT9sWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjvm3J+vHwww5NQUVsvviVbGjs8zxyChhJQzf4oYhS+dPW9PGg
	Q70LTa5GYsX+HWDtqOEll/Z0ZDIhTsWqIq7mGNAsFGyyEQ5WZpyHBQKOPTKrfxheAseJ5H+naBx
	g+qwvnBcVhk9xamVR+eXJqdKqQpO3ClL1WiNmbChod6OakmJY+xY+/SO2/+QeJTI=
X-Gm-Gg: AR+sD120PCtrn/iB9BoFpntmZuu+SsUkRgWLK81I7t3u4uvJ1pE3o/AZweGEId8RO13
	0qbPi+nQ6tiKV1f4DjB8zPmDHoIJWU/QVUJUflIR+pzoMK/5p15zDRZ2PvOgBx/pzOB242t4L4I
	B2dXn7a/J3d0I4dq62bxTEuca9HymAU8O4u9fbPkbynxsGq6JHaIu+IMf37RlPkIoIhCxL/J+V7
	PiMOvwAOCTtVtD9aUVTKjiYGon3jDDvIIlwxkkAtguBl2w2gRyPwkoMrp4JyFYed1JEhArU9a4I
	gh2n7WEdGUUr1juOonWH6TnfMuMP/NSooYRgf9Z3bcCaBPbxdLHdkjkynSJxFB9KE48q6R2hBDI
	GiJGDKyH2iVZ83a4=
X-Received: by 2002:ae9:e51a:0:b0:92e:e3eb:de54 with SMTP id af79cd13be357-936d201e8c4mr2118818085a.11.1786955107086;
        Mon, 17 Aug 2026 01:25:07 -0700 (PDT)
X-Received: by 2002:ae9:e51a:0:b0:92e:e3eb:de54 with SMTP id af79cd13be357-936d201e8c4mr2118814785a.11.1786955106585;
        Mon, 17 Aug 2026 01:25:06 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a7bc6esm2372760f8f.19.2026.08.17.01.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:25:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@mainlining.org>,
        David Wronek <davidwronek@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Date: Mon, 17 Aug 2026 10:24:58 +0200
Message-ID: <20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=v4qYwtQ6sWyeR6A7Ip6Xn+sA+1EPP9vFY8mtI7ebyWc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqgsVZPH7l6uilu5hW/4SM6S7YNWjk3WN/IH4l1
 swqmR7sd7qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaoLFWQAKCRDBN2bmhouD
 1yQND/9FxTdDiYu/GF61FwxqPsfsIs1YnXLGZaQQtBvYqSgOgawqvbKhjROzmYlThx5pIp6vdU/
 oZG9CfvEEyTvLgZgqM/+TrZkFqlLMDHEWQzh7WyaliV9PKNUTogPrZBmzbcTCD+weUU/+wcNPxm
 kMz/dOvl8bWpJEqq0nKgx/IjJuzbBsjjGNnlHksEGZaeRy8nGKmSmf9vXb6p/aSm12fMkGneAs+
 HCvB1IY3PNbcR0PKWBjBnGfdthG+1cuS8BLFQo4+YAPV2yECcANaV/aBT+EaBgZl5PkIACXkAGd
 37Xh10Plm04AoxBEyjPdWhVVSV8V+/vwrq0Imk3KUwxsOMmTEGv7CUAalZfrKvF9NDSOzr87Aax
 Dpn6214Wa8DadyZSoZvhw1y8r+9YzZ/S1L0lSvOztWnYr4Cj1vHjdEx+CkrptfKnLKs9mI5h0gc
 f6P2t4lVmAEO9ZNGyLohh6M59e1Xijg9Ew5tsTi+4nrGXjDirxB5aLIFQqpAq55Hn5PzrEbJtDZ
 iQ7yQ7iWz53KzAmaCcRf5lvRmqFlZXm5RkGCT0j9F9Ldf3ksCj8HpBuFqM3YTXYZdPmSzkIpFBJ
 dkNJbagBSAX67v7wJBMuSLNLusYFHRo8vuv9slyBPx2Gx6SEkE1XNaFuNsamus2Z9UJUOrOdcSM eegX37S8fP7tHyQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2MSBTYWx0ZWRfX6v/wI/R9rpb+
 XwyfxrbHd7lJU9shoLEAiu5zV7zA9R9h7h5XHNM7l2gUu8KErEQKR7VzUua6CeGBjjMzwKBK6iX
 bSVFKD0SVLypBNFWG2cw02XHf1Vg46LfTBUYvvwe8dUy5mIAOTUGRQAWF/CsgVyImeVQq0ZzyhD
 hcuCPDSjAW8yELBz3TAxUKxv1ue69J747RQWjBiv7qHhuteat0holI4YfQoDC5JeqdalKDzdYCJ
 8baF1sK7QbwKjU5teXcXAcIlP7NL3fjF5sG0EJ1owoFRlbPDs3BSN1cMav9AKo997G3Ubxzlmjd
 0UnPIqV3qqMrvbPp4A/AdEveW5Xj06iiCfoFJg7wERmxnnKvPNTu1ZhizTqLoYUBImu2qoFdo8K
 1+kUx+GESJKmTHeNcK1lu3dgUpdZx4Q1YtUyP5hvHJK4xHW3fSkwW4pxZxjn2SG3eZLHmHO8mHD
 7b4PbUiP20l97+JtBCw==
X-Proofpoint-GUID: DPCHDXC9qraCt5OY1OeqxYsKKrP8x_PX
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a82c564 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7ibcVnAUAAAA:8 a=pGLkceISAAAA:8
 a=rN_0p8sgu83ql7wKLuAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-ORIG-GUID: DPCHDXC9qraCt5OY1OeqxYsKKrP8x_PX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2MSBTYWx0ZWRfX1wZKV4O6c822
 erqeVkmpMZTtux9g78UvsVZnL17Dabc2TOVPTjGu3rwr8qzUZftcuz/AG171VBqkw1mUJ6ZM0Ck
 hLVdpBNTuoTToF+DSuONRrFmnUrDIHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170061

Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
identical, so this could be one file for less handling and encouraging
future grouping of similar devices (like SM7250 which also would fit here).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm6375-gcc.yaml       |  9 +++-
 .../bindings/clock/qcom,sm7150-gcc.yaml       | 53 -------------------
 2 files changed, 7 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
index 66dfa72fa975..b4ad2ad14d85 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
@@ -4,10 +4,13 @@
 $id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM6375
+title: Qualcomm Global Clock & Reset Controller on SM6375 and SM7150
 
 maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
+  - Bjorn Andersson <andersson@kernel.org>
+  - Danila Tikhonov <danila@jiaxyga.com>
+  - David Wronek <davidwronek@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
@@ -20,7 +23,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sm6375-gcc
+    enum:
+      - qcom,sm6375-gcc
+      - qcom,sm7150-gcc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
deleted file mode 100644
index 3878808f811e..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
+++ /dev/null
@@ -1,53 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sm7150-gcc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Global Clock & Reset Controller on SM7150
-
-maintainers:
-  - Bjorn Andersson <andersson@kernel.org>
-  - Danila Tikhonov <danila@jiaxyga.com>
-  - David Wronek <davidwronek@gmail.com>
-
-description: |
-  Qualcomm global clock control module provides the clocks, resets and power
-  domains on SM7150
-
-  See also: include/dt-bindings/clock/qcom,sm7150-gcc.h
-
-properties:
-  compatible:
-    const: qcom,sm7150-gcc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: Board XO Active-Only source
-      - description: Sleep clock source
-
-required:
-  - compatible
-  - clocks
-  - '#power-domain-cells'
-
-allOf:
-  - $ref: qcom,gcc.yaml#
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,rpmh.h>
-    clock-controller@100000 {
-      compatible = "qcom,sm7150-gcc";
-      reg = <0x00100000 0x001f0000>;
-      clocks = <&rpmhcc RPMH_CXO_CLK>,
-               <&rpmhcc RPMH_CXO_CLK_A>,
-               <&sleep_clk>;
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-...
-- 
2.53.0


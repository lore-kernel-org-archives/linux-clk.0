Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406B4C6F10
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328648; cv=none; b=tyIEaPDngfCI5E6aju72xHqSaO9pgANj/kM3/ro+Gv7sttqw7sOVcgFxN8aNsIKTHHxaC6/8zBj4lFA7UPWGLQfL6gOvHmU4nF7CBls64gPzHhkrmYdCN6MeexzooDGg49s33M0pqVLN7BurD06zGugkkGrtqQpXaOiryp9u0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328648; c=relaxed/simple;
	bh=Wpq78rgozBemMvqXHShHTN41xjvjcSPxsv2keQOrZLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9GmQjV8BQZqdBhAJhDb4CpnthAB7EPH6rXcujpE4Y8n/RNhV4vglQUMfXu9b+7vi0VKS3ykqxTpYQYUFemSS419CB8vogm43Z3Y0VoDuNVws484T8zKIBuZ4JlOWezU1LStd65cdIDOnUJS9vUGuOOK9/IUYNH2mUW3SIes3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edXqU8uq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMqR02mC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edXqU8uq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMqR02mC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm9mn2832687
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=; b=edXqU8uqZdz//uFl
	5RyLDYxnwzVQCD99oR0I/rcuPGBGWqmkOpoKvNkPuU+tNp9nitjoWlUOvmkv12Ke
	/xwANwZAXPLynBXIcC7sHstPBqXCRHIbK7yLVwg/2dIRXvzORZ8Ko+TwVrNcVdeQ
	IwHLlH1lurvue0YVmVdgT+jvv9ut+4b+PEWcwh9WabYe7YMizbK0hBSiUWiH8rBD
	QD/HbsWxwpmbwnnIZ1BNt0s/2NqkIy02iXpeFATuRhNDicQRIRXZvkMZHtqtMXlQ
	Wb1MSUx1iPIRlErdo5b5MeDgE6GGXzgsCrbJJ6/ju9azQAbXqAfPBBv7C4QRjtkS
	YtbPUQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsk5pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28d8d1b76so1040240b6e.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328645; x=1787933445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=;
        b=OMqR02mCD2GHHmduIUZh+Rz1AUWhbdkLDU2Aejm8zAfEh87QEiDHx5x1ap+HRMHK9S
         l2WRzkUGli6IxV0OjEHySDY2zCToeLgiEU0fNi5Q8TKMmavmWTOehkAIIFEOVH9NAUDr
         RcwutTafIc/qNdRi6AREFqTv5k6jn3yZUwXzv20s95ICAzsUlsAQr2EtHSdwOMFtn44k
         u/arMDCpdrg5PtYOQ/GXzv5hlsg+cJNbLV/jRqs8bWZAVv1ZxIopl6lIVA+Hu8YjLjnR
         Ts8Z2Pg3wqZUJwMEWBO1JbVBpiSUesJf0P9q8UZkZKWvbSbj3bvCTSqXx1E4yCjsuoTl
         uZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328645; x=1787933445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=;
        b=dr0sJlJoNaXKJe5xb9x2kgKiEHiv/hcHsN2yjrLzMuO1BmS0S3by6BgIiaunNDV3OA
         uWJEf6rv8r1iCe/hNlAxYRVCjIGK0vzHrJmJuyHE2cCvLtSlWb2D279fSsSdWnESyTNo
         cla+Jp8rnlNfGLJGvfqpjG3uhfmUOxEf/IFJxh25OsoDltbUZiIjoAWtZvphF1EDq0ey
         wi1EZY8Fh0kguacPODNbZ8VGcupB9nQpoFN5o72vbI858meuHqQe8PHAlcr3dWj2dPHa
         1L05x5RtmBO7owyoaJGarNru2U4cKTSNEfyV/acuXSaO0BVo7/WXXFoXrYF25xDCdWQS
         2STA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1VPp0EcRfVso3V0cHE9wubbDpz2dd4YEKQl/obL63dHXuWYICCXDmfLw36AI8kyKOnpavX+ySH8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd0xm73MZPP9BSqvoy+E8J7IUYJZFP781pE4pjtB+dGOd3M/uQ
	sY7lqzKDew96hcMR8Mvrm1R1jDb7IQK+oem4DP+ZLR445yoR+QEYqTbYkco7w8ji9NlcJBIRFcH
	skIiMSX76UQhryNX3ZaYWA6XHOpJq/KPYrGRdapv5HpZQJJjZwVTZZdkdwpkTl/Y=
X-Gm-Gg: AR+sD115N3JbD8DPUwv/FBrMzLtVv7lN5T4mmSf5JZ9oqUd2bhQkg0PkrdYJEZgbamQ
	Q0rWYUGUKknHQk0lDwlEglpTzi/lkDDvfjG/oFUBXrqh7uS9SorlypZtu3fHrzQUH2M1s7EKs8R
	GrqvUP3hJcACMx1dLgtpCwy0mM83QdnCZ/FCIYk+3rXtrciXPsPPoLeqcn7Sy3t0ONXJrqolLe5
	blYvuDv/hV1pZEXpMBMY+MfnjrZUJYZpT5/fGRkS/xg4cyivXBPmDSuVMjycZHBW0kxxGoTUCV3
	5V2vHPs+HuMmV5rUi5r9otZ2cdQZOv+Or2fmCQm00SOU9XU48I/poWVK/z5QxLNwwFbSkBmg3h7
	fxtbYvQsoYPu9SD/BVTo2lxyTjkiiL/aknOwUWCSLM1MCtJzG9Wt7uI8aNpMT3Ij342il6s2DEV
	wdQjKR4RLJgCNfdA4tOBsZ3iA=
X-Received: by 2002:a05:6808:4f65:b0:4b2:8dbf:771 with SMTP id 5614622812f47-4b2ef36ac0dmr8148594b6e.10.1787328645363;
        Fri, 21 Aug 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a05:6808:4f65:b0:4b2:8dbf:771 with SMTP id 5614622812f47-4b2ef36ac0dmr8148515b6e.10.1787328644850;
        Fri, 21 Aug 2026 09:10:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:10:44 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:03 +0530
Subject: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=5624;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=Wpq78rgozBemMvqXHShHTN41xjvjcSPxsv2keQOrZLk=;
 b=2JB3MH5BwbpK/GnBaySz6WvTOeAwNs8O1+wa0QVsVL28hl2+1sSGtcKdI0IIYQe62SiAl0V7V
 RpKGgcVPhFgA2cQCqTfAJcHVOe2O4mu0C4giH0PGmxMn88OZLcBee3L
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: ki2wmlTxLlqL52uT4t9yy-imjMB5s222
X-Proofpoint-GUID: ki2wmlTxLlqL52uT4t9yy-imjMB5s222
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXxU+UsJW3Z9tJ
 EX19EfFJqqunxFg9OkR6DMlmq0q4Dy6AyacNkhiUb1rgOAsFci0IxUHKH2Kn2aOYKYrPvu7+XhY
 VXzbM5rBD3XRZfcaahR4irLZLT6GicE=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a887886 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PKuh8qK-LUMqOkA3WUgA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXwIG3HSB6rNQN
 3kmhM83uX+7nOz612JBrNZVO++kge99V/4C9suPzPz8zJYbNlDhWRo8IUV++1bmiGwFEA1J7Hko
 9FRoNQPYl7lm0b8G6CsFPQaSzx2a0RTrQLsncDIxAqxWLiSwQZYTfD1fUolLrWsHNaBMRdzC7LP
 6fAETwvv923G5oKSDVe7RSG2ELsYEHSDu+GVpKuEY8iEYlhdK7MGJ+1LxuGgpD8ZFixesUZuLR1
 ebow+oN02ZJrnqOBAs1kbuQhEqQhQOo7DgzoMl91oF4LDK3U8DrTIlvRVYcSUg96OSHfeD7DV1C
 jeQQ4fpBdBcMxgsNunCyfCwNyNdGLw0gtyDy3rQCLpcdlHj6enumHQDtD8AIYqpmbxQNqOZ+7pD
 sEt9TDgvSGE0uOf95yPNyAWb5BUL596xnTdHhepYxX6tMjY5kqj2RNH49BFXnJ6vM5P1vZlK0GW
 ZvHP8c/FO8ghcE6T+5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 52 ++++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..7ae37033a1af
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Kuno
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks and resets on Kuno.
+
+  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
+
+properties:
+  compatible:
+    const: qcom,kuno-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: Sleep clock source
+      - description: PCIe pipe clock source
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_pipe_clk>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,kuno-gcc.h b/include/dt-bindings/clock/qcom,kuno-gcc.h
new file mode 100644
index 000000000000..bbaf1799590f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kuno-gcc.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL2							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL4_OUT_EVEN						5
+#define GCC_EMAC0_AXI_CLK					7
+#define GCC_EMAC0_PHY_AUX_CLK					8
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				9
+#define GCC_EMAC0_PTP_CLK					10
+#define GCC_EMAC0_PTP_CLK_SRC					11
+#define GCC_EMAC0_RGMII_CLK					12
+#define GCC_EMAC0_RGMII_CLK_SRC					13
+#define GCC_EMAC0_SLV_AHB_CLK					14
+#define GCC_EMAC_0_CLKREF_EN					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_PCIE_0_CLKREF_EN					22
+#define GCC_PCIE_AUX_CLK					23
+#define GCC_PCIE_AUX_CLK_SRC					24
+#define GCC_PCIE_AUX_PHY_CLK_SRC				25
+#define GCC_PCIE_CFG_AHB_CLK					26
+#define GCC_PCIE_MSTR_AXI_CLK					27
+#define GCC_PCIE_PIPE_CLK					28
+#define GCC_PCIE_PIPE_CLK_SRC					29
+#define GCC_PCIE_RCHNG_PHY_CLK					30
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				31
+#define GCC_PCIE_SLEEP_CLK					32
+#define GCC_PCIE_SLV_AXI_CLK					33
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				34
+#define GCC_PDM2_CLK						35
+#define GCC_PDM2_CLK_SRC					36
+#define GCC_PDM_AHB_CLK						37
+#define GCC_PDM_XO4_CLK						38
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				39
+#define GCC_QUPV3_WRAP0_CORE_CLK				40
+#define GCC_QUPV3_WRAP0_S0_CLK					41
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				42
+#define GCC_QUPV3_WRAP0_S1_CLK					43
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				44
+#define GCC_QUPV3_WRAP0_S2_CLK					45
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				46
+#define GCC_QUPV3_WRAP0_S3_CLK					47
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				48
+#define GCC_QUPV3_WRAP0_S4_CLK					49
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				50
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				51
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				52
+#define GCC_SDCC4_AHB_CLK					53
+#define GCC_SDCC4_APPS_CLK					54
+#define GCC_SDCC4_APPS_CLK_SRC					55
+#define GCC_SNOC_CNOC_USB3_CLK					56
+#define GCC_SYS_NOC_USB_SF_AXI_CLK				57
+#define GCC_USB20_MASTER_CLK					58
+#define GCC_USB20_MASTER_CLK_SRC				59
+#define GCC_USB20_MOCK_UTMI_CLK					60
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				61
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			62
+#define GCC_USB20_SLEEP_CLK					63
+#define GCC_USB2_CLKREF_EN					64
+#define GCC_USB3_PRIM_CLKREF_EN					65
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				66
+#define GCC_BOOT_ROM_AHB_CLK					68
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUPV3_WRAPPER_0_BCR					9
+#define GCC_QUSB2PHY_BCR					10
+#define GCC_SDCC4_BCR						11
+#define GCC_TCSR_PCIE_BCR					12
+#define GCC_USB20_BCR						13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif

-- 
2.43.0


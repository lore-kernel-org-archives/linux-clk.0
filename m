Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A414A13BF
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535137; cv=none; b=rSoneGrLSWcGL5+Eb2t4hsAMiuO3RVPFOON6/Iwb+AewEzsawK1oVbiOnQG5ncQtqrS25XU3J+36LabfB7/s9BPorXSkBamOxZM/bO9wweM5p2FLtIGZSD9YrFMm9LXicTCCZOjCjCaJCyjFncS3FQiGjJPUHWdxIAK867DUknY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535137; c=relaxed/simple;
	bh=5+tOIwKjFEOViCePhwuk8uzWNUyFlbnCkTYOxe+u4rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcApiDdzEaojF5hJoyYeMTdJlxJBDP7m3zVUnrqk6dAXPoJe3ZZll91hxsDW3s8yVLaxpIlYH2Urxm7avfewnBvI2qVroxejee4E6/1NPJU42+PRbP8Mtwz9drkgJyMkaPCzivJlStwWlwbX5WS5OEZq0CJXB1V2MI8eGg2thRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk8FfjU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6fNoImJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk8FfjU5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6fNoImJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668ILjZT3578723
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 18:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=; b=Sk8FfjU5GLvHMFJB
	3eR1yBnF/n8m0LnjcEUPdFp6W/2DibP0GV8EiXaNkX2pF/hJV7Hbh7/am8uG2A3E
	Acy3qLxLSfjWC4xmZlRYGV+XSA3mmPGqK54et9igrS8Gs5EYvq50iLKrKfAlmIDw
	ERTaVKd/FwhrCUV3LVl2J7XAW+0Nd7txz1dsDNXjRTF7NB/LsK1KuS0eeQdHwsA4
	y4+0hqNTLV6QyDIfkr6YSqR948nJAmMx6dPR6RtN9yFHu4pGR0YPuFLALoaWAHd+
	mrvQfnJ7sb02+7ulSIpK4udiANZOYPpXdaKhAZht/OJNXPko7bM0fiDkz/eY27dd
	kSg6ww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvr0es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 18:25:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso84487b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535134; x=1784139934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=;
        b=R6fNoImJIB65+ZMz/VpvGr7x5ZcH5zJODn7VckrtpqXl12c3+xS1AQ/FOt6Db4C8wW
         m4mQfNPgAaITW6xD15bmkycDbm2d3P+7autDCThz8wC28wwYq6vTJ5uqI48tQqhNngIW
         11pLa9SnhU+gZ/xxL70En+3kFwok6rV56DOOr+Ry/UEuuSK7LovbzZvKnu3GoD1to4EC
         BCV/WE9X0LUrKywhrJOkjyTZTkFhBLSEaFpZ0Vwi7owHh2UfkDKWzBczDnvPt/LPoHPG
         uG00+kU4AJ5sQtDwZapNWLfsPWlOGMtKf/H1rmWTE8crtuDgtp0NZB/DodUYItN06XDr
         HsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535134; x=1784139934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=;
        b=cjFu7k1hYHIacNbcr3s2mEGDJTI81DLKljFTkoe/fCadUttLsIBzkTb0VVO+AK2wQ4
         xzgNPZ4PuwbkUtWUFvruXuCMCGH4znxq2Ck6LB6GJT7Z9S/yhgsGj9Gsn/gBr6vU9C9V
         tUeHtbj1TC9idYRMWz7yGWqeIlqgiiUJDMT9F2WFSuk/V+Wsm1hMS/BVCWy38jO5UhjL
         NutbPkXhqWEsJgFkcyZz64RtN7zyI/RbbcKm6hx3HNa8Pf1btgYVTPFaOX5A02XvQoWu
         ri94ezxf5X92eOqvWCVXyY7w2PvaWWI3aw9wJw6nnbUE7twfmrGIWBGObH0czxxqSgJJ
         BChw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd/yH6CXKchJKHYGYKLeTZByrA+57yhPqXzhKZfKR2KZe5HE9dS/bRy7ihMeFbSjlzoizt+KIPKtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvLMglCp2ATti3uLLxtPxDjf+1XBzin15SykHj5tAUOnigLY8E
	tuKP6BUb6I8z0HizhoYXN4ypsTIYWy/c7VA4LLrAWqLI2ARPoiPcaVHV3FQUAyX2ohIT5lMZXVx
	9qJF+H3D2057CxAVQicDD3DAoAcOKOBLKLOZn34Lsmk/QfvU5n+lDfg1MdjAZdDk=
X-Gm-Gg: AfdE7ckJgoDIPg2UmnlhGwcEL294GyHI1YZ9Wz27j31Jv8qVrP2O+1TamgNibzakBrB
	BiVXS5PB2DFqZS6DtbKV2gQHjNGWueBordPM2kbUSzy/kbJak9JvJS8cBErkvB9g+2y9ttmUsUk
	YLDo9Aep4515rHRvlCyvt/wYZXMdEdZE9hS3B1YNJNcw/i7lWXJk9O31UhmSB2xY33vfyCbYj7T
	IAIC4ZvSNRScpt3j/E0YyDRnO5aurZInmQeL74PJ5CtJfpUHcPRCVHjaP79MwuwcLvME3OuIIa8
	e9pzJDmWel/wXzl3q7ZyN9TaAw47sA/1NwlDRwIkPrqQDtAoR7qErhwYftC4COJpMp1cbf2uhKH
	PwDHikpZO8fHEZwn6gSb7k8JwSvag8aq5RBWybUNdCg==
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9acb:3ff with SMTP id adf61e73a8af0-3c0ba29e14cmr4396681637.36.1783535133981;
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9acb:3ff with SMTP id adf61e73a8af0-3c0ba29e14cmr4396641637.36.1783535133447;
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:06 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3OSBTYWx0ZWRfXzZC4OhaogcxX
 9IGt1BviI9A8ltNKxAk06VqxgQ8jlo5JaARnWSoHuOtMn2eQCfp8LKw+JGUkGC4qXIeLcsfsNUt
 zuIRCiOrP9fz6+MEOymo4WCUzKCEAZI=
X-Proofpoint-GUID: JrJg0a-lYuniZtRdWyD-Uc1_xg0u9Gd3
X-Proofpoint-ORIG-GUID: JrJg0a-lYuniZtRdWyD-Uc1_xg0u9Gd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3OSBTYWx0ZWRfX/RVWS4EHW/vZ
 C+hpmRrhbqVa7E8NiOGozaqgwUu0aID3g8zAPCUCyd63pR+UVIxRqckd4jKVsrEvw8vHF+BYUpy
 g1zHq8Wg4m2casuM9gwveOnjUqq394s+6Swnjc1kRVzAHtJhBSx5WQ5XPKRtIeQQWCNpwfUdaUx
 x7reckavJOick0ls/1Z0J5kl7K6P43ai3i+4KmBg0YpMLVXEnqAFYf0NgAPVdS8PFMFLBeQL4C1
 D3wVr5xPxHGf+yAdw2Qjfw66Wjelciy4FQ+8Zc1aou965ZWPcF831JLqiJtdGmME//cg7aum3tj
 kQ721EkeaSOKQaRZ4ay+7rfwDkvlrbHoNfpaIs2Ov2XD4u1fAdK3lVfbGfLixt1nvdNIliOGm4E
 NOQ848HaG0riAW8Lppf7LOpN9M8pnfAD7AIENHWHuFScPjQdlXJqVqQqag+NR2s78+WEUihsiY/
 tbmZ80HET/ABKrdI13Q==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4e961e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z3K_AQPDDkgJnXkyaHcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080179

Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
that provides clocks and Audio Core CSR that provides resets on Qualcomm
Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1ec24951316842fbe3b0bc5c0e7e80c0d9d8d637
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-audiocorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core Clock & Reset Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio core clock control module provides the clocks and Audio Core CSR
+  module provides the resets on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-audiocorecc
+      - qcom,shikra-audiocore-csr
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: Audio ref clock source
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-audiocorecc
+    then:
+      properties:
+        '#reset-cells': false
+      required:
+        - clocks
+        - '#clock-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-audiocore-csr
+    then:
+      properties:
+        clocks: false
+        '#clock-cells': false
+      required:
+        - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@a0a0000 {
+      compatible = "qcom,shikra-audiocorecc";
+      reg = <0x0a0a0000 0x10000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&aud_ref_clk_src>;
+      #clock-cells = <1>;
+    };
+
+  - |
+    reset-controller@a0b4000 {
+      compatible = "qcom,shikra-audiocore-csr";
+      reg = <0x0a0b4000 0x1000>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-audiocorecc.h b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0e64a42523f1ec4213ce8cbbbe6f8262d414f0eb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+
+/* AUDIO_CORE_CC clocks */
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX				0
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX2				1
+#define AUDIO_CORE_CC_DIG_PLL					2
+#define AUDIO_CORE_CC_AIF_IF0_CLK_SRC				3
+#define AUDIO_CORE_CC_AIF_IF0_EBIT_CLK				4
+#define AUDIO_CORE_CC_AIF_IF0_IBIT_CLK				5
+#define AUDIO_CORE_CC_AIF_IF1_CLK_SRC				6
+#define AUDIO_CORE_CC_AIF_IF1_EBIT_CLK				7
+#define AUDIO_CORE_CC_AIF_IF1_IBIT_CLK				8
+#define AUDIO_CORE_CC_AIF_IF2_CLK_SRC				9
+#define AUDIO_CORE_CC_AIF_IF2_EBIT_CLK				10
+#define AUDIO_CORE_CC_AIF_IF2_IBIT_CLK				11
+#define AUDIO_CORE_CC_AIF_IF3_CLK_SRC				12
+#define AUDIO_CORE_CC_AIF_IF3_EBIT_CLK				13
+#define AUDIO_CORE_CC_AIF_IF3_IBIT_CLK				14
+#define AUDIO_CORE_CC_AUD_DMA_CLK				15
+#define AUDIO_CORE_CC_AUD_DMA_CLK_SRC				16
+#define AUDIO_CORE_CC_AUD_DMA_MEM_CLK				17
+#define AUDIO_CORE_CC_BUS_CLK					18
+#define AUDIO_CORE_CC_BUS_CLK_SRC				19
+#define AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC			20
+#define AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC				21
+#define AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK				22
+#define AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC				23
+#define AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK				24
+#define AUDIO_CORE_CC_IM_SLEEP_CLK				25
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK				26
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC			27
+#define AUDIO_CORE_CC_RX_MCLK_2X_CLK				28
+#define AUDIO_CORE_CC_RX_MCLK_CLK				29
+#define AUDIO_CORE_CC_SAMPLING_CLK				30
+#define AUDIO_CORE_CC_TX_MCLK_2X_CLK				31
+#define AUDIO_CORE_CC_TX_MCLK_CLK				32
+#define AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC			33
+
+/* AUDIO_CORE_CSR resets */
+#define AUDIO_CORE_CSR_RX_SWR_CGCR	0
+#define AUDIO_CORE_CSR_TX_SWR_CGCR	1
+
+#endif

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F69E4C901C
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658844; cv=none; b=dwTCPVOa7tI0Qyh6cTEApH6e1UaOnkg8LR5pl2A4ZGogb1978jGnO6FzJWEdQqoBxFQe20g8EXAbRwHPxoMQlYksVhAmr7jL32uSt7GyB8inArp8c0os5Y2wY0dDZBoNEi0/B2IzqoyfH4AxkZmxU/eQFxjVLkWE05562u9xVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658844; c=relaxed/simple;
	bh=AawuB1oGtm2VcWy/cNDO3ngim5IUQy6JDtKTA328qNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ew9z1CO3aJz1FOy3IJyXdLAThHtXzEVZpicxopodevs7VqGSEOk/FhR9yW2OMbTi9On3pgfBPAszrryfDiKqst98CiVaxJV4ABHqEhf+lBPjTjOSEn1a4dBlp7QI4gQDfAjTdSth55WK0SwdhSMTMG/lAhQXgPugqBfUjmWaAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGkUbw5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhnEuGWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGkUbw5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhnEuGWz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655753fK3529003
	for <linux-clk@vger.kernel.org>; Fri, 5 Jun 2026 11:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9upK7aJQL0zjBpJsJSlz9ZdlDK5n6ved3+bFQjUiPc=; b=aGkUbw5ElavX7S5F
	lZNlHKvLO3letO1xvmCgOfmN2SrWo0FJjoldNBdbWJ7RhGqLQiv7KR01FyTJNc3U
	Fi1U5Jf1UCKz+V8/Si0CZzhVD4+qd4fFrYhqBe2TjBpMMDDN1lclkbGle+VOYzqe
	tT7IXKBLPLTpPYpsPqLuUyAgRwujsyXXNxYOjMiQTd3zvYa4OfDttCuBTPSBuT+P
	uO2zi775NICbfOl/OnWYVlKoK2eM+3qNF7QVaLMhEnkqgkGIZISM6BL1DBJtKtkZ
	B7mlxZEv8QXbz4ydlmsLDfJo6egPcplkmh7g/aQR85L1Q4MvIarc/EVv6zB1QCsu
	xkrjxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp90fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 11:27:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f3e4728so1225382b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658841; x=1781263641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9upK7aJQL0zjBpJsJSlz9ZdlDK5n6ved3+bFQjUiPc=;
        b=NhnEuGWzUWmHfhZWEbTvS9Xy26BzBeL+MFJaCt/ycSdYlXOuiAWXmgqQqlbKKNERp/
         Q/j2xOPYvl7BPYplnPwjG6D5fuIpoMevguzBw477VOAGCyVf2wDI2ammC+hZlg216d5u
         kd1ryB8bHGk7f2kTNffs8yLG2SBJ/El4XxhumJMX4yayx3q1HdAnHlB411PTpQFsnneg
         hKYlwv7MZUL0Hk1cc1d/MPGIjnSgAYq+j4LP3z1B85GpMVKfFVYfEVCe8w34LHAaSLvi
         YUyjs6Jzn/35vwoQOhVjrQdexIru0V1DuNQJVDwTE3TlhbhdC2dNhO4ZZ1dQxevvHZa2
         EGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658841; x=1781263641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y9upK7aJQL0zjBpJsJSlz9ZdlDK5n6ved3+bFQjUiPc=;
        b=eQFCD+gantjRBq1nsN5NKvjgzb8RmKPfZxl+UsF1pbhpTpUvP3sMINBMEbHDToDGrA
         IxKPgu2+JqsUtszlpKtIjgg/rDgvty2pcWOmUNi59NSsX7id/tR0/499rBuizCPZwPK1
         l2yiaAok7CCHk/8cSGeHye1KPFUcbYEfC+Fh97Vl4ujR0PVNKZEOaewfceTWhi6AGzck
         vaxqA7Oi5wkD3IGfOmWiYHU59F1U6ONTxFX+sYh+nEaZ/RQn434t2Y9q0W/4IceFQSEK
         EAbWIjgRVHX0YtAwjD6JI1DcSGuZ7sWMB7UGFrVuUPwhfwD9TPyX9fsj5q8H2xDJNpBs
         0kqg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ss0HxzHuCsGuUGlg420UZI8z04ih6bdTtU5aQ3Trh9or42OOCo6oggMlINbDrxm7zfBxAYZ+akYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcckKuj1nbPxPTEJwEkWnNOrwIYa1K9j+ujUeEF2DTc1JzM96
	34P/K4k+ve1ANmq9zUHDhI4XOLsj5Gh3TWc2mdbzYO8/HQdB5XAIBJjG227gt/HNNW7vFOXtAqg
	MLt0Mnkut4VEaJi5xNnn4G1H4P+WZxvkVlbMe46VTthDZAap0fC/n5xz/Qzve3DY=
X-Gm-Gg: Acq92OEiCxZyuMsp1PvLQVzAD8K7EQO5HrV060uAmt2qluavp2z0LY04wMWPlIme264
	8x33JE54cGcKEPO0gwio1wweNcHo0F06zeUBpQmEWufWiGnHI+fcF0ezXdwGNGQDLIb6DnCucS5
	c8kaINJ0mVOzNaQoA0Y8EEi4NLAZhtnvmFVgouJrFP4eOI+N6JdZivyoL7fu+WDSiUxmaOh0wMq
	x7C5QJK5IjK4s/54IwfV0MA2vS9uEPVCg3x9nQ7afB7gkaaqHTsOUkqmjc/SHK8GQB+IbVIgSbb
	FnXtQai+JMGGYNOnP+RYXNGlXvkpITv/Iqd7wNSnLC/o+XoUzCqfsFKi2XCDYCxDIuJOvw2sMuN
	EbSZNsApdpIyZbd9Uv/TcS8UoVjcsELhFvJUxfPHXTvHNL/3Yo6H6zhZ7wqKTs3Q=
X-Received: by 2002:a05:6a00:1d89:b0:842:4f49:6bfd with SMTP id d2e1a72fcca58-842b10677admr3048304b3a.26.1780658840631;
        Fri, 05 Jun 2026 04:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d89:b0:842:4f49:6bfd with SMTP id d2e1a72fcca58-842b10677admr3048259b3a.26.1780658840115;
        Fri, 05 Jun 2026 04:27:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:31 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
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
X-Proofpoint-GUID: XGVtDkKiKFdXTJy04usMr1RXBbF9SdWb
X-Proofpoint-ORIG-GUID: XGVtDkKiKFdXTJy04usMr1RXBbF9SdWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX5wx5PzRkbVHl
 DxdLvYV78T41/tokME83ism2pZgaJsi2PQQKYdlvBCu833aedDsD93c7br0uRTlScliL57NDbOY
 +eTqp4sTdX54IQlF37yQ4WjL02FvBLEX/Qzq5GhcfbKAta/kRjpYzpqOXt/fBeY3xBlzp7q5Ezt
 +aH2cZcEB4rBmn8NIN8GHdtnXg4svodkq1AloMg3r8YbpFmxetMVVnj9eINUTBJ0X8VKXxbVTAa
 DZMRBOOf0CUIr8dTa6NrTosB/ZE2CkMyAVtNizE1duuYqhsdEAtH4+Svujw7L0SM/ScwvpQCXbp
 biWPf0remNp8i1IQhjm686gK7BgyqM5d8VRytmQulg79pGBdiaz1R+MphyqVfhLlIsQ84yaGl8a
 dz6z3+ijV6nn66kaqHy5cCOOH7t5x+kwoWNADGcmft/CXIbgD0DmkHXTJCfO7+LHawV0K+nnfG/
 QNEJiHEAMg6MttGqLfA==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a22b299 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PWWK3QiPue6MOfw6qxEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
across variants based on Audio subsystem enablement as follows:

CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
IQS: no clocks/resets needed; no SoundWire codecs

To handle these requirements, variant-specific compatibles are introduced.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2ed1d9d871175ff868584cfd606e14c5779f1766
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,62 @@
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
+  Audio core clock control module provides the clocks and resets
+  on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cqm-audiocorecc
+      - qcom,shikra-cqs-audiocorecc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: Audio ref clock source
+
+  reg:
+    maxItems: 2
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
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@a0a0000 {
+      compatible = "qcom,shikra-cqm-audiocorecc";
+      reg = <0x0a0a0000 0x10000>,
+            <0x0a0b4000 0x1000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&aud_ref_clk_src>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-audiocorecc.h b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3052feb627ff3dc8beb405534ff94bf75525fcb2
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
+/* AUDIO_CORE_CC resets */
+#define AUDIO_CORE_CSR_RX_SWR_CGCR	0
+#define AUDIO_CORE_CSR_TX_SWR_CGCR	1
+
+#endif

-- 
2.34.1


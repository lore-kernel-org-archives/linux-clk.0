Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D83384247
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921007; cv=none; b=BxSjDmbvTEeSZhdkKHqqXt5Dm8BbHIplpWo+oBEOPzhepdKdFTdH8LIBpOTxMl0nxRl2Aj9uWZS97crrvVn++JY+WEUnJG9MugtUvHM842Mqb7CB0s+cgXeJctRCWGkbh79MBJHSradSYh34LtQe3MFkryRy58xf65micbqLbqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921007; c=relaxed/simple;
	bh=kUbZ9dcJpCBm8LNy6lv93okg/giV3v+g52Xhyqlg/aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0u7FEKZOGe+6ezjpVzNb5gICfGf5EEsFo+pg9DctAHur6QxYNbyYlF4fJs4H0EDW6XHzCnZ/SGEizFSg1hI11PtC5wgnwTIffq0Cn/+CSNTpTYePj2xekSQrxBJPUvVAy0Z/nP7lWGp3lm977dwje5q5LGc83Pvs2FieCGVXtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fySKbQoQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZGcDq88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fySKbQoQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZGcDq88"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73xG12544624
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8goUPqYgZwZuq1DitNWak0dNvB+tZ1RH7j8j2+02qo=; b=fySKbQoQGJKg4w/k
	+DgJpYgVr+xHkFc08O8PoNa2nMfJ/Fpnb2+XNNuIccNAnAKKaxNEjX/EKiiYE2jY
	gY+aIiUAmafbB/VcEa+rSumCygG1h1uXJnifDO6L489Qd0tgPgIbJuMjVv0xnDar
	GxY33iCgeMGRSICcmHXMZhqrSto96Hc3qfTHB448JqBsXMLMNUKNGStv8UrfN6QJ
	rIr+AqKY33JoGU2HeEosbxyO/ZBziUjp+yH32bl3cCtFPlkAKOFxIEl1jeyKQRTv
	MX9bwr/R07Gpo6kQz9Zm5+LLS2RA5MWPeX6cTIL/8izUi6XDho33pruL9jHGA1Nl
	mmXyjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0957sdc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso10042631cf.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773921004; x=1774525804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8goUPqYgZwZuq1DitNWak0dNvB+tZ1RH7j8j2+02qo=;
        b=fZGcDq8813BpOxPknXEU65HP68zkddQkBa66CRNOzIgf9QwEsbFKtyBIEiKDSju5FH
         vuLX0rT+hqZqPGVsj7x6jnHRx7qNyF+cmD2cnNnzxxnqh7DPoyXu7mJqY4hO5BJx099y
         skMASovIiHLlTA4D2bNcdT+kJI+ndWaB3L4XdSsbmlV4DIgR9isB4qAvjAscvE9Q9tob
         OnxbZwE6JtTc+BL97MlirJrTXRpNYxen7rCjnB4JYchr1M4hpGsL6U5NpA6Rmk4j0vYu
         qDkWxvd2joJ4/ifdbkSqOM4kP3NVTifiW7r+83Fi56M0PdgdqsMiC8KXP3gNE9lQcClS
         VtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921004; x=1774525804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W8goUPqYgZwZuq1DitNWak0dNvB+tZ1RH7j8j2+02qo=;
        b=k4TBuTW8bDJfzUECQDvFkKJbNURVMhE3M9zZs+vPv4wLISnU32M4ev4ubEo1BcTdeL
         Nx7rZE8paTxUmiwf2GftSot3YBJUjsTwRo6mobacM/vG9We3ul5IbAW9l3IHRcfz9lQv
         HsOvrmW/VWBcyRhvxahWCa3eQWiOxhLsXUD955j30INxTYvCL98ZN6l8NoVFgeV6iwPs
         JEvQGm3CgLDnBTF7eaKcR9VkSXAOycbdv2T+5vtPOl8/eQviOc5FIAtxUlyU02AbRCJY
         BFmHGSSbBp8YbeUybBM6cxc4t5bZS354seLI0DYxWRlCpdHc3fh42+eND2zkoqYsFGVx
         OFhw==
X-Forwarded-Encrypted: i=1; AJvYcCWUMqzVaC7AdQuvcATPEE/smcl4H7+CfFDUsHK77JcoRCJltAGHH2y/Rb6lJv+XdxPWdrDZq3sCdrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy3LSDF0QO3tFuehxrGaA9MUUomV92avaNm/MmWq5+l1N2lXV0
	DcyFY0MadkzI81IlUYbX5wsLcOv9x5C290Cp0o5uVtFAoABfsApYZLEZoDSYVcEojO257PBsE9B
	jD8vjAWSqfKbM99sVjrigsOm8rBXVcq/4Ds5DKcRmrkzH8lEJzAtyceCSVBB0MKg=
X-Gm-Gg: ATEYQzzQ/a6RCR2XsHRN/OhGzmpLrak9izPVE0lMNTIxJ7nfW9vCpa9o/BeCg8cS7Ay
	YVezV6NRychWe8aFF0ewgNo1jbiGUR+T2JVxI/skyKUiF1xS4NYoka5Sxpt5kcdfLl2iI032YEb
	TI7Q1MR5zHnagViugx7xVNMRKAr6zlZpvjt40RuiUEpiCJ4gXkr8ThozIEikAEOlsjwjE0UMqyO
	KNY341Z3kf8SFzafgGOyDElRTkMQRYkWP3K3Y0FULLvprsT12MTlw7TL7gVhMLSSiC74mItHFE0
	TfU+zvbnlWDGzsYL9CD0amszJkh2M5x/vNSMQNDXPvSRIvw66FxOLk1KYhIRI23o1LZ/wuZkuRf
	+xVogrTVtJ8FLtsYQeBH4CTxG895dF24GTbIHNuD2x2vi
X-Received: by 2002:a05:622a:1a81:b0:509:1226:83e0 with SMTP id d75a77b69052e-50b14752d37mr89790651cf.5.1773921003985;
        Thu, 19 Mar 2026 04:50:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1a81:b0:509:1226:83e0 with SMTP id d75a77b69052e-50b14752d37mr89790171cf.5.1773921003453;
        Thu, 19 Mar 2026 04:50:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm66384605e9.2.2026.03.19.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:50:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:49:42 +0100
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-clk-qcom-dispcc-eliza-v3-1-d1f2b19a6e6b@oss.qualcomm.com>
References: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
In-Reply-To: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8809;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kUbZ9dcJpCBm8LNy6lv93okg/giV3v+g52Xhyqlg/aQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu+Ll8eeD2hiHNv28DTIQiAjOZEoHAwrrMcc8v
 44mHoNYI0mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvi5QAKCRDBN2bmhouD
 16CLD/43myv8RIseB1P4+h6iW1H6ZYPyPFZ+J0JbO5SGziUVOKHEuZ736MckDCDxGejqy5xD6AC
 wMWpBx45JoN12s+1wteAY56abl1fXIg29SC2FjlQF1uYP6FTDnVUWkFfdyWHNEkpy33xBCBxQwz
 Gr9ungpt6oJwvLJ5SPTQkzjEIwpG8uOL4vIul3lfLO+loZNVFKWEMbYv4G+7W8YkYsgRnHTlg4X
 FTp7r6BPQpvipLYje9PRxts9B4xWD6cE5sxQlXarDi/RBvnb0tJwdskz74+ea1DrqpHiN1MRPQO
 kWhNryT6Kb66nJa/L6cW2XwBuH+A9MwhE0f5kinQw83KwSGRfu5y/2/rnmQwIcNC8+nzX4w67uJ
 RfuKFIqvKtB0PfKJMwBD1kg7d/ihOfrYoKEIVXQeal5CPl6Y4FIs0W0WHytG6z7k3RQ90xKz0cM
 2YQCqjITKlMsSJiTYorcodyn4PlXqqrp7ea+dOr3gzHouQot4xOHnDPvZGg37cohNJmep3CPCCL
 upWT7UjFdVOwwkoaAfkP7GeSwMBKzkqZykn1I55lar7T/4LwspldrZxc7p9PXZHyC2F14407PN/
 Q1f+Lov7HpDDHxjc5LUrIqO/+bkmJOSEgbGfCnxiZfAZm3xvXJ0kid2yxTLZP+ZscJhjPcM+DUe
 s7cow+DiZB3H4FA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: E9NcS3D87yVkan_1wWZyTLGSwu9lvA3Y
X-Proofpoint-GUID: E9NcS3D87yVkan_1wWZyTLGSwu9lvA3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NSBTYWx0ZWRfXwMz/uUM7feCM
 yk5uCo9acEvm8vJYUKBEGb1PQfGxrzSLiBjfOn3kRotlqgMk13HQpleB9sOBXRen9KcGDxzPeiS
 zH1ltoocm1FsyQxh08yVODadqpV5BfnPZjiyUDBMy6hGDne36XVup2KJZYodrnZSLd8ColsnYUo
 4eY8KPw+Yq/OJn813gvdhm7AA+rsD7HrCT1b/UgsVOgd8HdhIaF53zPOMrTnCoziuKGc9CUxiN4
 zf/0c+kl7RP8asbv3JU+QdzqtbzbDZpctmlx2vUIjo60BCkXW6iET9cgBQv2lJ7/JMw+A16AgcN
 g7azM/zZlPD9iFJTC+O5YN3VbDVEqs4T4BVVPR6RN5BCKNnEss3EvUmQCeNREhjfRk7PxK5s5FE
 B78jOWIAaaQpS2WUvJi/GsZcMhcwQJ9+YnHejPQmKLWeVIC+8mhN1D7dBNpLNAIo2mJzK9yJYPw
 ScRpZ1S5+1siYmNIK1w==
X-Authority-Analysis: v=2.4 cv=RZedyltv c=1 sm=1 tr=0 ts=69bbe2ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=I8plYztaKvtxx8zCzTMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190095

Add bindings for Qualcomm Eliza SoC display clock controller (dispcc),
which is very similar to one in SM8750, except new HDMI-related clocks
and additional clock input from HDMI PHY PLL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-dispcc.yaml          |  96 +++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      | 118 +++++++++++++++++++++
 2 files changed, 214 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
new file mode 100644
index 000000000000..0935ec185dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Display Clock & Reset Controller for Qualcomm Eliza SoC
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
+
+description: |
+  Display clock control module provides the clocks, resets and power
+  domains on Qualcomm Eliza SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,eliza-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,eliza-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Display's AHB clock
+      - description: sleep clock
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+      - description: Link clock from DP PHY1
+      - description: VCO DIV clock from DP PHY1
+      - description: Link clock from DP PHY2
+      - description: VCO DIV clock from DP PHY2
+      - description: Link clock from DP PHY3
+      - description: VCO DIV clock from DP PHY3
+      - description: HDMI link clock from HDMI PHY
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
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
+    #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@af00000 {
+        compatible = "qcom,eliza-dispcc";
+        reg = <0x0af00000 0x20000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&sleep_clk>,
+                 <&dsi0_phy DSI_BYTE_PLL_CLK>,
+                 <&dsi0_phy DSI_PIXEL_PLL_CLK>,
+                 <&dsi1_phy DSI_BYTE_PLL_CLK>,
+                 <&dsi1_phy DSI_PIXEL_PLL_CLK>,
+                 <&dp0_phy 0>,
+                 <&dp0_phy 1>,
+                 <&dp1_phy 0>,
+                 <&dp1_phy 1>,
+                 <&dp2_phy 0>,
+                 <&dp2_phy 1>,
+                 <&dp3_phy 0>,
+                 <&dp3_phy 1>,
+                 <&hdmi_phy>;
+
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+        required-opps = <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,eliza-dispcc.h b/include/dt-bindings/clock/qcom,eliza-dispcc.h
new file mode 100644
index 000000000000..30c6d856fa98
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-dispcc.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_ELIZA_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_ELIZA_DISP_CC_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_PLL1						1
+#define DISP_CC_PLL2						2
+#define DISP_CC_ESYNC0_CLK					3
+#define DISP_CC_ESYNC0_CLK_SRC					4
+#define DISP_CC_ESYNC1_CLK					5
+#define DISP_CC_ESYNC1_CLK_SRC					6
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				7
+#define DISP_CC_MDSS_AHB1_CLK					8
+#define DISP_CC_MDSS_AHB_CLK					9
+#define DISP_CC_MDSS_AHB_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE0_CLK					11
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				13
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				14
+#define DISP_CC_MDSS_BYTE1_CLK					15
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				17
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				19
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				20
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				22
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				23
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			24
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				26
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				28
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			29
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				31
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				32
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				34
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				35
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			36
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				38
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				40
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			41
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				43
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				44
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				46
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				47
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			48
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				50
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				52
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				54
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				55
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				57
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				58
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			59
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				61
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			62
+#define DISP_CC_MDSS_ESC0_CLK					63
+#define DISP_CC_MDSS_ESC0_CLK_SRC				64
+#define DISP_CC_MDSS_ESC1_CLK					65
+#define DISP_CC_MDSS_ESC1_CLK_SRC				66
+#define DISP_CC_MDSS_HDMI_AHBM_CLK				67
+#define DISP_CC_MDSS_HDMI_APP_CLK				68
+#define DISP_CC_MDSS_HDMI_APP_CLK_SRC				69
+#define DISP_CC_MDSS_HDMI_CRYPTO_CLK				70
+#define DISP_CC_MDSS_HDMI_INTF_CLK				71
+#define DISP_CC_MDSS_HDMI_PCLK_CLK				72
+#define DISP_CC_MDSS_HDMI_PCLK_CLK_SRC				73
+#define DISP_CC_MDSS_HDMI_PCLK_DIV_CLK_SRC			74
+#define DISP_CC_MDSS_MDP1_CLK					75
+#define DISP_CC_MDSS_MDP_CLK					76
+#define DISP_CC_MDSS_MDP_CLK_SRC				77
+#define DISP_CC_MDSS_MDP_LUT1_CLK				78
+#define DISP_CC_MDSS_MDP_LUT_CLK				79
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				80
+#define DISP_CC_MDSS_PCLK0_CLK					81
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				82
+#define DISP_CC_MDSS_PCLK1_CLK					83
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				84
+#define DISP_CC_MDSS_PCLK2_CLK					85
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				86
+#define DISP_CC_MDSS_RSCC_AHB_CLK				87
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				88
+#define DISP_CC_MDSS_VSYNC1_CLK					89
+#define DISP_CC_MDSS_VSYNC_CLK					90
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				91
+#define DISP_CC_OSC_CLK						92
+#define DISP_CC_OSC_CLK_SRC					93
+#define DISP_CC_SLEEP_CLK					94
+#define DISP_CC_SLEEP_CLK_SRC					95
+#define DISP_CC_XO_CLK						96
+#define DISP_CC_XO_CLK_SRC					97
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC						0
+#define MDSS_INT2_GDSC						1
+
+#endif

-- 
2.51.0


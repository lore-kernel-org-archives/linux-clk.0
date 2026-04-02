Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB66366558
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110581; cv=none; b=iYlRfZLRX+XkHfjHBIVa9besWH+j2YvCOLMPm/siNmHkVsCcgFYBTqmpNcrJZDUgvn1m7CZWVqWXmqJCLK1quz6d3xrn8KI85kNYLteZ8EtL3qh9ZsYFlZX8/Ogr9Xc4mZgrBkt/vvb95ywWfstVuRMWxYCwrM8vnKP9G0szSqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110581; c=relaxed/simple;
	bh=7LBiolQCnRZvqemjauhhN/YGc6Gd2qjG+eDMRoIX6zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXU+yaWKFDsjqKMmvK/1lwvHm1lC1Qi3d1hhblq7JkDrxHnjxvQsYqIzViTJu1tnbQh5vlxCTbbeVlJqRL353/3C2HG68BIP6fhWmiKx0AZsDr0a+IlNVQZvSBwZbh+lld1H04PrBSvnDPyybvXAjw1+P6eTi+QRaTHl2DLo6BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/ugsWhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCo/XH48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/ugsWhw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCo/XH48"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M42si3745952
	for <linux-clk@vger.kernel.org>; Thu, 2 Apr 2026 06:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwKlEZFKuVVGAIbg74e0t2WyYC1u6+RUM14UYJG2vAA=; b=L/ugsWhwoTOFjJHf
	LvIbFoT2oxUhJO06YHPYHIe9c2eyEKOsYRgssoPTivqN2FwPZSr9Aw6zXTYol07V
	FLgQrc5XsWobaA/k0R7sW63/71w6KsFHTsaxh7486Ue58Z2y+hrE6yVETJvjWjFb
	WNAYe5O8VNOY+NLLamnzEeXTXAMqxtF4EnqRveevA+TZt+eC1U+O0AlCRc1o6ZM+
	sTZXpdZYy9QcZQT+KCjF2HCE3PRkSOZqC+N3UUITSHlDQUXtjq0XBZ5bSIqb11S7
	30hsoTcyxRTeEhTKEc0rJoCC+qo/klVimIhz6c/5oSYvpdyxYSVURu1x9bCQMhPT
	mIOWWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324kpgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 06:16:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24308165dso15147975ad.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110578; x=1775715378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwKlEZFKuVVGAIbg74e0t2WyYC1u6+RUM14UYJG2vAA=;
        b=RCo/XH48oFYPkTRAWH0niKdupeKx0345JujHMrx15LpFlDqKWV+hYWbj2rQh/eDKM9
         xaRZ9pM27BcUkn4rlIiWDEReQgy3mg/SCERZ/B8Z1z0+O7MMgUI6jnk0TnxHEqhWZqxf
         yIOQ6FI9lgs77y/NhmckCLAh/OqODSQhvUECe0aHtUjucob+9R8ytUsQDVysnZWOUbcs
         wXLv9pvJRX7mPUEkh7XOQ9Aty7N86zcVUwBd6awcafh0qI+82y4gzzB2mrPcfTSs3Kzi
         CZMRi500dOYr/asX1/1RwuxvaXMHIHDpdwPIZCQML+Z44lOfN19BmiaAJ3eov4gsJi/I
         1ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110578; x=1775715378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lwKlEZFKuVVGAIbg74e0t2WyYC1u6+RUM14UYJG2vAA=;
        b=C+RqfPcJ5XnJkzt306B7X1bpZPDJa23Z7WAmE1nOcDvsQomkuUcj3U95w3S5lDSX7a
         XHFXDjrkykLsaX6JDE+TgX+GYEw+1Dc07U1K4yJAMQ+movVKBYFNdYYTJdHvP0IUT9ra
         0GrYoqViSVoidFoIS3lm6FaDs87cdYxHxezDkREoUZOBbPDEsP2+MN+fX8IsowKX9skT
         B/LdVg4WoEgW/r6BN3G+ye44s/rBe/yWsdaPfIlHB4JA5Mf6/c35F2vzMY5RccX7QEe/
         z0vgiyrq39oi3xv8KIFwcii4CzLtc/yK9R/VdRGq5j58RinAVYr6qPxiuatupOw/NYE9
         /2sw==
X-Forwarded-Encrypted: i=1; AJvYcCXesUZcCx77mhNAGRbxm78bVZmwZ2Q093b+3dEFWDqz6y5eDr6Nu0mzBVir6t1pdoySyUSavCqcI6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfcVhT6Se2s7wtqn/xMmH9RjLNSXMoU16yMhZHjzKEBVspq41r
	EatYaUYumFCepM04+W7nd3/vV73gKTQVKgtEdt7IFA2cVSfdYFQlCavbE/XFoc0A6+eb19Lr9XY
	tACyrHRRczu97wERskx3fGwJHm3hRbp09AlwRCSKseJOkqHhlYOO5WEClm2hN7wc=
X-Gm-Gg: AeBDieuymx+o4IB+TweoQoQpiJcbUe9xlTCfoQKVgUN0qn5btM5OdyafL+k7LY9K6ON
	Ug016refLTaUEjdM21VEfsnSrxrLof21ty6UxzlQVcP1VLYh7ybbO/xgPd98fSHoaeXlcYRcQAf
	TNN1ZuB01uXwQlOmu7Fl/5M4vJ9/lzOQCg480UaQ8GAiVe8q0NTK2hIgX2nBQyTbmhftN6/w2Ta
	v4476Ek6vtWGpD0CyHtK8LeOPMBPqi4BX0zVL3kZ7IQBpGCyMGM0pb6uVGpGeBUUrn5/d83XrMj
	fpqEdPgB1YTgWXOOt5PeU7DJXP/ZcsVc6g81KEFwfx5QArYIYejWk9+J3u9FS/nNFmDYlRNCHCe
	sf6ohfl6Pb4A3f2woUsxucBPi4ayKEUZzaNesbN5yxZQQCWIFUkOB
X-Received: by 2002:a17:902:c94d:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b269ce4fb4mr66874255ad.46.1775110577885;
        Wed, 01 Apr 2026 23:16:17 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b269ce4fb4mr66873845ad.46.1775110577405;
        Wed, 01 Apr 2026 23:16:17 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 11:45:43 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-glymur_camcc-v1-1-e8da05a21da7@oss.qualcomm.com>
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: xgw6S8EaTw66_uQmylMcetEIU9VV-Mh-
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce09b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Dk9EUgma8fqr-VUMxRAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX5fv+r6Psmzh/
 qUv7WB8BsmXsvyUaKlQBmEOGzPDbx1JormkgjulhtCDaeSytHM5Q664F1mAvW4XgXXn4q/AhJrz
 0vNsjqw+55A8Ps855bDMBP0sR/rw9H/Jj+SQ87A99KFX39HlhxTfe/fxMiSpgQD+mP2dyykfoGd
 EJG02sg6Ketp+ixU1YksY2IcqwWYU3PhCgJ4MKQ8jbO+CBEEK0HzH1gNJccjWKSwxMA1JsyD86r
 x+PPERAx5AATNhworaX3Hit1s5Eme8M7N23NJ0T4xvDm6e4BuI37Ciu/3BFbEqnbmafSO7jf7EQ
 1RjfvxSAI9iiirxD19f/Jge7s1fCaaYFPsbXg+w8oyEFVA+ZG81c8QOXugrZRddcqUrAF7Mztph
 lAabM9NQPHhPX2cqHPLRYw3St5SDETFrwj5AzzWbfj9/b3ry2sNhga9lLmuxda2EAPZYPbjb6QE
 itSUCLO+gW8ioe3XNRg==
X-Proofpoint-ORIG-GUID: xgw6S8EaTw66_uQmylMcetEIU9VV-Mh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053

Add device tree bindings for the camera clock controller on
Qualcomm Glymur SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   3 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      | 122 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 938a2f1ff3fca899b5708101df7f8aa07e943336..93a379a4347cfc83f647e6f52d2af2713cd06514 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -8,12 +8,14 @@ title: Qualcomm Camera Clock & Reset Controller on x1e80100
 
 maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+  - Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on x1e80100.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 allOf:
@@ -22,6 +24,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,glymur-camcc
       - qcom,x1e80100-camcc
 
   reg:
diff --git a/include/dt-bindings/clock/qcom,glymur-camcc.h b/include/dt-bindings/clock/qcom,glymur-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0c93fc77ef268b5971e671c57ea5cfca3d630471
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-camcc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_CLK						1
+#define CAM_CC_BPS_CLK_SRC					2
+#define CAM_CC_BPS_FAST_AHB_CLK					3
+#define CAM_CC_CAMNOC_AXI_NRT_CLK				4
+#define CAM_CC_CAMNOC_AXI_RT_CLK				5
+#define CAM_CC_CAMNOC_AXI_RT_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CAMNOC_XO_CLK					8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPAS_BPS_CLK					15
+#define CAM_CC_CPAS_FAST_AHB_CLK				16
+#define CAM_CC_CPAS_IFE_0_CLK					17
+#define CAM_CC_CPAS_IFE_1_CLK					18
+#define CAM_CC_CPAS_IFE_LITE_CLK				19
+#define CAM_CC_CPAS_IPE_NPS_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CSI0PHYTIMER_CLK					22
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI1PHYTIMER_CLK					24
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY4_CLK					33
+#define CAM_CC_FAST_AHB_CLK_SRC					34
+#define CAM_CC_GDSC_CLK						35
+#define CAM_CC_ICP_AHB_CLK					36
+#define CAM_CC_ICP_CLK						37
+#define CAM_CC_ICP_CLK_SRC					38
+#define CAM_CC_IFE_0_CLK					39
+#define CAM_CC_IFE_0_CLK_SRC					40
+#define CAM_CC_IFE_0_DSP_CLK					41
+#define CAM_CC_IFE_0_FAST_AHB_CLK				42
+#define CAM_CC_IFE_1_CLK					43
+#define CAM_CC_IFE_1_CLK_SRC					44
+#define CAM_CC_IFE_1_DSP_CLK					45
+#define CAM_CC_IFE_1_FAST_AHB_CLK				46
+#define CAM_CC_IFE_LITE_AHB_CLK					47
+#define CAM_CC_IFE_LITE_CLK					48
+#define CAM_CC_IFE_LITE_CLK_SRC					49
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				50
+#define CAM_CC_IFE_LITE_CSID_CLK				51
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				52
+#define CAM_CC_IPE_NPS_AHB_CLK					53
+#define CAM_CC_IPE_NPS_CLK					54
+#define CAM_CC_IPE_NPS_CLK_SRC					55
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				56
+#define CAM_CC_IPE_PPS_CLK					57
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				58
+#define CAM_CC_JPEG_CLK						59
+#define CAM_CC_JPEG_CLK_SRC					60
+#define CAM_CC_MCLK0_CLK					61
+#define CAM_CC_MCLK0_CLK_SRC					62
+#define CAM_CC_MCLK1_CLK					63
+#define CAM_CC_MCLK1_CLK_SRC					64
+#define CAM_CC_MCLK2_CLK					65
+#define CAM_CC_MCLK2_CLK_SRC					66
+#define CAM_CC_MCLK3_CLK					67
+#define CAM_CC_MCLK3_CLK_SRC					68
+#define CAM_CC_MCLK4_CLK					69
+#define CAM_CC_MCLK4_CLK_SRC					70
+#define CAM_CC_MCLK5_CLK					71
+#define CAM_CC_MCLK5_CLK_SRC					72
+#define CAM_CC_MCLK6_CLK					73
+#define CAM_CC_MCLK6_CLK_SRC					74
+#define CAM_CC_MCLK7_CLK					75
+#define CAM_CC_MCLK7_CLK_SRC					76
+#define CAM_CC_PLL0						77
+#define CAM_CC_PLL0_OUT_EVEN					78
+#define CAM_CC_PLL0_OUT_ODD					79
+#define CAM_CC_PLL1						80
+#define CAM_CC_PLL1_OUT_EVEN					81
+#define CAM_CC_PLL2						82
+#define CAM_CC_PLL3						83
+#define CAM_CC_PLL3_OUT_EVEN					84
+#define CAM_CC_PLL4						85
+#define CAM_CC_PLL4_OUT_EVEN					86
+#define CAM_CC_PLL5						87
+#define CAM_CC_PLL5_OUT_EVEN					88
+#define CAM_CC_QDSS_DEBUG_CLK					89
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				90
+#define CAM_CC_QDSS_DEBUG_XO_CLK				91
+#define CAM_CC_SLEEP_CLK					92
+#define CAM_CC_SLEEP_CLK_SRC					93
+#define CAM_CC_SLOW_AHB_CLK_SRC					94
+#define CAM_CC_XO_CLK_SRC					95
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC						0
+#define CAM_CC_IFE_0_GDSC					1
+#define CAM_CC_IFE_1_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_TITAN_TOP_GDSC					4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IPE_0_BCR					4
+#define CAM_CC_QDSS_DEBUG_BCR					5
+
+#endif

-- 
2.34.1


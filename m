Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE63A59A7
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 06:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933697; cv=none; b=BIhrr8qKATiyYd/7oFuDoBpw1S8vhpY2dcdF2wwWurvMwaCZvVOe1Wn9Hccj8i5x4ez8l87+vLYM+F9HtZifxJPxGrCNqRd28vbnzVWE2t+Qoknr/g74KlR2Ci2S+hJE+IEYEJnv5NPm2gJ2SEmvEkTH1Vg4+tDyRdIUytED7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933697; c=relaxed/simple;
	bh=DK5LR/s9wkOnpRLHcnLiKVDahgjwXGbFEOo5kDpj8c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVIDRYnROTrg2Iq9lxv6lDsAe704ALWSyv5Wry1geFab2rGS9OLCxvloS11vm4mXORg+GeKDHc9pNXocMHe3U/oS4Q0xz/10F1e6dySX/ylc1ohkgTd07qi0EZTG5fttuyBMwl3X/lPLpyRIA3NQsfDlYz722LHsi8Tc9W9xJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKNowFlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBmmWMKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKNowFlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBmmWMKu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892a3fV1189177
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 06:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aK5QidnlMNFR3ZaT8JSykXcP8zjjf1VdQ2lfdAukIGg=; b=LKNowFlQFQg67o2K
	oGy84bQNByCPu4S+k7iIbM4wi7NjCONirVJAS9pXJSoX4bMCnPio8B6cOL+iecla
	+SZTAstl6I2lE07qAVEbnA4ffPmAlnE2e5jhwPsrKI8HMQYyvgzf20OcjdoBMlL8
	kLGajU1gsVq2y15CyLWrptzsszDBM0Tt/71d1YlKd0AiilUbNrVWXt/c/mNQ/Xpr
	HBsNFYueGNJKxImwkzDEwlgMKFzls/58BjtEe1vJZa7rXJ4YyabMEbu5kIy9pfdI
	8H7IzzCQNleThqTR7AQdEYJn1xFxMtvfC6tpNWMX3KZGqOsEhRAIpyTGX/POEUn8
	Bc6EUQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm0nqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 06:01:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso6481548a91.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 23:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788933694; x=1789538494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK5QidnlMNFR3ZaT8JSykXcP8zjjf1VdQ2lfdAukIGg=;
        b=QBmmWMKuCW4NBRj0WY/BtRFrW8OVe9BJwkUxQpTDQVlJbZ6ZeWZMnBxETrs9bCzwsB
         aBNeqn5kLu8OChUUZtqY46KyELZ1Eq7BUANTCnAr21L9DZpqa3gYiH27nYR3r5wPCt3u
         ZvAaHFWoxxzuLoZoJd15oyJ7sJw87aeuEr3gXpGkTAmVx2JZyNOGXI3f6rQxreSYbZeh
         QZU0+LNuHQC8OCSaYiAYUmVPHoDrUkusoROt9AJdiyR4S2eZelke36GfZOWaoMYnbfcf
         QtL/sbA+WB43/U3qlRXus9ZDm9V9zlK9bUcIMwvJpeB3+M2qDgJHyO6ERdlUQLq3BwYK
         lykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933694; x=1789538494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK5QidnlMNFR3ZaT8JSykXcP8zjjf1VdQ2lfdAukIGg=;
        b=EwLUmi5NH/xi9Kxz9G8AvhjIB782C8WLw7IZE3sQHKfozGMttAi9OjH6mmAdQdUaeC
         8FSNf4QMxt+wjo6fAbyEtMW/+5uLxQQamQBubCehc36NbKTMXMjQmmXYrmPA+TSDI6IG
         3CbO0Feia/veJRfOju3idsf5dG1l/bdnTz1SDnoqBegvJu677/RqD1clKCtggXo16scr
         HqZTMzr90KqCpp3lVo/+k3DhkAVM6hxTBq8nlH5RiGVViAeMQiGsRaf+ZdPsTbJ9gghS
         rdIDv00t7wxYF0hUsG47WsDa1lkXSUmPkuuJ1zKR74bDDqtY5YhQHYALYg550AI80Sw8
         AiCA==
X-Forwarded-Encrypted: i=1; AKwUvBxMAg38FEPcLHYeXp4FT+tIst3cVeiRGpdkyW0kOx0Nm5YpJhCYBF3gHDNuTlAMLw9sPxCkDGLwANY=@vger.kernel.org
X-Gm-Message-State: AFuF++nIdCXwXdxYNg2JnMCXJVGJq1dKHaSwNVgw8HxRJn2yZNXEOxba
	ajswX6fQnobcHXtiCrZKD3yRmPPucarjqnCjhTCOctvJpoPdj+uWqhYTtndzFq+cb9SPK91+tJo
	UekmQOV6JhNq3/bIXiIB+1p396BgRjVOy+ZdeC3iqva7Aom7UXHm/gvDPWW5zOVQ=
X-Gm-Gg: AYBFou1AEjS/sJYMS3spgMVwl6BFhNgo7KN+Pj+ClpHQPTJrAFEoPfgXROh+XUBCsdT
	xcRJqU12DAivDGWt0wPIZ/qqc2GrJZ8xtyKiCNkEjn9w5Xx32tIY9k+q+3X/5g1aCCO5AvbXEOf
	lekVWPT7mUm1wjjcEDnS88zXhK95j5Zq5U1nhAcB2t1wbI2gyoE4FlfGi45+7nQHoiKI1Q8Cf8s
	V5W/jTatC8n3J0CxsJucJ8KMWGLfhXEwJe1IoCEJlpPlKaCr/m8jvjwekstDfSfYoTaqiSw39bw
	hJCIp/AVdyNGj4KA01xkltQuYShpbKLRDzqpm9Utv9FXQ9HVUuPQznsAy7t6aebV8Xqzy+rKCpU
	B6vwbNzXCVDaqBwWZoIqGqyvAHEAvbTsncyfkkbPvA3s8COfRNRPFOts=
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr39914490a91.22.1788933693477;
        Tue, 08 Sep 2026 23:01:33 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39b087992ddmr39914398a91.22.1788933692828;
        Tue, 08 Sep 2026 23:01:32 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm41342098eec.9.2026.09.08.23.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:01:32 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 23:01:22 -0700
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC compatible
 strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788933690; l=9135;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=DK5LR/s9wkOnpRLHcnLiKVDahgjwXGbFEOo5kDpj8c8=;
 b=TAKMDvt764HYu3BfRJKeRmjeD4SGSNqQSbXkT/2OM7BtVJRfjUzGl9Jbw1wKt5wI/a+jDLDPJ
 JM3nS5/6oxYB5Hew2dQZH/hJGw5wC5IFFizyXRQHsy6K3z/QnLZW+2j
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX4kRA8DAR8mOr
 steUab/PO6P/siIbgObc3iVURJrbt6bjjH+p26G0dwkNa154/Ndqxo8Khs23ztuKoojfD07W6RV
 qe9LQXSZkZH8X9NPRuA8jovKXXusZnU=
X-Proofpoint-GUID: q36zzusIJyemHF8W4C8_pZYEYAYsrGLs
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa0f63e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=n03nB097HQIk0uR8NEgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: q36zzusIJyemHF8W4C8_pZYEYAYsrGLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA2NiBTYWx0ZWRfX8l0zeftO13nf
 aDjYKzy9564BE74Fyj2MiFdOJSNp1QYYOVazv3SOVM1uhXW3N9dRcZDdeHEPr8+ft7L2lV9MvPF
 G+7z5BkDxHIuwbkacQ9kIheQokCsxjz/Y1YStItlOh4Ymb6loUE0dAZ0OSlMErrDlIozcad/J2b
 g/o3NF3pA6brlutXXBx/m94Q4YKH0eTdUqmkHBolGDMaIxDkhkgVKMcaaVAKGQP6XrkolnbutW7
 DJf6Wpd6CX30bT6YOcVC4JfyuI9n1Hp6sZLGPOvkUFkBimj2P09oM1zlUHm15JjGnK6D5U0CHOg
 fVYzjFHDEkdEr6iB6+mc8bOkk2g4/KYcMMLogKl18d+APbw9FIKvsbH2eumO3Yd3aujiWFC7IMg
 kS2tZRCv+zw2thX3zfaMRQJAdgNAAfqdksZ1tKnY81CA7isyxa2U6XU8tvOm94GOZfBpjueZyk4
 PLgm5nUO8PRyu8hEFOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090066

The Hawi SoC is a derivative of Kaanapali  with an updated camera
clock controller (CAMCC). While the overall block structure is
similar, Hawi's CAMCC differs from Kaanapali in the following ways:

  - Uses Taycan EHA-T PLLs instead of Taycan EKO-T PLLs, with an
    additional ninth PLL (PLL8)
  - Adds a SQPF block with its own GDSC, AHB clock, and BCR reset
  - Adds a CX GDSC (CAM_CC_TITAN_TOP_CX_GDSC) for the camera subsystem
  - Expands ICP from one to two instances (ICP_0 and ICP_1)

Due to these differences, Hawi requires its own 'qcom,hawi-camcc'
compatible string and a dedicated driver.

The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
driver to support both SoCs without modification.

Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
strings to the binding, along with the corresponding clock ID header.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |  27 ++--
 include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
 2 files changed, 182 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index f65380747220..3e6ba5505584 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -16,6 +16,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,hawi-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
     include/dt-bindings/clock/qcom,nord-camcc.h
@@ -27,16 +28,22 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-cambistmclkcc
-      - qcom,kaanapali-camcc
-      - qcom,nord-camcc
-      - qcom,sm8450-camcc
-      - qcom,sm8475-camcc
-      - qcom,sm8550-camcc
-      - qcom,sm8650-camcc
-      - qcom,sm8750-cambistmclkcc
-      - qcom,sm8750-camcc
+    oneOf:
+      - enum:
+          - qcom,hawi-camcc
+          - qcom,kaanapali-cambistmclkcc
+          - qcom,kaanapali-camcc
+          - qcom,nord-camcc
+          - qcom,sm8450-camcc
+          - qcom,sm8475-camcc
+          - qcom,sm8550-camcc
+          - qcom,sm8650-camcc
+          - qcom,sm8750-cambistmclkcc
+          - qcom,sm8750-camcc
+      - items:
+          - enum:
+              - qcom,hawi-cambistmclkcc
+          - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,hawi-camcc.h b/include/dt-bindings/clock/qcom,hawi-camcc.h
new file mode 100644
index 000000000000..6ef731738e6e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-camcc.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_HAWI_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAM_TOP_AHB_CLK					0
+#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
+#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
+#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
+#define CAM_CC_CAMNOC_NRT_IPE_SCALERS_CLK			6
+#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				7
+#define CAM_CC_CAMNOC_NRT_SQPF_CLK				8
+#define CAM_CC_CAMNOC_RT_AXI_CLK				9
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
+#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
+#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				12
+#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				13
+#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				14
+#define CAM_CC_CCI_0_CLK					15
+#define CAM_CC_CCI_0_CLK_SRC					16
+#define CAM_CC_CCI_1_CLK					17
+#define CAM_CC_CCI_1_CLK_SRC					18
+#define CAM_CC_CCI_2_CLK					19
+#define CAM_CC_CCI_2_CLK_SRC					20
+#define CAM_CC_CORE_AHB_CLK					21
+#define CAM_CC_CPHY_RX_CLK_SRC					22
+#define CAM_CC_CRE_AHB_CLK					23
+#define CAM_CC_CRE_CLK						24
+#define CAM_CC_CRE_CLK_SRC					25
+#define CAM_CC_CSI0PHYTIMER_CLK					26
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSI1PHYTIMER_CLK					28
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				29
+#define CAM_CC_CSI2PHYTIMER_CLK					30
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				31
+#define CAM_CC_CSI3PHYTIMER_CLK					32
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				33
+#define CAM_CC_CSI4PHYTIMER_CLK					34
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				35
+#define CAM_CC_CSI5PHYTIMER_CLK					36
+#define CAM_CC_CSI5PHYTIMER_CLK_SRC				37
+#define CAM_CC_CSID_CLK						38
+#define CAM_CC_CSID_CLK_SRC					39
+#define CAM_CC_CSID_CSIPHY_RX_CLK				40
+#define CAM_CC_CSIPHY0_CLK					41
+#define CAM_CC_CSIPHY1_CLK					42
+#define CAM_CC_CSIPHY2_CLK					43
+#define CAM_CC_CSIPHY3_CLK					44
+#define CAM_CC_CSIPHY4_CLK					45
+#define CAM_CC_CSIPHY5_CLK					46
+#define CAM_CC_CX_GDSC_CLK					47
+#define CAM_CC_DRV_AHB_CLK					48
+#define CAM_CC_DRV_XO_CLK					49
+#define CAM_CC_FAST_AHB_CLK_SRC					50
+#define CAM_CC_GDSC_CLK						51
+#define CAM_CC_ICP_0_AHB_CLK					52
+#define CAM_CC_ICP_0_CLK					53
+#define CAM_CC_ICP_0_CLK_SRC					54
+#define CAM_CC_ICP_1_AHB_CLK					55
+#define CAM_CC_ICP_1_CLK					56
+#define CAM_CC_ICP_1_CLK_SRC					57
+#define CAM_CC_IFE_LITE_AHB_CLK					58
+#define CAM_CC_IFE_LITE_CLK					59
+#define CAM_CC_IFE_LITE_CLK_SRC					60
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				61
+#define CAM_CC_IFE_LITE_CSID_CLK				62
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				63
+#define CAM_CC_IPE_NPS_AHB_CLK					64
+#define CAM_CC_IPE_NPS_CLK					65
+#define CAM_CC_IPE_NPS_CLK_SRC					66
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				67
+#define CAM_CC_IPE_PPS_CLK					68
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				69
+#define CAM_CC_IPE_SCALERS_CLK					70
+#define CAM_CC_IPE_SCALERS_FAST_AHB_CLK				71
+#define CAM_CC_JPEG_CLK						72
+#define CAM_CC_JPEG_CLK_SRC					73
+#define CAM_CC_MMSS_AHB_CLK					74
+#define CAM_CC_OFE_AHB_CLK					75
+#define CAM_CC_OFE_ANCHOR_CLK					76
+#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				77
+#define CAM_CC_OFE_CLK_SRC					78
+#define CAM_CC_OFE_HDR_CLK					79
+#define CAM_CC_OFE_HDR_FAST_AHB_CLK				80
+#define CAM_CC_OFE_MAIN_CLK					81
+#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				82
+#define CAM_CC_OFE_MP_CLK					83
+#define CAM_CC_OFE_MP_FAST_AHB_CLK				84
+#define CAM_CC_PLL0						85
+#define CAM_CC_PLL0_OUT_EVEN					86
+#define CAM_CC_PLL0_OUT_ODD					87
+#define CAM_CC_PLL1						88
+#define CAM_CC_PLL1_OUT_EVEN					89
+#define CAM_CC_PLL2						90
+#define CAM_CC_PLL2_OUT_EVEN					91
+#define CAM_CC_PLL3						92
+#define CAM_CC_PLL3_OUT_EVEN					93
+#define CAM_CC_PLL4						94
+#define CAM_CC_PLL4_OUT_EVEN					95
+#define CAM_CC_PLL5						96
+#define CAM_CC_PLL5_OUT_EVEN					97
+#define CAM_CC_PLL6						98
+#define CAM_CC_PLL6_OUT_EVEN					99
+#define CAM_CC_PLL6_OUT_ODD					100
+#define CAM_CC_PLL7						101
+#define CAM_CC_PLL8						102
+#define CAM_CC_PLL8_OUT_EVEN					103
+#define CAM_CC_QDSS_DEBUG_CLK					104
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				105
+#define CAM_CC_QDSS_DEBUG_XO_CLK				106
+#define CAM_CC_SLEEP_CLK					107
+#define CAM_CC_SLOW_AHB_CLK_SRC					108
+#define CAM_CC_SQPF_AHB_CLK					109
+#define CAM_CC_SQPF_CLK						110
+#define CAM_CC_SQPF_CLK_SRC					111
+#define CAM_CC_SQPF_FAST_AHB_CLK				112
+#define CAM_CC_TFE_0_BAYER_CLK					113
+#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				114
+#define CAM_CC_TFE_0_CLK_SRC					115
+#define CAM_CC_TFE_0_MAIN_CLK					116
+#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				117
+#define CAM_CC_TFE_1_BAYER_CLK					118
+#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				119
+#define CAM_CC_TFE_1_CLK_SRC					120
+#define CAM_CC_TFE_1_MAIN_CLK					121
+#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				122
+#define CAM_CC_TFE_2_BAYER_CLK					123
+#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				124
+#define CAM_CC_TFE_2_CLK_SRC					125
+#define CAM_CC_TFE_2_MAIN_CLK					126
+#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				127
+#define CAM_CC_TITAN_CAMNOC_XO_CLK				128
+#define CAM_CC_TITAN_MNOC_HF_CLK				129
+#define CAM_CC_TITAN_MNOC_SF_CLK				130
+#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				131
+#define CAM_CC_XO_CLK_SRC					132
+
+/* CAM_CC power domains */
+#define CAM_CC_IPE_0_GDSC					0
+#define CAM_CC_OFE_GDSC						1
+#define CAM_CC_SQPF_GDSC					2
+#define CAM_CC_TFE_0_GDSC					3
+#define CAM_CC_TFE_1_GDSC					4
+#define CAM_CC_TFE_2_GDSC					5
+#define CAM_CC_TITAN_TOP_CX_GDSC				6
+#define CAM_CC_TITAN_TOP_GDSC					7
+
+/* CAM_CC resets */
+#define CAM_CC_DRV_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IPE_0_BCR					2
+#define CAM_CC_OFE_BCR						3
+#define CAM_CC_QDSS_DEBUG_BCR					4
+#define CAM_CC_SQPF_BCR						5
+#define CAM_CC_TFE_0_BCR					6
+#define CAM_CC_TFE_1_BCR					7
+#define CAM_CC_TFE_2_BCR					8
+
+#endif

-- 
2.34.1


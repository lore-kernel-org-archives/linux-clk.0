Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE333126BD
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145980; cv=none; b=ObfSLRxDby/+xp8xjgnA/3t426TdzV8Dzlu4cmzXdcpEhVCo6ZLYDDEBVgratwJU6qKj2LQ3JnJKYI/OSp6Z/SUjT+wYAoVV9VUQWO3dThxmzXBa6P5AxljOGd8zmo78swV+qZeztmAoDfdNrbxCFgo3Kvm7wmYJzVG0fZrBnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145980; c=relaxed/simple;
	bh=GtbwmtuoA/RBe5b8zxBPGEtjM/G6nG/3ONfOTQxsQ8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWeOO2gtVdQg6644m4LKh2Kcq4KlAHegbC3csT27dpjTT3kybsEkvEujBCi9yS6GfzUfv7TDoMuQldBdmTxwBqsgsWAHXt0xDkTlyN7mbM7b+d8VtD6aqRxscz+OIwJ82c2sPybc1jZ1uwFrsE/FHZ9XOrr/UWPxGasFeAVT7r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aY3xfU2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aY3xfU2b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG9sgd012253
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8XNNR5zTZOnEFE8Ns2yHRkIaTcCY0LcCd9f6zu7FJM=; b=aY3xfU2bNCIpXG3u
	xsC/f8Dg0t506GCODq6BbPtQKCsYky3eXjgkGpPkl9CzdzafEqu9o27Gfer0hvYM
	VO5e/f41/5HEX9oXbBP9tih7GRdn4eei9lnKaGy0Unb8udp6UkLUFT9Xa/FVCOzy
	ymjUSxoPkhTcbKQbRY7J6ZIndLYhI6Ri+nMWRV8ZTaEYpOyCXLBGwdQUX2cuD0Rq
	oyh9h7npuxaClhnRnF0cyHjoafm4S9Rt45bkS1TK3JKwDMrn+j11nyRoaYkIDc/E
	RZP8Db5u1WV0GiCv1LhlvI8fg+Y2KSDqltfhy1wNZp1fEVJf98ZFogkMdQo7SI0s
	bXrM7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfe3fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 18:19:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246de620e6bso13789125ad.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 11:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145976; x=1756750776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8XNNR5zTZOnEFE8Ns2yHRkIaTcCY0LcCd9f6zu7FJM=;
        b=cMwaw8lPFqOOSzQvm+W1I72kESeXSqs2VbdgM3f/yInmjIR9GXygpBA9Mm0QWy4RLw
         L5CE5EWpGv+jfT50HKINV4lwFB1yG2Gwqer0VK2TScU+jjeRyVgCycxIHxEw+uCY0zbY
         v2Jus5kppZrRA2728207Meu1uNQOZhI+1wvZZJ8Mz8V5UWZ3k/44d2VaYlBQ8IHEaZZi
         i8qZzM6xGLADZJyTkXXOzNPZicsxP9+66Sn/w0E9u7jU0oxYNHtcEWU+/BPsM3c0TpzT
         YHvqvZqV74iGG4swEQV6ysd3MbLIAlFtCUyXG+vhL55l8+g97ezCl0yxJ9+kU5//1pi+
         cgSw==
X-Forwarded-Encrypted: i=1; AJvYcCVAZp8w/X0YwP2jfD9wAaFoWPY1NoxfHQK7AiSAaXLdbnJe1I6VrTmhgKqOmP0ZDV6hMCHxoBzZ2hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1y1X6yIIxGEzHilBKXA3b/WM/NEJ3bL/PbMByP8NsTDl6OgqC
	SOlGh7KnqTes8dwCFEEzUrDETVEepbuSRQqw2JcWD4H6sd6xYjuILc4OshYLJhsyWZK3a2HUvIp
	KI19cqKzz+jGlvmeGOjgc0mQ3a1KrdWp+FWKpahnfL/yKouhrDVGqMRxgZ2YkKxs=
X-Gm-Gg: ASbGnctUkRFNo+aQ7t32DKdCGpKRQCwYgnDLe4PL7JNiMismw7l7uhGBWJBkSiHxvbx
	Osm9FYabu0tQM6AaZz1jou7HEm+sC8NHHFa+huGHO1FA5tC830MRqWQ0GwVxwWDRvEOc1dGIVes
	geV1hciqsf3u/W7kecxesjCZTkYNot9PGjSV3+hNAhWTgO0okC8KzH8zmXVmk0AKInG5Sc4zisT
	zRBuTX27IKvEazoy7qZafyiZR5oZmW4vLMHHMTNdNeOLgYFUnx1qe8bUsCDdvkEv/lkQQbemb65
	Iws1Lk6um5p6UKC/7FWdaqOqbbuX7Ha22zijRpwojCEGMC1wZKeoTenFPFByxbWu
X-Received: by 2002:a17:902:f690:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2483deef02bmr5266335ad.3.1756145976244;
        Mon, 25 Aug 2025 11:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxgqJNt5H3Am11ZyaQvv80Pcq57RRvU2s0dMUVrSGwe/SucEQAzGZOcYHr2zqbV/FlMVTGRw==
X-Received: by 2002:a17:902:f690:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2483deef02bmr5266015ad.3.1756145975781;
        Mon, 25 Aug 2025 11:19:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 23:49:09 +0530
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-glymur-clock-controller-v5-v5-2-01b8c8681bcd@oss.qualcomm.com>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9M4pbe63wVhj
 k3k4bB0RoEcv7lt4Gmwbv4hTVnkrkPfeoPSEAhHpLvbjpLLFmkmmbPIviA81pbc09XjRqZo1O4E
 pXqUB2z48kVAcC/O/jvzRkcnfm4u7h3DLJuVsGn85cBXkgcmP/x06vYDncSmrKW3bz62z0tAY6y
 WyaqCwZDUFV+wz1zZv2vKLfO9DpozWSjHo+sCARWeuh5fWPJ8p7b4gVf3jfS6Y4udXk7GZXHRYZ
 2CcscpYI2ynksdsLOn3SWCN3iz8ZTkMjScygs3JLjE3jPErLnl4wxY1zgmxGaxwaDC+t3hgxu4t
 +TM5rv4Bb+UVPx5O68foplCfBtTubG/VNFACEa/Vq9/+5XXA4yK6zKFFhBfFIKz214BeCZksFnK
 GQgB+mzu
X-Proofpoint-GUID: OOLWEt9VFHrqOjOIjAsYqRV-5KIIkArd
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68aca939 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UTa3es7JcjS1KsmnmHQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OOLWEt9VFHrqOjOIjAsYqRV-5KIIkArd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe and USB.
Add this to the TCSR clock controller binding together with identifiers
for the clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2ed7d59722fc7e1e8ccc3adbef16e26fc44bf156..2c992b3437f29b38d9c73e3c600f2c55e0b8ae98 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -8,12 +8,14 @@ title: Qualcomm TCSR Clock Controller on SM8550
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm TCSR clock control module provides the clocks, resets and
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -22,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
new file mode 100644
index 0000000000000000000000000000000000000000..72614226b113bb60f1e430fc18e13c46c8b043d3
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_GLYMUR_H
+
+/* TCSR_CC clocks */
+#define TCSR_EDP_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_PCIE_2_CLKREF_EN					2
+#define TCSR_PCIE_3_CLKREF_EN					3
+#define TCSR_PCIE_4_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_USB2_2_CLKREF_EN					6
+#define TCSR_USB2_3_CLKREF_EN					7
+#define TCSR_USB2_4_CLKREF_EN					8
+#define TCSR_USB3_0_CLKREF_EN					9
+#define TCSR_USB3_1_CLKREF_EN					10
+#define TCSR_USB4_1_CLKREF_EN					11
+#define TCSR_USB4_2_CLKREF_EN					12
+
+#endif

-- 
2.34.1


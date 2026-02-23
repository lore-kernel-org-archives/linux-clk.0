Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C724E3659E9
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848116; cv=none; b=NhIixXhlVdfEQ3nIDQcd9TLmma+GfE3OkFv5KkNUA7ceN8P751AukiWqWgYim9QzJYDTGaG34FcgjgwzX0ruoKdVaMQOCdba7L7QDYcsx1td1y+S0jXfXCq3BU8zRuBT9ersa0atJl518CR8fs9et8QKAmWIfPzELF6Cfkd0YV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848116; c=relaxed/simple;
	bh=+X74KMWb2lVjQ9fnowKj6jei9ytZdwOYWqFCEBJ/bZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXjEapoKHY1lRgUx68QO6wT9mA5WEAk5BkoTEGYRFv7HPaHIZIPOCVFVeIWiyjRAFe9yFVQ4ezC5ofXxd076kQuWTukzQxAhgGKXFOMAIHHeMckmLW8p/QN27WRILPJMyru/hmHMmItO0fqwtFdiZHTWvqgEBDvuwdq8wLM1zqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrqQslL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMEqMD6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrqQslL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMEqMD6X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYNXI3409097
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=; b=mrqQslL988XqELJ2
	t1fb2kQVv3169ATCQGD4V1APm6IyRpOhfxDn6vpZLiqDTYhhGvH9swjPJRGgNT8l
	7pkVNuxMxwDX//YcOtCJdqGFBrjcmomE52pRBTonHSiUnPzyAvJ82uZ1J5Ybrvpe
	pRi1DzIvGS7R2VfdNOnNGXDZwqIKFPrGUki0gR5HAL44m8f7ITmnKJ0mpckHT9eQ
	JuKKmD5LXKcmqqL8kpR6ZjEg1rgaQSOBrNNiOR42aYfq+4KAWIVt4p9zRfTH3O7R
	mU0Ai0VqwiRu0l5PXPs1l0upVf3W7urBEwySi4ph/VKzUwD1ZZwyl6YKsMTFpagU
	YBW1LQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tr7hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:53 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45f148c7fc6so52631659b6e.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848112; x=1772452912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=QMEqMD6XJjlalWtYn8z7giE3se6yuc63ePA3YKLiO8gyioa5zpZoBKA3ZhaEYs3g0r
         0bOrk0m501yuDEPpwSE1/4+iw7ub4OlA8cVVWoBNMgsOTx7MMwJY19XpVifQh7SOZf+N
         VLgsWb9Hcq9MCOnsjkWqegwfUtjalqenr0gHFOlwz2aa5WZqFLTzwW+DRMnOzw3lzYvT
         4c8HHRoyWGqoQfqHaUUpSBihuW2DwhAQfUr7xvc0iClHtZXuzmgizfyFXHKD77lVBOVg
         DNHCsfEp0282cDB2E58CgnX3bNfDW8gttpT0SMKjbJV4TYlPLxAVVV5rFWT10fnGo+Ku
         dCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848112; x=1772452912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=lTj5xYf5Kkh6ipAaXVrIBvGCFHh7KxYJOCIp5GDnCZATwrUXXWMYaqkpnm7SECFtGz
         i3IBGeDEkyrB1u49S4Z7iOWESHJacv+nLtgTDHT4ktQMvXth8ivEAGF5on8hHjLKFiqz
         27YvjFEIVDZIIxN2h7ReIoEYXKuJAIj98p/kM8uFT7LMNppcE4RbC+dC+AcfkDK2iQ/x
         XHmVKALbaDiXyXgp+yBuXko8Yb5YvId+CXzTALpwzwa5mCCiE22Al4x8DHIBWq6VSg4r
         8plczy2E62IL1NRB3d5wIGuMWf7313IMgfzKvWSXpwQ1qN1ZBpPaxe6jQA4P93SjRLhH
         5P/A==
X-Forwarded-Encrypted: i=1; AJvYcCXtxQ4WYbB9p1SEEmAIG6p6sGsEdCDUuVcdVIRRYEixAnOgcI3Ziwvmkq/pvKqf7oC5qv5FlSk6MuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/k7hv7d55aLA223lTn/jQYHiJ6h6iX6etnhl3CRIK5Vy9rPX
	HPcJ1GtJYncbRMhszFsiY2jOaR5YX2hz5eBW4hRoyTgLwPQH3X6SEZesLhs4NjE74QGzmrPOu55
	ciouoHWcNE9pqTrMNw44JsADGwmqW5fU6JkQhacTDtMGELUNYqGT0ZF9KeDwfGds=
X-Gm-Gg: AZuq6aKRbxDdJPP2+TbHycKcMspBWMzZhE0QrMQbST6WL9wXx+lXNwYzVYgOKjm7gZQ
	0TRwUXBCpqvCWbrHgj/dUkMr9VmQfkAObv4f8gTfIgMthdMHo2KiALKreJS1DOlVlXVJkl4V+nT
	zQMBbKOMlwhpZOOqZ4M0xM54XPxpgzYVszcNoeV5jJKM2DHMMsYJjSNWJFmiUP5zbRWRHbWnzWk
	/2bYy0Hq6HUkxyGezpJrBic+HojpTPXO/fijktNF8wX7YZKIhMNP82l4W29ZVuLr8VtqsCCLeFU
	UsP1ZIPkbKB5hImbviJqQyvIKjI/qRel0ItpZcEgNjseR8v3WXHhfsRxc7mErRV3RU0wrkrNK5v
	NmJcVdEOTTeo5cXM7SIaa5awmOz6R7g==
X-Received: by 2002:a05:6808:2512:b0:45c:93ea:1188 with SMTP id 5614622812f47-46446361423mr3353543b6e.43.1771848112393;
        Mon, 23 Feb 2026 04:01:52 -0800 (PST)
X-Received: by 2002:a05:6808:2512:b0:45c:93ea:1188 with SMTP id 5614622812f47-46446361423mr3353526b6e.43.1771848111955;
        Mon, 23 Feb 2026 04:01:51 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:51 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:01:19 +0200
Subject: [PATCH v5 2/6] dt-bindings: clock: qcom: Document the Eliza TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-eliza-clocks-v5-2-dcc66df713c3@oss.qualcomm.com>
References: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
In-Reply-To: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AauMYzLc6gTEXz/GOQcSBdK6m37250bGHySZPyTqHNw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGfltcwhJKNGI47tnCQToTdeDBgbN80+3BTR
 pl08sZCPt2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBnwAKCRAbX0TJAJUV
 VjUpD/95RlULzq6njrb9+CLOp0nGBuQhX/8vh+sME0eYl1KOvOm5KbrV81aqg0kiX9C5sz6gdde
 i5dJ2u2bErnLV0zs/g+uzN6X1hrkMJGiyxuretA48JXbG8mRgk17eqTs+8YAZb4C0qZ2z9Xvn4I
 IJczKlIzHkQoCYrLJWoDJipr1RniBddO7r68CeXH0QcE9RleHodn3Gx2Mzy/G7nVgysDdms4Wss
 3JclbZcqo7617feHO1odSrKBzqREJbIRj4qb4wjb8sqiXqzf51sC5i8NOxtnpjY7vmzgaqzbkDJ
 r5/6Q1Oz5EM9lwKhtFlFy4DLiNu11RgcA2/vgp3LfH2liH1ZoDW3nsuRNgyhMIpmYu7v+Z/Fka/
 lbJZKJSVWatIDwfIN0Ayl1by6zgD6C3fI7dRBTG7wJQxclR4FWQ1uaSmkaKdIrjWjrxK1eapBif
 MkrckOP9EzJTFyAup2RNBRxwGf88ctk0UTD/1VyfelZUdVC+q/1bCJrdsdM3/TLrEiEKzIswCLo
 oLz/pIygwM3TPGO74LZ3S1GQIf7+Or9DjvrHaJ6Tnl7896MaFqWSRwocSQKmi61WyNULpYTViMx
 MaMu36FtxPCcoahhecbowcPCR5EweE4BF41CmjjXZIXZrjBSsfSID4pYz6cSO67wPCGPTB9J6VH
 YLYNsvsI5yRKUFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699c41b1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: wPrNM8U692djgPciF3TrHT3X1nBAKpmD
X-Proofpoint-GUID: wPrNM8U692djgPciF3TrHT3X1nBAKpmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX+iEdx0P0SK1Y
 SWT2tuMVJkxKDaE8weJSivMAHmBqT1Id9e3g/9IGUEd1ehJSq7ByFe+npyo0I9hkpcxOdoUKH7t
 StQh6Nk/G7tD+vvTt+yRhNcqT4v9ZpKTqgtWKSGRkcJrygxaHm/eXVnxmYQpcNJYT9o6gXH93Pu
 Vda0nF5Ec3HpTUioESBtdC0Fmi/nj0kXHMvUUieneYWbCsx1uho+6Tk0+8CmAUc5LyiuD4C/3Zb
 0NqsfsLAQrnrx13owcBO3502qzEFbrQtEjg6YVim0zF8amKKKov2P5ikH4dqhl0AZqxu73+7SU4
 8jvVVJkBBqjjPrhS6UY6fkvuw7E/jvAcB+3VvS+Gn6Q8RzJ/RmGZ+PrO60FlkMusypN2f1R2D8w
 MX/Y79LA32Sgctm9+18D8c5W2bSOY4xxkbb/zLFyTNocNIKefBYTvirxTvx9a9S4kyut3eI+xrR
 pekeKZJoU+L+DXbPaCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for TCSR Clock Controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml     |  2 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h             | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 784fef830681..ae9aef0e54e8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -15,6 +15,7 @@ description: |
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-tcsr
           - qcom,glymur-tcsr
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
diff --git a/include/dt-bindings/clock/qcom,eliza-tcsr.h b/include/dt-bindings/clock/qcom,eliza-tcsr.h
new file mode 100644
index 000000000000..aeb5e2b1a47b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-tcsr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+
+/* TCSR_CC clocks */
+#define TCSR_HDMI_CLKREF_EN				0
+#define TCSR_PCIE_0_CLKREF_EN				1
+#define TCSR_PCIE_1_CLKREF_EN				2
+#define TCSR_UFS_CLKREF_EN				3
+#define TCSR_USB2_CLKREF_EN				4
+#define TCSR_USB3_CLKREF_EN				5
+
+#endif

-- 
2.48.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBDE3A7F5E
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083249; cv=none; b=bBeXxrl+c7WHSrv36i50uKum7T9uFhcbV1HfLh+xawYWIB9xUu6O+BHBrDp4n/6zq2e1fozar1SHCb4QEZtWDQwqTtUtkRTJjYQRqhTmPTYAWYKJNf/bc+rTuBx+Sr+0qjj/amZHkRU4og2Ws7CgX0NE0qUyNTd2mbGXuXaOMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083249; c=relaxed/simple;
	bh=LRUBCHmtCWd3pCbCEWG4bzIfRmvXJJnOFe2l5IDMwng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MM1xOuLewSrDknhesPBhbv9fn8m1bKtBxmjKCsbFbVWoAplHNHFJKUQzGkdmzk42th51VfefxqysSKfEQIB2YMKGgrwHzEcirUfTZXhLTt2FhyJt1qMBqIjJeQnBUHok5I4KJVlR4x1h1ki8NiJGqLNdjZaHQAiuD2Y4725M/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWXUMHt9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs1aLryW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWXUMHt9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bs1aLryW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IXQE2101455
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=; b=cWXUMHt9c2uS+jPC
	sxQFmgpc18pMaxx7SFPJJdLHqrzTBiZytnGlvg36aywqcNOESfoViiilXt4VuMNI
	O3lHUwK7MnxuDCKirK4jfFK+JAkvXj4F0yrk2HI6iEZyGWY5Ti67V8Z26+vR6IFK
	m4Yh3bfxEJdpQpxidcFhkhn6NLptfZ7pngMQfi2EoORHXtbgUKRahO6Fpl3HqwY1
	fB/3T1XkkEV5s8ibZMQfH3FtSdac+Zn2jaLVa1o5ERImf+XOj69u36CwTYMDF/o9
	Q9wIHjB82McFARyKV70H0nC9i7UADBB9LXzUNev5CcOm7jIc6iQworITt7joAnSC
	UlUy1A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ksmes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso12708738a12.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083246; x=1784688046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=;
        b=bs1aLryWFkQeHeJL0PYz40DQuDcx9II87BheOdFAd38m3YVFe7cFBT/4Or+XMLTG66
         XJlekLT1OIAmeh7rN7eHoO1Mzg1Djvz/HAYmLNZ5PnKyipFFc/7l9/w1lBGawOM3m5DH
         IVDA8ZrCHjJ7HtMxe0198aKWANMyuVL1L6arxMqhZ419Kmh4JNFg5ZhIcLh4xODh/ago
         uJGyf1DFoD9O/rm9yDqKz6zIRILzJwCq3GM+cEgzup+2r6/hkLKNvYM35ndNZsW7VkhS
         07+M4tRp4o8Lnc9udRvT1OXkdUWKmLj0gfmddfBseCIqw5O/BUBabm9+IZ61uPo1me5r
         EjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083246; x=1784688046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=;
        b=q2Yedsfic03U9C6QJJk+CuermtIlJ/L8CDpqz54eGtjqAVHfU5ZXbTnMLVWFPJSl74
         zY63H6471+LCDH1jQtjg/3tzcSdF65fBt0bfzTUXm7oDniklddAzj/RjLomIys89mlIr
         DDtbvO9MzFwqcn2wl+nqUgKQD00B9M6Qnn/l6QsDerS9MRxzCjkksPTBbnqjvc5NQXci
         otxsNfQIKnX01Ck6X4fuuqIfRXjVyq103H4FWAfixiig74zEqYbh/tpQqn7fvTPIwxe6
         ThyBOWYKnQfup4A3Q08iZ4M6Xz7yUv1gu1PC9psAgehZ7XYzXKpBzXTuOCeOPcUWabI4
         HjOg==
X-Forwarded-Encrypted: i=1; AHgh+RqKF7T7qCNvqHksNWa00sttyvB+qyKQan0FW/7sYKoa8Q8KUcRUJObp7cIkU/ei/ZG6NErpyMjrxC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYueOQUh2JfTzN4ryRyFGw5jLW8RCSYy5iGB8NjuB2gu4ea5O
	CsjJG1iQTEHiW1GAV9CIGWlkEFOeaL2JcIvKYm9YM/QVDyxI0uTK9DeGoyDwanLZGSokz4A9L6E
	EoUHOI7THGIr3+SQ+7Gjh/f5wrLSOrdxVgEuLtQ5D8SE0VrABoElsBqJvGAwABYw=
X-Gm-Gg: AfdE7ck2XZMGwXCKm1QIxscXCc6tV1Z2I7ed35CSwPKlfiI8F0XVgAYxteNnVOj49N8
	E7jJAVKmg1aDLnQRymtLGu5rMBWUsbkJNnRff5G/6K1gwEPg81j14vRaDMw6ZjeKn+grNDLgnKp
	LqxOOYYBV/JMlWGtkil8GzskDgxNEmnWqB9G/3Ic6pEn8xVd5TtwdV6ZjWgcndoO4pjhMpU8jm7
	uJfjdedJjOv/PAuHX47GATzeJPKNWR63WVW90g7oyEyFFwTZQX473W32tK3/UviBu0CfjZq045B
	KiMKmjWNa0j/fKKo4Qj3xEYLsMMG3f+kn/9qcpnChPZivj1G9tU/QaX/ASCPGlk62xJT5dsKaW/
	s5jss9NAj6nMeInmK3LEOGz9WrwbSEj+ACoXp6/xZV4Y0EVLa7AI3nMTsiw==
X-Received: by 2002:a05:6a20:244b:b0:3bf:6c08:fb8f with SMTP id adf61e73a8af0-3c36c39741bmr1072987637.49.1784083246053;
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:244b:b0:3bf:6c08:fb8f with SMTP id adf61e73a8af0-3c36c39741bmr1072968637.49.1784083245588;
        Tue, 14 Jul 2026 19:40:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:40:41 -0700
Subject: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=4927;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LRUBCHmtCWd3pCbCEWG4bzIfRmvXJJnOFe2l5IDMwng=;
 b=f0Yo0J8KBn9i1Z+E521tianI8T71rTtfRs/0vEwfA3bR7lKcElCwIJIKlTus19+hm4IEGsIbO
 mLCksaUbv+DB1I4n9/nBORqaEHTOY8urUuyv/xF5PISX2elqg5oLFdb
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a56f32f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Vu0f6eG494TTLRuRXOAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: HpAUcle-H6cU-mfTYZi66tlA01fPs2v5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX6NN7Y21BGC8v
 wQtHf6aFf7jiEKOyGwQmHBObTLy6wVa4XFPxRmg0QcV/bXVbPDQA7GMmoOBKWPGk4oUeixdtq7C
 OAxwtpsWKzuEVJjwOUPK3X1UNgLsOYo=
X-Proofpoint-GUID: HpAUcle-H6cU-mfTYZi66tlA01fPs2v5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfXx5qGt1JACr1i
 GYml6TZgso59+EBgzPUHml5sRf0jGnEwfnNQ1HfaLNNInlteLKc7lWuLC3h8UiK6+4by6ljjk0a
 hYTNlsenvgDQK41TdcGKLYjqDKJsB8lnb5i31qcXnmcsavXPfGpPJ2TFiQjxQNe9mx48GCHbWKP
 QYIoQLuZkvCAk8/kqMELjRLk1SbC7UWzUA6eDJ5glhd+e7bK+bkDJ76POwao3RZjtg49T+Qttow
 kvzz19j4y6ZhhNF8n+AAI7DLqvEHnmlozzMuY5qGg+7HUu+ybeOUCyXaezw3T9ZePeTZDNMw3KL
 P5NLF5x3SUaBU7boluOqOYmfIYVSCBNpICcPLpe5y3A5DwdtB96baPlrXaVezJKJgkdslmH0g1J
 LMv2tQtO+OUWGl+z5fqKpFUp4Kj+83W22DEB4xd58wu8AkpCtNX9y1ZGRDpeLTGDihJOgqyFi67
 Ty8Vp8nsYgVvvYg67TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
requires dedicated LDO supplies to operate. The digital control
interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
Since QREF has no dedicated DT node of its own, these supply
properties are placed in the TCSR node which acts as the control
interface for QREF.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 +++++++++++++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 19ae0634b922..1af53c6b99d9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -35,7 +35,6 @@ properties:
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
       - const: syscon
 
   clocks:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..55182cf550e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:
+  - include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
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
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qreftx1-1p2-supply: true
+  vdda-refgen0-0p9-supply: true
+  vdda-refgen0-1p2-supply: true
+  vdda-refgen2-0p9-supply: true
+  vdda-refgen2-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx3-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-qreftx1-1p2-supply
+  - vdda-refgen0-0p9-supply
+  - vdda-refgen0-1p2-supply
+  - vdda-refgen2-0p9-supply
+  - vdda-refgen2-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fc0000 {
+        compatible = "qcom,x1e80100-tcsr", "syscon";
+        reg = <0x0 0x1fc0000 0x0 0x30000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx1-1p2-supply = <&vreg_l2a>;
+        vdda-refgen0-0p9-supply = <&vreg_l1a>;
+        vdda-refgen0-1p2-supply = <&vreg_l2a>;
+        vdda-refgen2-0p9-supply = <&vreg_l1a>;
+        vdda-refgen2-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...

-- 
2.34.1


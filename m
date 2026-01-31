Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC63596F9
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880838; cv=none; b=PXjgyxMKyyq/hwHmLM28PZpo2E66MryPL13WWeMacobd1/orekSs0Y6Nts/cWUTZImy263U0c9wX3OtleI+8DJuYpaOjYVrCdIyPSBIgefnGToojdL7Bb8lpWXhk5AzUxUBHNae+gXp6hoWaD7Qa+zWRhp82Mn8tZwAa8qgFMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880838; c=relaxed/simple;
	bh=gxIXe2a72VsWyLP2OTPzaK3zyONPcQ3zGYwdMGiHXoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjJE3XOgIfYCtYvzSJbuHH2l7qaZTzYwkL4KBdkgz44ilKuayQBiBflYFR2rKR9uJiV10lbeQ+wheVgZuOa/seIkYRxl2AzcBsVF9CVb1gBhNjFjNTgyPY8RTOfTs97VOss4MRXYS6+jEG2cNzijDDw5N79khzYhhu/dVPFLbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEOcxqkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFirTP5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEOcxqkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFirTP5L"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VAsv8u2289131
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnkMkrPaYIJyBxXxsPgIey4l4FW1EJfwbRE7eWiesw4=; b=lEOcxqkFZ/RZCfGK
	0Ge8jPYyCALiI+ejQnwxN7XLdXyxRVjurjE+5Tu4b3EcoRCaYPXMtrepL74q+Pf5
	svUPnAITg9tfer24qCtjmJ/kp0s7kuPUDY0Ol/Diive1MUzVbGOi8WKUXs1wy3PS
	5s9dDMsLC4x/Cl84FXoa8e0y+6Adkebg02ZlPcXQlei2HNFoWf9gVAPV9F9ix9a+
	+pAKNQI3KHf9HPqi1AtBO9pHO3FxlEbnYralrf5XBsfbb6kkyzvGOWOW6/us/GCa
	YSVfSrP/kGOQNTKA6DOtv8b7hmA1BsLK81kAWazVl3sCudIvo612jIpligh3D1rK
	ud8gkw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard17b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 17:33:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948aff549d5so290796241.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880834; x=1770485634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnkMkrPaYIJyBxXxsPgIey4l4FW1EJfwbRE7eWiesw4=;
        b=XFirTP5LIQ4g/8biMltPVBMVnt88eekSbC4J4TKqQImFLLnCi9QFOu5kjG6V7tmYwf
         6/ly/0pK1lUdCLsjYQvf3EMpRx/+ithtNG83OYXOZF5YqncIx+Xd6ErpevgyYEfrlS3x
         naFyqjOxArKkw1cvWfXQhc3MqVfnmB/0F2+eeSgpBaSqe3knBWYD+19V2Zvd6nuwOYII
         7Yv3lRPggPjbUtDC3TMsC1ClaQpx58dS/gFYvh5rfGVh67f5M1J7Ih+RNYbNGDFB4Jrd
         XH3mdiFz8E9WE4JhOd4e+eHwz9WeU3AcXvwpSF17pYpaQq21ahLNQUUqBp/YMYy9OCrP
         LWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880834; x=1770485634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LnkMkrPaYIJyBxXxsPgIey4l4FW1EJfwbRE7eWiesw4=;
        b=PYQG5d8ILcy2o8cWGPRZye2t8kS1e7eUwKDX05okgmsqPk+UrqtCypLDh86nx0BStV
         oLOulEEUeByRhhHy3Gy1WY+T7kKHAHf44TalP0lgkklHMxt/1EfrZNp3kWJtEtW+m1Fk
         jiIoz8DW0nfu6oz8IrJiCAL3/8MIKXFgaWg1+E80W9a8mfUpgO+S2LgZzDikIiruofP8
         g5DeWZ4wIXwDm/Ch7PssmDbwzr73HLD7fXQ6v171N+OWqw+gYC0HwozZs6a6PxpVFyip
         gcthkgwUfhwAMUqidCJOBsieyFzITDUO5W7e3lMlqkueSwllSf2DzYjU/MvR5clj8TvC
         IbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ9ALc7XnhhYx5qJJ0VKt2cG6y2UMqogLvATbKKGiGcZRiNDVsOvrsMSrYfuZtxbFNvAkBCmhciOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOh+7lEnA738B1aZeNRizs6yZmf9qzqiCXucynDRUcLyorYm4
	lqjedyP1Xf17N0LtxKR+LctEV5oFeuX2qTkfK9OZPhCwVyU8BS7y8v2kYrOAB+dWjPPz3xZsdz1
	sIUIbqvzxH9vuFTLJYWnGbkKjApCAit28zUnlJrVH9k6NcW7lPva649e8XexrcmA=
X-Gm-Gg: AZuq6aKqjhKZeMwgV6MGW1pcYzP2OJ9xHrqFyZ4GPYDP+rdEkNfFliBkgmXQXRvpJtH
	jIiA10q0FQ5QKV8hBm4rf83WgeTIEZNY9u9N1ASXsbZKaGb/05ttaT2A8hSDOi9+szdHBKgITUp
	rIo8BtE4SrY9e7X/Mc7kyvSmz8SP+nmKO1hBlz/JHnyqYAaZKM3HL+Yyq8xDII4VU/zwkift9d0
	FPMLpvzfN8uGqszDFixcoucH1zh5ceOmCNFgPtaah0GBSMKcTiZBx0FjDT7ARfPJW1zOcc4G5Sm
	g7oWJvQt5x4NjfJBE0om7jfar/uScyfB4P+Ji6tPvmL/dUtMQqLqVMCWZUTE2XsTvnqwsF88yuY
	RyIugBtXkvQu767+aRKSTj8K/EgJElvdjTVLfKPwqanrryyH6K0MIK3RJSnBC+uUki9R9Lyq4aW
	ED/LTcxzOqzMJGAywHh53H4g4=
X-Received: by 2002:a05:6102:3f09:b0:5db:e909:aa0d with SMTP id ada2fe7eead31-5f8e2680347mr2120374137.37.1769880834497;
        Sat, 31 Jan 2026 09:33:54 -0800 (PST)
X-Received: by 2002:a05:6102:3f09:b0:5db:e909:aa0d with SMTP id ada2fe7eead31-5f8e2680347mr2120358137.37.1769880834040;
        Sat, 31 Jan 2026 09:33:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:43 +0200
Subject: [PATCH 1/8] dt-bindings: clock: qcom,sm8250-videocc: account for
 the MX domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-1-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4456;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gxIXe2a72VsWyLP2OTPzaK3zyONPcQ3zGYwdMGiHXoU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+eoeVMfDYYw75vpqNs7V1E+zQjHrSxMmSv
 +LTxLC7m1eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1WyDB/9U/zcHxjkGDm8rSQS9eHLureXekhc8AaFnvEnAw+TqC6ZC2I6DeWjAwmzfIKbM8OO/+mK
 Sho3VOV0JofuRh+M0Ctv/N8guezhTnhMQfaVAnPVPCM8QelFYPIB+CGWJwNzUGX1+nYXCjK7fd5
 LDWH1NOXB7jGb1YfAeTU6tFZwf9bVGcTgo789JoUD06JDJ4FmF6euIJKG7tesH4KfMCoQ6L6He5
 Y4o9Tv+xTLUuDy+aXO/Ht63YTjbtQ99LfPAif9QwPjZj8ajq5VMmb6yc7k4mlg9HnGErujSlIk0
 Jb+GOcMbL+1WPG2lW9h2iQ3YWtRRwy2RhwAmH3D8KjfuLFBC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX4o7CMa8sk+fe
 3Ja7wHlHt/1kWnYSYF1NvWZ9G4Xey+FZcsgE5Cg8/+H6th13CRgqs1gGbOp0zwwsfKTLW2IvYCs
 eMfF56guFJ/44ruBHMnpqjxpnm/2GSA1gV8TPy3g/Z1I6V4p21QlNBfwKg+tCFwsNQjIJqjdcpl
 euX7/Tk+rsR46y5Z7v0R6lm/U8FAwIztoO+r+Oclyo9+GfxVdTED8ZsCT5gthEcsjU8/D+fxApt
 wD2JrgH84RQpSM4IMYpUH+KsmynL9ObVB+pOHdaws5zKFn0CaozQD1Bzjd3MvZP1jV9MwFaDzdl
 eMQcPmYhANrpQnMlQLAsrHCFK/lL4wGh+697ekqAM3zOkbLxP8tJfYj+OGc4SgnpRU84KwWsfNN
 eBfcoCSmCg5486j9PJ9/WITpIH/x2v7lPIXp5nHHqRcpjW9bjsN/7y8cFccldIMu+VL4OGu3lc8
 ByCU6SlbkGmcQdyIBOg==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=697e3d03 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=-c0xKrEOHdUQarD6WDgA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nkHQ-1KIW2Kte6rCAe7NkNkx2RPNkdSl
X-Proofpoint-GUID: nkHQ-1KIW2Kte6rCAe7NkNkx2RPNkdSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Split the bindings
file in order to provide separate file utilizing MMCX and MX power
domains.

Fixes: dafb992a95e1 ("dt-bindings: clock: add SM8250 QCOM video clock bindings")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8250-videocc.yaml        | 80 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ------
 2 files changed, 80 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
new file mode 100644
index 000000000000..94264c309c65
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8250-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also::
+    include/dt-bindings/clock/qcom,videocc-sm8250.h
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sm8250-videocc
+
+  clocks:
+    items:
+      - description: AHB
+      - description: Board XO source
+      - description: Board active XO source
+  clock-names:
+    items:
+      - const: iface
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+
+  power-domains:
+    items:
+      - description:
+          A phandle and PM domain specifier for the MMCX power domain.
+      - description:
+          A phandle and PM domain specifier for the MX power domain.
+
+  required-opps:
+    items:
+      - description:
+          A phandle to an OPP node describing required MMCX performance point.
+      - description:
+          A phandle to an OPP node describing required MX performance point.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+      compatible = "qcom,sm8250-videocc";
+      reg = <0x0ab00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "bi_tcxo";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MX>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index f4ff9acef9d5..8676c7e22b4c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -19,7 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,videocc-sc7280.h
     include/dt-bindings/clock/qcom,videocc-sdm845.h
     include/dt-bindings/clock/qcom,videocc-sm8150.h
-    include/dt-bindings/clock/qcom,videocc-sm8250.h
 
 properties:
   compatible:
@@ -30,7 +29,6 @@ properties:
           - qcom,sdm845-videocc
           - qcom,sm6350-videocc
           - qcom,sm8150-videocc
-          - qcom,sm8250-videocc
       - items:
           - const: qcom,sc8180x-videocc
           - const: qcom,sm8150-videocc
@@ -128,24 +126,6 @@ allOf:
             - const: iface
             - const: bi_tcxo
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm8250-videocc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: AHB
-            - description: Board XO source
-            - description: Board active XO source
-        clock-names:
-          items:
-            - const: iface
-            - const: bi_tcxo
-            - const: bi_tcxo_ao
-
 unevaluatedProperties: false
 
 examples:

-- 
2.47.3


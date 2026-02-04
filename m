Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC9323B61B
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166801; cv=none; b=hWu3lCg4fRuW4CDfDNXcYynXEGDnovLNSaEgtoDQ/RZHfgKHGizfiGWwGEm69mrI6wnnjzhY8ae91kXlC2aHRhO5vs5N0qYZf7q5Tp0/SXzCd7+nLoB+8BLZR8zdmUkUKdH4vEMWsLBOQxRnkyc6C2r2vktAGz0T5br8ETt9vFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166801; c=relaxed/simple;
	bh=NfLzmE5xWwA42fboOATaUS3ihgAtr6cr7dapV1J0XF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+3e4vMguvQTRuxjk/V2LTInt8GM/nOUZMoXu7CCpAKDsSiW+op4kpoRW14i/RDp9nL+MzvZ3nl0iCjXXNaZSA6JiMwITX7IXgJ4AuldSjbSXV/oMeBeWh0MfEnmwCQAjVNnyDQdqBYkv9XmWSQNa7JtDLniY/+MaI02ToU6bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT2Q7ODv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEeP7nH/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT2Q7ODv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEeP7nH/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlkmR2667192
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 00:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdJXOV1m+mI0FazdKoVmmfJbSUPedEZOVAEp+F9mNEY=; b=PT2Q7ODvpzBAdVmU
	EScc9i56eREFS6WbsbonUBddpNTAhI9G14D6wBcrwwqlUerIcC3Rmb+hndgloipN
	Xy9j1ttyssc9lN7r5/L0QLlPsTw5hemKtVs25VmQOGEuzbY6W1/LOt6ylPUAmWJh
	YEhuUgyDgHRlYcQAyk8JO/lYYTGjM2YVxNV+/O6J1jQq8KFyQYVnbpocHqNCJXzc
	PL5V/aQN8Ig/3qwImMRuWWnuUUIU2bPVEi1TkhGx6/8T0PXf3554T3p3cTC+5iRy
	XYuRlFXWvMbEOjQQnmB2Z16ii2qfJuth4rytzGw0HqUy95nsHW+hGDAWLkCdwEOI
	rQy9dw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3nf61aye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 00:59:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5e166fb75so2028084285a.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 16:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166798; x=1770771598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdJXOV1m+mI0FazdKoVmmfJbSUPedEZOVAEp+F9mNEY=;
        b=HEeP7nH/oDld9bXhI1Bd1gs1NVf0BPeXGUoXHreYAp6mYZvRgRWkTLTPgkJWCk1Wwg
         7tlhLjXlfMv2+rVdm83FN6m4jyVo/SY/7GSNZbtp610W0eNxhAlAlmSp4YbMBmvOSrPb
         a4rWDZhn94raVc9uSHb71Mkh8196kW6M0A1aFrUEnZ4fzcDDX+JJ9JP8fjlR2dIbpf1h
         aAybhgHqS/AUeuQxeWiPypLvoMMfk46o9+hHLuOMZH7IE/Mu7AdUzw/3Ahrbe09IovLM
         1zl3ad5uc2JAkx+NjsbW03Uru+ckvxq2vUiJnyJYROe7Q3//zEeOo/6+h3OH+FmnU2/q
         d0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166798; x=1770771598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdJXOV1m+mI0FazdKoVmmfJbSUPedEZOVAEp+F9mNEY=;
        b=vrFKq9ce7DuRLG8r2d8ypO+H66owKn1LwdYB3LRSVpOqLCUZbMjmvSYkkciJ5NmalQ
         mQqs7ohz0t6Bedzyz3UbuXzb3/CZ6L05Rz4PgvdRUXeACvnx4mwtS6HE0fuxT19/Hfma
         Xcpwx84p0q/gZS0K6w32NBySSx/lzIG6WZoLIn6ChZv3dBYoeXOkAN3aznteXJX1zTPm
         0P5EC3BVyr8RHnHNs6YGB+qiZySSNzRvXzaSukE/28slEY8B0dSQig3URdXggmEk5+2L
         fT2CLTj72aRVnP8JjULYUKAftU3nvRKxgAw7tbQGsZhmSpJ2G2q9xO5XKFsdhjYPWIeK
         UfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWef+XRjP/3q/TaKHczkVtLVywYellAf//zXYQSTEPxC6yBnQh0ZJgmP6shYBwh/Eh0kmV8Cy/xO58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBa943tEPpKU1r31aCZR5oukqqd1J4HLBPhcbZ6iCpucLLCIA
	Eu2Iq6z9jZZDUm9YDP9m6SN4GXwEYgZ6m7ymDkK+P2Gl6qKIecTqK8d37pXXWgjo3KgpjXPbe4W
	WroQInntRRan8G0haKCQOHPckHZJyl0r/Y21bi+A0+Vmwx9CC2cVqsfxzuIz4b6w=
X-Gm-Gg: AZuq6aJBtOHjb3XuznQjT8FSuZEq3HRPcu6hUrrPJJy/6//sIeskaepBRNlVCw7x0CJ
	N/3zGtEGREPXdsCKuR/2n8U4B2JHWhCH4wleWTILV11cDHV1t6CqoCXAadv5aEGN7kdasuH9/Qo
	lfgYIiiaZZD+EkzcgYBXUXxTDYroOBL+wk3F+X+hQ6u0stlrhr92mqrU/ra5zyJd7xdljQIf7lb
	mjZAWDQVxezMQtyuvq1q/3V3xgji7HuQHVbLvOpdMGW5U1FUVwp61/n3aPnblQvVgcTG68fw54K
	7DSAaRWj3adcs/utYbr2xQ4aOZJZbmLPqHI4NibGI+Vmn+znssm+m9XZWt6hYVTTi8rpM51e0ck
	2ciZE4N4X0+e2grLMlRWdiIUgpFl+JiJWXX3WFs/h49DFNxpnKdCULr6RfZxeyHwLjpqAMEhRA5
	KxZ0xbKYkLdRq7WeMwIPoM4CE=
X-Received: by 2002:a05:620a:2a16:b0:8c6:a848:71fd with SMTP id af79cd13be357-8ca2f846e6dmr193271285a.27.1770166797776;
        Tue, 03 Feb 2026 16:59:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8c6:a848:71fd with SMTP id af79cd13be357-8ca2f846e6dmr193268885a.27.1770166797264;
        Tue, 03 Feb 2026 16:59:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:59:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:49 +0200
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom,sm8250-videocc: account
 for the MX domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-1-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4671;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NfLzmE5xWwA42fboOATaUS3ihgAtr6cr7dapV1J0XF4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bTLHbTWX0xkz0MAq1qTj17rigUl56auSrF+LXQr02ex
 98rxjzpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEmCdzMMznzZ/y6cahMtnC
 pxv6m3i+JOfUOx2Yy+TJoZ8V/ir3aXqF14d5154KX9a33F3As2mRNPdLH/mtYSV8Wml8TBYyOxq
 VJr2/cszuNLf8PJ2PPNNM2eVPf428KMV5X/rg7ocmyrcUGvSSH2060NTL81+X0yVHOjm/butOw2
 KJiPcvJzJ7LTDrfhP8IP/Qp1Qz94PvWxZcWfFvfrm5S39Nm6Ku1i/OvGCHRWcNrnpW9efen2QRU
 d2RwDm7W5Kh6O8D190fWl6ePyacZy1voPBO/I9+y8T/65U3TNbLn6jZmBe9J8nj1oFVz79MWtj0
 a70Pt6mnocZTPp79WxxLM/RqvzUKrJ86TbhoueUruaDJAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: lVxqz1nUSCqtGb4-uG6QF2rEcogUHx2K
X-Proofpoint-ORIG-GUID: lVxqz1nUSCqtGb4-uG6QF2rEcogUHx2K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX5yCQ1j+LPyKj
 eclUxX915lcw2g5ka1ubn/MRJgBbQgJROhCGeoVqmqnyYi4vMw0ReAF/rfjzkfiPXIon7MMpW6g
 3bPVqKRkdVvVCMt/OWx+M8vhx1KesZiIk0z3pjD04pdA//ZSG4NtvSHG9gQvIISIASj58qmmJvq
 tT4akRZUcYAqNUuco/nLOprHcf+Gv6YuC5GHCCGSpohdMyBYePwIIyodj/10KwAZcCa5q3x8iC2
 F1nkOzM6Nfy2Zd0OeVlIARP5RxbPJh4jZlQnuNwp0Mehkni4M4j0t+f9ZaRi0ecNPySR5kM96i1
 LRyg1Puw1LzUrkWkYxdKInkifT5d/gBexIPv9yUSW19GuNdW5u40nXNi8tISoEFaV3YU3WO8lfl
 vu5rpR7qXOJEvMxXNzfwhEkCYlqkuaFiWlsiwXCVlb2Nic1xXYkhY+PwJkc6ugiGeqhX8jCzB7R
 HR1+K/bXfiJGSRGEw8w==
X-Authority-Analysis: v=2.4 cv=doTWylg4 c=1 sm=1 tr=0 ts=69829a0e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=YnufBIW6yfzn90QHPNQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040004

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Split the bindings
file in order to provide separate file utilizing MMCX and MX power
domains.

Fixes: dafb992a95e1 ("dt-bindings: clock: add SM8250 QCOM video clock bindings")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
 2 files changed, 85 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
new file mode 100644
index 000000000000..341d3cbb7cbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
@@ -0,0 +1,85 @@
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
+
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
+      clocks = <&gcc_gcc_video_ahb_clk>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>;
+      clock-names = "iface",
+                    "bi_tcxo",
+                    "bi_tcxo_ao";
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


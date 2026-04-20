Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011334B67F
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702595; cv=none; b=iY3fiEkAee1Pofq7Jm48bxNZs7FCZoi5rCsf+3bkb4ABTT6gCoqVBkkl7Od34FRt5cjpYrEj58bhJV2KiMHzLLnh5fGmAdawCCkWan+Erx9VL4OWJjxc14B8omdSM1DEhf2tUYQnLRyWhYxOHh0kezMkxXrkefyEihIEPilqPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702595; c=relaxed/simple;
	bh=8++tdoM0bWTeLdr+13f1de1STU//f0CmIo3qeR+11TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf6T61gslosHSM+rMRlHfX15MtMz3kUxCY0HvDCuXB6Mc2eqAnGmput0riMc15+Osiwmuq60Hxr3J6gnYDz/VdKQ8c2Jq1G6T70Ny1dtQ5Gllty94q7hW1pR08Comw4dUUM6GOKG8nq+GpHkLM+BSWggI9tmct+Ypu/pRGGcbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGwZpZQU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ByIF8L+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGwZpZQU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByIF8L+F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFp4852281691
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=; b=NGwZpZQUD0lILMai
	HZHCb9ZB2WT/xlJ3skwW+zG/svWFPK6ZYst4BGXPmM9kVV2IbTuX3IX4COQXIltR
	6G0SbRqPmU8PaHU6Ucc9hTKnk74kKlfqA2TFWA8LTmKNYNNy+LtqlvvBU5Ismpt8
	FqOSpzaNPdqMr31WFqWijmrUoVUTLu4tqtdcmyybhwgaha56whNMn071yE7f4cVN
	Dn50dEDqnmU7yBfjQZ0cibhtlbHao8cjrAwwzKv15+4LISWLzlEltQ8wFO/J9bEC
	jvEkL4S0uAtvND1Z38OR7g1jhUd27Y0dSwie4AQwy25j3T/5PjKDnwlT/U+e4wj2
	S0fd8A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599n8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:29:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa366fb79so1827776b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702589; x=1777307389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=;
        b=ByIF8L+FI7mzHZpHl1MshJwPoPz4J6ojxLcIg4D7KPoQD6KBhSaqTZBEeXBr7NZvhm
         MgxElxhZiC03jh0gT0JcngdMHZ+A34JZXvyeuMpj9amAa/eK/VWWljbtEuf8WhmBRhfX
         a0lsBxDaH8mowUHEh+8sVs0xrSXTkv70PbHJEj2o6PGSGbR89vrfeOQu5IgpPg/8jUSo
         os0UH1BF0riJXVyoJQwuzoM2KRukF83zoj9vT9ZGNe8cO6ZDGlY31tt+ULZxR3wfyhzy
         c0OgnMo03OoxqH5WPHAN3UeQnIbBz0luxgYQNH5mbZjgMQHCDhkCLakzCBHQoYwBVnCr
         xo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702589; x=1777307389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VXWuxZCanFDMWHQocrsOySflKMnK78h7KKeCmnCbxV8=;
        b=REuSbuFGvEqTL+xvNTrgOTJYO+tps1w6swfZxKeHaS3Yd2rF3UxTjTqN5MYIQCxo83
         864oi42HoYv91W4Uh/hLSdmJq2WhC+at+8B3IV+rKO2u24MCbYYza6qWTNETHgKHUJTZ
         CRP2pHGG5P50CfV8drGt/DWIb/Hh6FQkkyIyESoLZ31nkQHTIE99BS7tlFlCqbvuZn8n
         +goMrPlP6eb6ATnK4HGh2ojmYDgvfAHfaMTEqSnbI64RGInj5vrq5wT2NhH2inYi0OO3
         aX5/oChGE0C/0uq5N2ITa3yRi/O2N3dDMwW4VlzTfj/F+EoK8Y0jnkFc20qmt15NeFMV
         GwJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nVgCqdnBs294znF9Q3FmbHg9BB5+IE+JThSb9zYFD6uHS7T+qYjnd8MTYlYwwjEblV2CHnsFh8T8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJyyQfbBahwdzOUXcLznZpTrsmQ54k1EsRSVBFe6uPrktI5OTQ
	b+4CmJtJrFEHvIPwRGmjr0mwGqWkeSx+un20bbg4YRXYT+UBh0IRXd0gBC8CyERSUhklS2oBhww
	XUVVhGxm0+nCjluqE2h51G8Rf817OT8BJFfgpzDt2jDHX91mefZw3GrFayMELUOM=
X-Gm-Gg: AeBDiesu1E1+duCr3LLe2bwuGJOV1Im4fzMy6mdcqCNR9hMaqKV6L1RxGxxamebbPND
	qJ9eEUvp4BL8Z42e8qy00DSdA3Cuxo4yQk/Av/vy2w4yzYo+fNIYnCccsMsvWZPnQlJLrkJ0vPP
	7xIe5keZbpwYJQ8wBMQ+5TM8jyjy57tL4JJPgMtXGGeqCgtDcBT0nXBcACNI0G+tahDgMyyTpYQ
	lO1950gshpMHZzg5avu6n4NmsRDC58TrGBpBs5g77aYj3001c+7r34M6JWN/PQ4WV22ikilZfwQ
	raqNNW4L49ODb3vmh1+farbe72lDQHleEVCxO9kBlnR7iuQfFYEpdGN5D1DKME6lRysbS3Mwt6D
	qCu6NpBmNSwfAl+ymJ/Ykgia7HeolAq3e3mCeL4Et+ZehfM9MMA6gBFbAP2q7f+o=
X-Received: by 2002:a05:6a00:2308:b0:82d:162c:581f with SMTP id d2e1a72fcca58-82f8c97c71emr14267586b3a.48.1776702588688;
        Mon, 20 Apr 2026 09:29:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:82d:162c:581f with SMTP id d2e1a72fcca58-82f8c97c71emr14267547b3a.48.1776702588152;
        Mon, 20 Apr 2026 09:29:48 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:29:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:54 +0530
Subject: [PATCH 01/13] dt-bindings: soc: Introduce device bindings for
 CESTA Resource Manager
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: xDHOZxaX6tDtXYg_FFC8iRTRNswQKYYV
X-Proofpoint-GUID: xDHOZxaX6tDtXYg_FFC8iRTRNswQKYYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX6yatqh7400+c
 lV8GhrW43H3cjGPRpyC4e3CcPwfHcTvogqinFhDAmOQMgyMfg2mHCVlemCe+7dkq/ZqSLVjH6bW
 zE/JvtPzv77yZGceU85ToYo/dMVHpELwzFdeM8uUJPPFbSkMyU6YWsTXhLd/BjuSBbOhXEw8rIu
 RF46KKVLlZUtK7lzcsawiFFkCsmr/EDrH3oAavejFilk2LTYJgj84P3NotCrEmIU/HNPJIbPWKn
 In42X0aB4DDeiLlpZt0oxJjdz1PIecqtA6SdoWEpJ77K5+ktJ3oM1Tcsz5dYz/3cZAriVGsNxn3
 UuAKslNwqozr6sdK7sVt4vhkcO7ll8Z5zkh+3uNm8vrZ2bPESxKXIkJu9pqpJ/PEGlunQlh4VPu
 UnKSPV0QDCUtXRgyNLnMlObDJdvkffEJw46k8odP3BJEGShUe/IArv5cdvKTGGklax/C6QgGOPj
 27M+py+S9DoTsWQ4E1g==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e6547d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=E7ZTn-C8EJTiI1aftXIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
CESTA (Client State Aggregation) Resource Manager which is responsible
for client side management and aggregation of local resources.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,crm.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a1485db8b7476b0cb0b4e8a41adc8fb4092b731f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,crm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM)
+
+maintainers:
+  - Maulik Shah <maulik.shah@oss.qualcomm.com>
+
+description:
+  Support for communication with the hardened-CRM blocks. A set of SW
+  client Direct Resource Voters (DRVs) in CRM provides interface to vote
+  desired power state of resources local to a subsystem.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8750-disp-crm
+
+  label:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    oneOf:
+      - description: Specifies the name of the CRM.
+        items:
+          - enum:
+              - disp_crm
+
+  reg:
+    minItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+    description:
+      One interrupt for each DRV. The interrupt trips when a message complete/response is
+      received from the accelerators for the desired power state. Number of interrupts must
+      match number of DRV blocks.
+
+  qcom,sw-drv-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 6
+    items:
+      minimum: 0
+      maximum: 5
+    description:
+      List of SW DRV IDs used within kernel. May contain holes as some DRVs can
+      be allocated to DSPs / can be spare.
+
+required:
+  - compatible
+  - label
+  - reg
+  - interrupts
+  - qcom,sw-drv-ids
+
+additionalProperties: false
+
+examples:
+  # Example of Display CRM device with SW DRVs
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    disp_crm: crm@af21000 {
+      compatible = "qcom,sm8750-disp-crm";
+      label = "disp_crm";
+      reg = <0x0af21000 0x6000>,
+            <0x0af29f00 0x100>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
+      qcom,sw-drv-ids = <0 1 2 3 4 5>;
+    };
+...

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FA3BF66E
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773410; cv=none; b=ODP9iaK6O8zyUzBB/hkE5jODgBAde8nqMbbW2ZXOXtJYo9S8+XIqF4bsllmU8G/mxuOok/CQjSOcjm/kv02DqJY34K+YY8n0koJW4Du8if75VeQXxviZD0cYrjrPm3Qg/+A+09IVqlvRqvG+7qOrdbGeaqVPzajWdXshaVdmlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773410; c=relaxed/simple;
	bh=PPpzR6Fy3ALZUlNzn9X9rfLsNAUY59r/ulVpKcsIzrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8vP7RvWSRW6yVKOsYJHqUlFHXuz1kSoHTS6rgDeCxv6toieZzx/IETImk7B++8vRNBeUjc+oSlehR4R+Yhf1NQX4M/HSp76YjE7KXyLjOZ11cdHsYyMvnR3eqhXB8ZELXsOUmrdk6LKmmoWX6YVMdeSa4rTzvKjLJlpBKMF7yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8M37NyK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1nB4rtn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8M37NyK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1nB4rtn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2oK9F3063423
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESLi7GDGI+mdPVzEeN/1L177WzF4D7iWWh1EznIzvQA=; b=N8M37NyKk79K9HrU
	/hS2Z2QP3s8QH8deT4R91JyZOSWh4Q940U5dcJpIBUqMeANZYu5bTakm4hh2CuMB
	WZ4y8+wbzySWka04Gx1rSue4pbRKJqeArEg9sHY1zvoF69W0hdHBtbLgulG9PiSt
	J74YRfpZiQvuj10ij3S93fyzfiep5+0zXi10BKZoXRYkLNM69fhpA89ywc38LqzF
	G/Ebxi8xn/Ba9IzsrVG/BgMzLXrmZNf0P6v1w8v2FBqUcs1e0E3opsA4TnqiEB7B
	xr6odGNh3+yFPyalilBbliOsaotI7bIy57w8cV+hNqMIBwoWk3Xgom3/ucIJGmOs
	uAE5+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gkmak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:30:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so111308205ad.0
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 22:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779773407; x=1780378207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESLi7GDGI+mdPVzEeN/1L177WzF4D7iWWh1EznIzvQA=;
        b=g1nB4rtnP+ZPgFR89mdrTDLorK0Dq8597BJZ2lupn9Rlz9TzMSWHxKyYGcwSJjBCai
         AjxjzL2UE64Speh6kLXj7IcC8trPIjk9HGyecyyp5ZNPk2NbpgcOq2IbNWrIEBUgOZ6x
         V3XObr4AQDynagNMtLWPTdWq41wSB/GCBoZ8SndBTxlhPnoJuCVJJUtMucrU1vDOG7O9
         WgTVnMw5P5cBknovlkMBK4XSChiz3gXZrugF0AoNqK47FLiuZM1LNgCRVLp5YZt/LUph
         v00nDEH5PjUaP+WO+cUas3i3m/oLOxs3j+zyfibh06RlHwRcTE/B89si+dQ4jr6PAJHT
         4kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779773407; x=1780378207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ESLi7GDGI+mdPVzEeN/1L177WzF4D7iWWh1EznIzvQA=;
        b=gEUZW5eO9wMkwjDyfTChfKQSGPSJpqRJEA5dqNyrYkszvothxoFZjF90pB/r9fy2AY
         NIp1LHbS+HX39EFm+nCpjXJsKNrySbNlExwGO9scCq4jx2BvasFXYFPjgUPc8TXvuUHf
         FrzgYZ0GCVwqQe9Amtw3rq7D6QTB/yHGf4b4vzPqiBsIIdOtpnjIfGfZDujffvq/7p8S
         jRCLsLiAd1YdwGVjnNl2IvNfkeIvglHQZHtFrT+hlALBHVfhdmCzjgps4R4wS73ssjZC
         i30PRus2PYEy2HN3kkUY30rQJO5SxjfRcvbErHYHheSt+6HolcAfQ6x61K02cGQvgkqM
         fRHw==
X-Forwarded-Encrypted: i=1; AFNElJ/qm9Bj8V7e8pGjmss50IskZuPbehJJK7enMnQfmJECkHiGl2/1SMpNEZO0NYiFdsuPL0HFI2Tav2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOipeZs0EoyCtoE/rgtl0CrBn6W5/K2pmdO/znjsskjwF6lvQ
	Zef6SSN428i6IJMqyl9jyRvXd+lLyvMofAZpoucs/H85nvlzm9+ZxTSwYOftwnFV4aTYTuzSmr8
	gc35/O6RLvzysuN+PDZeCUZ5lZPdthG5D/G7Tju1JizIr3bfCpKGZPNgk14TLhz8=
X-Gm-Gg: Acq92OER5HpiqgB+RYzQWE0uthrUfjvPbbzYw64UUEKRFCVU/dOXdvxfxRmxEACjDqZ
	n6Dn2QqwFX4/kXGRW1X0dA1tIRhqWkLBO/RadOWg0c/oOOILxBj60lpKeBoOGGggV66svicIi1R
	hym86aAvkAVoDFm/FjegAP4P2MwZOvvazDAZTR3MEohTNjJv8/Jm+asnAE/pc2u5BqFGITGJU1f
	0ssxFJmBiVzel0UUnuoHMBtNEu6UmTU6L4AhIUYYlASLmyMXY0OVTuFbP7wnyONHeVrv/U/8oj1
	NczIIS3HvbWRnmjon6DoGVF1tEqQxOFSM+pg59AJvxkAfCjwV+vrHnakkn+tJkzPUUq7wlN5ECo
	jr9yf4pzXCVC91HcOavzbyvQvPY6gY1iOBJi4XBq8BRnZfKd7HyCLEWbE
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr123066095ad.5.1779773406405;
        Mon, 25 May 2026 22:30:06 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr123065755ad.5.1779773405851;
        Mon, 25 May 2026 22:30:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b7920sm114088995ad.21.2026.05.25.22.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:30:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:59:45 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add EVA clock and reset
 controller for Glymur SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-evacc_glymur-v1-2-b61c7755c403@oss.qualcomm.com>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: 7wCcXxt2VXyXMaeDBSD5OPxH5N_-y6rb
X-Proofpoint-GUID: 7wCcXxt2VXyXMaeDBSD5OPxH5N_-y6rb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0NSBTYWx0ZWRfX7HJ/2MawH7tG
 oBPqMTTKeltV4FsqBarQhThoyprY9K/Op8ZFQmRO5ilu8nLi0oKylGa5hZQxKJ0eBLyDMMNkqIn
 Qs5/NPs880OkttGAgRN7oAjTaQ3Qw4Iuu0lS/kAHEel1SXuccWgE0GRd1awzBpYLIo0YcKmS9dF
 XXdR8VcmFO0mQQEHRFOxM8TmOHMm1l5VZH6ipCF3vuO9W+cUzDpBZ9pHHk85kANqv+JMpmgcF3r
 BjWNwjAkHP5F9yKf07LpOdvzr816R0IM+i0dGNoUkhUhUKMc/VcsHxNVioCGYaK4q4PuGrNBHSt
 FewF0FtwtMq/GSmNexc6VcZJGOOlG7W204ViamBovczgVbGP7gNLj2FRP0oMpVhRIqeIjXfwFpg
 QaYINf1HlX5SisDa2JT33bIBrNyfO/XzOxA1SEuZ5ZN+VrgUIVspXwg3l3skjVuBPHFI2KfmifY
 9KnJ++oEia/Bcjstl0g==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a152fdf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=QUVFY6MdtzYYwQCb-hMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260045

Add the device tree bindings for the enhanced video analytics(EVA) clock
controller which is required on Qualcomm Glymur SoC. The controller
provides clocks, resets and power domains for the EVA subsystem.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-evacc.yaml          | 76 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-evacc.h      | 38 +++++++++++
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8315e3ce82ecfefb5413ce1c42843adb0bce50d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-evacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm EVA Clock & Reset Controller on Glymur SoC
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm EVA clock control module which supports the clocks, resets and
+  power domains for the EVA instances on Glymur SoC.
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-evacc.h
+
+properties:
+  compatible:
+    const: qcom,glymur-evacc
+
+  clocks:
+    items:
+      - description: Interface clock from GCC
+      - description: Board XO source
+      - description: Board XO_A source
+      - description: Sleep clock source
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain
+
+  required-opps:
+    description:
+      Required OPP nodes for the MMCX and MXC power domains.
+    items:
+      - description: MMCX performance point
+      - description: MXC performance point
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+        compatible = "qcom,glymur-evacc";
+        reg = <0x0ab00000 0x10000>;
+        clocks = <&gcc GCC_EVA_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MXC>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-evacc.h b/include/dt-bindings/clock/qcom,glymur-evacc.h
new file mode 100644
index 0000000000000000000000000000000000000000..35a7b4550351661bdb1f7bdfbeec625fafdfcef7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-evacc.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+
+/* EVA_CC clocks */
+#define EVA_CC_AHB_CLK					0
+#define EVA_CC_AHB_CLK_SRC				1
+#define EVA_CC_MVS0_CLK					2
+#define EVA_CC_MVS0_CLK_SRC				3
+#define EVA_CC_MVS0_DIV_CLK_SRC				4
+#define EVA_CC_MVS0_FREERUN_CLK				5
+#define EVA_CC_MVS0_SHIFT_CLK				6
+#define EVA_CC_MVS0C_CLK				7
+#define EVA_CC_MVS0C_DIV2_DIV_CLK_SRC			8
+#define EVA_CC_MVS0C_FREERUN_CLK			9
+#define EVA_CC_MVS0C_SHIFT_CLK				10
+#define EVA_CC_PLL0					11
+#define EVA_CC_SLEEP_CLK				12
+#define EVA_CC_SLEEP_CLK_SRC				13
+#define EVA_CC_XO_CLK					14
+#define EVA_CC_XO_CLK_SRC				15
+
+/* EVA_CC power domains */
+#define EVA_CC_MVS0_GDSC				0
+#define EVA_CC_MVS0C_GDSC				1
+
+/* EVA_CC resets */
+#define EVA_CC_INTERFACE_BCR				0
+#define EVA_CC_MVS0_BCR					1
+#define EVA_CC_MVS0C_CLK_ARES				2
+#define EVA_CC_MVS0C_BCR				3
+#define EVA_CC_MVS0C_FREERUN_CLK_ARES			4
+
+#endif /* _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H */

-- 
2.34.1


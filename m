Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4E28FFF6
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328612; cv=none; b=CeYN9tdXabyQ5CmVSaUrbFCue9pcjwaoe/W+NaUKBLUtq6Wwg/iNPucT7G0nDQaOH6+iiJRrT44uRjIrR4b8i8WFW7FkuEnfWpXqtVCObNbeoPqbiuSoH+uf9bF32EWxq3ZruzPwLucdANP69CqsW36WoA59Y6/7IXZd5cu1+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328612; c=relaxed/simple;
	bh=mtVrV1uYZXDyrVr/tVpZRG4gZ+TsBy9yYnmosCcfvew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZpMA9/YNAcewWjhgVdT1YUOuQJdID0SqjUqY54LPK6XrkXdLUwOM/JLQWF8Rt63PcEvDN+etciBXowbwSo4WF4eDHjkOfecQrnvrxvNQWAmIaFMEeG6kt6YS36mZR34mAnQfdZcNjt3d8WmpDAnpwpL1T0doNwlJOZ4L/hnG5q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdfK5mYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSREcyfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdfK5mYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSREcyfu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm9752744019
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=; b=JdfK5mYBUw8Od7lx
	mnYx8xKrBAxPDulL9nPlnbBpRY36/r+pFoL97Bg45H0yVhsu0CGisLqDW9AjEsMe
	ULzloGtMg2JztODH5JxXXXTyPEeaAMNnHBeFvCdsWDxEOkc8fqz0PR35v4Vo+V8U
	fDiv/YlPsOX58o4V489IAh69Zpx76LVbTtmVw4+TQD/Q1Pxi7uI4uXCGDFIhpk5A
	W8hcNNYKipPedlEhm4xDESYRn69mWSDPS998p0VENHHo24Yd9MYkk1RG9MSh395R
	of3OveJN7v8USCDTyRkAlWov61FuxFX+ma0wx6jp5VzPJ8IQR6dSfN6WNVglvT38
	LRDIeQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdnaf2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:08 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2fb8f0df0so767961b6e.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328608; x=1787933408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=;
        b=RSREcyfu9dV+/ICVueQ2vbGIYIg4ReUZvQPY7LIak62FVO/8Khi8zu6PZvrq2wnoNm
         htrh5F1JhDrBT0ivTQQQkj+Qvm3qFfD86Urhk/Bkr4uVsdTNs/smseBkZollBh8GMGKS
         9VEvsteph8W7SY3l3OH6EViEPHDRhwKj0YJRSy+78lKcb/9AVmBSK9HQbxlsqUJEWybg
         bldnOzpbASBSZpqHnFkW0s38amIhKnJBcdV1Iryp6QnLE09gjRK/S2HmrGMpakQs6oLB
         V5lQvslCuZY/HFluPLj1zySGCb4rmlWaMtZxBugkVk/U1Niv0UioUoI/9D7a8QPw2r4u
         A+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328608; x=1787933408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=;
        b=jNQJSvYewqXmBm6h3ePcX6my5ecTxovQYKuDu3lVwRKgdnc68vhNkWHxYFsfKKSTNe
         0MEl1XijAtRF0mw1MJQ5/yfUiUinhJgDDxQMR3v59gnqxQEzvoNCrWKfFc4ubZgdhT6h
         JcMWXtSF8u5sNr6mDvjF74OIYhPbR+xOtN4A3ip3yzW3jo2rfEks0Vt1aDJ/yOy8W3HP
         Wzuo8M/r3+6FxWALOq5zOX1d9olaGpfiGu1VIBWn7H9oB9eW701Sfvy1A8veolVEr6PS
         oz/Kiphq9etpAmZxK1j/OW9qL8VeXmQ3zjB0LucsO0bX85/rzLnNV/Rlg+AsyhVgnFwS
         oZ5A==
X-Forwarded-Encrypted: i=1; AHgh+RpJTFU5wz33E2QFh1OC/Vcf4dQjdDogH7l+cWL35AFG9UV8PlykJ+qogEvVLU7mpZCxiEDy6KOrzuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0fEOJw5BqrNmf5zg7BDCyxcQH5U0wwoMehUwDHf2VaWr5Vh9t
	TmE+fCHp0xnLNFeyDgmhne84s3xzt60QPe0r7IVBWlTVNhziY9Mufuw/chWa2jjA6fiPw6CfmgZ
	o8SdNW85MJ4vVysJZ2A4hD++PTZrQPZ4FOG72tLx+/Gszy0y5Rn8qS24EAu1pZCc=
X-Gm-Gg: AR+sD13NzzlnRJR3ghZBioztZoTipdx0F6kQ7UHPgz+aAKmS0x8la9IpkfSQ4DrIHQy
	oLOd3ibt5Cby49oEQVj2PemhZOmw47B45AjXnej4PUI/PIs4kHAKVQEqJLUYp8yIWyMj7yJ0V6V
	rwTRbQTJuSKHRYO5dewOf8UEMI8suE3oSrMbpQxu4uYysCLxiv01w/WjXLwzJ2waypG/NsTzaTR
	R20sJhIaFW/Issi9jpMyfjqGsrjq7eCO9TGIoga/hbjT7eE5Wo5OqLBYw40Ven2kAGSVtGnK8qX
	z6fKq27tD7ZUtYYT2QsTy4K1vlPfJLLuyp6+M+kavKGqYtL+x65rRJnRoOp0pW2T5PnD226j3oW
	TSl68hBJdZD/jGQA3jgbWJ5ndMHUj8n6OW3ckRmRCsdX3bXjIa9vJEKa+P99+Zarad8IIO5MxBJ
	XQt3Nt1Ptc0lO0FBBSBc8wFWQ=
X-Received: by 2002:a05:6808:3c49:b0:49b:dcb8:e2b5 with SMTP id 5614622812f47-4b2ef32fbbfmr8775308b6e.19.1787328607640;
        Fri, 21 Aug 2026 09:10:07 -0700 (PDT)
X-Received: by 2002:a05:6808:3c49:b0:49b:dcb8:e2b5 with SMTP id 5614622812f47-4b2ef32fbbfmr8775199b6e.19.1787328607195;
        Fri, 21 Aug 2026 09:10:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:10:06 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:59 +0530
Subject: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=6723;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=mtVrV1uYZXDyrVr/tVpZRG4gZ+TsBy9yYnmosCcfvew=;
 b=7PUGi/8pw2fm6JVgwRuMQ1lLjBQHi4gKEBJbyChLH2ALoQTlEK8RuCF8rjiCbtGttm4CyiGBe
 p05KznwNYIEA9LdZDATX5ua/pk+BnSBmqZuAeqP0x9UX7cj6BCJxQ3Y
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXxBBgZMhQiX8n
 PmxJQdhbNAlLgsLhvp2Yrh7r34e9qgfxfAgZw490tQhO6tzUAj1KADCcIqiqCIEj+JJeStCogeq
 xrJF4NODZFW83mojMZrlwVrhO8f89pKovFAimmxbw8x4MTiLVIf5xjY5jedRCMr5oLExNew8XpO
 +FAvwL2vuJ9Dx2SbAzsfGrKyCefGk6b2SLsomlSrmdL39ETpGMryA87IVgXhTFEKcpJi7P0e1T2
 diEABGnng4yiUpsYSFEpbcGoKcRM9gadwRZQMzdRfGbAP+NnXxwNoOip+ZvEFGCbkXTKgSzB8AA
 Y5elae+X+gkPjOBGGAP+15t+y543uGzi2winmafQX1T99TER2YYAWiF58W3+7n/6E0pWwv/AJsa
 jYnqi8B4AqtSPHjo/HVLRG2N9MLJ3X8sUGFY5QrVZqBSqA/xXEDVizN3WW3CyerJpENddHEv5bP
 7hDBOny2n7jGuB+Jw4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXyq22/ltB8Xf3
 QRmSoONvpqG4jA9ZNxF6roIOyjVSHd45uPbQC5X9ZEcW5EOa9keiPvP7dZGvvFueMeiD4epHJie
 gllQav7xOOPAuGkBssxyj7HmfJm/hws=
X-Proofpoint-ORIG-GUID: u_uj-oT4oBSteEbzLXa4BdVclHAgCzaE
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a887860 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HzFHdt0s4hRtsg76xsUA:9
 a=SZrWHX6rubHfZbWI:21 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: u_uj-oT4oBSteEbzLXa4BdVclHAgCzaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210126

Document the RPMh-based Network-on-Chip interconnect providers and
associated node-ID definitions for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 117 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,kuno.h       |  89 ++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
new file mode 100644
index 000000000000..576ce8b1a802
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,kuno.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kuno-aggre-noc
+      - qcom,kuno-clk-virt
+      - qcom,kuno-cnoc-main
+      - qcom,kuno-dc-noc
+      - qcom,kuno-mc-virt
+      - qcom,kuno-mem-noc
+      - qcom,kuno-pcie-anoc
+      - qcom,kuno-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kuno-clk-virt
+              - qcom,kuno-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kuno-aggre-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: System NoC USB SF AXI clock
+            - description: IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kuno-system-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kuno-aggre-noc
+              - qcom,kuno-system-noc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kuno-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    interconnect-clk-virt {
+        compatible = "qcom,kuno-clk-virt";
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@1640000 {
+        compatible = "qcom,kuno-aggre-noc";
+        reg = <0x01640000 0x33400>;
+        clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
+                 <&rpmhcc RPMH_IPA_CLK>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+...
diff --git a/include/dt-bindings/interconnect/qcom,kuno.h b/include/dt-bindings/interconnect/qcom,kuno.h
new file mode 100644
index 000000000000..eacbae38f85d
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,kuno.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+
+#define MASTER_SYS_TCU				0
+#define MASTER_LLCC				1
+#define MASTER_AUDIO				2
+#define MASTER_CPUCP				3
+#define MASTER_PCIE_RSCC				4
+#define MASTER_QDSS_BAM				5
+#define MASTER_QPIC				6
+#define MASTER_QUP_0				7
+#define MASTER_ANOC_SNOC				8
+#define MASTER_CNOC_DC_NOC				9
+#define MASTER_CNOC_SNOC				10
+#define MASTER_MSS_PROC				11
+#define MASTER_GEM_NOC_CFG				12
+#define MASTER_GEM_NOC_CNOC				13
+#define MASTER_GEM_NOC_PCIE_SNOC				14
+#define MASTER_ANOC_PCIE_GEM_NOC				15
+#define MASTER_SNOC_SF_MEM_NOC				16
+#define MASTER_QUP_CORE_0				17
+#define MASTER_CRYPTO				18
+#define MASTER_IPA				19
+#define MASTER_MSS_NAV				20
+#define MASTER_TME				21
+#define MASTER_APPSS_PROC				22
+#define MASTER_EMAC				23
+#define MASTER_IPA_PCIE				24
+#define MASTER_PCIE_0				25
+#define MASTER_QDSS_DAP				26
+#define MASTER_QDSS_ETR				27
+#define MASTER_QDSS_ETR_1				28
+#define MASTER_SDCC_4				29
+#define MASTER_USB3_0				30
+#define SLAVE_EBI1				31
+#define SLAVE_AHB2PHY				32
+#define SLAVE_AOSS				33
+#define SLAVE_APPSS				34
+#define SLAVE_AUDIO				35
+#define SLAVE_CLK_CTL				36
+#define SLAVE_RBCPR_CX_CFG				37
+#define SLAVE_RBCPR_MXA_CFG				38
+#define SLAVE_RBCPR_MXC_CFG				39
+#define SLAVE_CRYPTO_0_CFG				40
+#define SLAVE_EMAC_CFG				41
+#define SLAVE_IMEM_CFG				42
+#define SLAVE_IPA_CFG				43
+#define SLAVE_IPC_ROUTER_CFG				44
+#define SLAVE_LAGG_CFG				45
+#define SLAVE_MCCC_MASTER				46
+#define SLAVE_CNOC_MSS				47
+#define SLAVE_PCIE_0_CFG				48
+#define SLAVE_PCIE_RSC_CFG				49
+#define SLAVE_PDM				50
+#define SLAVE_PMU_WRAPPER_CFG				51
+#define SLAVE_PRNG				52
+#define SLAVE_QDSS_CFG				53
+#define SLAVE_QPIC				54
+#define SLAVE_QUP_0				55
+#define SLAVE_SDCC_4				56
+#define SLAVE_SPMI_VGI_COEX				57
+#define SLAVE_TCSR				58
+#define SLAVE_TLMM				59
+#define SLAVE_TME_CFG				60
+#define SLAVE_USB3				61
+#define SLAVE_VSENSE_CTRL_CFG				62
+#define SLAVE_A1NOC_CFG				63
+#define SLAVE_DDRSS_CFG				64
+#define SLAVE_LLCC				65
+#define SLAVE_GEM_NOC_CNOC				66
+#define SLAVE_SNOC_MEM_NOC_SF				67
+#define SLAVE_MEM_NOC_PCIE_SNOC				68
+#define SLAVE_ANOC_PCIE_GEM_NOC				69
+#define SLAVE_SNOC_CNOC				70
+#define SLAVE_ANOC_THROTTLE_CFG				71
+#define SLAVE_QUP_CORE_0				72
+#define SLAVE_BOOT_IMEM				73
+#define SLAVE_IMEM				74
+#define SLAVE_SERVICE_GEM_NOC				75
+#define SLAVE_PCIE_0				76
+#define SLAVE_QDSS_STM				77
+#define SLAVE_TCU				78
+
+#endif

-- 
2.43.0


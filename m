Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8609A442B23
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769594; cv=none; b=NfaYxnrgECHSfAgt3ZF7pZwt4uNcNmLcRUbxZ05w+Kv8g4flCb1wW948nUCAGfqkOtHOtXNClkeGyoMALk8WPrbnP3lCnxErAdZIgivcH/53Oa86PcMshZqoy8Nzqht/V2IoMTwW1VxVYnQ9phXBQWOFzLCGN7apIV5nN7Ul3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769594; c=relaxed/simple;
	bh=6ilCrygcJVQCwHFjl0W5gSS8nhzKVETMGaO0byKSZ6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFbMrR2myVGsoVy23pC9xH8i0UHZnenwdzNxBe9zY5SCHkMN7fDbdPqE6oypHRf/cVmexbKN/1qTZfKBiJpAkAxyFKQrRP4kwwulHLk1gOVS5IVNprsIidXbL17Ze6jpoFuUtRBVFLSb8+oe8JPLzLGq23Bh8KXLkD/KM3g4EA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxXcsNgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGCQVteH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxXcsNgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGCQVteH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777uBG3686803
	for <linux-clk@vger.kernel.org>; Mon, 7 Sep 2026 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVR68Ul/xnzrbUTxNhIxSbewKkviF9tBTQO1ocKFetI=; b=IxXcsNgF6Ybmw/i/
	nt5eP2O/ebvNBTzlXl6KLd3sdeub5YCSvT9SaZtyWyN3IBAiNi7w180xVLZMsRoU
	9Ok7X/Ev1kFSMg7lk/ha4TCSm+9mW26SYrgeks3SWWDgiOCgF0h+3qNyKxqgAZHn
	C9y2WoFvs3mV4I/xMMHQceYz6bzHUo5GZu1BD63SmWajUQy2NcO7+tzZChCfUtZL
	2YpLQC6m0op/NAoLRzRkVxqLzfKA8JRUvdzwNHReH5xuVlOnyuVG2ZuCy2zf/BrX
	2kKCx0VsQ8APz2FjWrnaHqVFRG0pDzA1sgSw18aVBISolZ0LIGltgjVIPvu4kqRn
	1zPA0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga37630f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 08:26:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so5279518a91.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2026 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769590; x=1789374390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVR68Ul/xnzrbUTxNhIxSbewKkviF9tBTQO1ocKFetI=;
        b=gGCQVteHuIClNWpfvv9EdGS7xeEHQID+r7dbAN/oDuX0Ehsb4GaJErlq9MOF+/TywU
         sdMjKMUW2TIQZA78EVhjf+cJaI8I7FcjoSlao4EMHaW0WAXFl0txDhLzj4EEWXBbSe3o
         oR/LN/6yfW1mbXUQ/GzCTiJdc/VF4F7H6Z6Wml70hF6fn/12LhMgvvofOPzZBMeME5nu
         xMn9eDLxrqe7QLhuErnzNjINLjk+3/DqSOWrFKzrdTT49F8366W8CvSJCWFe9x9ePW0T
         CpAWlXJVzoqPSqahKP8QPKVS5CJHo/fsOsOUTomqHooQQ0ofALb2VNj9yM+67CWMgDj4
         TBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769590; x=1789374390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVR68Ul/xnzrbUTxNhIxSbewKkviF9tBTQO1ocKFetI=;
        b=CLo8n4DMZsTpq2LIay3ghV5wW2JakWQ0C2khcnSg2O2e6F/L8jhOcdRFpBvGBhfSWo
         P0ty5PYgBKzxg2UhU4dqnaOsxztmA9lITYERjO2BULJWy8Goa9hlDCmoxYSv/6nUjh58
         MuIGDSF0bE167dczcrKIu0tVw/DgemTB3nCSb6/6b5YIKEP8xniCAEZjlMRhwHRWe6WK
         u3k/t/oAHhKjubIBl9IBHS0CajETCvPY/pcMumCmKZaumBUEVTk5xwWvSv/bdUeIecZC
         tXwVrFGxKPPktOuQVduE7scR2SLMbVUZiRusyKL3iVAIszktkCPYVfxCB107vRMyttwf
         oX8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxnLMWc2WN+9i/2OV3ZVJMv9R8U2kyTpLedb/4yrK1qTCNqzOf2sZ/GnWBItmS5h+CFG3FZXgwbmuU=@vger.kernel.org
X-Gm-Message-State: AFuF++l4ZrlkBpiNO/XuQJWQdY251kbPJIX0DeZqdXJMqb7lZNbHksWi
	6kMLVG+2AQK9kDwfB8cQstdWlfBejv5jQMo9UD39bAecSNb5YsDBIsNZIq8deRLtHwFVHZIy1Mu
	r0ZKjFHrBFEWLqT9GyBlJkNJAQGw/yQsKmdKwcaCuisCsiS639hdcsaOxQx3JEpE=
X-Gm-Gg: AYBFou3JCS96PFXBNvdNLfRT7pYBvjCZw7F2KyOb9vNJQptfNqZEkqy6yft+JrRaXeH
	vCaOchB2SWGKBpwqs29uRRhpeSj4kXSmxICsXYYh8NY1P6oe++Cjr1NC/0ptHnpC+bCo9XS8oXC
	3mR9UDzWLlUjk4CtcAc2gjSofK93FZ+AB/+ISOruglN0es369boNy9E0DMU/DOVy+/2u76Z8DPb
	cX7hlbBpMPIgxEjPmeO5ahl5spWSwc2svvXSeo3gfe5PuRaMzv4/+i1/NJWJbeOjmubLN7S53PG
	hCg9PRRsNsXXZqOc0X3EHIa2EbUHPEorpFl4vijFvdylmLJ6pq4n1/0kwzP+qU8SCdbhmNCMgYb
	WiylXcGSbVxwhXmxeNEL9D4kA
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr30533065a91.11.1788769590337;
        Mon, 07 Sep 2026 01:26:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad1:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39b2616ef8amr30533020a91.11.1788769589929;
        Mon, 07 Sep 2026 01:26:29 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:29 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:56:14 +0530
Subject: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 1X2ao0w1Jw11ihXfZOP-UDdT3Szjk2aL
X-Proofpoint-ORIG-GUID: 1X2ao0w1Jw11ihXfZOP-UDdT3Szjk2aL
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e7537 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1x_EA7c-f_fbMv8ZdKgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfXy1ehVc3e5n0e
 BYfh2hCiHwmBtt6BBnTQlqOUfgmvEiZc5opyerSDEiEXExzFFZlOXOcjfBPi++/k1OWF1zLl20e
 KNk9tgmARJBU4SwOzzNyGk8QxkGswvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX+3Kf2W9wDXwt
 qj7+uzH+gsQcw+fBw1ttjyxbzlyUeUWaqVCCkgtzZDYw9GjhGSLVAjhaPx9nZ0rlxtgfQ5b72O0
 IIr5VUvEMg2Fd41yOKVKGpRY74ZzjZzrHxOU9KpGIRWX/vmSJS1Yi7FfU1p8jmglwZEWz4hj1G/
 WNxyNxPH0PAun/x5ySJMQFkfYhVrPRLJLOrozIO6qKuZnq8GfBqt7T0LLewYcVghdKoygUdQf7K
 GXguig+czIMnogOUOZeszzl+o+QYR1ZKVH6cBDuQfihzry73TDNLHhZl6VOnftx+foR2MmiimDB
 Hw4Tk3CiruhmEV92gWgiKEOvTwVK7zbI383roGDhRJVeZ/PRuKDOvAog75HjOo+Gb0R1MHkWcU+
 cfYyieeGzZ2rEjXpYe+qf/iaEsADarcXm8P52Q0aRTaCzp6HMNg/CtTZE0OzRv+D5Ld4w495Abl
 WlGIClXS+FmQWgkLVkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070090

Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
 2 files changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fbaaad1f3db3ff67589d6201ed0e25710c044614
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DPRX Clock & Reset Controller on Nord
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm dprx clock control module provides the clocks, resets and power
+  domains on Nord.
+
+  See also:
+    include/dt-bindings/clock/qcom,nord-dprxcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-dprxcc0
+      - qcom,nord-dprxcc1
+
+  clocks:
+    items:
+      - description: XO clock source
+      - description: DPRX CFG AHB clock from NWGCC
+      - description: Sleep clock source
+
+  power-domains:
+    description:
+      MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
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
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@a940000 {
+      compatible = "qcom,nord-dprxcc0";
+      reg = <0x0a940000 0xc000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
+
+/* DPRX_CC clocks */
+#define DPRX_CC_AHB_CLK					0
+#define DPRX_CC_AUD_CLK					1
+#define DPRX_CC_AUDIO_CLK_SRC				2
+#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
+#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
+#define DPRX_CC_CORE_RCG0_CLK_SRC			5
+#define DPRX_CC_CORE_RCG2_CLK_SRC			6
+#define DPRX_CC_CORE_RCG3_CLK_SRC			7
+#define DPRX_CC_MDP_MEM_CLK				8
+#define DPRX_CC_MMCX_XO_CLK				9
+#define DPRX_CC_PLL0					10
+#define DPRX_CC_PLL1					11
+#define DPRX_CC_VID_MEM_CLK				12
+
+/* DPRX_CC resets */
+#define DPRX_CC_DPRX_BLK_BCR				0
+
+#endif

-- 
2.34.1


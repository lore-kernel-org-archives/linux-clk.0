Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2207C385D67
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692820; cv=none; b=jfhAP2adlMtv80M7AA3EWzwe2r8Oo8QAOniCrWsiDn7kPPKsQ129BHxkk8UvGoksxQpbwSsZlZIgwd0bUCjc29kEqalXFiPTnVE81NQ09/2KiLfXLf4b0FRMXWk9gNnrfs8/L+/oStFm51dKevr9lN/Wu8IR6omsTs0vYZDeOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692820; c=relaxed/simple;
	bh=RDAyPUHQMKd0UCR0T2UhbFhR2yIFwf1uGVlsiEAfgzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koc7Hn2NK1tkhbLj7fF5o4oTF2GsT9NapTsx+zsL/OReGlBDSyfcLPY1xDaGDwm8kqssBOcsiQHSE/ZZ5ZcvLNqERxOgQp12FE+ggcaaKSji4wMvjVcsfAT02dlPsXKPd2ScEMcVv1R05SN1M4apazxsqX1y4AQJ6mzRrQ39jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpi8KKqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/PeFpii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpi8KKqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/PeFpii"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QpGU594176
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=; b=gpi8KKqn25/uo+Jf
	BIPShBBH/LpHdwg/dXkV101E4hpWYBAsqbzH08bh057VNJAMOVl/vbtGTr0RwPLh
	FS62tdzCYo8X7qDQF4cU9fJM9bNyGFL3NUZ3i/yFVTQV6Tb/3935Qu9icnEvCV1R
	IK8tLBzw2uIjHZsLp0Wg4SJOF9o7X1KXv3iz/y/yusncpQSEo6qDRg4uHVWRF/CW
	Gy5mROfW3NUstgHchmPLxAEB8upxb0gX7hSWCWa935NHxYCbBEeIrrqKPsr1OqMf
	vuLxwX6jlWd7nJaUMJIDNXH1ZsVCHVOOw8o3lymVoDskN9RghD+ZtFpEcQE81Kif
	wrNJeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4u8he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:33:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so911111a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692806; x=1787297606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=;
        b=R/PeFpii9bTJpfGbOFZ+TNu3V7aer71b+wALZE7YxkzMk3+4E+n9BYZmv5gHfr/xHy
         VMCKEGDQW/jghBB/oLA6wyxR/yMnkR5xwMPfkAxejB+I5ep+GabmfuLQ47mLbTc/SEmF
         /j1t7U1poyXkL9wE5izB8K6bvqCWFbegwtPQDtFeUVWUyfi08cviULjIsvxkQMxSeR6i
         0VFTR+3nS/1dpkaLAWD+U41ety/QKIQOXt/DLNWFKKK9vBz3JdBq5VUsJXin3J1/Ctwr
         nJnW8oEterxBc+ur4yg5D9s/8ChLM+dujOGIojv04FHmm+TpiW8eYE8o2Y+7wOiUvFSC
         luEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692806; x=1787297606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG4tGMO6kvaIZbaI3ajfRrdIAplElSjZ8UgSgWuKV70=;
        b=kNDkww4jAHUaGcS39676MApoUSsiXgYp0vHZWb3Y0CMJmRsod2SdOTTtFt66OPkYWh
         lxd8a1PUtrPpKJRHYJs6dFt2bmjbcj9KmT3pF30wM1YEGtZmzMCHxJrTzdYO4O2omZlh
         F1H8UD6reo38bXxECQwF/jAerEhlN5mM/Rs7zUW6ewIhkVk6Ckm5z1yJgSusqdsPxA3h
         N5NKIqGDyGub3RoEtO0Knj4eDZGoN7Dv9yLwWDX04egWqMzlZPLFG0gcXqh2lwpa8zdf
         Es19UxLENatHtnK7nD/rGZ/3D9/i+JcFOvF423ufNoRG+ZmyuZxAmFKYY1q9VvbyYAh/
         LcWA==
X-Forwarded-Encrypted: i=1; AHgh+RquXhE9nLOPyyxPBPcOjKu3tuU4RdgOIT7EbOeu3DtP3HAOy54dNxDTu8kz9Pfedt0EW2dwJqOCFz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYczhr7L6TAw+ANJQT3k7aSaSxgmNzB/uSNORwkEWUFuf0mD0H
	usoNqf7M63wnEda0j/iqUspdy9oPsVw8cQfXb+IELnEYBMz1eMpwzuFN40Oq2oBAf1cjq9NQ95w
	agin4jzBJg7EY56aAFQcuNiHULDB+ZsfFWHAf/sXlxrtVdvbZaOjHbhAfGw/ju2s=
X-Gm-Gg: AR+sD13G2uA6LaLUFV7W+JsYDzyqmWcnzk7o70tnMW0+KOPbsnOY1Y65hCiQ6mwr/Qq
	PCAT196lXPLdJWxFHFXNJO49lHzFv5VRgE3T1KCmWOstVXDWn8okUvyf+vijcmhpz9dO2JYqZdW
	OC5Nn6kBKUtMMx9O0muLNJ1lq0VyhJumhIYrierDw63dBeXrHOSeAmxJgpMcQcINNU1+5uqPj3A
	YvUrvl3TH3+MNQOlYfkDhNYl2cB9KCpPX3MOZ5Oi4mgbHfF361vcAx0NBSeIMmgmXxJUfr2Lqsg
	I8NVPh6pGgwWUdepmW1j2iPEtHYo6uW4WpnAOT3jdOTZx4x8UIgjmjy/T7DavjObLuKJ5zLzqyz
	1jvv5pmBEZ/cTA5rVUW2OSVxR+DS8zz1lRR7vQHPiMkVAS1u8rWLKnVb06w+dx/Mek5TRMbNFJ4
	VOyH9YFO23O09p9hbAebIrJNQ=
X-Received: by 2002:a05:6a21:7316:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc71ed56f7mr4073886637.37.1786692806221;
        Fri, 14 Aug 2026 00:33:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:7316:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc71ed56f7mr4073819637.37.1786692805793;
        Fri, 14 Aug 2026 00:33:25 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:41 +0530
Subject: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=5559;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=RDAyPUHQMKd0UCR0T2UhbFhR2yIFwf1uGVlsiEAfgzI=;
 b=UtRhbW+tGvbmJCG5ZtNLc/4AeeCek33ST2p1FOR5EXuF62dWA6YOgpMZXUiPfLfuKFzWtpf0z
 e5E/P+JXspLAq+QNE/gdi706COkQcU044BcOLZXRJSjdCOjr+Z/4A7T
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: _7_CqddLxte9dX_wCrDnQJ1W5jGnQ2lY
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7ec4c7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=55wsOiQBk-PRjUXo0ZkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyIRDFhOgaEMK
 ke42zHPsLu9Vr/KMIj69Ki9wegvheZJzRRSMZTLtGQxR5XpdWSZwgCREepnjOkiuYj4XUENn4ul
 MAEu331YoD0/hK4+p8Ngiksg1XJwmfA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1rMoSQqGj7pK
 OJ0ylShvdMnjftjIADecDtU65/euRP1xjIzL8r4f8rfyD4VeXvNFSY/utFEH1K+wxxE8k4PGm+e
 ktdfaCYXxMXMAY5XygErSz5w3tdTqUvIjw7cASen83ux3pRKSgAmw7IEeRYkmmUrNtHPCSmS42O
 KB9Ng6xlPMaH4RhUczlHBLsx8qy+O4nmFm64PI9Y+fejc/rgANcHjLKPtAXjJ1F1WIJdiBL4bki
 a0Kf083lt9IBGVPNkr2jsFhMQKiMAax6D90vUvsKa6AP+ABKvlLFvw+8oxuoEkulA81UQZ1oZWo
 er8cDOQmG8AukI1Al1g4BALzi7px4Ma+c+Qux5EJ8jiBXqbHHwGp42L672pa5j4h0vAqv4OAX8E
 zgFhaZDD2CuKmUa6xfZ7TSNn/ugnwSds9O5GCoB88xJfNMAeRswR2ZF48glYHqd/93pUHWoZJ/k
 V+/pp+yueOgqYkpxJJA==
X-Proofpoint-GUID: _7_CqddLxte9dX_wCrDnQJ1W5jGnQ2lY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 50 ++++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..c4919b518693
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Kuno
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks and resets on Kuno.
+
+  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
+
+properties:
+  compatible:
+    const: qcom,kuno-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: Sleep clock source
+      - description: PCIe pipe clock source
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_pipe_clk>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,kuno-gcc.h b/include/dt-bindings/clock/qcom,kuno-gcc.h
new file mode 100644
index 000000000000..bbaf1799590f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kuno-gcc.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL2							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL4_OUT_EVEN						5
+#define GCC_EMAC0_AXI_CLK					7
+#define GCC_EMAC0_PHY_AUX_CLK					8
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				9
+#define GCC_EMAC0_PTP_CLK					10
+#define GCC_EMAC0_PTP_CLK_SRC					11
+#define GCC_EMAC0_RGMII_CLK					12
+#define GCC_EMAC0_RGMII_CLK_SRC					13
+#define GCC_EMAC0_SLV_AHB_CLK					14
+#define GCC_EMAC_0_CLKREF_EN					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_PCIE_0_CLKREF_EN					22
+#define GCC_PCIE_AUX_CLK					23
+#define GCC_PCIE_AUX_CLK_SRC					24
+#define GCC_PCIE_AUX_PHY_CLK_SRC				25
+#define GCC_PCIE_CFG_AHB_CLK					26
+#define GCC_PCIE_MSTR_AXI_CLK					27
+#define GCC_PCIE_PIPE_CLK					28
+#define GCC_PCIE_PIPE_CLK_SRC					29
+#define GCC_PCIE_RCHNG_PHY_CLK					30
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				31
+#define GCC_PCIE_SLEEP_CLK					32
+#define GCC_PCIE_SLV_AXI_CLK					33
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				34
+#define GCC_PDM2_CLK						35
+#define GCC_PDM2_CLK_SRC					36
+#define GCC_PDM_AHB_CLK						37
+#define GCC_PDM_XO4_CLK						38
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				39
+#define GCC_QUPV3_WRAP0_CORE_CLK				40
+#define GCC_QUPV3_WRAP0_S0_CLK					41
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				42
+#define GCC_QUPV3_WRAP0_S1_CLK					43
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				44
+#define GCC_QUPV3_WRAP0_S2_CLK					45
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				46
+#define GCC_QUPV3_WRAP0_S3_CLK					47
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				48
+#define GCC_QUPV3_WRAP0_S4_CLK					49
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				50
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				51
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				52
+#define GCC_SDCC4_AHB_CLK					53
+#define GCC_SDCC4_APPS_CLK					54
+#define GCC_SDCC4_APPS_CLK_SRC					55
+#define GCC_SNOC_CNOC_USB3_CLK					56
+#define GCC_SYS_NOC_USB_SF_AXI_CLK				57
+#define GCC_USB20_MASTER_CLK					58
+#define GCC_USB20_MASTER_CLK_SRC				59
+#define GCC_USB20_MOCK_UTMI_CLK					60
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				61
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			62
+#define GCC_USB20_SLEEP_CLK					63
+#define GCC_USB2_CLKREF_EN					64
+#define GCC_USB3_PRIM_CLKREF_EN					65
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				66
+#define GCC_BOOT_ROM_AHB_CLK					68
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUPV3_WRAPPER_0_BCR					9
+#define GCC_QUSB2PHY_BCR					10
+#define GCC_SDCC4_BCR						11
+#define GCC_TCSR_PCIE_BCR					12
+#define GCC_USB20_BCR						13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif

-- 
2.43.0


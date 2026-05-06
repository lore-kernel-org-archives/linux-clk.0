Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C5494A00
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086301; cv=none; b=B/DRd6KOj0EJ2L1iMlgbTLZ0ISKLTngxFyrxris7/BUA5KnJ6wAXu/IzS4/mC3utZgRCvAcRHc9c/aKYjGwq88lkKJM3NpgEBGqASw+UUPK4Tvxp5UZlt9B7EnR1ZRXN0ahOw8oVVqOd8BpLoVMkeC32YSmhnwFYh76HaGUcDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086301; c=relaxed/simple;
	bh=6g1WF0bJP9e7ZdbeB2+tYA9c6Y4Bxo2hSf+nMkSZ9YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7lEr2CwLgli0VT17QSTGPrio4NdFThwsIr0+92OzsYQZr05er+/vd4l2p6LXaiNoGvSjn/9yb+dAptQtDXmoDk/g6yh421vZ72jzS4H1yOW1+i47mJoROEKykC+6QJE25VtloTZL4vKDMSQzmUb4lcV1RgE9uPw611og10PMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKoTCB1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdsRU+Vh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKoTCB1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdsRU+Vh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Fms9x442581
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 16:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyzQGoVTFWr2gfTGVoGf9Gl5POo9qlyaNijhlQwiIN4=; b=LKoTCB1ClkK3/A1N
	njisUirX1t42GqocuZcAg52Dqv4FLAofZlWy83lmYgYdcbvHOBJU9yRUlxMY/5+y
	gKinyJlUbo9HtZwiRaYtNuznhpAI3Y3cGWdVuHDR52W9q7968imC+1Wur/SK2OXd
	fyNPdcMOCX2TZZYiWeXNoiY+eFMlNJIZmIZbAw0REToX5ClkS9lrRSzAc75k/dxy
	7ddAq22rrgvvZj+acudplc45XW1k7DNgM6OEXNu7nIMNWEyWB/xBTxUvPZj4DtGJ
	AJllvZjlq5tk34wkXFPkRJfb/P8X3wGwfwQPU7+2wX0rdwU0A7jRdcRAj7LvJYKP
	mPG8ww==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299husu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:51:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1270dcd11c1so13522636c88.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086293; x=1778691093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyzQGoVTFWr2gfTGVoGf9Gl5POo9qlyaNijhlQwiIN4=;
        b=QdsRU+VhthzIDEuKUmHD4pBlXoFm7uElztFpCno6LKEZN+km6sZyGP7GmcDsfHeBSA
         qGB8faymHIvg30hGnWtDXpf8z4IPAvNQl6uj+BX1PMLTwPO4/gyCLg5O9akFr7A9AJ1/
         nLOi6TWiQ9LAZT1p4BQ58Falq76lfVaLDxtO7sJVC8BSUQinMpl7Cm7Ryx+Ao8i2EGG5
         Q5wON8n4JxlILvDp23F6JNWBZJZ0akxmqUw0z7cBZDgo3PLW509USrXeFfvLh0InjHJp
         bNvZvfjP2T4AJyNvROHQrOMVwN6N9rs7Piw1DuOAMTafwP+avLiRK2BZO35wY6cqIha5
         IvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086293; x=1778691093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyzQGoVTFWr2gfTGVoGf9Gl5POo9qlyaNijhlQwiIN4=;
        b=UGkpLuCkw+XbUP98kGl9n31Rt/HHCtn6CGqJu45dashs614IeEYfdDmsKhuLjqs6LQ
         D71QGaHoz1lbUtwTNMc1hoILH8zTzYKgPCsYkyT2ghzsjl+PXLoUzlrkLLPFAp/2ApDZ
         OJCae+5C/rSeF9ZV1L+m2Jpetstw3tfmdaxefjHrYvXo8Dlna5jb/60N22PYb+TuMnw/
         RIrlW3YOE692LPvTNyi0KFeu2peSiSnh7oYsiMhaY3ZilTGv0W6KX11aITQL3FvFAd7u
         xa39+QrOYxMgtGIPNBn3SnvXS2n8CqKsX/348LnCq4E3MZSXoYNlp4fi2JMSneuX8KxS
         mLbg==
X-Forwarded-Encrypted: i=1; AFNElJ92vVa2punxOsCWrxn3ptR27tPfuPkBZHUdm9wqD4Jo+NhBCj+13gI0XqbdMtguu3L33Lh8A+RDwRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbL6ryH4Q9aZpy78thygXfLCzoSE6+yWNHA+tg5xIH42L2SoJ
	7BXtDWZQR9M7hT2TjfZKUPXG5W2l6ChuSH4TKHIZ1jY/19DOC24ASAk2YtiZ6zSUEcCH56a9Kt0
	bNFFd7GFp1HNxmnjpZKINroMIY5HrwIrU9x3jJcxnryNCNpwzEPqLP+f0i0BLAoS8cgZnG60=
X-Gm-Gg: AeBDietMKzynV1UclPxLTdycHh/dsxaGPPG64Qn6DUVTqa2h97nIK88gk64P9wwy8PI
	NSpJ9EDF9ytSDAZb2GbWzS7HjywDZryNWeGkZ0/Z2IqciLnCpD8q79xNgANLTPcYgwGVhpZLd+x
	y+AfDYhKl/4/iEya6+zsed81J2JeQdlhhuXdS6D9+UPb3ZrexJt6Gan/J8tFWakgWxt9u7Lsn9J
	62CMilu9110xf2CRqqH4AHyntoj2WF51m3Yucl3TlPxSVIkX92NBMA4uQjWnqoa+3tAXy+CAyJv
	v7PEg7k0iv7NaY+c/Wfs15rFc4oY1ZJrfNYCHoxoJz9P2lyJj89zgPq2f3WI0AARgevdbec8wgm
	McdilaM0gPLW92quQckeqfuRQ3V4BDdrywPhU754ZcWFLyMlGaJo/fZlzYzRD8sXGlYgjnTExAI
	b9q35asL0CiCaQjJN6XRjSIQ==
X-Received: by 2002:a05:7022:4a9:b0:12d:de3e:be88 with SMTP id a92af1059eb24-131a69f2f19mr1959454c88.36.1778086292978;
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
X-Received: by 2002:a05:7022:4a9:b0:12d:de3e:be88 with SMTP id a92af1059eb24-131a69f2f19mr1959420c88.36.1778086292287;
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:42 -0700
Subject: [PATCH v3 3/7] dt-bindings: clock: qcom: Add Hawi global clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-3-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=12643;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=6g1WF0bJP9e7ZdbeB2+tYA9c6Y4Bxo2hSf+nMkSZ9YM=;
 b=LOr4+3DNELeHn8YqeR3f6fT7/Kc76xqZYGTAUjcwrHb3CD+OL2tAub6MQAkYyBKdiYU8INjGN
 RgVwhVjoforBwveg3eGDLE6LOBf56HiOPI7tTSXU3TC4Z81+T/gXxgp
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb7196 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z2lVzDD_EwnTmjuFXOsA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: fTz2nYYIPfK4tkFuF3nwlRVWPyVMTiC3
X-Proofpoint-GUID: fTz2nYYIPfK4tkFuF3nwlRVWPyVMTiC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX0stSctl4Vfjd
 e4kxQD5307VB479P0FuXoGtQHLeqMKnhkdQXIouNLvQDKn9M3vsKMPMJ/R63pSvV4XnM35PCczD
 8MHynBjzECCLuCQMpEo5/WKZtjr1w5NnU4sDj7ZPAU5Lbnb4mdVTuFzXvRdkeGqz0hqy9dQxOvB
 C0hdVfkWiqIRIV7vd5/EUQb297RmZbLL21w+jDASSP9npFdwxz/31O/gmEQIVfy0ikWN4/t9cLl
 BqzxmB6cNrsG5WU88ylvR7LohioKvTejP79gK7NggZI4XLIDZUDfaFfWWHjJn8usz2v4y0f76yw
 5NV6RvkcQCwG6AECgaGxnMeRHviYaLp9VfRPHKeoAVcfZ+qmAeOCoBCFT9HsYNMJJgZ0ZYtjJQ+
 +y62bnR5coqPEpEeKUL4wsPBJQbOfWdnQbmfkJTzS7+8O7ywO84h22FnJR67bSPrzbTE4D9trNa
 l7EiYdVsxSvQoXMju8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Add device tree bindings for the global clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  63 +++++
 include/dt-bindings/clock/qcom,hawi-gcc.h          | 253 +++++++++++++++++++++
 2 files changed, 316 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
new file mode 100644
index 000000000000..4f428c0f7286
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Hawi
+
+maintainers:
+  - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Hawi.
+
+  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+
+properties:
+  compatible:
+    const: qcom,hawi-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 1 Pipe clock source
+      - description: UFS PHY RX symbol 0 clock
+      - description: UFS PHY RX symbol 1 clock
+      - description: UFS PHY TX symbol 0 clock
+      - description: USB3 PHY wrapper pipe clock
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,hawi-gcc";
+      reg = <0x00100000 0x1f4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&pcie0_phy>,
+               <&pcie1_phy>,
+               <&ufs_mem_phy 0>,
+               <&ufs_mem_phy 1>,
+               <&ufs_mem_phy 2>,
+               <&usb_1_qmpphy>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,hawi-gcc.h b/include/dt-bindings/clock/qcom,hawi-gcc.h
new file mode 100644
index 000000000000..6cd7fa0884f5
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-gcc.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_HAWI_H
+
+/* GCC clocks */
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK				0
+#define GCC_AGGRE_STARDUSTNOC_USB3_PRIM_AXI_CLK			1
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				2
+#define GCC_BOOT_ROM_AHB_CLK					3
+#define GCC_CAM_BIST_MCLK_AHB_CLK				4
+#define GCC_CAMERA_AHB_CLK					5
+#define GCC_CAMERA_HF_AXI_CLK					6
+#define GCC_CAMERA_RSC_CORE_CLK					7
+#define GCC_CAMERA_SF_AXI_CLK					8
+#define GCC_CAMERA_XO_CLK					9
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CNOC_PCIE_SF_AXI_CLK				12
+#define GCC_EVA_AHB_CLK						13
+#define GCC_EVA_AXI0_CLK					14
+#define GCC_EVA_AXI0C_CLK					15
+#define GCC_EVA_XO_CLK						16
+#define GCC_GP1_CLK						17
+#define GCC_GP1_CLK_SRC						18
+#define GCC_GP2_CLK						19
+#define GCC_GP2_CLK_SRC						20
+#define GCC_GP3_CLK						21
+#define GCC_GP3_CLK_SRC						22
+#define GCC_GPLL0						23
+#define GCC_GPLL0_OUT_EVEN					24
+#define GCC_GPLL4						25
+#define GCC_GPLL5						26
+#define GCC_GPLL7						27
+#define GCC_GPLL9						28
+#define GCC_GPU_CFG_AHB_CLK					29
+#define GCC_GPU_GEMNOC_GFX_CLK					30
+#define GCC_GPU_GPLL0_CLK_SRC					31
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				32
+#define GCC_GPU_RSC_CORE_CLK					33
+#define GCC_GPU_SMMU_VOTE_CLK					34
+#define GCC_MMU_TCU_VOTE_CLK					35
+#define GCC_PCIE_0_AUX_CLK					36
+#define GCC_PCIE_0_AUX_CLK_SRC					37
+#define GCC_PCIE_0_CFG_AHB_CLK					38
+#define GCC_PCIE_0_MSTR_AXI_CLK					39
+#define GCC_PCIE_0_PHY_AUX_CLK					40
+#define GCC_PCIE_0_PHY_AUX_CLK_SRC				41
+#define GCC_PCIE_0_PHY_RCHNG_CLK				42
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				43
+#define GCC_PCIE_0_PIPE_CLK					44
+#define GCC_PCIE_0_PIPE_CLK_SRC					45
+#define GCC_PCIE_0_PIPE_DIV2_CLK				46
+#define GCC_PCIE_0_PIPE_DIV_CLK_SRC				47
+#define GCC_PCIE_0_SLV_AXI_CLK					48
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				49
+#define GCC_PCIE_1_AUX_CLK					50
+#define GCC_PCIE_1_AUX_CLK_SRC					51
+#define GCC_PCIE_1_CFG_AHB_CLK					52
+#define GCC_PCIE_1_MSTR_AXI_CLK					53
+#define GCC_PCIE_1_PHY_AUX_CLK					54
+#define GCC_PCIE_1_PHY_AUX_CLK_SRC				55
+#define GCC_PCIE_1_PHY_RCHNG_CLK				56
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				57
+#define GCC_PCIE_1_PIPE_CLK					58
+#define GCC_PCIE_1_PIPE_CLK_SRC					59
+#define GCC_PCIE_1_PIPE_DIV2_CLK				60
+#define GCC_PCIE_1_PIPE_DIV_CLK_SRC				61
+#define GCC_PCIE_1_RSC_CORE_CLK					62
+#define GCC_PCIE_1_SLV_AXI_CLK					63
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				64
+#define GCC_PCIE_RSC_CORE_CLK					65
+#define GCC_PCIE_RSCC_CFG_AHB_CLK				66
+#define GCC_PCIE_RSCC_XO_CLK					67
+#define GCC_PDM2_CLK						68
+#define GCC_PDM2_CLK_SRC					69
+#define GCC_PDM_AHB_CLK						70
+#define GCC_PDM_XO4_CLK						71
+#define GCC_QUPV3_I2C_CORE_CLK					72
+#define GCC_QUPV3_I2C_S0_CLK					73
+#define GCC_QUPV3_I2C_S0_CLK_SRC				74
+#define GCC_QUPV3_I2C_S1_CLK					75
+#define GCC_QUPV3_I2C_S1_CLK_SRC				76
+#define GCC_QUPV3_I2C_S2_CLK					77
+#define GCC_QUPV3_I2C_S2_CLK_SRC				78
+#define GCC_QUPV3_I2C_S3_CLK					79
+#define GCC_QUPV3_I2C_S3_CLK_SRC				80
+#define GCC_QUPV3_I2C_S4_CLK					81
+#define GCC_QUPV3_I2C_S4_CLK_SRC				82
+#define GCC_QUPV3_I2C_S_AHB_CLK					83
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				84
+#define GCC_QUPV3_WRAP1_CORE_CLK				85
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK				86
+#define GCC_QUPV3_WRAP1_QSPI_REF_CLK_SRC			87
+#define GCC_QUPV3_WRAP1_S0_CLK					88
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S1_CLK					90
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				91
+#define GCC_QUPV3_WRAP1_S2_CLK					92
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				93
+#define GCC_QUPV3_WRAP1_S3_CLK					94
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				95
+#define GCC_QUPV3_WRAP1_S4_CLK					96
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				97
+#define GCC_QUPV3_WRAP1_S5_CLK					98
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				99
+#define GCC_QUPV3_WRAP1_S6_CLK					100
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC				101
+#define GCC_QUPV3_WRAP1_S7_CLK					102
+#define GCC_QUPV3_WRAP1_S7_CLK_SRC				103
+#define GCC_QUPV3_WRAP2_CORE_2X_CLK				104
+#define GCC_QUPV3_WRAP2_CORE_CLK				105
+#define GCC_QUPV3_WRAP2_S0_CLK					106
+#define GCC_QUPV3_WRAP2_S0_CLK_SRC				107
+#define GCC_QUPV3_WRAP2_S1_CLK					108
+#define GCC_QUPV3_WRAP2_S1_CLK_SRC				109
+#define GCC_QUPV3_WRAP2_S2_CLK					110
+#define GCC_QUPV3_WRAP2_S2_CLK_SRC				111
+#define GCC_QUPV3_WRAP2_S3_CLK					112
+#define GCC_QUPV3_WRAP2_S3_CLK_SRC				113
+#define GCC_QUPV3_WRAP2_S4_CLK					114
+#define GCC_QUPV3_WRAP2_S4_CLK_SRC				115
+#define GCC_QUPV3_WRAP3_CORE_2X_CLK				116
+#define GCC_QUPV3_WRAP3_CORE_CLK				117
+#define GCC_QUPV3_WRAP3_QSPI_REF_CLK				118
+#define GCC_QUPV3_WRAP3_QSPI_REF_CLK_SRC			119
+#define GCC_QUPV3_WRAP3_S0_CLK					120
+#define GCC_QUPV3_WRAP3_S0_CLK_SRC				121
+#define GCC_QUPV3_WRAP3_S1_CLK					122
+#define GCC_QUPV3_WRAP3_S1_CLK_SRC				123
+#define GCC_QUPV3_WRAP3_S2_CLK					124
+#define GCC_QUPV3_WRAP3_S2_CLK_SRC				125
+#define GCC_QUPV3_WRAP3_S3_CLK					126
+#define GCC_QUPV3_WRAP3_S3_CLK_SRC				127
+#define GCC_QUPV3_WRAP3_S4_CLK					128
+#define GCC_QUPV3_WRAP3_S4_CLK_SRC				129
+#define GCC_QUPV3_WRAP3_S5_CLK					130
+#define GCC_QUPV3_WRAP3_S5_CLK_SRC				131
+#define GCC_QUPV3_WRAP4_CORE_2X_CLK				132
+#define GCC_QUPV3_WRAP4_CORE_CLK				133
+#define GCC_QUPV3_WRAP4_S0_CLK					134
+#define GCC_QUPV3_WRAP4_S0_CLK_SRC				135
+#define GCC_QUPV3_WRAP4_S1_CLK					136
+#define GCC_QUPV3_WRAP4_S1_CLK_SRC				137
+#define GCC_QUPV3_WRAP4_S2_CLK					138
+#define GCC_QUPV3_WRAP4_S2_CLK_SRC				139
+#define GCC_QUPV3_WRAP4_S3_CLK					140
+#define GCC_QUPV3_WRAP4_S3_CLK_SRC				141
+#define GCC_QUPV3_WRAP4_S4_CLK					142
+#define GCC_QUPV3_WRAP4_S4_CLK_SRC				143
+#define GCC_QUPV3_WRAP_1_M_AXI_CLK				144
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				145
+#define GCC_QUPV3_WRAP_2_M_AHB_CLK				146
+#define GCC_QUPV3_WRAP_2_S_AHB_CLK				147
+#define GCC_QUPV3_WRAP_3_M_AHB_CLK				148
+#define GCC_QUPV3_WRAP_3_S_AHB_CLK				149
+#define GCC_QUPV3_WRAP_4_M_AHB_CLK				150
+#define GCC_QUPV3_WRAP_4_S_AHB_CLK				151
+#define GCC_SDCC2_AHB_CLK					152
+#define GCC_SDCC2_APPS_CLK					153
+#define GCC_SDCC2_APPS_CLK_SRC					154
+#define GCC_SDCC4_AHB_CLK					155
+#define GCC_SDCC4_APPS_CLK					156
+#define GCC_SDCC4_APPS_CLK_SRC					157
+#define GCC_UFS_PHY_AHB_CLK					158
+#define GCC_UFS_PHY_AXI_CLK					159
+#define GCC_UFS_PHY_AXI_CLK_SRC					160
+#define GCC_UFS_PHY_ICE_CORE_CLK				161
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				162
+#define GCC_UFS_PHY_PHY_AUX_CLK					163
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				164
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				165
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				166
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				167
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				168
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				169
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				170
+#define GCC_UFS_PHY_UNIPRO_5_CORE_CLK				171
+#define GCC_UFS_PHY_UNIPRO_5_CORE_CLK_SRC			172
+#define GCC_USB30_PRIM_MASTER_CLK				173
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				174
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				175
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			176
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		177
+#define GCC_USB30_PRIM_SLEEP_CLK				178
+#define GCC_USB3_PRIM_PHY_AUX_CLK				179
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				180
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				181
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				182
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				183
+#define GCC_VIDEO_AHB_CLK					184
+#define GCC_VIDEO_AXI0_CLK					185
+#define GCC_VIDEO_AXI0C_CLK					186
+#define GCC_VIDEO_XO_CLK					187
+
+/* GCC power domains */
+#define GCC_PCIE_0_GDSC						0
+#define GCC_PCIE_0_PHY_GDSC					1
+#define GCC_PCIE_1_GDSC						2
+#define GCC_PCIE_1_PHY_GDSC					3
+#define GCC_UFS_MEM_PHY_GDSC					4
+#define GCC_UFS_PHY_GDSC					5
+#define GCC_USB30_PRIM_GDSC					6
+#define GCC_USB3_PHY_GDSC					7
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_EVA_AXI0_CLK_ARES					1
+#define GCC_EVA_AXI0C_CLK_ARES					2
+#define GCC_EVA_BCR						3
+#define GCC_GPU_BCR						4
+#define GCC_PCIE_0_BCR						5
+#define GCC_PCIE_0_LINK_DOWN_BCR				6
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				7
+#define GCC_PCIE_0_PHY_BCR					8
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			9
+#define GCC_PCIE_1_BCR						10
+#define GCC_PCIE_1_LINK_DOWN_BCR				11
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				12
+#define GCC_PCIE_1_PHY_BCR					13
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			14
+#define GCC_PCIE_PHY_BCR					15
+#define GCC_PCIE_PHY_CFG_AHB_BCR				16
+#define GCC_PCIE_PHY_COM_BCR					17
+#define GCC_PCIE_RSCC_BCR					18
+#define GCC_PDM_BCR						19
+#define GCC_QUPV3_WRAPPER_1_BCR					20
+#define GCC_QUPV3_WRAPPER_2_BCR					21
+#define GCC_QUPV3_WRAPPER_3_BCR					22
+#define GCC_QUPV3_WRAPPER_4_BCR					23
+#define GCC_QUPV3_WRAPPER_I2C_BCR				24
+#define GCC_QUSB2PHY_PRIM_BCR					25
+#define GCC_QUSB2PHY_SEC_BCR					26
+#define GCC_SDCC2_BCR						27
+#define GCC_SDCC4_BCR						28
+#define GCC_TCSR_PCIE_BCR					29
+#define GCC_UFS_PHY_BCR						30
+#define GCC_USB30_PRIM_BCR					31
+#define GCC_USB3_DP_PHY_PRIM_BCR				32
+#define GCC_USB3_DP_PHY_SEC_BCR					33
+#define GCC_USB3_PHY_PRIM_BCR					34
+#define GCC_USB3_PHY_SEC_BCR					35
+#define GCC_USB3PHY_PHY_PRIM_BCR				36
+#define GCC_USB3PHY_PHY_SEC_BCR					37
+#define GCC_VIDEO_AXI0_CLK_ARES					38
+#define GCC_VIDEO_AXI0C_CLK_ARES				39
+#define GCC_VIDEO_BCR						40
+#define GCC_VIDEO_XO_CLK_ARES					41
+
+#endif

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E093AB5C3
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260523; cv=none; b=cgrNnr+XS+ZW5ea+D4ZYyrtS4YmZyCN/BgHs6B5lBiqijRTaPDorlUJWDa6p9aBMMGPe+InyBxkfMWTT/NVlSPwYnnV609qsDPi+ptHQFL+VkVMKyrh5tNys3w80812L2OP7wdg13llp6oUsxuxh8NbDjYoUH2pE+LrUFsTINkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260523; c=relaxed/simple;
	bh=yxA32/uuk35Dah7wwIltOLJpeqYfAbrR+6/mS6QVK9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoVZFS24pIM0efO7QN8fm5SGdPRS6TWapTc65bGhv5OCMHit3yveYKnASGbm8lfvr/nBmYgMsjXjXu9NW7//NFGVr/KPq0ytY0GNA84VSROwKLPrhfqXBqqRMDSTxFKHSbPKYrFT3guJiFuRlrF3x/vx6nQ1DzqKVNJUgMYitq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBrTiwzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyjUUE8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBrTiwzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyjUUE8U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795dZsM1597331
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzYkFa+0iTyfkMFS6BwUwkpxpuQqxwJbf3crHmpZtXY=; b=mBrTiwztQ6ab4uOO
	BcV3Y94XmkCc3UcT5UI+cjhgx6muvXtv/lDGBmwIz33o87Ru967IxRrXp3mYkcFS
	EfthoZH/Mzo5U+rlCm6s6R2I9Hu0hEXS+QE66WixtbXeZDF6o2WYSVeXbUEccqO7
	5HwmK8otHYC8eeeQwI1dBYpapKVt33Oub+tiCxKGw5g8XTN+j5FQPGnTzoZXWGjC
	VjwtoF6G9aoKWu6fMwckCr9LgWtvKOtJbbdXdlbqPjpgwdEo+An/d85QzjbgdJAs
	ONMmZXZAktNK0EmsEiX9NRkL5NYaBV4CCmTRqHRgC0RgrvepHi9FFpXo9bIU/bHu
	yZMNIw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7ctdh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:28:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1045264a91.1
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260520; x=1786865320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzYkFa+0iTyfkMFS6BwUwkpxpuQqxwJbf3crHmpZtXY=;
        b=OyjUUE8UsJofQv3fOL4NM4mUhzV7ZNvgreuFBN3uI4jD0eWIYRSxT8HpnGn2Vquurd
         VJ0LGwb1yFYmhfZjsQ4n4a8cXQk2ODAk4u/Y5Bp99hMyy4dLdZ7Rjepp5UHp5SWPfeif
         zaOg1bl1Jgv2zTpFAKSwBH2b81lR2jKjp3Mo4me9T/JYTBZYrIQu1S677jGKUp2+RpN9
         /mGE15mHBxXbNw15ItOf6HZJtSNg+fO3HV2fx0qu3PF/GP32IsrybRsnVomGBoosEhDX
         TM/XwDu9voBgMa0CgaaJ9oeSNHBLxyC9S+wqQW+an1zOO2fqBCf/A0eCQv1sHAjMuRPz
         seew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260520; x=1786865320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzYkFa+0iTyfkMFS6BwUwkpxpuQqxwJbf3crHmpZtXY=;
        b=gxXr3Kf/u/lqaCEpsx232Cx7+TXScB5TtG2vC/s2m+aWBxEYg3zjpy6fzP1O1mWCLH
         92+OXMvAjpwn4P4JMWIYL+rrPp3oriOri9J6WLFYNA8mwibr3aBTYJQBZGFgSI4Sl7Gp
         SuBCkfgwfu0Lk3GC/IDEqRUuDVl+eZpUibQk6c92U4Fgj4tdJSwSy6ekykSrXxYwnxPS
         HKfVrhcG3u9e6tdTdg73DTRgLXLrdMcgKBO60wCnzdgWDl+pS5KMp144j6GtN6K4+G5O
         TgKHBCDPgibhGewP/GxpT8fIWjPI0REiQv29cIDVmo7Sw1w++a+NEJLenodlJGtgUZ8d
         uQcw==
X-Forwarded-Encrypted: i=1; AHgh+Rqimy3K7CfU803Y9Tf6vRpllT/Hm4FrxyyqpDGymJABy9KlIa7172wVlquqXGVPTBADyGAUCOIIWzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtoHg7d5X6EuvDZ1bys8IEWS69CrYIUGgR9GNmOOMqxoTA9MGt
	nztQNSIiXA2JfG2OQ5CA7jixcY/WNQEBDfEh6nf0MJFEGZkfkOiRGAvWD2t10qvx5jkRGRnXLO7
	aeJbObvIAHHRpDdOa36Z+K0BtmCYCg6gvZZ8saNlZS21KtvMxeQTvq/KZooBxqXI=
X-Gm-Gg: AR+sD10nkArBrM5gb2k11ibCcOmNads9gkmsR5o+tBsd9UHk77gL+ZLlBFghEQhVOGV
	WQTcWgXRaBF21iVd27lOd5VjMNjQ9GasEuPCzHh0NAJ4EJfy2K1oPCxtP0dsdHoMZ+QgFrEjxKA
	uYUI8wxmXzSn4GqpaZWamwPvFe9G7cgVr6tjjh++IMMz3WsCs5nbwwDk3iW3lu1B6YHmduvhWxN
	XIWwKCtXwN4V1RLviv8XCSrqqBzoetWpt6B2q/y3aaqzzDGIdiXJgQ+hT8UA9/8diHYMjx2/I6m
	iQN68yxPDj0xJ1oRAAomWfZ5SQkDTR7PtBicsy/hSNx+J3J5j1MFWp8gLG1yn8hjThgONXQ0Io8
	d/D+RznPyaJs6jyZYdGoQvqQPg5r0ejK4vVVLLd5mDWvTS2zyP0qLSH+M2C0Y17SkspAk1v0u9A
	Psq/un2FuNiApAG2rGz0NnX2w=
X-Received: by 2002:a17:90b:57cd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-392823c808fmr10795387a91.14.1786260519674;
        Sun, 09 Aug 2026 00:28:39 -0700 (PDT)
X-Received: by 2002:a17:90b:57cd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-392823c808fmr10795354a91.14.1786260519175;
        Sun, 09 Aug 2026 00:28:39 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:28:38 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:09 +0530
Subject: [PATCH 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-10-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=5818;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=yxA32/uuk35Dah7wwIltOLJpeqYfAbrR+6/mS6QVK9A=;
 b=Uxjomh2FHLXfw1veZl9q8fbNhQwZHpUab6YYtAvKMy5cJlrFz7iHoM7SYwZot0sSjvDjYn1Hu
 KFuQr+57J7jBw36MPncmnskD7kFY8Xn7rxZ4OrWsqUmIaGfa9oPuUBF
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: dN59MrSvrE4RBTMu8tfHFRUiZs1lwxCu
X-Proofpoint-ORIG-GUID: dN59MrSvrE4RBTMu8tfHFRUiZs1lwxCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX3DmPtus/MqsG
 1IH9Ap+wAfetK89MTWUfSNDb/yAl51Sy55UhPWHlGLRS8tp9WIFEjCea1fC7Yi9VyyDG4zn1BpR
 Rs4dSHkJXA9lSxpN4GEaIg5puqJHIMIitAxNpn/XkRjTDVf7meXiDqAU6zBG5JOHPIoSSo4mQyN
 hVaQuUpu4k7tp0AKqpkvS1SyDNFutfoLE4xXnUnVh4pKBPd1ROdxytUzWztxdf87YZL4+8k+mVR
 6ki9EnUKEzvQXW2fAjtTOgvbneT3l2qBbZuUwTIdlOI1l4VqkZq94hwVuwfmKm/lwYD2G7EpjJj
 e3QHrUnHXyIviqwEtOY1gpDBFsG4VxVUZ8jOkiM9Dej+hNYJh67vPvxTZ8DYRr+wzYTZeyFUOxq
 FaWE0HWUv1jaFP/QgfqfuAURF7SjizGI5zOGRv1e6UQg23XvXAcx/QlmCXdRGdDxilbcKp+iblK
 DL+DzhIXYyy4cW4xo1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXzfVrUhyBVIci
 K6P+ihDZuFQ3XgsXW0L7eEVzUXNZCDUgNZ/TZlm/WrRQ8PI+X/3QCTd9FSq5MwxBe6+vR5k5Hd4
 59Ltzi5LetvOWmw7Is6r1atcs3CmqGQ=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a782c28 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=55wsOiQBk-PRjUXo0ZkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Add the device tree binding and clock/reset IDs for the global clock
controller (GCC) on the Qualcomm Kuno SoC so its device trees can
describe the GCC block and reference the clocks and resets it provides.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 56 +++++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..ff01ff31c2e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,56 @@
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
+  power-domains:
+    items:
+      - description: CX domain
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
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_phy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
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


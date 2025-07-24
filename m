Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15325F78D
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364564; cv=none; b=IV7fsh9D2TZ6Q5iYSnB5Wc4RFGQI4vJO2xaUCiuNARL5MJOR+F/KOQkZ/6q3BBACMFdJ5iXpIUfT91RjnOMnexI0yMP39gUQg6TZ6hOelSIalOdaKRzN0/9scuX4UlrB9ldZgJ0ADjl89DCx8+2hvI9dILkDoN0t5GVGOLSr4F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364564; c=relaxed/simple;
	bh=UryF0rpju1PiWXv+CrgewpHUBq3rSTNKBCvks25Dv0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCS4llDZQdpOPiDLoUUawqOP8F/QVFI/nUkEL/KwIeec0tUyxs91fGjx6ey5bnBQ6Zf+OVukEV/atBlmfNJZvPbilzpQ0qgesEWIgumowGF753yHQRTnwko3bDAs+I0jruS1/ttpEDw2ZXd5bQy/c8gALU2jRzmqIYxF6cOg070=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=My/yQfYE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="My/yQfYE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9eYFB005774
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=35OZAVgUPVe
	SaPfobtSiuu2KfE5wOqBQ6AhppcgE+TA=; b=My/yQfYEFKaaa1ilzaUJiH+s/tJ
	YA/J3VQxSVLvTWwuZuYa28tfuXWv4EhU25+7xFgmy3sKQ8vp/GEnHoyDrR1Y4bJa
	gwY0n/OGbAG7NMcFKU71RzG93sIsxhR91Xzg/5sNDb12DCF1EFltqNyLKUFHQIzh
	ql3rn+IX2wfXj4Ncji38X4lKPs3sRjFL3Uc/AiEt12ky1UZG5+5SbTMXX54eisN/
	dcp1nior5KoMoVHcec5xlHv48bOPZ2HrcqvuYCjRnjuirAIU+kxgotaNGaMqtP5X
	/LZxH+LnVsN84c/fp5aPKCjidTdJF8HlM2mx6JfDZmHUghBqtOzUJ6K4dkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qgw4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e095227f5dso171643085a.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 06:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364555; x=1753969355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35OZAVgUPVeSaPfobtSiuu2KfE5wOqBQ6AhppcgE+TA=;
        b=Kc5Vcq5ULgrEVFhXPjDqARDgtZhQc5OJDtBpBSicOssvZH+TL/uf9PRSABclfualQw
         54Q4Je/ZraSRxYPvMZaZlhO7jgmoVMBTnbt4tc/PEkmHPhH8F3jNc1g+uCFGW7XhYlFe
         KZQz7zKSgDxhtOi9sC5NQYVcw/23tSjmiHHkjwxh6eZFxpmpybRtKme4YRjffMtIWmRl
         1Bw1bg4WRQPYS+Qa1Glag4gNWdShxQdBsfgf5jXpFx0zdshb+RF69FPmdnPus9jFIdme
         dfhUyyuQwrW5ToafdAuTMDI1h2/iP5O3wmsMcEvkm6Prcf2/drkeLCMqWLtIiJJCZfom
         HFlg==
X-Forwarded-Encrypted: i=1; AJvYcCU4RwWFSvaxDQ+ocXkXsFTkuGD1T6tDuHDYGACGB+JzgvmnyL4vv1jFT9qKt5m+2v3SCotSM4xaZtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1erhcLWbf7uQ3VuIh/qPdPtutKrNhxu+lKX64Uw6Mtu4uYrt
	qRorZcmlYH/F7CjgdTvSFcm9lgLqdQu2oq447G0EA0tloTT43xKDK4r/AkYDGJMP9TgrvLrT+WN
	IucC9uYQzD6pAn++wEqYQl1kMr41cG2vuPF9quaWjDtt4osQodLF01HW+lbKAU08=
X-Gm-Gg: ASbGncsLzg5S49NX/rixUd7Vs5lOMnPAqHgj7nJbVsyfK54yFqOM7d+FC06ifrPZU/Q
	Ov/jtLf8NAjD5JdbSax5LuFH39231Ivf7uEdfkBbzKeIIsdKLzHvhEbzYbr2BS0Ecjx8KpWM9S5
	VIDLi3ncvCqgazPff0gmt7Cb7Q/XeAI7YXSwp00HyCMIvS5D3Zfe8PPssLE5IyiQZwLu03DYA3s
	QUWoYzCVg6KWB0zMh/sRM71CvOmDylLLB5F4k6EmCUDb8FB9hZAN3F9pnZi2gOygsgOIHXcME5U
	KHwotlN/gdb8mfRzO4HWPnFhuC08hI7QHzzv7M5xSFXcJ36sWUY4PA==
X-Received: by 2002:a05:620a:1986:b0:7e3:2d1d:bda0 with SMTP id af79cd13be357-7e62a096683mr805907885a.2.1753364554947;
        Thu, 24 Jul 2025 06:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3jU5xcI9izF6TXQQb+s38TZgawuW/fDp9sG2RJ1onj9Ee55TAojp0nO7A0MVLBPTh0DHZtA==
X-Received: by 2002:a05:620a:1986:b0:7e3:2d1d:bda0 with SMTP id af79cd13be357-7e62a096683mr805901885a.2.1753364554288;
        Thu, 24 Jul 2025 06:42:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm driver
Date: Thu, 24 Jul 2025 14:42:29 +0100
Message-ID: <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNCBTYWx0ZWRfX+L+kAqn+Psa3
 ZOps6BUu3m2w6f9jNRMp2mLq/bIxM9JDqnc33M7nD0+n8TGqREfsytAgkHXd3zRjfqP4J5FEgUK
 jl/ZYS/5dgudjvgtC7IYDYSDmDiOXMYNd4PKBk694gF6lg8FAPPycdY8Vf3pveNtZsqyyhtG5+k
 8e67bJQcu7xUaTm02U9WaHbwK7ezcYbrmfpI25AY6NBkt89QDhOcGR/ikvJ5zoHHUSZIQOIz7iA
 yKHrrrB8TyHwMlYoyWnnPxcrnk/xG72TW7Ek4BT22DQLtB7h7DjYLZghRNOhGnrjb3DHeI+MbDU
 n2cNdoBDvEBjmsdYymNvHk29Yqx7CF97l4IV8rONvgBo8KiQZ/7q3RVQdxmoOa7NPG/I3MTiiMn
 YQkFw9tDeVeP/zITWBI1OIJamGDg9HeeA45jdyLznjTyt6Fn+FBx00+a48D2aaw0S4RoRaYb
X-Proofpoint-ORIG-GUID: qoxWDMbp5_yRl0uToK5rDhuLQOfYoIdB
X-Proofpoint-GUID: qoxWDMbp5_yRl0uToK5rDhuLQOfYoIdB
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68823850 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=rG4MJh4HkvqLyLlG4ZYA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240104

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

GFM mux driver for sm8250 is totally dead and unused, there is no point
in keeping this driver without any users. This patch removes the driver
and the dt-bindings and headers associated with this driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
 drivers/clk/qcom/Kconfig                      |   7 -
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
 7 files changed, 472 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
deleted file mode 100644
index 8b8932bd5a92..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
+++ /dev/null
@@ -1,61 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,aoncc-sm8250.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: LPASS Always ON Clock Controller on SM8250 SoCs
-
-maintainers:
-  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-
-description: |
-  The clock consumer should specify the desired clock by having the clock
-  ID in its "clocks" phandle cell.
-  See include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h for the full list
-  of Audio Clock controller clock IDs.
-
-properties:
-  compatible:
-    const: qcom,sm8250-lpass-aoncc
-
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-
-  clocks:
-    items:
-      - description: LPASS Core voting clock
-      - description: LPASS Audio codec voting clock
-      - description: Glitch Free Mux register clock
-
-  clock-names:
-    items:
-      - const: core
-      - const: audio
-      - const: bus
-
-required:
-  - compatible
-  - reg
-  - '#clock-cells'
-  - clocks
-  - clock-names
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
-    #include <dt-bindings/sound/qcom,q6afe.h>
-    clock-controller@3800000 {
-      #clock-cells = <1>;
-      compatible = "qcom,sm8250-lpass-aoncc";
-      reg = <0x03380000 0x40000>;
-      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-      clock-names = "core", "audio", "bus";
-    };
diff --git a/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
deleted file mode 100644
index cfca888f6014..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
+++ /dev/null
@@ -1,61 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,audiocc-sm8250.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: LPASS Audio Clock Controller on SM8250 SoCs
-
-maintainers:
-  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-
-description: |
-  The clock consumer should specify the desired clock by having the clock
-  ID in its "clocks" phandle cell.
-  See include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h for the full list
-  of Audio Clock controller clock IDs.
-
-properties:
-  compatible:
-    const: qcom,sm8250-lpass-audiocc
-
-  reg:
-    maxItems: 1
-
-  '#clock-cells':
-    const: 1
-
-  clocks:
-    items:
-      - description: LPASS Core voting clock
-      - description: LPASS Audio codec voting clock
-      - description: Glitch Free Mux register clock
-
-  clock-names:
-    items:
-      - const: core
-      - const: audio
-      - const: bus
-
-required:
-  - compatible
-  - reg
-  - '#clock-cells'
-  - clocks
-  - clock-names
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
-    #include <dt-bindings/sound/qcom,q6afe.h>
-    clock-controller@3300000 {
-      #clock-cells = <1>;
-      compatible = "qcom,sm8250-lpass-audiocc";
-      reg = <0x03300000 0x30000>;
-      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-      clock-names = "core", "audio", "bus";
-    };
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 6cb6cd3e1778..f6e6ed0773bf 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1511,13 +1511,6 @@ config KRAITCC
 	  Support for the Krait CPU clocks on Qualcomm devices.
 	  Say Y if you want to support CPU frequency scaling.
 
-config CLK_GFM_LPASS_SM8250
-	tristate "SM8250 GFM LPASS Clocks"
-	depends on ARM64 || COMPILE_TEST
-	help
-	  Support for the Glitch Free Mux (GFM) Low power audio
-          subsystem (LPASS) clocks found on SM8250 SoCs.
-
 config SM_VIDEOCC_8450
 	tristate "SM8450 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index ddb7e06fae40..72d4c34d7f57 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -20,7 +20,6 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
-obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
deleted file mode 100644
index 65d380e30eed..000000000000
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ /dev/null
@@ -1,318 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * LPASS Audio CC and Always ON CC Glitch Free Mux clock driver
- *
- * Copyright (c) 2020 Linaro Ltd.
- * Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/clk-provider.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/err.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
-#include <linux/device.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
-#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
-
-struct lpass_gfm {
-	struct device *dev;
-	void __iomem *base;
-};
-
-struct clk_gfm {
-	unsigned int mux_reg;
-	unsigned int mux_mask;
-	struct clk_hw	hw;
-	struct lpass_gfm *priv;
-	void __iomem *gfm_mux;
-};
-
-#define to_clk_gfm(_hw) container_of(_hw, struct clk_gfm, hw)
-
-static u8 clk_gfm_get_parent(struct clk_hw *hw)
-{
-	struct clk_gfm *clk = to_clk_gfm(hw);
-
-	return readl(clk->gfm_mux) & clk->mux_mask;
-}
-
-static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
-{
-	struct clk_gfm *clk = to_clk_gfm(hw);
-	unsigned int val;
-
-	val = readl(clk->gfm_mux);
-
-	if (index)
-		val |= clk->mux_mask;
-	else
-		val &= ~clk->mux_mask;
-
-
-	writel(val, clk->gfm_mux);
-
-	return 0;
-}
-
-static const struct clk_ops clk_gfm_ops = {
-	.get_parent = clk_gfm_get_parent,
-	.set_parent = clk_gfm_set_parent,
-	.determine_rate = __clk_mux_determine_rate,
-};
-
-static struct clk_gfm lpass_gfm_va_mclk = {
-	.mux_reg = 0x20000,
-	.mux_mask = BIT(0),
-	.hw.init = &(struct clk_init_data) {
-		.name = "VA_MCLK",
-		.ops = &clk_gfm_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-		.num_parents = 2,
-		.parent_data = (const struct clk_parent_data[]){
-			{
-				.index = 0,
-				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
-			}, {
-				.index = 1,
-				.fw_name = "LPASS_CLK_ID_VA_CORE_MCLK",
-			},
-		},
-	},
-};
-
-static struct clk_gfm lpass_gfm_tx_npl = {
-	.mux_reg = 0x20000,
-	.mux_mask = BIT(0),
-	.hw.init = &(struct clk_init_data) {
-		.name = "TX_NPL",
-		.ops = &clk_gfm_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-		.parent_data = (const struct clk_parent_data[]){
-			{
-				.index = 0,
-				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
-			}, {
-				.index = 1,
-				.fw_name = "LPASS_CLK_ID_VA_CORE_2X_MCLK",
-			},
-		},
-		.num_parents = 2,
-	},
-};
-
-static struct clk_gfm lpass_gfm_wsa_mclk = {
-	.mux_reg = 0x220d8,
-	.mux_mask = BIT(0),
-	.hw.init = &(struct clk_init_data) {
-		.name = "WSA_MCLK",
-		.ops = &clk_gfm_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-		.parent_data = (const struct clk_parent_data[]){
-			{
-				.index = 0,
-				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
-			}, {
-				.index = 1,
-				.fw_name = "LPASS_CLK_ID_WSA_CORE_MCLK",
-			},
-		},
-		.num_parents = 2,
-	},
-};
-
-static struct clk_gfm lpass_gfm_wsa_npl = {
-	.mux_reg = 0x220d8,
-	.mux_mask = BIT(0),
-	.hw.init = &(struct clk_init_data) {
-		.name = "WSA_NPL",
-		.ops = &clk_gfm_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-		.parent_data = (const struct clk_parent_data[]){
-			{
-				.index = 0,
-				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
-			}, {
-				.index = 1,
-				.fw_name = "LPASS_CLK_ID_WSA_CORE_NPL_MCLK",
-			},
-		},
-		.num_parents = 2,
-	},
-};
-
-static struct clk_gfm lpass_gfm_rx_mclk_mclk2 = {
-	.mux_reg = 0x240d8,
-	.mux_mask = BIT(0),
-	.hw.init = &(struct clk_init_data) {
-		.name = "RX_MCLK_MCLK2",
-		.ops = &clk_gfm_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-		.parent_data = (const struct clk_parent_data[]){
-			{
-				.index = 0,
-				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
-			}, {
-				.index = 1,
-				.fw_name = "LPASS_CLK_ID_RX_CORE_MCLK",
-			},
-		},
-		.num_parents = 2,
-	},
-};
-
-static struct clk_gfm lpass_gfm_rx_npl = {
-	.mux_reg = 0x240d8,
-	.mux_mask = BIT(0),
-	.hw.init = &(struct clk_init_data) {
-		.name = "RX_NPL",
-		.ops = &clk_gfm_ops,
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-		.parent_data = (const struct clk_parent_data[]){
-			{
-				.index = 0,
-				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
-			}, {
-				.index = 1,
-				.fw_name = "LPASS_CLK_ID_RX_CORE_NPL_MCLK",
-			},
-		},
-		.num_parents = 2,
-	},
-};
-
-static struct clk_gfm *aoncc_gfm_clks[] = {
-	[LPASS_CDC_VA_MCLK]		= &lpass_gfm_va_mclk,
-	[LPASS_CDC_TX_NPL]		= &lpass_gfm_tx_npl,
-};
-
-static struct clk_hw_onecell_data aoncc_hw_onecell_data = {
-	.hws = {
-		[LPASS_CDC_VA_MCLK]	= &lpass_gfm_va_mclk.hw,
-		[LPASS_CDC_TX_NPL]	= &lpass_gfm_tx_npl.hw,
-	},
-	.num = ARRAY_SIZE(aoncc_gfm_clks),
-};
-
-static struct clk_gfm *audiocc_gfm_clks[] = {
-	[LPASS_CDC_WSA_NPL]		= &lpass_gfm_wsa_npl,
-	[LPASS_CDC_WSA_MCLK]		= &lpass_gfm_wsa_mclk,
-	[LPASS_CDC_RX_NPL]		= &lpass_gfm_rx_npl,
-	[LPASS_CDC_RX_MCLK_MCLK2]	= &lpass_gfm_rx_mclk_mclk2,
-};
-
-static struct clk_hw_onecell_data audiocc_hw_onecell_data = {
-	.hws = {
-		[LPASS_CDC_WSA_NPL]	= &lpass_gfm_wsa_npl.hw,
-		[LPASS_CDC_WSA_MCLK]	= &lpass_gfm_wsa_mclk.hw,
-		[LPASS_CDC_RX_NPL]	= &lpass_gfm_rx_npl.hw,
-		[LPASS_CDC_RX_MCLK_MCLK2] = &lpass_gfm_rx_mclk_mclk2.hw,
-	},
-	.num = ARRAY_SIZE(audiocc_gfm_clks),
-};
-
-struct lpass_gfm_data {
-	struct clk_hw_onecell_data *onecell_data;
-	struct clk_gfm **gfm_clks;
-};
-
-static struct lpass_gfm_data audiocc_data = {
-	.onecell_data = &audiocc_hw_onecell_data,
-	.gfm_clks = audiocc_gfm_clks,
-};
-
-static struct lpass_gfm_data aoncc_data = {
-	.onecell_data = &aoncc_hw_onecell_data,
-	.gfm_clks = aoncc_gfm_clks,
-};
-
-static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
-{
-	const struct lpass_gfm_data *data;
-	struct device *dev = &pdev->dev;
-	struct clk_gfm *gfm;
-	struct lpass_gfm *cc;
-	int err, i;
-
-	data = of_device_get_match_data(dev);
-	if (!data)
-		return -EINVAL;
-
-	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
-	if (!cc)
-		return -ENOMEM;
-
-	cc->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(cc->base))
-		return PTR_ERR(cc->base);
-
-	err = devm_pm_runtime_enable(dev);
-	if (err)
-		return err;
-
-	err = devm_pm_clk_create(dev);
-	if (err)
-		return err;
-
-	err = of_pm_clk_add_clks(dev);
-	if (err < 0) {
-		dev_dbg(dev, "Failed to get lpass core voting clocks\n");
-		return err;
-	}
-
-	for (i = 0; i < data->onecell_data->num; i++) {
-		if (!data->gfm_clks[i])
-			continue;
-
-		gfm = data->gfm_clks[i];
-		gfm->priv = cc;
-		gfm->gfm_mux = cc->base;
-		gfm->gfm_mux = gfm->gfm_mux + data->gfm_clks[i]->mux_reg;
-
-		err = devm_clk_hw_register(dev, &data->gfm_clks[i]->hw);
-		if (err)
-			return err;
-
-	}
-
-	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-					  data->onecell_data);
-	if (err)
-		return err;
-
-	return 0;
-}
-
-static const struct of_device_id lpass_gfm_clk_match_table[] = {
-	{
-		.compatible = "qcom,sm8250-lpass-aoncc",
-		.data = &aoncc_data,
-	},
-	{
-		.compatible = "qcom,sm8250-lpass-audiocc",
-		.data = &audiocc_data,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, lpass_gfm_clk_match_table);
-
-static const struct dev_pm_ops lpass_gfm_pm_ops = {
-	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
-};
-
-static struct platform_driver lpass_gfm_clk_driver = {
-	.probe		= lpass_gfm_clk_driver_probe,
-	.driver		= {
-		.name	= "lpass-gfm-clk",
-		.of_match_table = lpass_gfm_clk_match_table,
-		.pm = &lpass_gfm_pm_ops,
-	},
-};
-module_platform_driver(lpass_gfm_clk_driver);
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("QTI SM8250 LPASS Glitch Free Mux clock driver");
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
deleted file mode 100644
index f5a1cfac8612..000000000000
--- a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
-#define _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
-
-/* from AOCC */
-#define LPASS_CDC_VA_MCLK				0
-#define LPASS_CDC_TX_NPL				1
-#define LPASS_CDC_TX_MCLK				2
-
-#endif /* _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H */
diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
deleted file mode 100644
index a1aa6cb5d840..000000000000
--- a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
-#define _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
-
-/* From AudioCC */
-#define LPASS_CDC_WSA_NPL				0
-#define LPASS_CDC_WSA_MCLK				1
-#define LPASS_CDC_RX_MCLK				2
-#define LPASS_CDC_RX_NPL				3
-#define LPASS_CDC_RX_MCLK_MCLK2				4
-
-#endif /* _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H */
-- 
2.50.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864280;
	b=ejwN0f1lbPEJ/FUYIISZv5m6ehBLM7ykcRQRtJJadV1nNvlFLzes9tHZ6JYFahkyb+hF
	 iDsMoi6YjvjnmffAYeomlCWE46e5wUtC61XGNP5Sa1wbwhS9gxaJZ4Fo77Ou4xYT3LEYx
	 qSaPuTI6KbUzm2zJgTLIuEGu2g8viRd5khYAeJxhltn+W5c2WB/1GcdjuiaOK+YG9G5i6
	 1Ag8YEOGoYN6eSWeAiuQF2oMjYOhkHNzlbFant9ovRwIblInYaa4qG1AiAYmIJZefcpgP
	 q/tFVNV/3UQPDVzOHnWuX0WG2I2JlgfCrKGJ9wGFZYT15E/XjfZVln2NdkEFPN3PFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4uAVaChvRr4HcWoVPcrfrs6MT6ETjvwtLlnKW7sirIg=;
	b=nsWpQ12kbDQsaynEmKbBN+oVJFqK1q8xODV+3I6VbfXiYOTO4JvHgneyKP1UvmT84qZF
	 ASm1/ywt0t4sAjVC9IjwtqM0KwqXfqrMRRZbpUEJF8wR/j6rw4UrFndFxmLuJOt8D2sOJ
	 cxpA91ZBNSseD8jQ4en1jlhPG9le/gS3wWmTf6ddqQuJ58Cz9mSLzz9/KMDkaN3bYdBAL
	 Y7sJSOGgq/fqib7rJxWSEvX1C9bHz1PNpYPzUxIzp0wWakFENscWIsWxyqaxhnWBkoAvo
	 DdDT3qPhjdrcwMBHeXzDfg56lWVWdU3REW/IQA0ukcB3dXUoyIuQPxw256Idayc9xKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvSFx+AX;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D87606A323
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 21:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D87606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvSFx+AX
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so1879727f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 13:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864278; x=1795469078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uAVaChvRr4HcWoVPcrfrs6MT6ETjvwtLlnKW7sirIg=;
        b=RvSFx+AXkRRrtHP34ayuJwJovLhAG1aXyQjINcwRB8ldfqcgYfEBAdMiHqkJtuNjBa
         xpgrPUBzNjYkTTeikTPBCRKx990HbpkVCRQ8DimtpjJCCBNbMyGOI/LmnBk07MkWherE
         p5Xoi74aNGfd93fTnZ9fDu2hwrRcgbtVHG8nqIHyuYA0tDTS4IEuRAK9a64xYceOpdCv
         X4jFAUtAQH+Zekr3jHIpS2poYQfoxPi6MbApRsRrYLHN3wFww9e4Xoiv63NsevtixLZj
         TALRPM4YSHe6Bx6TzGMeTxpQMs01bJaNz8nz57YC4K10rH0BhAeYkPgQxkJidzo+CROh
         cOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864278; x=1795469078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uAVaChvRr4HcWoVPcrfrs6MT6ETjvwtLlnKW7sirIg=;
        b=ydft63i7/wVxMGd7Rrd0ecaXYyjdVpT0m6IVQHLVkSpa5bSyiXCYxDLH0mGw3tczV6
         x6FHncQ1BPeDTTvCNhDrqS2ERNstdmLx/xDNBOzbueDzUU4C3dk1v+/50CEA/sTRuYGF
         A/INpUPPM7Aur334rsGJ+cvwd2cTvT0nhMxDJPJL2Ur1ug3n4ywJULdxK/vvNzaOkJWc
         Y6ZWIOuBVGSPmmWmEFbQPGUVL6e/8Fp+oFG34EhR6La08iCAzC5JkroQObthR84NrG+g
         ngZw//CwLicxTEsKOAacv0ZqGceb6Z30jWLw3rmye+cUcvhpGqtmexfvv0hLUo+2o5oE
         AjsA==
X-Forwarded-Encrypted: i=1; AL+hErHr9Z3NAPfqjf2vOKse1Hbm8TqQoLmWsKsVRaKr6SgtonB9J9srY7VeNSVT/r7tK//Lpu/JhSkqtL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3BqWsQQ1UsVE395EG8i8uGEiTbg2ymmGTmxjnYWH7wwjs1ys/
	hDDcBroeGUZCw3vBxhCviC28ZHThVkIV1QSwTKhkAikvvMB+pA/W8hAb
X-Gm-Gg: AZFdTZdW7kda40x8Dlf+Y9KTqMzSg5mHXblatr2ecoikJ5c1UBHxffdiIKcQidcGxy/
	5mEhEXmkfD21XRbXepjAClkGSfB3bzu+jWoRhqL7iYMENQOShdgzErlXxcISnwkV6PwhfJuNvsx
	pr6pSDewkVUVcsZ8DiSsFbrsCfeFsfoeAE/oPUV86YpE3Tc95xRfHnYlSX/AHKS773uF99HU8I8
	NdjjziFHbYESpneQmHKOK9qWG4LeCuK9f0Eyu19I+tzM+jgl8c3tR/8pBrU/acy57LPosX0SJ2I
	Q0uP+bPhHrdkAHZhbssMaaiuATpD56Ak6pbH570QCeNCjQLItTfZZzta/1NYE2riffD0f5kgwQ9
	sugG+KjU7U1oic961TLddUqTOpyKUcGYTdQqxzQUGXthGws7bS/m0+my9k6CHBqizXkPlw2hcTI
	wnUsS2YMYmkn7G6TmaAxwL4cN2JJzIkXRD5haVO1iyeHHg52ovUA4cOMZF6p5m96PJYhMzeMx7V
	2tbWy1vxYimM347HwXi6CwdCTaLpKKHqLasMWJcLFjKca0+8cR9Q2gzkrTQQH8bBYlVphsixRSl
	7D0x/EzcOGPYjq/TtrFOdy+61TDQz749s1DR/fw+
X-Received: by 2002:a05:6000:4714:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-49c71785315mr24912748f8f.24.1794864278422;
        Mon, 16 Nov 2026 13:24:38 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:37 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:21 +0000
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: document the Halliday
 Global Clock Controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-clk-v2-3-28208928da36@gmail.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
In-Reply-To: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=13247;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=KlV2oOxkf13Phy3le4bfhdJro60Pq6yLXq2sNIouxTc=;
 b=wibQMwQWWRedJMD4JChc/FWwlqPxXGQ/u3crFGLFK1KSVTudV0qvGzmi+KyDVYctM7cEdGB0U
 f+tRgFBweytDDpwtGRN3R8WEHB66shKh4A4kw1DsVnRvE1imjmL6K9d
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the bindings and the dt-bindings header for the Global Clock
Controller on the Qualcomm Halliday SoC (SXR2250P).

The clkref_en clocks gate the reference clock from the QREF block to
the PHYs. QREF is powered by two supplies, vdda-refgen-0p9 and
vdda-refgen-1p2. Downstream only lists the 0.9 V one, as the USB PHYs'
refgen-supply, and keeps the 1.2 V one on as the USB3 PHY's supply, but
the USB HS PHY stops working when either of them is off.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/clock/qcom,halliday-gcc.yaml          |  84 +++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      | 249 +++++++++++++++++++++
 2 files changed, 333 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,halliday-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,halliday-gcc.yaml
new file mode 100644
index 000000000000..2c57e217a392
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,halliday-gcc.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,halliday-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Halliday
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Halliday. Its clkref_en clocks gate the XO reference to the PHYs
+  through the QREF block, which needs the vdda-refgen supplies.
+
+  See also: include/dt-bindings/clock/qcom,halliday-gcc.h
+
+properties:
+  compatible:
+    const: qcom,halliday-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIE 0 Pipe clock source
+      - description: PCIE 1 Pipe clock source
+      - description: PCIE 2 Phy Auxiliary clock source
+      - description: PCIE 2 Pipe clock source
+      - description: UFS Phy Rx symbol 0 clock source
+      - description: UFS Phy Rx symbol 1 clock source
+      - description: UFS Phy Tx symbol 0 clock source
+      - description: USB3 Phy wrapper pipe clock source
+
+  power-domains:
+    items:
+      - description: CX domain
+
+  vdda-refgen-0p9-supply:
+    description: QREF 0.9 V supply
+
+  vdda-refgen-1p2-supply:
+    description: QREF 1.2 V supply
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - '#power-domain-cells'
+  - vdda-refgen-0p9-supply
+  - vdda-refgen-1p2-supply
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
+    clock-controller@100000 {
+        compatible = "qcom,halliday-gcc";
+        reg = <0x00100000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>,
+                 <&pcie0_phy>,
+                 <&pcie1_phy>,
+                 <&pcie2_phy 1>,
+                 <&pcie2_phy 0>,
+                 <&ufs_mem_phy 0>,
+                 <&ufs_mem_phy 1>,
+                 <&ufs_mem_phy 2>,
+                 <&usb_1_qmpphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
+        vdda-refgen-0p9-supply = <&vreg_l2f_0p88>;
+        vdda-refgen-1p2-supply = <&vreg_l2c_1p2>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,halliday-gcc.h b/include/dt-bindings/clock/qcom,halliday-gcc.h
new file mode 100644
index 000000000000..1341c4f02a88
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,halliday-gcc.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_HALLIDAY_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_HALLIDAY_H
+
+/* GCC clocks */
+#define GCC_GPLL0					0
+#define GCC_GPLL0_OUT_EVEN				1
+#define GCC_GPLL4					2
+#define GCC_GPLL9					3
+#define GCC_AGGRE_NOC_PCIE_AXI_CLK			4
+#define GCC_AGGRE_NOC_PCIE_SF_AXI_CLK			5
+#define GCC_AGGRE_UFS_PHY_AXI_CLK			6
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK			7
+#define GCC_BOOT_ROM_AHB_CLK				8
+#define GCC_CAMERA_AHB_CLK				9
+#define GCC_CAMERA_HF_AXI_CLK				10
+#define GCC_CAMERA_SF_AXI_CLK				11
+#define GCC_CAMERA_XO_CLK				12
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK			13
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK			14
+#define GCC_DDRSS_GPU_AXI_CLK				15
+#define GCC_DDRSS_PCIE_SF_TBU_CLK			16
+#define GCC_DISP1_AHB_CLK				17
+#define GCC_DISP1_HF_AXI_CLK				18
+#define GCC_DISP_AHB_CLK				19
+#define GCC_DISP_HF_AXI_CLK				20
+#define GCC_GP10_CLK					21
+#define GCC_GP10_CLK_SRC				22
+#define GCC_GP10_DIV_CLK_SRC				23
+#define GCC_GP11_CLK					24
+#define GCC_GP11_CLK_SRC				25
+#define GCC_GP11_DIV_CLK_SRC				26
+#define GCC_GP1_CLK					27
+#define GCC_GP1_CLK_SRC					28
+#define GCC_GP2_CLK					29
+#define GCC_GP2_CLK_SRC					30
+#define GCC_GP3_CLK					31
+#define GCC_GP3_CLK_SRC					32
+#define GCC_GP4_CLK					33
+#define GCC_GP4_CLK_SRC					34
+#define GCC_GP4_DIV_CLK_SRC				35
+#define GCC_GP5_CLK					36
+#define GCC_GP5_CLK_SRC					37
+#define GCC_GP5_DIV_CLK_SRC				38
+#define GCC_GP6_CLK					39
+#define GCC_GP6_CLK_SRC					40
+#define GCC_GP6_DIV_CLK_SRC				41
+#define GCC_GP7_CLK					42
+#define GCC_GP7_CLK_SRC					43
+#define GCC_GP7_DIV_CLK_SRC				44
+#define GCC_GP8_CLK					45
+#define GCC_GP8_CLK_SRC					46
+#define GCC_GP8_DIV_CLK_SRC				47
+#define GCC_GP9_CLK					48
+#define GCC_GP9_CLK_SRC					49
+#define GCC_GP9_DIV_CLK_SRC				50
+#define GCC_GPU_CFG_AHB_CLK				51
+#define GCC_GPU_GPLL0_CLK_SRC				52
+#define GCC_GPU_GPLL0_DIV_CLK_SRC			53
+#define GCC_GPU_MEMNOC_GFX_CLK				54
+#define GCC_GPU_SNOC_DVM_GFX_CLK			55
+#define GCC_PCIE_0_AUX_CLK				56
+#define GCC_PCIE_0_AUX_CLK_SRC				57
+#define GCC_PCIE_0_CFG_AHB_CLK				58
+#define GCC_PCIE_0_CLKREF_EN				59
+#define GCC_PCIE_0_MSTR_AXI_CLK				60
+#define GCC_PCIE_0_PHY_RCHNG_CLK			61
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC			62
+#define GCC_PCIE_0_PIPE_CLK				63
+#define GCC_PCIE_0_PIPE_CLK_SRC				64
+#define GCC_PCIE_0_PIPE_DIV2_CLK			65
+#define GCC_PCIE_0_PIPE_DIV_CLK_SRC			66
+#define GCC_PCIE_0_SLV_AXI_CLK				67
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK			68
+#define GCC_PCIE_1_AUX_CLK				69
+#define GCC_PCIE_1_AUX_CLK_SRC				70
+#define GCC_PCIE_1_CFG_AHB_CLK				71
+#define GCC_PCIE_1_CLKREF_EN				72
+#define GCC_PCIE_1_MSTR_AXI_CLK				73
+#define GCC_PCIE_1_PHY_RCHNG_CLK			74
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC			75
+#define GCC_PCIE_1_PIPE_CLK				76
+#define GCC_PCIE_1_PIPE_CLK_SRC				77
+#define GCC_PCIE_1_PIPE_DIV2_CLK			78
+#define GCC_PCIE_1_PIPE_DIV_CLK_SRC			79
+#define GCC_PCIE_1_SLV_AXI_CLK				80
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK			81
+#define GCC_PCIE_2_AUX_CLK				82
+#define GCC_PCIE_2_AUX_CLK_SRC				83
+#define GCC_PCIE_2_CFG_AHB_CLK				84
+#define GCC_PCIE_2_CLKREF_EN				85
+#define GCC_PCIE_2_MSTR_AXI_CLK				86
+#define GCC_PCIE_2_PHY_AUX_CLK				87
+#define GCC_PCIE_2_PHY_AUX_CLK_SRC			88
+#define GCC_PCIE_2_PHY_RCHNG_CLK			89
+#define GCC_PCIE_2_PHY_RCHNG_CLK_SRC			90
+#define GCC_PCIE_2_PIPE_CLK				91
+#define GCC_PCIE_2_PIPE_CLK_SRC				92
+#define GCC_PCIE_2_PIPE_DIV2_CLK			93
+#define GCC_PCIE_2_PIPE_DIV_CLK_SRC			94
+#define GCC_PCIE_2_SLV_AXI_CLK				95
+#define GCC_PCIE_2_SLV_Q2A_AXI_CLK			96
+#define GCC_PDM2_CLK					97
+#define GCC_PDM2_CLK_SRC				98
+#define GCC_PDM_AHB_CLK					99
+#define GCC_PDM_XO4_CLK					100
+#define GCC_PWM0_XO512_CLK				101
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK			102
+#define GCC_QMIP_CAMERA_RT_AHB_CLK			103
+#define GCC_QMIP_GPU_AHB_CLK				104
+#define GCC_QMIP_PCIE_AHB_CLK				105
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK			106
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK			107
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK			108
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK			109
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK			110
+#define GCC_QUPV3_WRAP0_CORE_CLK			111
+#define GCC_QUPV3_WRAP0_QSPI0_CLK			112
+#define GCC_QUPV3_WRAP0_S0_CLK				113
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC			114
+#define GCC_QUPV3_WRAP0_S1_CLK				115
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC			116
+#define GCC_QUPV3_WRAP0_S2_CLK				117
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC			118
+#define GCC_QUPV3_WRAP0_S3_CLK				119
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC			120
+#define GCC_QUPV3_WRAP0_S4_CLK				121
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC			122
+#define GCC_QUPV3_WRAP0_S4_DIV_CLK_SRC			123
+#define GCC_QUPV3_WRAP0_S5_CLK				124
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC			125
+#define GCC_QUPV3_WRAP0_S6_CLK				126
+#define GCC_QUPV3_WRAP0_S6_CLK_SRC			127
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK			128
+#define GCC_QUPV3_WRAP1_CORE_CLK			129
+#define GCC_QUPV3_WRAP1_QSPI0_CLK			130
+#define GCC_QUPV3_WRAP1_S0_CLK				131
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC			132
+#define GCC_QUPV3_WRAP1_S1_CLK				133
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC			134
+#define GCC_QUPV3_WRAP1_S2_CLK				135
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC			136
+#define GCC_QUPV3_WRAP1_S3_CLK				137
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC			138
+#define GCC_QUPV3_WRAP1_S4_CLK				139
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC			140
+#define GCC_QUPV3_WRAP1_S4_DIV_CLK_SRC			141
+#define GCC_QUPV3_WRAP1_S5_CLK				142
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC			143
+#define GCC_QUPV3_WRAP1_S6_CLK				144
+#define GCC_QUPV3_WRAP1_S6_CLK_SRC			145
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK			146
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK			147
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK			148
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK			149
+#define GCC_SDCC2_AHB_CLK				150
+#define GCC_SDCC2_APPS_CLK				151
+#define GCC_SDCC2_APPS_CLK_SRC				152
+#define GCC_UFS_0_CLKREF_EN				153
+#define GCC_UFS_PHY_AHB_CLK				154
+#define GCC_UFS_PHY_AXI_CLK				155
+#define GCC_UFS_PHY_AXI_CLK_SRC				156
+#define GCC_UFS_PHY_ICE_CORE_CLK			157
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC			158
+#define GCC_UFS_PHY_PHY_AUX_CLK				159
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC			160
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK			161
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC			162
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK			163
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC			164
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK			165
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC			166
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK			167
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC			168
+#define GCC_USB2_0_CLKREF_EN				169
+#define GCC_USB30_PRIM_MASTER_CLK			170
+#define GCC_USB30_PRIM_MASTER_CLK_SRC			171
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK			172
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC		173
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC	174
+#define GCC_USB30_PRIM_SLEEP_CLK			175
+#define GCC_USB3_0_CLKREF_EN				176
+#define GCC_USB3_PRIM_PHY_AUX_CLK			177
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC			178
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK			179
+#define GCC_USB3_PRIM_PHY_PIPE_CLK			180
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC			181
+#define GCC_VIDEO_AHB_CLK				182
+#define GCC_VIDEO_AXI0_CLK				183
+#define GCC_VIDEO_AXI1_CLK				184
+#define GCC_VIDEO_XO_CLK				185
+#define GCC_EDP_0_CLKREF_EN				186
+#define GCC_EDP_1_CLKREF_EN				187
+#define GCC_PWM0_XO512_DIV_CLK_SRC			188
+
+/* GCC power domains */
+#define PCIE_0_GDSC					0
+#define PCIE_1_GDSC					1
+#define PCIE_2_GDSC					2
+#define UFS_PHY_GDSC					3
+#define USB30_PRIM_GDSC					4
+
+/* GCC resets */
+#define GCC_CAMERA_BCR					0
+#define GCC_DISPLAY1_BCR				1
+#define GCC_DISPLAY_BCR					2
+#define GCC_GPU_BCR					3
+#define GCC_PCIE_0_BCR					4
+#define GCC_PCIE_0_LINK_DOWN_BCR			5
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR			6
+#define GCC_PCIE_0_PHY_BCR				7
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR		8
+#define GCC_PCIE_1_BCR					9
+#define GCC_PCIE_1_LINK_DOWN_BCR			10
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR			11
+#define GCC_PCIE_1_PHY_BCR				12
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR		13
+#define GCC_PCIE_2_BCR					14
+#define GCC_PCIE_2_LINK_DOWN_BCR			15
+#define GCC_PCIE_2_NOCSR_COM_PHY_BCR			16
+#define GCC_PCIE_2_PHY_BCR				17
+#define GCC_PCIE_2_PHY_NOCSR_COM_PHY_BCR		18
+#define GCC_PCIE_PHY_BCR				19
+#define GCC_PCIE_PHY_CFG_AHB_BCR			20
+#define GCC_PCIE_PHY_COM_BCR				21
+#define GCC_PDM_BCR					22
+#define GCC_QUPV3_WRAPPER_0_BCR				23
+#define GCC_QUPV3_WRAPPER_1_BCR				24
+#define GCC_QUSB2PHY_PRIM_BCR				25
+#define GCC_QUSB2PHY_SEC_BCR				26
+#define GCC_SDCC2_BCR					27
+#define GCC_UFS_PHY_BCR					28
+#define GCC_USB30_PRIM_BCR				29
+#define GCC_USB3_DP_PHY_PRIM_BCR			30
+#define GCC_USB3_DP_PHY_SEC_BCR				31
+#define GCC_USB3_PHY_PRIM_BCR				32
+#define GCC_USB3_PHY_SEC_BCR				33
+#define GCC_USB3PHY_PHY_PRIM_BCR			34
+#define GCC_USB3PHY_PHY_SEC_BCR				35
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR			36
+#define GCC_VIDEO_BCR					37
+#define GCC_VIDEO_AXI0_CLK_ARES				38
+#define GCC_VIDEO_AXI1_CLK_ARES				39
+
+#endif

-- 
2.55.0


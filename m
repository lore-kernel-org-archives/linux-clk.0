Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF793BED59
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194662; cv=none; b=bQ/w1hcxlZGO/VNfD+uHY9SGUSJYUeJ2KS2PJ/LDbJww85z90wpJxie0XKO0MSw+3b3xbUNwvSFQAq16b9DR2CVAwDLh23pNpdvOE4deq9zYYZ0lBNgvw1h7QLiAjDmuYHC1S0o0LG3CjhBJVe2IZX9NvGLlo6d2mPewCKcIYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194662; c=relaxed/simple;
	bh=IRhuTM0kLZsYFMp3Lrgkw0bn0kAOxMdvDnoLmBzNWoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4kWwNDL3Mjr/361ABNALNxsSRh4lmPvCfFD/VHhR/9GZV/RV+FBz5ac+vxtuEc84HMQt6XiYVmrZGz9x04JT0drwAkZAhRrDXI19IAkApPsQ9FOsCqt5IFB0Xaz/1FXzOXIzjjnBVXsiLi94KnIJtbGInBOrTuR6Ar8QvtiGTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJL6yBLW; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJL6yBLW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso1872466a12.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194654; x=1790799454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=;
        b=ZJL6yBLWkBcJzrLYyUTdEfCIA+QPROzG80OrQGmhnGm5TxpYKY5ZnsNw2Y09qciGfX
         3eV2H8ffg5t+LX3xzHYr/8NJnEMkqZfWjQWMMKqoDkoNdZqzj0uXH9Uo1EQgL+H4Oo8k
         cUOxEFuuP0D8/LQYNZjgkVSAhv+GvnE4NhZDbllSKsNrK8UaS3Afcf+g7oD/kP+J6mVj
         VXFgUSX6fJA1D85JGezKrCPXEIUTLpSqld2TYYW2H++yQXsWYGktjfOXgOs0kbe58F+4
         j8Rb5JyFK/aS9PYaHFxCPhpx4852Sy5oUUz4v+MFh1zGA/yynES7YltbBvYI0gRoJdRf
         zBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194654; x=1790799454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=;
        b=XP7PE9+l/DnXL9yrMr1Oys9+0AN1rl7w/py7mYmDmBXSqUA6yid3ETPPUnmf7lPKlT
         k0aY8SHioRvsMNloLTFSMYtrRNVp/UKRSQEajrcX+Sv+NOrkwVk2AGcYf07Fh9NcAApr
         c3ldVmib4PRsQoAIeJgmrcmFyvayfxr6B1b/NTwa896kGYPxPRp9UzXTZ/Jvf8Rlf/Nu
         eGfxWD/MvCuxROR9d/PuRrHhPiJZqQ5cP54NtU0BdX5ANYbeMeUuFR1WXDBIhQLRTHFf
         B1WCT9b9T5kVOhvhBHk8Hpm+yL9jgWF1yh/5KURWFwYtUULB9UnMX1hI5N+ya3w/F1mV
         lX+w==
X-Forwarded-Encrypted: i=1; AKwUvBxa7mPzD1E3MZMNhP37G0YWeYTOvt86XQx4JFbTAZzm44A20+nBS5gBKzBEOjzHtX/SV5q+d9ivj7g=@vger.kernel.org
X-Gm-Message-State: AFuF++nXJedG1SGiCD2QRs06Qol2uJXbHUaLcNrW3m/3lNkCG8jtAPb5
	SJYAA2B0vlTVQjUS76F/fAoYH04JG+Ryiuk3kpK5er2DLUbV9FkZo89z
X-Gm-Gg: AYBFou32Pf7Vwq64+ZZAnOWJv5F4aFGEMbZlpO2/hqOiuyMB/TKTel7pk5yHhhDW0M2
	wmOXc913biBf0EQKNdaQ5+NwfK8LEqOEsJ+M8z0vvKL4tth4rBlujg1SFL4QuxwcI4FAFq11w3a
	Qn6/RBY+CIQmzyndcyvEyPkqnfei+Y4+jMuzdEbpF+WkVCFHC+XuYx2DvKSd+3Wye8sIdh9MCmx
	Ls/L6MUhWvQv1shFEm8X2Nto+StJr3LsW7HY9OUKHHYSMx0FnAv2AYxgeuJ/q9Jdgs0PLmRntlG
	slXloxWx9foK5w7lWSZaGQBl2IVcTlQ+muPh48espKc29zqKRX2o6S0VGwgr1oBe1ttF2e+dDYd
	whQdan09jnFqV+ZM5j8zEoBmi+be/gMSHFP8ImxmeDuf1vL4kGVKiW0FcpU3m1uvVIEqqIS0mfe
	ocdEC3iEo2dtlazqMKs4xfDSX4XqyTO3DYA1+lvlz4043HE2T6b15poJiqaPFZKsPmnjRFHeT5V
	qIk86f+jIgxAl/4NdCMyXwa0+fi9Kw8
X-Received: by 2002:a17:907:9452:b0:c29:4b79:e41a with SMTP id a640c23a62f3a-c2ac24cf5c4mr18473566b.20.1790194654447;
        Wed, 23 Sep 2026 13:17:34 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:17:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 01/11] dt-bindings: clock: add Allwinner B288 CCU
Date: Wed, 23 Sep 2026 21:16:51 +0100
Message-ID: <20260923201701.43391-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../clock/allwinner,sun8i-b288-ccu.yaml       | 55 ++++++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 90 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
new file mode 100644
index 000000000000..22b59d5b652c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/allwinner,sun8i-b288-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Clock Control Unit
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    const: allwinner,sun8i-b288-ccu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: losc
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    ccu: clock-controller@1c20000 {
+        compatible = "allwinner,sun8i-b288-ccu";
+        reg = <0x01c20000 0x400>;
+        clocks = <&osc24M>, <&osc32k>;
+        clock-names = "hosc", "losc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..3dc1704d001e
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI_S	52
+#define CLK_BUS_CSI_M	53
+#define CLK_BUS_CSI_MISC	54
+#define CLK_BUS_ADDA	55
+#define CLK_BUS_SDRAM	56
+#define CLK_BUS_PSRAM	57
+#define CLK_BUS_DMA	58
+#define CLK_BUS_UART0	59
+#define CLK_BUS_UART1	60
+#define CLK_BUS_UART2	61
+#define CLK_BUS_UART3	62
+#define CLK_BUS_UART4	63
+#define CLK_BUS_UART5	64
+#define CLK_BUS_TWI0	65
+#define CLK_BUS_TWI1	66
+#define CLK_BUS_TWI2	67
+#define CLK_BUS_PIO	68
+#define CLK_BUS_GPADC	69
+#define CLK_BUS_KEYADC	70
+
+/*
+ * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, which
+ * needs the sample and output phase clocks. mmc2 and mmc3 are newer blocks
+ * that do their own delay calibration and have none.
+ */
+#define CLK_MMC0_SAMPLE	71
+#define CLK_MMC0_OUTPUT	72
+#define CLK_MMC1_SAMPLE	73
+#define CLK_MMC1_OUTPUT	74
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.53.0


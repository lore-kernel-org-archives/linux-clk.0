Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939894;
	b=RR56m51rmqkCjWVGROUglgf4EWvEhsJlrJiPxhtoeCKeAc/wf3TLwmxRri5Jk2UoRZuv
	 dB4dh40sy95a7rMqUemPr8pbeak30QgpNik0gP5GAIGeViLXRurDi/uKOs4ycp8o4SOwC
	 PmfLgbC8eWlXisQEXWrqjTfWMWh3/JJKJFgp4QsMw+BXU9kMwtsNBpRiTH/LCERct9Wzy
	 EaDOPS4QHCtmF2AElTU9gB28Ls1qeFpwSfHEXo2jwdxhI5XNzIs8fvFFMOsYEDDewBOFT
	 YAQ07Qlw6UrA12YfBz4Ih6DWj86gRHpmw52n1pZdlzNvf/uHGdpRG8Cdlbqx5CjR6Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=Rlene5xX8sJim1SaFUEMDrs4B5co5mgZZQwzVIbm+gO9Jx1NucDEEBfl3E1qCrx1sjSg
	 z+iML8uIOx79duMWEtjScUCvH+z+i6+JQsKplMIwTHImlTS14A8Ghx78AB/JatEYmzea9
	 DS9OnpIPX+fus0gzSFqHFLLR5i/SAJAYhCsK7c5zdr00DS0e3UH7zRTsEUd5Kx4RVmEmF
	 gudyHBGmQKu6/DF03d54YlcXTIKLzgca5/JeZ3SRZzlKAkCt0CJkcYyjtZ+SyKaPdAVIE
	 SXtGiWY1bLvUaQ+ElzSD34PCM2cbcovnokSqnrivvIDWcIVWcS4MxDqPRzGGJXbfReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKGCZgfG;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C31606A33D
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C31606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKGCZgfG
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so53551f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939892; x=1795544692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=AKGCZgfGTz8EnswKU3d7bOW6q+rT8MZTnwi/z2EMkHQrUpYtrh0t+VmsqSl4hrJxQI
         bEhakojJk/JpVdRPE/ibm1qJtCWtBXSZ0yn5K2OpzGryuP4a6o2Xnnf/SR4z5EXvIsK6
         lGAziiL7E1lDIqmVV8qxx17tBMo0UmkZFThIH4HhasmmP5qrhuLopXuljfYeUq3I9hpd
         6dZPm979Kiw68jtYQOilIoIYMAMWkLmugicYQS1jxKo+ujtNTAGJTpFczkmFXxmpOxKe
         RFnn4vrAoMoeSNKYSilEaWsO5/0sx+WWPG+/tR0tFP0zJ5VD5XbiUAyADj3Ftlr7AYS3
         LY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939892; x=1795544692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=VEkYWA9hMBhnPXW6DdPwpqKsTkLcbTdmDa1bturef7vKL2BCCK5f5Ti7W0NXVF010r
         8KvicO2irbAzZNy18PAeG5uV5F8jU7HHENph6IRJCSSuC1bzegWdEBwYU8HJKGTWpKQ0
         YJ/KCOos/KZSgIsPJB0Ne3iFkas2CRRw/SLNbDYq0TKn3LpLaqC0beKlhgU4kx5pewmJ
         GCPuoOageg+HkiSeL/5FQM+e+9fXZGbPcpHOD+pLxPx0qiFsyFSucE+X+4pPHORUfBi7
         nPFJ801CHVHkka0vEVzEQSiVfANx5R7RYKzB7iIssLpU0/HzRSpfiiWRnELFMlkg2hbS
         t08Q==
X-Forwarded-Encrypted: i=1; AL+hErHpVIAj1ghrbSerJuQ9Xs5sCO2KmWNWWtDDNDF975QZm8kJhrei5lwWS9PEp9qeMhcsG05KNKco9pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0KJY3lMYiimcxN5oohmoImQ8Uli9qqxG/0btLV3djAAxjvvFu
	yNi7vtVwZVoHCYNJdpQjjx7VTfJxM5Heo7LGTtl6g+fA3TcAb9aKb+Hz
X-Gm-Gg: AZFdTZfMx+qIfzXhWwovCUR4dwNgaIbr5FKye2XXJV6oIj+t5VgjMTz52K8QriZVGPK
	/r951dedXzvGWMxu0M/poD+0nl/k0XzzeATVU1URjrl3HKZHLFvF3x0BL4ERO1HUNhbScIJn4AA
	OG/jNpvD/+414g4AtUbApjXoOO0Ue4OqbKxzDez48/vY3FN15cSWQxoO1Sjbyec86v7ZrlWKs72
	WRBkN+/vysAun/erGd70kbr7Mi0Gvk++Ld4/+g9S5zh88HKAgAOa2T8yhfwNfLPwq3NNut6rpVy
	MjN032Jd2Lhq3PAtt4dUwYKBI7jVw2/DlVs04y5L0yIR8UXmPvgeJuKKuWwGUtsm4kVZ86zTfvQ
	Me3CxvmvraLNSb4l9OkDxxC7iU0hhzl5fxTxlz5OeWf/gNkk7cvtMBIeNZLwtAdPYY/XraRAYpB
	iM2nn4+TNd+E6oJ74ExNmFgrpOXu7uXlSwpuzPm481Grga/JmpsDvGzaBy0Hnto897RXC5Vog9a
	5LIuYlP6YOLmsiuOXkjaBa1DRnyXxrVemC+lh38kVfuC2HROd/+jDdt26djwZh2bl8kI7QiefXj
	fIfZUrn+00aMN/CMIChTnLrGSDMiKJDBrwuvMGtVSR3DKZYMG7Ciivp6YE9OsLGqx4wqzFyh/nT
	NSGemRuX48dkQM9Bc/dxpO9lX0UXotC+Pgw==
X-Received: by 2002:a05:6000:15e4:b0:48e:69ff:ba36 with SMTP id ffacd0b85a97d-4a639d17154mr442798f8f.28.1794939891953;
        Tue, 17 Nov 2026 10:24:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:51 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v13 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Tue, 17 Nov 2026 19:24:39 +0100
Message-ID: <20261117182444.103123-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

EN7581 internally handle the syscon with a direct reference by the use of
syscon_regmap_lookup_by_compatible while AN7583 wants to make this
explicit in DT with the new "airoha,chip-scu" phandle.

Similar to EN7581, also AN7583 permit the selection of the serdes line.

Add additional binding for additional clock and reset lines.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 25 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..05cd20ce3ab9 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -57,12 +58,36 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring the PCIe related clocks and resets.
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+      required:
+        - airoha,chip-scu
+        - '#reset-cells'
+        - '#phy-cells'
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..433a5c6180bf
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_XPON_XFI_RST		15
+#define AN7583_WDMA_RST			16
+#define AN7583_WOE0_RST			17
+#define AN7583_HSDMA_RST		18
+#define AN7583_TDMA_RST			19
+#define AN7583_EMMC_RST			20
+#define AN7583_SOE_RST			21
+#define AN7583_XFP_MAC_RST		22
+#define AN7583_MDIO0_RST		23
+#define AN7583_MDIO1_RST		24
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		25
+#define AN7583_FE_PDMA_RST		26
+#define AN7583_FE_QDMA_RST		27
+#define AN7583_PCM_SPIWP_RST		28
+#define AN7583_CRYPTO_RST		29
+#define AN7583_TIMER_RST		30
+#define AN7583_PCM1_RST			31
+#define AN7583_UART_RST			32
+#define AN7583_GPIO_RST			33
+#define AN7583_GDMA_RST			34
+#define AN7583_I2C_MASTER_RST		35
+#define AN7583_PCM2_ZSI_ISI_RST		36
+#define AN7583_SFC_RST			37
+#define AN7583_UART2_RST		38
+#define AN7583_GDMP_RST			39
+#define AN7583_FE_RST			40
+#define AN7583_USB_HOST_P0_RST		41
+#define AN7583_GSW_RST			42
+#define AN7583_SFC2_PCM_RST		43
+#define AN7583_PCIE0_RST		44
+#define AN7583_PCIE1_RST		45
+#define AN7583_CPU_TIMER_RST		46
+#define AN7583_PCIE_HB_RST		47
+#define AN7583_XPON_MAC_RST		48
+/* RST_PCIC */
+#define AN7583_PCIC_PERSTOUT0_RST	49
+#define AN7583_PCIC_PERSTOUT1_RST	50
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.55.0


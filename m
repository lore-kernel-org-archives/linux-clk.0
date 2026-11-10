Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269289;
	b=imoZKtkmqagHNwZ7S7RccskcFe4U6m1NeRCZ/LNbEGv/nUeIda0iEmJ8AutQ6GA3E4yo
	 anvyUDo/iQsJ0Aa1WZ7B1nW9QY8mqTIcAdEVAYJmv8W10yglZmm5q1Q3zvaBR8YKQ0mXK
	 ZEFGslranjG4NdP8BiTmLZBWmEuuMEMlwKfvKufLEiDZOcxYw8RdTf1o54oti+mkYRMNu
	 57S5g0CO5DVrqnjwAlq+Xn/LCkv8BiQTKUXMRBZQ9JJm9YXPgYetEikHKgp+lrzqEyzS9
	 gZ6TgVRzct1eQy1ytxEUKjJFTh1BZxthfNQ75igljZySXfywjxGxqIAlkxUuzS+QAig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=AwMECOa75g5ArGo2Jfwg/7Z5h1uMZHcwfv+Z40bJd3lxJUCQolPjmgnAJRMpocRFaLUY
	 jjxbW8mLLL1MmGsGSgw8MZ79Nx+9k2NZrWYxV4SZG6KYFvVLOA2BQLEZVa957xcbia+AS
	 AEkhwLkdX95WFgf1kGyG7hNY+HrTV5PCLmpB7+kiZYwMOQ2JtyJikCcekuWmevP+9ajL+
	 SwMftwVqpFdJBpNPe99I4HKsAMazwKM1yoPaOerZAI6QbzcpoIHs+oT+Nw84NhxkO2/gc
	 nERGafUxJDSUjZoNKhjbUFmD6yPrRnY10wjYk42cItkaYd84BzXZeMI6f+5RnLmLIQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR93sN0J;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AEF60A260A
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04AEF60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR93sN0J
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso960960f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269287; x=1794874087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=TR93sN0JjFV2ftO9VMO3mmKie2OgvCyhqtAkn5jH92BrIESPpmCbBKlTf/KudKxMoc
         +dhLdg3CWXQvUfsg3Ax/YBy2cOXyRjPfOsuJmuq4Ipi8zgvynxDmFFg5LK0tbmtEM9K0
         NoaZqZJ4dq3dEyIRI8dvU0crh+QL8kPCTCJVWXjbHRBLeqbcAsUpRBj33F4MvVyS7kFq
         /s1M9Zvh3DhAeQi6pceWe5QV3IlyfcAxuip4wLDbCkfLck/aUBIm+oOAEKmauS5C+qdj
         IcJQhjU91XRCmczDEeadT2AlsDmaBsp9/8tX+V7dQAslaoo08PxSo+k18nFHs1kj61PV
         zGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269287; x=1794874087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=WVeOEGjmMkwS1AewhTVUBfFc4KqD9KAZlyTSsejmO7xS9O2i+znCrfQm1lg1WZpERU
         v21GKoYmAzuXhhEibPSbOIfcUST5LsjlPpoA+3JhZMN0IIx1R8HeNr9yVaG52QCJrESB
         SdIsI8dTU21fbRzEtdn1VwIR4ChLMuuoBb+mSEoyGr7Z1pWUl+wenZYfLHQmErexNfbe
         63FLMRBMtz8o4EzXArt8aosghH9htDCAHJgHMTFH6yPsL7Y090DdzbPsnUYAQpIqVIda
         H4tb1WHbVnqRJ1X8LOAZT5aKDYc/9ukk9Ha1WDUj8veH72GojwzsyfVlv0g01i6hvarH
         j9Qw==
X-Forwarded-Encrypted: i=1; AL+hErG1nhb3B680uBbgL1xMHIo+w53zu7fgGZsVEdTYuF1+vj/bEtbMSFTipo6J+rvltYbVKNHL/+2xso4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vps+XtFKWeZuimveSMVS4fNKQzUhLgppYzkq8TH6z9Lzak8/0
	8kYpgJrix/7Atyi+54i85BSCTQ24osGFE9HxPJ7wjcvSGYmrectdu4snx2uGJw==
X-Gm-Gg: AYBFou3BNLyiaTYM3kDAwxw6X1TrnTUr+kBtUfB4YSkJK/VTmAvK9qjXCaRp8A85i7S
	qH0LPq7hhtRdrJDydFGEQDoFgVtaazr3a1f1WuTBn+52zlVTmglK2WrTYK5FCXGdYvkcFNnlhzd
	hHmHSYSWcIrVnqSw1AfesVGncjndaiVW3ueGXl4S5DpAw/LMeL3WQLxjmEH0DS1LF16c9SDdsE5
	b2kKz+GXoez6PrIkORxyxV7oPNHGXSgBKdflIRuXKSh7IwmRWq9h5n+So+ZxVKcMYuzq8uEuq1e
	qNzxHceicKFLqZBAaYAvpAZ4n/PBUgGQEoSKjpl/f8GWqhMInYmqm2syFwH9PLPSyFShPG2Nc6O
	82eTYawvp1t/5+/wj/TXXYNmBQaeP7hN5HxRvoeDfFGVKeDhVePzkuSfSrh4ASsqjUP5ir33qF0
	x2TwetgxD8VZK+gSN7MJKTZFPNUCdhSCv2hvQiaOpYyRzT6/7t3zS0H8t9/OViHCQPmQUIjShwO
	HaYVte6xRDjW8WMi/0ojPXz6N1cEdm3Hlpk2HYDYXSOkalEmOa8SH+kWVR4U9Ndvs74kJRcdmTl
	ys2S7MWmEljqnKB+6OcwjQhQ6IGJ/+P13Slt29jv85DLswltADW6P9tYCZ9rIbDWqflRqBVvHUn
	xVSa39E4K2eatSn5mctnFaJ6E3kCP4QTQQvkKQsvF3+jcIe9bIw==
X-Received: by 2002:a05:600c:55c1:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4ba01db744bmr16387325e9.11.1794269287318;
        Mon, 09 Nov 2026 16:08:07 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:06 -0800 (PST)
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
Subject: [PATCH v12 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Tue, 10 Nov 2026 01:07:46 +0100
Message-ID: <20261110000753.508-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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


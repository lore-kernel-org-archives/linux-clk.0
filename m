Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E03D5C12
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529664; cv=none; b=adcP/HkOK7SSNHiiI6BneA98v5DqEE7ODQDal53M/GgYmuED5YyHIcxT92b6Hd8nHDH1bxmy6Uj58YuLa92FShVtQ0E3ZzzdnTC8N9f+dXkTdfRVBQQGTASaCuFA5FQ88sKbe1mJ6zSSjOCYRIRXLdsKA632UuI1pl/QC+mbf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529664; c=relaxed/simple;
	bh=nSTo1VdEKP46zFTyr6sw7nYXnk3rhLO34q31k9PbB7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SijwT06x33seO/lKQVHnXscCqnhK3rxNzQPnXaCUdqC9RGylwR9Gd3HGCW0hwE2Yi/LFuhOgyJsBYfisjfl67oRXZLP9ZoUh4Ql4iPhDcQJBuvSuGUe7wt0PC1dCn7zsJpYi1iOsLn8aSA5qJNdKccbM3Ix/GpvkwC4g5a6DVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC6JOvRo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC6JOvRo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so9777895e9.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 00:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529661; x=1792134461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0DKBerAMph010nG26guGGCaKha8XpWR5390+tf1UWA=;
        b=SC6JOvRoco+R8fPOtk72FX+2PUZkF2r1R8mfXCVlFNFez42nHYrZ5lEi5Vmr27K1V5
         Wn2pRI8GHAE4aNxdq4KN+g65LYBjrmR7Y5VdCv2kfdcjXfFEkaTbtvawQhWvfvEbjUIh
         CVVQabkpVK8/gNNRTxpvIRvN8WaBcRTDH39IGxfFybiRj+lzcSQVeJ916bimUGNDZF0a
         HcBH95060U8NBb+w+u8as45pWs6x/R8LjVjWSjB0hKMd4x56YnhnL7XmCAfzYs1cETnu
         /x7p3rS67xkvB0DGk2An9wAYL7Igs7ZY87PI3vV1j7IRYpvx/5/KW97UFCeTxtxIC9CU
         V2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529661; x=1792134461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0DKBerAMph010nG26guGGCaKha8XpWR5390+tf1UWA=;
        b=DRvr7JAiAYZJbv0P0sryKA6/Jv0Kq2OfrGJIuXikL0BpreIl+dxZKsOKg0GxXXKkUn
         F/qNP7uqzKFuZDX+Zyvd6z5835dP5qsvH7Sg9te54lQj0DfdEiLb8JCfOCC3fous8aZp
         groliihNk4HmODWLesbwCa6ihp7DKyLAa9BX3bv3p9dP201JJDeNr2KhSDkds25BkIAN
         bHPe9xDblP/OupGwlopRPjbqELXlZLiXBrV2/eqxZgRNcrXphzyxb3w2FYrR7CBGlcC7
         SpREUp2LN8PEi7R9TPsGFO6nqH3rTSpLRuYnp4TkVKV0vwd4ObVAGtElgwX5GWuuoZAy
         zDkA==
X-Forwarded-Encrypted: i=1; AKwUvBzXlXeXp+eytGbX/xWwaqHat5sX/57zpbYcfBlDZkjHjeDAlAOEuQ2W+9j8BDevGUSRqWee9Z3HdI4=@vger.kernel.org
X-Gm-Message-State: AFuF++lA6C+p1usqsf+XH/S9j6vI+u1ahoY7DOnFKHDDZfonM8qcM81V
	NULTCbfACuqoTM4WAsW+BmzHMG2in5qsR/8L1ttlMSS5YZFBHP/KkNbW
X-Gm-Gg: AYBFou3W9OPKt3o9lgmeFxYjPljJftkUyoFOP+JECImN4J1PjQWpkFRRfkHlo2dQvcZ
	LsgmWwSPwx19gAfSd3l2QqYKXG0226v/4vfXUD9gsTmvcaLPzLChk/qjeJiXlGREzPt+HRC6R1u
	kuqd6gfxRJ76JZ8dIK2vnvT5w3yzTzF0aLlbK9xq2WKLt44Tu9Ng+ok8ANwtdt138RRyYeyKWMv
	kG/PSUR48hCWRfxFKJAgnesSQ8tD/4RItNADMZTxXPjv2gA1wvy1iAfwPEpjELmVMUZI0YVpuCP
	2p31DdnR7D5z/MRlpPZ3bDRmrvNmBMUQSEb1CqUFwRTrMMxOTTofEqEV3G0OJ51W6LWLAw2BKuG
	wR8g+K1LVAOechJFd/+huoO2ExxZ9JiXgECcNQEvoPR1DN8d/WDJj1shY28icH36Ksp7n0Awj1h
	8yz2oVBLaCPmDhjd0yGoqw3XVKa4lFrAPW6oP6Tf0rUR4pT5unNLjuUZxDzNSc3fSsD4x/0EwWU
	ZYZFdDh7/n5NXOJIdb0tGX4qZiEjHQw86g9QV6btDUMw8/vRlezCon3oDweJycJO2MKzJeSOyqe
	tnf5S078P30/Ag==
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr16083295e9.2.1791529661191;
        Fri, 09 Oct 2026 00:07:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-233-52-5.retail.telecomitalia.it. [95.233.52.5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm26176815e9.3.2026.10.09.00.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:07:39 -0700 (PDT)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Fri,  9 Oct 2026 09:07:21 +0200
Message-ID: <20261009070725.13196-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009070725.13196-1-ansuelsmth@gmail.com>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 23 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..8b94113d00ab 100644
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
@@ -57,12 +58,34 @@ properties:
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
index 000000000000..410e19802cf7
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
+#define AN7583_XPON_XFI_RST             15
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


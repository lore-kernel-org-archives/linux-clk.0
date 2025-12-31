Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F3A30F948;
	Wed, 31 Dec 2025 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767163435; cv=pass; b=K4lyf1KC2TInfqU3tlGf4syHT2n6aG3LdSPLPrhthb7pJIttY7BMGCJ5BI2M9wwIvlXNdQ6YzrjIL4mrpVS3KWfGMeEQUUDjvPpc5VoDRLLpvRmaNudTvSfbA/Rbg+nSoQ9VDE3kBQ8WDz5pa0qWbZvks5nazh0as2uB32Y4Glo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767163435; c=relaxed/simple;
	bh=ORPYr/fLoaoza0TzdWVFYu7i9Ci0Ozw5DP/1TyMufoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8hCX7JZpetgukv61Msp69htsjG5k3rpYetGGnHbARiamk+30j/rkbPe5tUbLmR03KPMZyRzhnAy/bsSOITbj8hEwFXMPQsS1Q1ISyMRoSCUF7POevlxsCYyELUK/LONzDCXC7EGLLo26HfrLqFQWZBI2w8F4F8y2DX+Q3hC09I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=pZFZlm17; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="pZFZlm17"
ARC-Seal: i=1; a=rsa-sha256; t=1767163408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j8SBYxrWQIli5jy88uUWFblzunVVbvowkUGbEdrVPk6x2otZlusIhzPljwi5/nbItADhwkj7Q2XrY/6jG+xCCDcaNTC87SQqpRumSjqoGiidCkCTlASt8YmxhxT9Bu3L0jeUSH0TC9TfdBErHRBIWjfCPitc+66fPqwNERJg9a4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163408; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w9AeUWrNf9a9wsZpNu+3dKUaPoG751aNT6wfowPspzo=; 
	b=FV1uSpV4rDDV8Qd+NeUhya98XjqI/jxbeZV7IkxUSjNwV4I65aBMGvezPNJiX7YabbMeGW9Q3Uaj5PMCagQN5l+XlbwvIhBCxrfMZeXtROtaVY7kS+s+CIxZqG+R7cKUiTcLgVVLUYdaGl+e92Qz+y/2spx/9HxdsknVd6a9WwY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163408;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=w9AeUWrNf9a9wsZpNu+3dKUaPoG751aNT6wfowPspzo=;
	b=pZFZlm17CFcTXzCpEdg96MyRIa9QJ12IkjQTwEuJtl8b9i3Jxliwrca8eQsHrOee
	Y5T9lPs3RFhJ5j4w9TZVPU+b+oRi1tAmPt3/hLPrXcSmuLyxwC1uD0axhGyizowwulh
	7Z5SFRqr1AoaXYOjUFBMAWkJuEqJWlJSzCLuHTGg=
Received: by mx.zohomail.com with SMTPS id 1767163407083906.179019697353;
	Tue, 30 Dec 2025 22:43:27 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 31 Dec 2025 14:40:06 +0800
Subject: [PATCH v4 2/6] dt-bindings: clock: add Anlogic DR1V90 CRU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-dr1v90-cru-v4-2-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
In-Reply-To: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=5066;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ORPYr/fLoaoza0TzdWVFYu7i9Ci0Ozw5DP/1TyMufoc=;
 b=62wqT5UceohvQhGx9JeUa2tfNDGr/M6QOJK8bctDmDLQGMHmgo/NLKXzL+stiz1uxFX7gBdNk
 alOAgD5GPyAB7qXK+B3vgYIuvTOw23ot7yA0tjjTfq1+C809ZXPPbQb
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add the Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC,
which is responsible for clock and reset management.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/clock/anlogic,dr1v90-cru.yaml         | 60 ++++++++++++++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     | 46 +++++++++++++++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     | 41 +++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
new file mode 100644
index 000000000000..165c71ce333a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/anlogic,dr1v90-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anlogic DR1V90 Clock and Reset Unit (CRU)
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+properties:
+  compatible:
+    const: anlogic,dr1v90-cru
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main Oscillator (33 MHz)
+      - description: External CAN clock
+      - description: External WDT clock
+
+  clock-names:
+    items:
+      - const: osc_33m
+      - const: can_ext
+      - const: wdt_ext
+
+  "#clock-cells":
+    const: 1
+    description:
+      Refer <dt-bindings/clock/anlogic,dr1v90-cru.h> for valid indices.
+
+  "#reset-cells":
+    const: 1
+    description:
+      Refer <dt-bindings/reset/anlogic,dr1v90-cru.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@f8801000 {
+        compatible = "anlogic,dr1v90-cru";
+        reg = <0xf8801000 0x400>;
+        clocks = <&osc_33m>, <&can_ext>, <&wdt_ext>;
+        clock-names = "osc_33m", "can_ext", "wdt_ext";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/anlogic,dr1v90-cru.h b/include/dt-bindings/clock/anlogic,dr1v90-cru.h
new file mode 100644
index 000000000000..664daf3946a7
--- /dev/null
+++ b/include/dt-bindings/clock/anlogic,dr1v90-cru.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2024-2025 Anlogic, Inc.
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ANLOGIC_DR1V90_CRU_H_
+#define _DT_BINDINGS_CLOCK_ANLOGIC_DR1V90_CRU_H_
+
+#define CLK_OSC_DIV2		0
+#define CLK_CPU_PLL		1
+#define CLK_CPU_PLL_4X		2
+#define CLK_CPU_4X		3
+#define CLK_CPU_2X		4
+#define CLK_CPU_1X		5
+#define CLK_IO_PLL		6
+#define CLK_IO_1000M		7
+#define CLK_IO_400M		8
+#define CLK_IO_25M		9
+#define CLK_IO_80M		10
+#define CLK_IO_400M_DIV2	11
+#define CLK_IO_400M_DIV4	12
+#define CLK_IO_400M_DIV8	13
+#define CLK_IO_400M_DIV16	14
+#define CLK_QSPI		15
+#define CLK_SPI			16
+#define CLK_SMC			17
+#define CLK_SDIO		18
+#define CLK_GPIO_DB		19
+#define CLK_EFUSE		20
+#define CLK_TVS			21
+#define CLK_TRNG		22
+#define CLK_OSC_DIV		23
+#define CLK_PWM			24
+#define CLK_FCLK0		25
+#define CLK_FCLK1		26
+#define CLK_FCLK2		27
+#define CLK_FCLK3		28
+#define CLK_WDT_SEL		29
+#define CLK_EFUSE_SEL		30
+#define CLK_CAN_SEL		31
+#define CLK_CPU_SEL		32
+#define CLK_CAN0		33
+#define CLK_CAN1		34
+
+#endif /* _DT_BINDINGS_CLOCK_ANLOGIC_DR1V90_CRU_H_ */
diff --git a/include/dt-bindings/reset/anlogic,dr1v90-cru.h b/include/dt-bindings/reset/anlogic,dr1v90-cru.h
new file mode 100644
index 000000000000..c5b7aae1ab6a
--- /dev/null
+++ b/include/dt-bindings/reset/anlogic,dr1v90-cru.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#ifndef _DT_BINDINGS_RESET_ANLOGIC_DR1V90_CRU_H_
+#define _DT_BINDINGS_RESET_ANLOGIC_DR1V90_CRU_H_
+
+#define RESET_OCM		0
+#define RESET_QSPI		1
+#define RESET_SMC		2
+#define RESET_WDT		3
+#define RESET_DMAC_AXI		4
+#define RESET_DMAC_AHB		5
+#define RESET_NPU		6
+#define RESET_JPU		7
+#define RESET_DDRBUS		8
+#define RESET_NIC_HP0		9
+#define RESET_NIC_HP1		10
+#define RESET_NIC_GP0M		11
+#define RESET_NIC_GP1M		12
+#define RESET_GPIO		13
+#define RESET_IPC		14
+#define RESET_USB0		15
+#define RESET_USB1		16
+#define RESET_GBE0		17
+#define RESET_GBE1		18
+#define RESET_SDIO0		19
+#define RESET_SDIO1		20
+#define RESET_UART0		21
+#define RESET_UART1		22
+#define RESET_SPI0		23
+#define RESET_SPI1		24
+#define RESET_CAN0		25
+#define RESET_CAN1		26
+#define RESET_TTC0		27
+#define RESET_TTC1		28
+#define RESET_I2C0		29
+#define RESET_I2C1		30
+
+#endif /* _DT_BINDINGS_RESET_ANLOGIC_DR1V90_CRU_H_ */

-- 
2.52.0


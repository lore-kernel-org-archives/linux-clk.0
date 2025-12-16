Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E0265632;
	Tue, 16 Dec 2025 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765856807; cv=pass; b=Pre/HypGuLSiIQVBBhYwDcYz6Md7jYb/rCKYhTCmRGabAgtKKvP4gOqV4IbiPWJYLrYoHWXlM8NbJgfohW+37S25zSJD97vUEcxX6peQpltEXJAs6l+CVxIJwTUS4/iwALkCqZkjJSStAK3zn+7KD6SXlMisqnmDbghzYkjSmqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765856807; c=relaxed/simple;
	bh=ALpitnnLzJTc1MzTgQ2H8DGRaqnG8rx6bQ5zk8Xl2O8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXyNYDsUufNqQ6eReC5e/hAaIQ2NjNJzMtqqkTUKfeg7O1xdBI4bFMNDTohWPBcq+rr3YA/6qcc2ryZUi8P97nEfaVe0Xupdr9SYzA8VmVh633JZFu6xR9Q4cbqaE6ZY978dPgjn3ACKuk+xF6Cc2zj6GUadBtMgERPN9ftLdek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=hjA2nAQH; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="hjA2nAQH"
ARC-Seal: i=1; a=rsa-sha256; t=1765856786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ipw0SjPs/+ZaxA9RNcbRPDPdNWITUkg4iR5jYne/ZCt039Lvz+Oa6wj4bzaJtzjXzFG0AhXXMrgRe4hVEDwiPv96QarMhWe2c60OMoRi3zqYSXNhDWzEaSM3wFZZ91lWF4LeOtHSVIE13oRd3oVgY1UAGtL5oDF0R1oR0zki59I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ILbL4CVlKIJmH7YalADTkioP1Q0SfdtkN/e5ADTMbaE=; 
	b=g6gARh9JlLGIA8iSKgbkAfkYe2GL79b4wwIK06zCVxZK3HBO3HzYhRurCp6uAV0/x0dcZ1OvkcQMbrX9gesbFxQXRf1m8N/+KBnYhxhoOzNs8kFEhtXppCD5mTIRvHaP/EJwJ22soLYgAhnXPXOlqBAtfDOGdx7GDf8X5vMwk8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856786;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ILbL4CVlKIJmH7YalADTkioP1Q0SfdtkN/e5ADTMbaE=;
	b=hjA2nAQHtvwsXX/Tc3IfHW0MZ45NPdpMimRdRZZHNudFsig7tbXMR/YnHpSBFy70
	UzTOAJLsP4bAkz5IOnO/N/45ex7OzIsUf2o4v9X8A364LQVY332Us10EuyDWY45Ljqn
	09AoguNgiF9kt/UXCf9tYPl7sc32mVu+HAqH9yFw=
Received: by mx.zohomail.com with SMTPS id 1765856785611547.9393815748379;
	Mon, 15 Dec 2025 19:46:25 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 16 Dec 2025 11:39:42 +0800
Subject: [PATCH v3 2/6] dt-bindings: clock: add Anlogic DR1V90 CRU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dr1v90-cru-v3-2-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
In-Reply-To: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=5234;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=ALpitnnLzJTc1MzTgQ2H8DGRaqnG8rx6bQ5zk8Xl2O8=;
 b=XxYkN41uxIs6la8TNt0l+S196xv0qPiFPnhpnoC2KCT6bsOGez5cKvM+WqPwk13gVY/tG+JXb
 NjODhJjvuoeDm/ane6t59uKE6618kfjIMI2Mb1ZQB0skMrQFiL/4xFu
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
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
index 0000000000000000000000000000000000000000..165c71ce333a8ee8ebbc86f238bb807880580aca
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
index 0000000000000000000000000000000000000000..664daf3946a7bc5812f03ac026081027690bc562
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
index 0000000000000000000000000000000000000000..c5b7aae1ab6ac7b931c35e52615991afdfe43b08
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


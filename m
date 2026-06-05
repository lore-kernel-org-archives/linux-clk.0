Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01E3175A9F;
	Fri,  5 Jun 2026 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639848; cv=none; b=qs/kQbce0HKWwqLlGf+Dc5aMSrF8YLJG7sxdBU/p3CQAFtwTTkKqVCer/u8M5ffJh5um7NLY7jBVpbWUFBeT08u1K4Ml3B9UbOU/RG5p0pOR6ZxR5nUbaP3AU5KPDMO+rhNBL7mtwW1bW5Qk1gpWV/qmOlGJuBXIjBUxgKdwin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639848; c=relaxed/simple;
	bh=36SPRrjs0koUXOHoLjqIuh033Bp4DVbFIAHsmJ4203Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i3ukPKY/A27M0FpB+AILcFkz+EPgOVe5asQ8CqApPMFEKY5aAx6iQDyBj+xJJbFXKypg8QITxis/8WBbT3LCumJM1GIgEMVAdrhSIfVTKOf6zoe0fTCLWQ8v7sPWGTx3ldsCkAlewFlRlZqNPuYcrOp3hv27pxVCtA2hm8pwEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgCnSXNHaCJqT0QiAA--.60845S2;
	Fri, 05 Jun 2026 14:10:17 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com,
	benoit.monin@bootlin.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
Date: Fri,  5 Jun 2026 14:10:02 +0800
Message-Id: <20260605061002.1854-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260605060730.1605-1-dongxuyang@eswincomputing.com>
References: <20260605060730.1605-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgCnSXNHaCJqT0QiAA--.60845S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF17CF4UXFy7Cw1rKr4xCrg_yoW7trWfpF
	4kCF97Gr1vyF93ua95ta40kryfJ3ZrCry5ArWkJFnrZa1DJw1qqF4IgFyrAF9rZr4fZrWx
	XF1xXw1av34xu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRmZXOUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add bindings for the high-speed peripherals clock and reset generator
on the ESWIN EIC7700 HSP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 .../bindings/clock/eswin,eic7700-hspcrg.yaml  | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 +-
 .../dt-bindings/clock/eswin,eic7700-hspcrg.h  | 33 ++++++++++
 .../dt-bindings/reset/eswin,eic7700-hspcrg.h  | 21 +++++++
 4 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

diff --git a/Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml b/Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
new file mode 100644
index 000000000000..43df689ae647
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/eswin,eic7700-hspcrg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EIC7700 HSP Clock and Reset Generator
+
+maintainers:
+  - Xuyang Dong <dongxuyang@eswincomputing.com>
+
+description:
+  Clock and reset generator for the ESWIN EIC7700 HSP (high-speed peripherals).
+
+properties:
+  compatible:
+    const: eswin,eic7700-hspcrg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: HSP configuration top clock
+      - description: MMC top clock
+      - description: SATA top clock
+
+  clock-names:
+    items:
+      - const: cfg
+      - const: mmc
+      - const: sata
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/eswin,eic7700-hspcrg.h> for valid indices.
+
+  '#reset-cells':
+    const: 1
+    description:
+      See <dt-bindings/reset/eswin,eic7700-hspcrg.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@50440000 {
+        compatible = "eswin,eic7700-hspcrg";
+        reg = <0x50440000 0x2000>;
+        clocks = <&clock 171>, <&clock 254>, <&clock 187>;
+        clock-names = "cfg", "mmc", "sata";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44..dce1175e1028 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9558,9 +9558,10 @@ ESWIN EIC7700 CLOCK DRIVER
 M:	Yifeng Huang <huangyifeng@eswincomputing.com>
 M:	Xuyang Dong <dongxuyang@eswincomputing.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
+F:	Documentation/devicetree/bindings/clock/eswin,eic7700*
 F:	drivers/clk/eswin/
-F:	include/dt-bindings/clock/eswin,eic7700-clock.h
+F:	include/dt-bindings/clock/eswin,eic7700*
+F:	include/dt-bindings/reset/eswin,eic7700-hspcrg.h
 
 ET131X NETWORK DRIVER
 M:	Mark Einon <mark.einon@gmail.com>
diff --git a/include/dt-bindings/clock/eswin,eic7700-hspcrg.h b/include/dt-bindings/clock/eswin,eic7700-hspcrg.h
new file mode 100644
index 000000000000..1d1ff15c1154
--- /dev/null
+++ b/include/dt-bindings/clock/eswin,eic7700-hspcrg.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
+ * All rights reserved.
+ *
+ * Device Tree binding constants for EIC7700 HSP clock controller.
+ *
+ * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#ifndef _DT_BINDINGS_ESWIN_EIC7700_HSPCRG_CLOCK_H_
+#define _DT_BINDINGS_ESWIN_EIC7700_HSPCRG_CLOCK_H_
+
+#define EIC7700_HSP_CLK_FAC_CFG_DIV2		0
+#define EIC7700_HSP_CLK_FAC_CFG_DIV4		1
+#define EIC7700_HSP_CLK_FAC_MMC_DIV10		2
+#define EIC7700_HSP_CLK_MUX_EMMC_3MUX1		3
+#define EIC7700_HSP_CLK_MUX_SD0_3MUX1		4
+#define EIC7700_HSP_CLK_MUX_SD1_3MUX1		5
+#define EIC7700_HSP_CLK_MUX_EMMC_CQE_2MUX1	6
+#define EIC7700_HSP_CLK_MUX_SD0_CQE_2MUX1	7
+#define EIC7700_HSP_CLK_MUX_SD1_CQE_2MUX1	8
+#define EIC7700_HSP_CLK_GATE_MSHC0_TMR		9
+#define EIC7700_HSP_CLK_GATE_EMMC		10
+#define EIC7700_HSP_CLK_GATE_MSHC1_TMR		11
+#define EIC7700_HSP_CLK_GATE_SD0		12
+#define EIC7700_HSP_CLK_GATE_MSHC2_TMR		13
+#define EIC7700_HSP_CLK_GATE_SD1		14
+#define EIC7700_HSP_CLK_GATE_USB0		15
+#define EIC7700_HSP_CLK_GATE_USB1		16
+#define EIC7700_HSP_CLK_GATE_SATA		17
+
+#endif /* _DT_BINDINGS_ESWIN_EIC7700_HSPCRG_CLOCK_H_ */
diff --git a/include/dt-bindings/reset/eswin,eic7700-hspcrg.h b/include/dt-bindings/reset/eswin,eic7700-hspcrg.h
new file mode 100644
index 000000000000..413fcd08c701
--- /dev/null
+++ b/include/dt-bindings/reset/eswin,eic7700-hspcrg.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
+ * All rights reserved.
+ *
+ * Device Tree binding constants for EIC7700 HSP reset controller.
+ *
+ * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#ifndef _DT_BINDINGS_ESWIN_EIC7700_HSPCRG_RESET_H_
+#define _DT_BINDINGS_ESWIN_EIC7700_HSPCRG_RESET_H_
+
+#define EIC7700_HSP_RST_SATA_P0		0
+#define EIC7700_HSP_RST_SATA_PHY	1
+#define EIC7700_HSP_RST_USB0		2
+#define EIC7700_HSP_RST_USB1		3
+#define EIC7700_HSP_RST_USB0_PHY	4
+#define EIC7700_HSP_RST_USB1_PHY	5
+
+#endif /* _DT_BINDINGS_ESWIN_EIC7700_HSPCRG_RESET_H_ */
-- 
2.34.1


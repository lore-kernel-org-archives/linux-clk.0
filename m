Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955DC285406;
	Fri,  3 Apr 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208968; cv=none; b=VKs4xEGeeB7W26ZPxk1blJnn5JwJLsw3k9hWNB9MVhddMAt+GZiO23J/LJ6kLnqYCb13emWjKz3IwM5yR/WiE27qU1I0xV+gegZCT1qSXxJHbw+ZzTAzY/ybIAHyxak391+02zvV3SMhom5wdiPk6YXJ0f083Ddt9p78oVOZMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208968; c=relaxed/simple;
	bh=gyk/04ck0+Zovfn3pvojUUQKj3yqNzbPBK8WPmOpUVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LO6S6ryVLVzYI/4MC+xCfyn89jHSQEy9ByDuCTZQo9ytVjSfvLfZFQMD02xGBF7yQjWTPoc7yvTeu/h8cRhNMEZAfVTlBtMxS9xRQNELE46T6gC+gGJ4vrPXMZ7Srh4YLMXVPZNSqCPw098Fe2yDKH8II/FcTTs07pVrAJfV47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgC3THH1ic9pzooOAA--.55047S2;
	Fri, 03 Apr 2026 17:35:51 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
Date: Fri,  3 Apr 2026 17:35:48 +0800
Message-Id: <20260403093548.670-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260403093459.612-1-dongxuyang@eswincomputing.com>
References: <20260403093459.612-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgC3THH1ic9pzooOAA--.55047S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF17CF4UXFy7Cw1rKr4xCrg_yoW7uw45pF
	4kCF97Gr1vyF93ua95ta40kryfJ3ZrCry5ArWkJFnrZan8Xw1qqF4IgFyrAF9rZr4fZryx
	XF1xWw1av3yxu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXJ5wUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add bindings for the high-speed peripherals clock and reset generator
on the ESWIN EIC7700 HSP.

Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 .../bindings/clock/eswin,eic7700-hspcrg.yaml  | 63 +++++++++++++++++++
 MAINTAINERS                                   |  3 +
 .../dt-bindings/clock/eswin,eic7700-hspcrg.h  | 33 ++++++++++
 .../dt-bindings/reset/eswin,eic7700-hspcrg.h  | 21 +++++++
 4 files changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

diff --git a/Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml b/Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
new file mode 100644
index 000000000000..b0acac559df1
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
+      - const: hsp_cfg
+      - const: hsp_mmc
+      - const: hsp_sata
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
+        clock-names = "hsp_cfg", "hsp_mmc", "hsp_sata";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 76e91d47d2f4..bcbb9578c043 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9506,8 +9506,11 @@ M:	Yifeng Huang <huangyifeng@eswincomputing.com>
 M:	Xuyang Dong <dongxuyang@eswincomputing.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
+F:	Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 F:	drivers/clk/eswin/
 F:	include/dt-bindings/clock/eswin,eic7700-clock.h
+F:	include/dt-bindings/clock/eswin,eic7700-hspcrg.h
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


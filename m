Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D671A680C;
	Tue, 12 May 2026 02:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551559; cv=none; b=ihlNfrUu3LIUNqzRBIjZnUMKdwyDSduNkSguR50C1sI5Yqkvgz+TM+i63J0gJIDkaoZCao7/lo/OCpVmGEp1eBplAeZIwGa0cn5godA6QAgnWh0NFvCtM67xckrjoiiDjxLxIrMFzIh6QPSUNJ0HBt+yNmOzyjeSrjTuE4KY6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551559; c=relaxed/simple;
	bh=ZntbPE9ULsi5T2sVrjBocsWAdl/4LmcxdkWpEUqKlys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ts5Wv8YxrKqYkP9nG35baLs44jpsPzB7YUUxaYQLqbKACbcRffaS72uRSYiFZA21W4gsKqrc2ZiODG6kt28qtqusri9+YMQ/X+y5r37GcPsGOPQ4VdgG3+8cJQKshSkHar2qSYOt2JaqFgTZpfxmeaykEO/ibwKfGJCV/osT9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgBHXJ_aigJqP64YAA--.13846S2;
	Tue, 12 May 2026 10:05:32 +0800 (CST)
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
	dongxuyang@eswincomputing.com,
	benoit.monin@bootlin.com,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
Date: Tue, 12 May 2026 10:05:11 +0800
Message-Id: <20260512020511.726-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260512020432.671-1-dongxuyang@eswincomputing.com>
References: <20260512020432.671-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgBHXJ_aigJqP64YAA--.13846S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF17CF4UXFy7Cw1rKr4xCrg_yoW7trWfpF
	4kCF97Gr1vyF93ua95ta40kryfJ3ZrCry5ArWkJFnrZa1DJw1qqF4IgFyrAF9rZr4fXryx
	XF1xXw4av34xu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRKtCzDUUUU
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
index b2040011a386..b7180863310c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9548,9 +9548,10 @@ ESWIN EIC7700 CLOCK DRIVER
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


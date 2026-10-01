Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79813E451B;
	Thu,  1 Oct 2026 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889663; cv=none; b=hBby24zJ0lduty+xte6Wxv1qEBJQRkIz3NOsBlqFzQ2Iud4RHyxlqsrWI2UdIw7z7qpHs+SCEO4CUnmuN2/v/JDWzsqRH1ErSFzzXlMjwmrhYWAc7jZTwW569jgXfzwmyPgFwNu19vExLeDkg95mfCB5rQsH4JMjS83FZgng8S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889663; c=relaxed/simple;
	bh=OlkcKFowBLB7vnMX5V46bf3kVa5tLb565KzuaTKZNx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jl3hFqNkiRS9G0v2OVVmU5z5xBmumjZLkHMdzCYpwQM3txvSyAc/Hk+meNriwPrCHOsIw0GbPjiH6Rbvoa0VaYdNN4FX+/lk2Cr/YOiV7c3CCU/ci+HHPbrbgrBHhkvHjXiTM/1A5OrAjR50NGaASKBozBiEzLK8k9nphPsmWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWba7niO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWba7niO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEA21F000FF;
	Thu,  1 Oct 2026 21:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889658;
	bh=i7sc5NB8AwtcMUY2eJtVo6YG1Q7MR1DbeZ7ei1cxYbQ=;
	h=From:To:Cc:Subject:Date;
	b=AWba7niOfPZFHKEXdnwPzm41s/+lLSRW5EYVqyAx95iVd6wowcEH/3A51FmAEWEM8
	 PlG1Y05k/iflPrlpsWAWiWvg2a9uspJ6ECXlrHfRJSgy8PR8Bjgdh2EyB5pF2KJRxb
	 hkMreUOH00U2N6dguBIv3SWbwv0Ws6NmTmIjiYfDxBMOojyTTs+oo8hcqwN+8Sspew
	 t3zPDv3qT3BEGWa7gJr8qytWI1TnbFSGN4NienHffRX2RkPZQH+KysK1TPY3Fueffy
	 QkY3bEYiOYoz55e0utai6jMUwfV9JJX2cPhIO9fxz141NG0QMPWP9gBrWGNBvBEXTM
	 uvm2kbrIGwObQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert HiSilicon clocks to DT schema
Date: Thu,  1 Oct 2026 16:20:48 -0500
Message-ID: <20261001212051.2227941-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the HiSilicon Hi6220/Hi3660/Hi3670 clock bindings to DT schema
format. Rearrange the binding documents splitting out the stub clock
binding from everything else.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/hi3660-clock.txt           | 47 -----------------
 .../bindings/clock/hi3670-clock.txt           | 43 ---------------
 .../bindings/clock/hi6220-clock.txt           | 52 -------------------
 .../bindings/clock/hisilicon,clocks.yaml      | 51 ++++++++++++++++++
 .../clock/hisilicon,hi6220-stub-clk.yaml      | 49 +++++++++++++++++
 5 files changed, 100 insertions(+), 142 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/hi3660-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/hi3670-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/hi3660-clock.txt b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
deleted file mode 100644
index 946da7cee54f..000000000000
--- a/Documentation/devicetree/bindings/clock/hi3660-clock.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Hisilicon Hi3660 Clock Controller
-
-The Hi3660 clock controller generates and supplies clock to various
-controllers within the Hi3660 SoC.
-
-Required Properties:
-
-- compatible: the compatible should be one of the following strings to
-	indicate the clock controller functionality.
-
-	- "hisilicon,hi3660-crgctrl"
-	- "hisilicon,hi3660-pctrl"
-	- "hisilicon,hi3660-pmuctrl"
-	- "hisilicon,hi3660-sctrl"
-	- "hisilicon,hi3660-iomcu"
-	- "hisilicon,hi3660-stub-clk"
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Optional Properties:
-
-- mboxes: Phandle to the mailbox for sending message to MCU.
-            (See: ../mailbox/hisilicon,hi3660-mailbox.txt for more info)
-
-Each clock is assigned an identifier and client nodes use this identifier
-to specify the clock which they consume.
-
-All these identifier could be found in <dt-bindings/clock/hi3660-clock.h>.
-
-Examples:
-	crg_ctrl: clock-controller@fff35000 {
-		compatible = "hisilicon,hi3660-crgctrl", "syscon";
-		reg = <0x0 0xfff35000 0x0 0x1000>;
-		#clock-cells = <1>;
-	};
-
-	uart0: serial@fdf02000 {
-		compatible = "arm,pl011", "arm,primecell";
-		reg = <0x0 0xfdf02000 0x0 0x1000>;
-		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&crg_ctrl HI3660_CLK_MUX_UART0>,
-			 <&crg_ctrl HI3660_PCLK>;
-		clock-names = "uartclk", "apb_pclk";
-	};
diff --git a/Documentation/devicetree/bindings/clock/hi3670-clock.txt b/Documentation/devicetree/bindings/clock/hi3670-clock.txt
deleted file mode 100644
index 66f3697eca78..000000000000
--- a/Documentation/devicetree/bindings/clock/hi3670-clock.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Hisilicon Hi3670 Clock Controller
-
-The Hi3670 clock controller generates and supplies clock to various
-controllers within the Hi3670 SoC.
-
-Required Properties:
-
-- compatible: the compatible should be one of the following strings to
-	indicate the clock controller functionality.
-
-	- "hisilicon,hi3670-crgctrl"
-	- "hisilicon,hi3670-pctrl"
-	- "hisilicon,hi3670-pmuctrl"
-	- "hisilicon,hi3670-sctrl"
-	- "hisilicon,hi3670-iomcu"
-	- "hisilicon,hi3670-media1-crg"
-	- "hisilicon,hi3670-media2-crg"
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes use this identifier
-to specify the clock which they consume.
-
-All these identifier could be found in <dt-bindings/clock/hi3670-clock.h>.
-
-Examples:
-	crg_ctrl: clock-controller@fff35000 {
-		compatible = "hisilicon,hi3670-crgctrl", "syscon";
-		reg = <0x0 0xfff35000 0x0 0x1000>;
-		#clock-cells = <1>;
-	};
-
-	uart0: serial@fdf02000 {
-		compatible = "arm,pl011", "arm,primecell";
-		reg = <0x0 0xfdf02000 0x0 0x1000>;
-		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&crg_ctrl HI3670_CLK_GATE_UART0>,
-			 <&crg_ctrl HI3670_PCLK>;
-		clock-names = "uartclk", "apb_pclk";
-	};
diff --git a/Documentation/devicetree/bindings/clock/hi6220-clock.txt b/Documentation/devicetree/bindings/clock/hi6220-clock.txt
deleted file mode 100644
index 17ac4a3dd26a..000000000000
--- a/Documentation/devicetree/bindings/clock/hi6220-clock.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Hisilicon Hi6220 Clock Controller
-
-Clock control registers reside in different Hi6220 system controllers,
-please refer the following document to know more about the binding rules
-for these system controllers:
-
-Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
-
-Required Properties:
-
-- compatible: the compatible should be one of the following strings to
-	indicate the clock controller functionality.
-
-	- "hisilicon,hi6220-acpu-sctrl"
-	- "hisilicon,hi6220-aoctrl"
-	- "hisilicon,hi6220-sysctrl"
-	- "hisilicon,hi6220-mediactrl"
-	- "hisilicon,hi6220-pmctrl"
-	- "hisilicon,hi6220-stub-clk"
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Optional Properties:
-
-- hisilicon,hi6220-clk-sram: phandle to the syscon managing the SoC internal sram;
-  the driver need use the sram to pass parameters for frequency change.
-
-- mboxes: use the label reference for the mailbox as the first parameter, the
-  second parameter is the channel number.
-
-Example 1:
-	sys_ctrl: sys_ctrl@f7030000 {
-		compatible = "hisilicon,hi6220-sysctrl", "syscon";
-		reg = <0x0 0xf7030000 0x0 0x2000>;
-		#clock-cells = <1>;
-	};
-
-Example 2:
-	stub_clock: stub_clock {
-		compatible = "hisilicon,hi6220-stub-clk";
-		hisilicon,hi6220-clk-sram = <&sram>;
-		#clock-cells = <1>;
-		mboxes = <&mailbox 1>;
-	};
-
-Each clock is assigned an identifier and client nodes use this identifier
-to specify the clock which they consume.
-
-All these identifier could be found in <dt-bindings/clock/hi6220-clock.h>.
diff --git a/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml b/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
new file mode 100644
index 000000000000..345c6d0e7a13
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/hisilicon,clocks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon Hi6220/Hi3660/Hi3670 Clock Controllers
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+description: >
+  The Hi3670 clock controller generates and supplies clock to various
+  controllers within the Hi3670 SoC.
+
+  All these identifiers can be found in:
+    dt-bindings/clock/hi3660-clock.h.
+    dt-bindings/clock/hi3670-clock.h.
+    dt-bindings/clock/hi6220-clock.h.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hisilicon,hi3660-crgctrl
+          - hisilicon,hi3660-pctrl
+          - hisilicon,hi3660-pmuctrl
+          - hisilicon,hi3660-sctrl
+          - hisilicon,hi3660-iomcu
+          - hisilicon,hi3670-crgctrl
+          - hisilicon,hi3670-pctrl
+          - hisilicon,hi3670-pmuctrl
+          - hisilicon,hi3670-sctrl
+          - hisilicon,hi3670-iomcu
+          - hisilicon,hi3670-media1-crg
+          - hisilicon,hi3670-media2-crg
+          - hisilicon,hi6220-acpu-sctrl
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml b/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml
new file mode 100644
index 000000000000..4dd6a01bfd9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/hisilicon,hi6220-stub-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hisilicon Stub Clock Controller
+
+maintainers:
+  - Wei Xu <xuwei5@hisilicon.com>
+
+description: >
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify the clock which they consume.
+
+  All these identifiers can be found in:
+    dt-bindings/clock/hi3660-clock.h.
+    dt-bindings/clock/hi6220-clock.h.
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hi3660-stub-clk
+      - hisilicon,hi6220-stub-clk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  hisilicon,hi6220-clk-sram:
+    description:
+      syscon managing the SoC internal SRAM; driver needs the SRAM to pass
+      parameters for frequency change.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    const: mbox-tx
+
+required:
+  - compatible
+  - '#clock-cells'
+  - mboxes
+
+additionalProperties: false
-- 
2.53.0


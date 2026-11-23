Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795398071;
	b=4Z7V1sDhcVHQbaSblYzL77J5znoM2GIlWtONVwe0OOMoyiqMz5vh/sg1E2BjTf1dGK6t
	 Lo+Q26R8ze0TsXz9LEqtPRNkus0ohEK8riAtPGFN/BfRHenrqUrXpwNq99b24MJsTDw3F
	 GjEvEukQQQBEPLK1BWoIVKQQ8913JZtwXEYNp8MDrYt3wx4OogPqHtWyyhyNngB8tt/tD
	 mxu9KUX7q6QJKX7TJeXY8UuY5T4s414w3S+Xe+xbsfLmI49zxyPIMmNODa85D3sA8szdm
	 maVs23ZpZv1w5FEOw7EUkVMGDEGzivwjQNAp7nezKEj5ovXGK55PCbGv1GVz4j+bz9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398071;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	b=se7/2PdThK12JzlRZX6gab8iDiFL9DknA0QpP3eirS+N66CO95Wkvt4db17L2vu6HOp5
	 W2hS5zmK5APhPDlC+aZ0YANT2RCuiuENtGQoFgw1XS1WoXAw5HpRptZPGmsiCowAeRV9x
	 vOGhqBhIiEr1BXYXO1+EVrt8/MnO/NpvFjPU2MaC4mNlX0Kgpe//t4rZ23kFfCRBFDT2E
	 yocP457+XPUwbuJ0gecuCXIQxutoyqK+XA9bkCYJS0wpktUrxnNR3sAflPqzE/wntW8GQ
	 Zd1mUnqZseoYO7MwJpHe17sVYL/6j7bHYE5DY2zsZSBWWN/8Ct3ZlFwns2/isMbJiIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FeTfXWEL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB95E606A31A;
	Mon, 23 Nov 2026 01:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FeTfXWEL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795398071;
	b=0SRPLzAQrvBbJ0W4uBCj38jlClrs0rIqiqd8PsI6TBryF+ZOv0RmomZei5Dc5nHg5Uel
	 ukkenFqGFnyxaNR3i37uhB47DUF0956gY3oc+yEbPtIeS96Vnz5VtbHcjXvk6F4URBxJ3
	 yK3NbBnUpb3Ra/nkzz40KL+iklnZDQEW4fhF9kvcbTyTRe76Tgh5LDHYbaO9d/2p3rquC
	 1jM1thjAF8/8vCRB3CZUvUyvpeYOImsVSGt+iBkaPSEEIr8fegenRI2i7flXCyvSgRZ0t
	 3lS8Z5p974mz8DvRBOT0QviJHBmcu7bYGCcklVE7w+t0TrDEaDL+PcO1NuLbwCH4K2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795398071;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	b=pbIE50ppnHnMxwC2Bpf9GSag1Ry3ilzsO5E+tX4gEjbdJ+eY55FGKahNyiqQ/s1//1NU
	 yxysYZyWKx9DrhXMPfmPzrh4+nYxudG0d8xz8JY9nvKk0aU1UDgvolTWTTE9Xtlr61c+Y
	 Ff0G6Iz8Ta/1tj1uH7C7CRWRt0pIr50pAql/amc5iJgo3Gg8teSu8n0A1WjMGSJpRSyp0
	 sArDkEFA+ow9Qhfc/Kv0Pas605IcT257y6Dibmi/XXuta+c9CkXy2O7idn4Nu1syQaJiN
	 zBONWXga2hnKtWi4TBaJHatFiP8QAuLumLJljn76wIPUiOCC680+uExPRnvXLiRJ4eQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E835D1F000D2;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398071;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FeTfXWELgcmHpAMDBSFNyG9YKtMfvMzCY785v6PR15MhcBNAHJyQ6t2htYcR2hDvY
	 QkhXVnXD75TQhwUbleEUEgIpK15MA014xWVi0xAtw7a1wirNL3meC2U1WE/zV3s3KS
	 NLfScADEKjwWxSdGnGvzSN6aMTqaiwebK+eRF2EuqF6dmnj39iG+2l7c8A21ksFb4w
	 lxH7E5m6QfG48Bdq0LfKHHi3A6lEqpgVoB59I29edrcCnVK/NK3CKRhaKtlYX+kLH3
	 6cx/ReVJkT5heMLrcIbX39/9YHcK/VzozFNqSatj3BXX6XjDAi9rrnPjU3H2dayNAF
	 UC1Ke1QszN+SA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 75D7D4C2D4;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 22 Nov 2026 20:40:58 -0500
Subject: [PATCH v4 3/4] dt-bindings: clock: Add Siflower SF19A2890
 peripheral clock/reset managers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-sf19a2890-sysm-v4-3-bbfe1c495e2e@telaak.dev>
References: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
In-Reply-To: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795398062; l=8716;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jhe/wmRGKRZEoUc58eWAge+X8p9oPBOwrKECt3T0S4I=;
 b=IG0ybulO41yP0P0yihurtxuXvkpabPP6Sl0dl1FCVUkThTex1lZxF6yS9hh5CqgIgkq7ONZp6
 /vJvnfnGT54DbwYvycd0CYVqv/CXrxvd33NMjwWBbJ7SV3mqI7k0i34
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Each peripheral block of the Siflower SF19A2890 has a clock and reset
manager of its own, with a reset register, a clock gate register and a
bus output enable. The blocks differ in which gate and reset bits they
use, so each has its own compatible, and clock N of a manager is its
input clock N, gated. The header names the clocks and resets of each
manager, since their meaning depends on the manager.

Based on Chuanhong Guo's binding, which described every block with one
compatible and its bit layout in properties.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../clock/siflower,sf19a2890-periph-crm.yaml       | 166 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +
 .../clock/siflower,sf19a2890-periph-crm.h          |  87 +++++++++++
 3 files changed, 255 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
new file mode 100644
index 000000000000..f464cfffb2a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf19a2890-periph-crm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF19A2890 peripheral clock and reset manager
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description: |
+  Each peripheral, or group of peripherals, of the Siflower SF19A2890 has
+  a clock and reset manager of its own: a reset register, a clock gate
+  register, and a bus output enable that the peripherals need as well as
+  their clocks to answer bus requests.
+
+  Clock N of the manager is input clock N, gated. The clocks and resets of
+  each manager are defined in
+  include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h.
+
+properties:
+  compatible:
+    enum:
+      - siflower,sf19a2890-gmac-crm
+      - siflower,sf19a2890-gpio-crm
+      - siflower,sf19a2890-i2c-crm
+      - siflower,sf19a2890-pwm-crm
+      - siflower,sf19a2890-rf-crm
+      - siflower,sf19a2890-spi-crm
+      - siflower,sf19a2890-timer-crm
+      - siflower,sf19a2890-uart-crm
+      - siflower,sf19a2890-usb-crm
+      - siflower,sf19a2890-wdt-crm
+      - siflower,sf19a2890-wlan24-crm
+      - siflower,sf19a2890-wlan5-crm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: siflower,sf19a2890-gmac-crm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC bus clock
+            - description: GMAC register clock
+            - description: RGMII transmit reference clock
+            - description: Timestamp unit clock
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - siflower,sf19a2890-wlan24-crm
+              - siflower,sf19a2890-wlan5-crm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: AXI slave clock
+            - description: AXI master clock
+            - description: Radio platform clock
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: siflower,sf19a2890-rf-crm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Test clock
+            - description: AXI slave clock
+            - description: Boot clock
+            - description: Low-power clock
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: siflower,sf19a2890-usb-crm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: USB controller clock
+            - description: AXI master clock
+            - description: USB PHY reference clock
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: siflower,sf19a2890-spi-crm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: APB clock
+            - description: SSP clock
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: siflower,sf19a2890-uart-crm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: UART0 APB clock
+            - description: UART1 APB clock
+            - description: UART2 APB clock
+            - description: UART0 clock
+            - description: UART1 clock
+            - description: UART2 clock
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - siflower,sf19a2890-gpio-crm
+              - siflower,sf19a2890-i2c-crm
+              - siflower,sf19a2890-pwm-crm
+              - siflower,sf19a2890-timer-crm
+              - siflower,sf19a2890-wdt-crm
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/siflower,sf19a2890-clk.h>
+
+    clock-controller@19e24c00 {
+        compatible = "siflower,sf19a2890-uart-crm";
+        reg = <0x19e24c00 0x10>;
+        clocks = <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
+                 <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
+                 <&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index de087d1c255d..47a3a72a5d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25703,8 +25703,10 @@ M:	Joseph Telaak <joseph@telaak.dev>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
+F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
 F:	drivers/clk/siflower/clk-sf19a2890.c
 F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
+F:	include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
 
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h b/include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
new file mode 100644
index 000000000000..1cf54761fe72
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_PERIPH_CRM_H
+#define __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_PERIPH_CRM_H
+
+/* siflower,sf19a2890-gmac-crm */
+#define CLK_GMAC_BUS		0
+#define CLK_GMAC_REG		1
+#define CLK_GMAC_TX_REF		2
+#define CLK_GMAC_TSU		3
+
+#define RST_GMAC		0
+
+/* siflower,sf19a2890-gpio-crm */
+#define CLK_GPIO		0
+
+#define RST_GPIO		0
+
+/* siflower,sf19a2890-i2c-crm */
+#define CLK_I2C			0
+
+#define RST_I2C			0
+
+/* siflower,sf19a2890-pwm-crm */
+#define CLK_PWM			0
+
+#define RST_PWM			0
+
+/* siflower,sf19a2890-rf-crm */
+#define CLK_RF_TEST		0
+#define CLK_RF_AXIS		1
+#define CLK_RF_BOOT		2
+#define CLK_RF_LP		3
+
+#define RST_RF			0
+
+/* siflower,sf19a2890-spi-crm */
+#define CLK_SPI_APB		0
+#define CLK_SPI_SSP		1
+
+#define RST_SPI			0
+
+/* siflower,sf19a2890-timer-crm */
+#define CLK_TIMER		0
+
+#define RST_TIMER		0
+
+/* siflower,sf19a2890-uart-crm */
+#define CLK_UART0_APB		0
+#define CLK_UART1_APB		1
+#define CLK_UART2_APB		2
+#define CLK_UART0		3
+#define CLK_UART1		4
+#define CLK_UART2		5
+
+#define RST_UART0		0
+#define RST_UART1		1
+#define RST_UART2		2
+
+/* siflower,sf19a2890-usb-crm */
+#define CLK_USB			0
+#define CLK_USB_AXIM		1
+#define CLK_USB_PHY_REF		2
+
+#define RST_USB			0
+#define RST_USB_PHY_POR		1
+#define RST_USB_PHY		2
+
+/* siflower,sf19a2890-wdt-crm */
+#define CLK_WDT			0
+
+#define RST_WDT			0
+
+/* siflower,sf19a2890-wlan24-crm */
+#define CLK_WLAN24_AXIS		0
+#define CLK_WLAN24_AXIM		1
+#define CLK_WLAN24_PLF		2
+
+#define RST_WLAN24		0
+
+/* siflower,sf19a2890-wlan5-crm */
+#define CLK_WLAN5_AXIS		0
+#define CLK_WLAN5_AXIM		1
+#define CLK_WLAN5_PLF		2
+
+#define RST_WLAN5		0
+
+#endif /* __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_PERIPH_CRM_H */

-- 
Git-155)



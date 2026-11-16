Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866704;
	b=FCnR4Up32n7hKoVZ4h6HxgkGCegebnmtngXsydwWf8rqGiK3hikiy6VTYIaK9/oRCuWE
	 A9RyVVNqS8g3AUmwsi99n0qUfmYAJxHvjWCcyW4q+L38NCuWC31nDTaXIFdFLmRP11pET
	 bxOoZaS3ZiqhQhLDx1OdedmkIV2v6MeS9/bss9W1FXy5xber0yuKYfUlotL+rp8tCle1R
	 X+5eBzBNs2BqHlVPaRg5tJs/3uobGuBLK2PmN9JGKB03P8Pw16DlUkHJdKE7GL33cb8hV
	 ro/nIu2YUztPLTxNWI3jlpwfk3ZFoGCIw+1KOWRLODpdQ1UZTC2rppwCCz9PYGhHxYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866704;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	b=oHVMM7ObpjEnZcmxe2HQWgRDlLNoqB7PrSYzv9Ue6r8b1HM1O3DZ1vZ4a7Uuc7EnKXCN
	 +l8SaM8XNohNyTPCGO4V/vGtXd/KTN9BC2lNZdHpdo712Z4F1lFFaLYD0r2cuokbf+aPz
	 EL4+5q9bEcig9kxqGf+T/6GgdiADP02VCjgXp5XEx4fpv4v/l8DXuDbVw9ZAOS74lg7sb
	 Dib6dRdxpUJLZQqFp6UKFrZdDA36BYFXWgX3hr3PGxIVLHXY3nG9HijQhNaFTro1ORCrs
	 HEVcQi8ZYuXRBCY3fkLx7SZTvRrky5Loy2aP3SjCx+MpXhjp/YKnnb0Dl1+7vI2dWkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzdKwQwk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836D606A33D;
	Mon, 16 Nov 2026 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzdKwQwk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794866704;
	b=cx6JtLDGwMrBYFck54IzAQOYtiB+5TGTqao3BAiQ1kJxI6aaXs/6vG9nw8n/OVA6K0Up
	 2ZhD9aoaNr8ftGlfsIG09uP61V00yLtzvbGo3/M/eUwnltIVze1N7fGiVKyYSWR9y1sUT
	 XJKqKEXk0kTk00E5yv3xs3yfzNhpfDvMRskH87MwKMlbGET5bnWzZ3pSQJFHHxE9KCoe7
	 kWn8Md1iTMCafvNRnBedMJGQnpJiM25mcwSe0s2ZClyKnqNhVL3/n9K2uccv9oXQCrMD8
	 aUGEk3/IuTokslHTSXipKHeAB81FcTtAiBjlJTzaARcszfFy3CF+Sea6jy5IQpPlUuA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794866704;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	b=tCiE/481rfeVk7wRCqZBqZRvjEufcS9OWKfgEqocVsTZYt/ZZ05smaDYrZg2cZN/3RLB
	 yAPL2Bp0YfyDibOKX+ATOgPXK3E+OycXgUYbqTZuRY/vfiBIW7SJ/feHnW3k/6dsPZZUN
	 tjWGxyvjWfLu9LmTZB4ujyeyPiADBJoJLJF98+8D0/8huf2pM0ZhaS2sD7arEVI63nkB0
	 6s6+ZGAuwfje4vZny4jt02f8e2bnNTZ8ImWWr9T10yxouzRmSgPHL5ZaE+zdsk5FOIUkD
	 A3B41uQp2CT6CogSAlW8ZD12WHeVeonTpMQ106z5AGz1OG7Qx0l4Ycf5jKBw2mlq1Qw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AF031F000C7;
	Mon, 16 Nov 2026 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866704;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZzdKwQwkcYrylZahabkGdIY+nKvCz60SDAsRavpnYpcpv5D9KHtyof/Gsd7qHoqIz
	 9RK7JOq7rA6kN3UXFqBTsb4glz7QZJ4gs4Y7PigvRlolduC8qDaQ2iqBimG5wzs9+2
	 xX1C7aGETbrA9AIz4L10z58mhcZYZapprRZNxYoHMH2uXsz3LxlHAy3HalupEosqGA
	 0qFma0DKkGQvEIAhR9X8yC4HU9Seoka2d2oU8NZPvxg2+gSWY+nxupuYk+zpdX44qu
	 VuJyDgnCIwNZqFe9mn/uutB6d4OPIz4dRSIV9YbYVPV1Z0UFnDhFbuuZswORL2yaXD
	 xVJLRZYxzucFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD5A74A60C;
	Mon, 16 Nov 2026 22:05:02 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 16 Nov 2026 17:04:49 -0500
Subject: [PATCH v3 3/4] dt-bindings: clock: Add Siflower SF19A2890
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
Message-Id: <20261116-sf19a2890-sysm-v3-3-b07bc7833a87@telaak.dev>
References: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
In-Reply-To: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866701; l=8716;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jhe/wmRGKRZEoUc58eWAge+X8p9oPBOwrKECt3T0S4I=;
 b=uwZpATPD22lL7RZZ/iuVK8AbTin4JahGdI4w76LYQYa8EgDAM40YGREXSsNRMxC06bTrHP4IG
 OPFhdOA/zIzCDTjcBFn5Qld0mHT3Ks2Eb+KZnxB3xHfJyIrWHGbFvkV
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



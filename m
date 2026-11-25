Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638307;
	b=E1T62nWp3VHck6TqKaFXyh4lYq409WHgwuiX0i9I3YS4lzYpyp150Jppba0fubdRMkJY
	 6PuQ9axYIryAyRZm2Oq6ter3/ifOiN7tKScnoAqFFTaZ/CKJvfIq4gF9CdZ0xDVigRUTE
	 9WdO5NDedd0hajy2RmB6EjUjljwg2n5CE0Wc3CdbExKDKqre03RtoAYaktiUX3x2IEH5+
	 i2ewR0Jx/dyXCeDI6mLE9HBh0cSdn/0yAoCU2yIF1i4lltxoYCyHAyOhd4TJDkmTbcEbg
	 OaMLTSx+5wnYyUwj0i2ySLDfcKc6OHHZ2Yn1sH3nRCE9SAo5xoXgstRtufo6tN4JskQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638307;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	b=MRcOYnnF4ZBXFJnixDPXCb5zfI6LWXl7j7F6aMlyQI8GNqB0sGGrQMYskO9+/sRNcEfJ
	 zTltkOvODTUUGDNfrLZx/Yd0EQY9N+9ffGBRjsrq6EaUxohNMPgcYKz7cO7bKJBVAH3Ek
	 n20qj1NeQltOdiF+RKh4aqra3FLsaVsd+XN0LwE9V/EKvMx2+1/rke4GpG60Ubgt/cjQQ
	 A6G24NmY6RzGJKFvX/la2s2JYqzFsUnu2tt4nfBWInfdzfyHUWwEE14wlXMdXMuKdH+e5
	 sMbmQ/STkgb3iOBLSO6VeJGyAVWInUe83ZYOceb+FyfJ5jvAi4fzAreubZa1+yG084w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G83E89PB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F0606A330;
	Wed, 25 Nov 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G83E89PB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795638307;
	b=BBlybLWouzMsWTC17iGVJVi3RJYN0W11XLQHvH6+uVgQsAqm7MrQpMrviCHpgTqDN89O
	 AGrSv83GsBrg8HvDFT4zqLicNMXHBmuGiouTDy1b+YUY/ABrhhPltMEhADwwxX4mVFul3
	 lBwm3F5wzsbErmDq4K3WvDmZgG0M9AfAqtDRa//Mxgr91GJENaKFoZxad46N/TOUOShPD
	 Iovaq86eVkQRiSe7Onp9OeyHBf1Uple9/J4Sv2JgVwVetaiVvZHkl+oW1pmFYw0QiY1rs
	 Y048a3tsPovPiSW03pBymKtGY91MJSHtCEf4p3myeohOUd4TrSHoSKvh4xHTkZA1wZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795638307;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	b=RO4ZMneHNKWo2eE3iK82mHk27p6OVWC6AdWo9TieEXGzUZWPHRqRfHa7Jmqtng55AGIY
	 Y2I1BtnLPuzoEKWllZHz11kRuyXg9bviWlJt0uFP9bmiMV++CkRlQdCXgKx6QzpYYoAJZ
	 IjfDz5+BzM/PWhLvaeNH6i48tyH1bptXSqhNiaSpQ9BB7vW3Bvo6KkAPzv6iP8QayfnGk
	 v4KDLad2Ry5xg9UNm6joFNKEXRkKefp/BTgYjeXPJMmNB3Rid9+xczwapY46L7prn5WAI
	 XQY+gR9rV8AZMMbGHAVFIbMw7ynK53yiN9GNMON6DgHOl8iXHKXSNc0sVNWSOtzKptA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 255651F000D1;
	Wed, 25 Nov 2026 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638307;
	bh=rwP6hYLmbNkuOgB89irY+7NxXjvjB1ChDUj1DhEAqsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=G83E89PBjwG+f3PWSeFiEewjoZg+Zyyaupcq7RUmf46NQiUm00Fhg8yyWrlsUhXVH
	 Np/aBp3kZ961Gn9jHvrUz0BOeGdOWlYR8xcaLJ03nSHsLCn/BbM8aNqYRcTInotZYE
	 waC59x6wel80Ehf+Kx9NkrujMFQxYk+IlMAVUKqF06n6daGzKgUIymdQRalTUotzx2
	 JMlwcCynkdk8QgOsroxm5bde0XlXDnlwftLtlLB3C12YrWJsYBEexVkYh3LSuC2WPn
	 vU0OTnUIgehC5HLpJ3yP7zycBZ/CYRmXRYwOGjJh7e4N8qNs4/XldC1VZ/BdrMw4FF
	 dyusL65EH8tBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A59C64D02D;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 25 Nov 2026 15:24:51 -0500
Subject: [PATCH v6 4/6] dt-bindings: clock: Add Siflower SF19A2890
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
Message-Id: <20261125-sf19a2890-sysm-v6-4-181875c10682@telaak.dev>
References: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
In-Reply-To: <20261125-sf19a2890-sysm-v6-0-181875c10682@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chuanhong Guo <gch981213@gmail.com>, 
 Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795638294; l=8716;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jhe/wmRGKRZEoUc58eWAge+X8p9oPBOwrKECt3T0S4I=;
 b=W+QNaQJfQjhictFh/FaqjuEFtjb/lWmqv+0S9NuhuYrUHRTq/1m+L3GWmHccGftAj3BBh9lUR
 uUov+srzqF+CpkRb01Xu5SuQSGG2FKm7Xbn+TaLiAoGO1zpf/tW24Pp
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



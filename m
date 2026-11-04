Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776869;
	b=HU61x60ocQ1Ola1gUva57gTy0VLncLzK8azbepsIvbAwvgpQK2gm0N/sVtGJflARTg8P
	 jfmlywt3Fg+SYwpFUtqs5kvMdE8G7FdbJ01m2XUs2yoB3bhx5W6phy8iZ41pI4h1GMIxs
	 rEqWt1FxZuEoHf526EZiUA7GmEZK4lhJfmHGB1Dh9rU7we0kt9P+vX8Y3GMG2SA4ABTCN
	 bSP1yzCH+aP1liXtx8/8ngRc/gu5ql2jiCQIGNFBGWR5P1MONoxv3eTigVXSLEgcSxiYm
	 sthdfNZS/wKpQ95OuqST/0VVWQUSI0PVVoBAW2IHTvcYdfSW2NOZ0Q6Gc6K4UC/QLBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776869;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3SZrotQFvmPueH/4BQAu3CKol44iMpmtrxjOSk9/PG0=;
	b=ISvcZiKPZ2FlxkCCBxMI6ZVB0FMpho9He3HM3P854TAkLsayP0i3kvrlKDe4gWv1AW8Y
	 6JQXijSVuvqJ5nfayPA4Jl71EIqOE1EdVcX0tMFl6dAns0wq9MjplsK03rge1rp3ZTAzd
	 kvXipQac5jmTL2wWgyRvhE0ik0a9/o9eAyjd7+sIa1zu90awT/X7cjKdkITuxSuZUGHCz
	 jX8TS6VMWCByrtN2LvwhM9bbGZU6AmlwbzrZq6KFluCSE/Iqeu5dU1huBmJ1IRtQBfn2A
	 5PK5EUWfFfchtC61biznVJh5AX0x7ZAzf0CYrKZEAJibI7Io0pS3CKgrF7TcY1jdmrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZ5x2YIp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E421606A32F;
	Wed,  4 Nov 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZ5x2YIp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776869;
	b=hFa595XfNmurYX5VGtVX9/H8HvZ9V6T5FBW+9rLNOON4PTaLgTAbYpWDc4hjyjusztk7
	 nqPFSa0WJkU/x+yXka843JlT9Pwed/TLK2vmUlvRRsPBry2TC/HN1qkYsKdBzRLvDy2Sv
	 m3IB25n0KZ/8+ei0v7f7/OoBiBtW3YH5I7IBFtISSzxn63i5YCAMYQlEQ/en7TvYZKuJ2
	 Pp+fsmzgG5VY/BK96CgE6pFI0HBXpvvTncryVi9uplwAUCiRIXcXiEKDTCzTJ8M+zwZLQ
	 3Zo+O9ECWrY9hkE3FrAt4LONDMCqkQ8tnnGJxTB6guHhsw4eD1ZsW2+P8AYCB+TjBwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776869;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3SZrotQFvmPueH/4BQAu3CKol44iMpmtrxjOSk9/PG0=;
	b=RqLNYM1p6rtn5kb2yyDO3qnvdY66OonO3ncV14D6YPlcVAXM+GxqvHpvywzFjrCfSeoE
	 +Ash1b8UmcphF4PEYg8DK+mcc8KBHpYMX7fAiGCqO218v5g7XrOMgqRiIzBYyrLODYmpC
	 hDuvEuDGZipQdXuLWgZKGkZvjQqJamaccp7S2Uo4tTmW14E6+TOK9pnCDltV5wGyosiTw
	 zQW9RfAnka7lMXgqIyLd4phpIrvn6iFP2HTBPXFCbUfaSDuEnvT3eYT4XOpZXnDwrq9Rk
	 5U+bAzb2qFzhVXvJvbQPJCLhcFWK/w0IqSU9Q3DVszDSfVXdYnctpkmnr9xTfb6wjwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BF061F00A02;
	Wed,  4 Nov 2026 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776868;
	bh=3SZrotQFvmPueH/4BQAu3CKol44iMpmtrxjOSk9/PG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JZ5x2YIpgS1YwbYgrJ+V+osRrvaQCxVZky/mrqXtvcJabvVcKINVIplojL0iDt1Xk
	 K9q0lCaYaFFezEfoV3z7v1wfOtTAdzrK2eD8r6s/KQVoh7zkEBRp07Xy+asmJWEDaI
	 liDm09gnSCcWthFOFYMVOITyS9DJ0y66qzrh+5PCk1yafP7kPcRnTzn1pGsKaABW4V
	 +ySt92yE1jPpuSnO/sQY7Bgds0A34d/zkhfpFsOA9DQVvG6m4ceTv6G4els+cgNe1/
	 PnKccM87KhKDffMJVk8pfyCo4OtFW3/5FZ3yv/CT0djISJQZLFbh8nSD0ivA7ZIDUs
	 lXwuM9VtLaFSA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0BC046CFC;
	Wed,  4 Nov 2026 07:21:06 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:00 -0500
Subject: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
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
Message-Id: <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
In-Reply-To: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776865; l=5702;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=4KWzG/an7MCfsubmOaaiA9hvsylDSllSRf9ZeagAwwI=;
 b=BFngtlTXgARtrMOMTmNMZrMimkrw6si2n2L908ZtjYSDvyIC9x0TEz5kdqSKtHZ5h01j9OpCB
 qaJ4dn5BEwwD3CDGjlcaSN8pTt98x+RhwY4bxlvAOaKlqwLwslbMQwF
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
input clock N, gated.

Based on Chuanhong Guo's binding, which described every block with one
compatible and its bit layout in properties.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../clock/siflower,sf19a2890-periph-crm.yaml       | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
new file mode 100644
index 000000000..7f0bce603
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
@@ -0,0 +1,169 @@
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
+  Clock N of the manager is input clock N, gated. The reset lines are:
+
+    gmac-crm:  0 GMAC
+    usb-crm:   0 USB controller, 1 USB PHY power-on, 2 USB PHY
+    uart-crm:  0 UART0, 1 UART1, 2 UART2
+    the others: 0 the block
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

-- 
Git-155)



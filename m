Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795398075;
	b=DZoAlAI/+rEYxk5xo8X8K/Z2lclQLCkQ7tFTyFuNgheOeASFb0cCxtRCzmOoq9dh01to
	 4bz7I/qn8hs+Vx8nNwsi0QL/IsWAdMrIxXp7xu5uHGP4/oAQ1ghGN3jUyjVBBKLZ+Dc/q
	 aYxJ4ci+SapcC27FTmY7vMGLfCvC9YiQLUxfgzbYNwyPtgRQ1RPgvQtK6RDupITbcBJ+T
	 xRQREyxsI6MWha/CCR8u8MT48KkoIF/0m0wnNMsJv/s1G3vZbD1F5kOskfKr5cUce+Dd5
	 bqV2ZDHXBpwHAarlRczkH0JC6qeim1jMQniRwGPZY40U069fIZdlRS8YT1BSlbyAaGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398075;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=rZbz9ldsBAtVY3QVercL96rHAkzT10/INBcYFw6TcqNO6FmadQPMeLpaGGq9qLZ4+lU9
	 /n/crC2c+WT9ArKA5NNkJBTpJrZkKc3d7kwCE3SLoT2pBmzULGi4a4C3jnsxYk+IIH2jf
	 PwHb17B2vFKqpCRL4LrgXNaBzNvQjGnQtZjAxckFvks+4iR4XilzrNsYAA0PUz729C9HF
	 jjVj3ZggaiObMfY726947FRul+9ILR1B3hN95yUKpFZEL7GoiEKgwY/N3ciUE6UqUsVCz
	 GVTcLcJ2Z+Zm794snV+uBX/TQy3zeq3wNTS3o5zLbMvlpYN0CLvbqhaThTztFYr62og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPl12e1d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21C606A32A;
	Mon, 23 Nov 2026 01:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPl12e1d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795398075;
	b=m4Vn4DcQpOXckOQLDsaC5EbrRTfuswcog/mUmKEsq6mL00tPGUKNjCVfYlPFMaYPh6Kj
	 0KTLSHuLlmEZO0QkngvzxyV9e4EVg5V+mDaKaxmjNouT0CkQfCD1/EOK9kcD1JDBG3s80
	 ZnT6eFuXvdpEojvD0ANfxGCEsJoQsjV7An7+dWk5By7GPsQk+eV8JrEr0MffXUevaA/sZ
	 CBZixc9kv6yYMlA77fcx9cAs4mk3CHzyeyhriOXN6NF4XjjsYHYjP/9KbZbjybckz6bYu
	 y3SUtArY79NFHl6lmBDt2/iH5lK6QnfBp4zqP9GKQBERi2fg2cRAeAErbIg2KzLDyDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795398075;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=aiUn81+REA+aZprw1Y6iaoOv+tBCrWcTU9/qDY1E0NGWCqwuVOqbFQ59SfpGJ+C+tuNN
	 TO9NKAJqlQCmxj1GQWX7UBS5QCASrZk/ukWrG964hdq46TNwJW5Vm4WgilfaeuIqhcOz8
	 YGeXfaBJ1Piu61pLk4H6PgT5cwAxUFs8zuEIKuiKN4Mc81w5LZCMvf+gMkLqktK/SgLNc
	 Atz5ED8N2eNyM8IlkT/jRXpL4Yt2cvnrpkoRNB72R3M4IsZah0NPqTnu/PDeHJff9bmoj
	 cvJCHG4Fc2w5yG4XO38eTon/G0Lr3F3wEHvWoM+I1SmOoatJo8kgLd5Mh22C6sVifQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBDCE1F000C0;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398075;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lPl12e1dBrgNsrZMQA1J7htSmxQWG8u7ixNST7kp6FoXQuNLPFlNMO+qyU+X0vZ13
	 nBLFuVYLO9F5IWbT3WabGwe4XHZxFYmr56hm4uUJqRmchIfG/dPTJXFTXn41MJNQXQ
	 +XnujyQdvZBZb/0Wq46vrVtWvYx9PIQo6x21I+MT9D9i+29+cHh6WfviD9bN42Aqag
	 JIrSctRctZwEwYipEBYckC69BjP6zjtexehzYpSm31vbfXFII65m1ramflCJifztcE
	 dcagz2t5HsFUAJmD1XXPIbgQNuRA81Lek61baTSdWIOpHLMVa2iUOFTXjh3u0qbywf
	 R/o29V70QWEZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3FE174C2CE;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 22 Nov 2026 20:40:56 -0500
Subject: [PATCH v4 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock
 manager
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
Message-Id: <20261122-sf19a2890-sysm-v4-1-bbfe1c495e2e@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795398062; l=4233;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=1hE1zhMG0OtBg9FcIR+gI4NTYVaU3Uop5FjyhLMYHqg=;
 b=LNfjcWoDPXuX9v5tE19GNoja3EVNjSpfJgR92f0M3a0kT9AU6ThozFTtQ2OK7P7P2hgCPrV/V
 xVkUTFZwc3ZCiAhA9Atm5Xd1vKgretscWMH7FRrKm21C0cyVVW8G1Lo
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The clock manager of the Siflower SF19A2890 holds the SoC's PLLs and
the muxes and dividers that derive the bus, CPU and peripheral clocks
from them. The peripherals' own gates and resets are in separate
blocks.

The header is Chuanhong Guo's, from his SF19A2890 branch, and keeps his
license. It drops the count at its end, and names the NPU clock
CLK_MUXDIV_NPU_PE, without the _CLK suffix that no other clock has.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/clock/siflower,sf19a2890-clk.yaml     | 57 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h | 27 ++++++++++
 3 files changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
new file mode 100644
index 000000000000..9b72f14c2bd9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/siflower,sf19a2890-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF19A2890 clock manager
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+description: |
+  The clock manager of the Siflower SF19A2890 holds the SoC's three PLLs
+  (CPU, DDR and common) and the clock muxes with dividers that derive the
+  bus, CPU and peripheral clocks from them. The peripherals' own clock
+  gates and resets are in separate peripheral clock and reset managers.
+
+  The clocks are defined in include/dt-bindings/clock/siflower,sf19a2890-clk.h.
+
+properties:
+  compatible:
+    const: siflower,sf19a2890-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 12 MHz oscillator
+      - description: 40 MHz oscillator
+
+  clock-names:
+    items:
+      - const: osc12m
+      - const: osc40m
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@19e01000 {
+        compatible = "siflower,sf19a2890-clk";
+        reg = <0x19e01000 0x800>;
+        clocks = <&osc12m>, <&osc40m>;
+        clock-names = "osc12m", "osc40m";
+        #clock-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..ce8d0596939c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25698,6 +25698,13 @@ N:	sifive
 K:	fu[57]40
 K:	[^@]sifive
 
+SIFLOWER SF19A2890 CLOCK DRIVERS
+M:	Joseph Telaak <joseph@telaak.dev>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
+F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
diff --git a/include/dt-bindings/clock/siflower,sf19a2890-clk.h b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
new file mode 100644
index 000000000000..94bbebd0c1cc
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H
+#define __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H
+
+#define CLK_PLL_CPU		0
+#define CLK_PLL_DDR		1
+#define CLK_PLL_CMN		2
+#define CLK_MUXDIV_BUS1		3
+#define CLK_MUXDIV_BUS2		4
+#define CLK_MUXDIV_BUS3		5
+#define CLK_MUXDIV_CPU		6
+#define CLK_MUXDIV_PBUS		7
+#define CLK_MUXDIV_MEM_PHY	8
+#define CLK_MUXDIV_UART		9
+#define CLK_MUXDIV_ETH_REF	10
+#define CLK_MUXDIV_ETH_BYP_REF	11
+#define CLK_MUXDIV_ETH_TSU	12
+#define CLK_MUXDIV_GMAC_BYP_REF	13
+#define CLK_MUXDIV_M6250_0	14
+#define CLK_MUXDIV_M6250_1	15
+#define CLK_MUXDIV_WLAN24_PLF	16
+#define CLK_MUXDIV_WLAN5_PLF	17
+#define CLK_MUXDIV_USBPHY_REF	18
+#define CLK_MUXDIV_TCLK		19
+#define CLK_MUXDIV_NPU_PE	20
+
+#endif /* __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H */

-- 
Git-155)



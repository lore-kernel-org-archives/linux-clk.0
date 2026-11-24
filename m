Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495298;
	b=0i8Ldnu4+cjEipDnCPTr+glq87S7eHSqoL+WgsxMy99fufLZECxz8IdvjJPm161OPsht
	 2/LuUSQkGAVEEKxGMAqyqM52UB2n7xZI0iUrh9tsUsi9Qd4247KbaqUzmKqzYLwLjJ3su
	 D8BtzDW/lzXgxh+6UACpDsovvL2W8ih0RL+3q0oKljvogmyDRFwmRRc0OTDEP85g0vFc2
	 tbhNJR8CS3ztBBdpwuHYZBnvIqwhDP7uVh1pCFZMpMhuen4utyeOsXdTOUKEUdLvR8OCI
	 oD0LfnEfklEkv4/IGm17bXB3boXSJKJSO1cZazau4Mcv2Cvd95Pi/e9QBy1tAN7CeuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495298;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=bJDqsr9Q+ygToXGtdDjkws2fCMmHFBvpN1Q0kW7nc/PbbnYV1p19P9hKz4ayhvUC+yTh
	 apuksA/F2TrMm2g987+jAVD5eAmzmPdVDuSDoNVXDsAIGUSN41luAw+cvlq94vRCW4uQv
	 /v1Y3fkb0Z/HzxLCohFiEWMTvC3ByAxuFtYV5/WOGxgku0vqymyk6OdpUNyBRIvGOk8ZU
	 qB0vWvDGjyamyxknLrsmPe0hWii2qaMOPm7l/xbeD05Li2eEWquwmgqdHivFdLYbZZJ/v
	 oT4fLCbycVwzK99t4DAR6FrPTaF4SFU1zG9ko13nDmCiWYXc29yhaEhjXi1wJXm+6iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBtCCE3k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B5606A6A2;
	Tue, 24 Nov 2026 04:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBtCCE3k
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495297;
	b=wop2nyJCWQBv4uUngfGoZtOBLPAxc475xGCsdf9+oIrA/MZfVkkD+bCXnW6rh2UmhuLM
	 O6fl+FKMhNkqHBSFMVf+JqPYRZo2TL6KsrqxeU9wbGD5a9ItQB0XoAaYCg0A6gx0UxVeX
	 veNZqjlojFc/8QV1yLOm/CBgxgAVbw3MdI3pn0wwWT1u0wT55RcG6Fx2mHQdsRAgMlVwi
	 Q+D7ESL+d2ptlwog3WfrXI4fztdqq+lupxce9Z2OMy+31NObTVEg51by6wleEnZA3X5y2
	 9wQbTIj7J+uVm2N8rm0XLicQZo37e/SQ+b+LeCSTV6uJIIJFb3S0bOR7Ze+cgbYLxeQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495297;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=sufEO/yNniNuJdGzutCfhYuqXYN1PQxP1jiZBCNCBFFfYK5ZjaHc0cxsaBK8nQKSd+5e
	 VF5E1EcEtrwPlW5caxz5fyeI/XCIrHQU1IuItKE6FRfhuc0ICax4ltV/zbjNA1aGd0Jbw
	 SflroP5FoFLPXviWkwqHEIEtfgJJFVuISB6Ocx2mfrzi+/LZAkrs79ipRZxv/IWXPzYhG
	 byjltndvxo/zQztkjkB+g1in56/RrGKytda39JP42vHgWfaVRD79EYelNQKY7+Kf/Y1uy
	 gB0Yp1lwL2vUorsv+uKSzlGovCdV6bKX5nfjyO9ANXCcymmLQ4Uv8qdXwHgVKFxPXzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC6561F000D0;
	Tue, 24 Nov 2026 04:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495297;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WBtCCE3ktU4NbIgn5Je6zTHUt5JaLR21wltA/pG7OUvf6tS7mcXikR8aXplhl4rBS
	 1Hl4TVPOktIdQs8eKFaGGVRzG0IgZ7fxzeaGEemaNkD2lC7lJX1wp8c0Qt3VsvFzZN
	 yr2+cOfPEElUrGNK0DhITzRjTnoqfQ0d0jgXmbz02UGzBNA596wVaXF8qUTn6GoYhK
	 HHH8ABpcsxHFJVBQHBpOmJz4uP0ZnptBGU5vui3VHjG0RGw2H37YcJY/ZwoCVhq7Be
	 t7+xcImS61ihBQZRWBdFkFyawnNeVuXDRg8GqjvcmNpFCB/d7JYeQyG6Jza1ETRPde
	 I+0Bz9DvlGWTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6FA974C8AA;
	Tue, 24 Nov 2026 04:41:24 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 23 Nov 2026 23:41:22 -0500
Subject: [PATCH v5 2/6] dt-bindings: clock: Add Siflower SF19A2890 clock
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
Message-Id: <20261123-sf19a2890-sysm-v5-2-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
In-Reply-To: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495283; l=4233;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=1hE1zhMG0OtBg9FcIR+gI4NTYVaU3Uop5FjyhLMYHqg=;
 b=C8q1a6zO5bUc86v+SBwtHzYmqGAl8EVJtjkUc3W/g+z4Rcyiuj5UhJ1vBSBvVrtAtKm/flszR
 OkTW9Jg11kNCzbOek5LoqXgTsmO5s6yVBTLfqIUYCkRfoFQznR2VdqT
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



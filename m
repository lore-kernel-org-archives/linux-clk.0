Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776869;
	b=bECo73jckutGF+EWgLSxu+vNBJMGOsjWgoRvO2UYIwdLJAgTYDq4a1zFXrmozJXvk9Hq
	 RRF9sDVbjo3S04S+7PvAGO16XJbQUnqeasM3E+LA4RGFOtkhMhfxcLURB2MnuzQnHgQH5
	 /KmzJdrLUEYxpKr9k61mVCr9HwUHG5w8MlfrzM6IOJ7Y1gKNRSSNnMFY8+L59hLj1bsso
	 4PQYQZPPVq5yJOyfrJ72Y2Bt8UfgyZEfrNju0yNcSuS7MHNVlVt90f/W60KbPYx0MTRE1
	 R6bvSKCrRCw8m7k71I8qc+sEQkTCsNRMgUhuSPAmCwFQnYBHnm/aL1FQdvf4gEaYg0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776869;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0koFSESUFWnAbyCgQDc/6P2aygsX1jk+kyP8HlGSb3k=;
	b=lHXmQZoaUKY88gj4dFi4KwIv6FODXGXaYew4XNp46Mu14Xa2Ru5cOhpwrtVDGAK6bu2/
	 dIHFN9j8G0xXaV0RP5jZ/jakU8g7gHIaBGharsNl+zlZyJclPQQeiXh1PZnq6Wlvfmda0
	 bNg38quAKv9KGbfhAY7Suhr3HHdU2yszuGpVBz3+P8kwKWjkKS8hX/Fp5ntWYKN18K0sB
	 slP4WRt/xTWQqfN3qLs11TldwOYkAGHK8iOzWyRlRc55A5QTCBARxXA5ZOvYMPRUeuyGI
	 MqYU8R+LDrhO1LBVcSJ3ugrZMdPNrvEJjgpE2rjZRsKx36WB5peLUYQ/+rR1q8OBH9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFV8OnZd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF22606A33B;
	Wed,  4 Nov 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFV8OnZd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776869;
	b=xQ2IoqS9Bg/7LLXZMGWpFtC/R5//IVtFKOOzQxyKZ0eFL8IJWm5VC0mHqhcvRM8thKaw
	 971iVeBOvyLr4nxpaG6E/VrLRaTDiyvZE1Vdmg5mSr/t3pr5JIsLsAlsw8qDZ4PiaUri8
	 57LKcwgx1o4opHUzxQn40nqxVvLEIMMkWTzaChpReDqnwlfYvAD0BVsa6yFE2BU0a1oLG
	 OGluEpyUFbcJ0SsgYe3reWGx3f1JJuc8Pzsv+31OzCSFIOqCQGtWYoNDM3qqtxf7fEMZj
	 0IBMok+/BEPDzwPA2r9FX867SkAFY0m7CBg48hp0dRzNpzMpNofM5Gd9oecLPkNjf5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776869;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0koFSESUFWnAbyCgQDc/6P2aygsX1jk+kyP8HlGSb3k=;
	b=JG4Klpiu79oW1u96tzb/E0eN6Uul2t2Wm9NqwCKlyKL9CQDplRT1dWif4Et7+qqjN8IR
	 T7wnasAo9NuKrzQMOixyI5q+OQ4QzhnYqjoW+0BsfLy1EKnZ39Hx6WO1BchSU/+wDKvwA
	 DIc7HsWMlHSi4FlFCY1FOhwlxs6cGBmZFGGnQVQQjh3sasx5+tPda5J1D7kZI+EnYDRs4
	 bqabm+Og2aqYO2GULE84bthOF2u8BQnBs7c/ui/kfu+WrV2rX0euTQZ3RQhD04kC6xvqQ
	 K763CxWxlTEwUzX+uigM8sTBUXrbcHUvsDBlRYAb/Gjd9xi7tWHIpUgvsehmnE+XqLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 270561F000C1;
	Wed,  4 Nov 2026 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776869;
	bh=0koFSESUFWnAbyCgQDc/6P2aygsX1jk+kyP8HlGSb3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LFV8OnZds4e/DrT1EzxQUxd/FSVITVrFaqK2z6PP2DTo/ul8zd+rfsYA/ls57MTVU
	 CtTWwWRzmWgDsqRlgC2iWfG8032aK1bN5R21fxh16btC/uL0M8mQkRW4+bF4gjFbMn
	 9xo13cGP3HI5xWcJy+UoZoRMeOYWSMnAqPE79tkxjHCNuGaOOtBZL/LXRnNoruYRhw
	 P2t5SZpNVkcbqJs2F5nE5Q6AxCm8RJ3eoBeMlMh9RbM71X5bS9EUcgJeHNslNfT0RI
	 tdPnnJXUT1tzjKpYDcndGK29hn2YlwI6WZ4nllnvdOXmCkbL6KgPKgA2qaSipyfJwh
	 ZBdGL/L+dGuOA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A404B46CF5;
	Wed,  4 Nov 2026 07:21:06 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:20:58 -0500
Subject: [PATCH 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock
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
Message-Id: <20261104-sf19a2890-sysm-v1-1-a4fac07df823@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776865; l=3448;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=UOCQCNAQ/b0HDJGf7xgsq9U+ntDdWggj7SVJU/wSbdg=;
 b=a4M53z8NCt5Fp3VmSoBvIu32pNpnavi3PoxnbOiGH6esw56KeHSPxuOLFGLq9VGYAArtk2Mdd
 48BkaYnbXN6BHsAPUOIvV0hxRF75avMLJem9JDycYO2e34tewEumuej
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

The header is Chuanhong Guo's, from his SF19A2890 branch, without the
count at its end.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/clock/siflower,sf19a2890-clk.yaml     | 57 ++++++++++++++++++++++
 include/dt-bindings/clock/siflower,sf19a2890-clk.h | 27 ++++++++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
new file mode 100644
index 000000000..9b72f14c2
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
diff --git a/include/dt-bindings/clock/siflower,sf19a2890-clk.h b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
new file mode 100644
index 000000000..74b9d67ea
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
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
+#define CLK_MUXDIV_NPU_PE_CLK	20
+
+#endif /* __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H */

-- 
Git-155)



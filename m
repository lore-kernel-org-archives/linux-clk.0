Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866703;
	b=jpG6y3MWu6yD99iTdEHFAgjrTOUfh8i8Jwgqh1goCGUO9CFhbX6fLWPgKisUoZWuKsll
	 VNoaCWbBDjUfkphHnMRK7YsKPju/WsZFeTCXjEsP3bygDez0lIvFEPTpyHUottbrtmxMw
	 mnQoAHV9S1OeqE7Pkv7EcFuzOQDMuJtTYl9lZ2CTJq/ntl+J5Ep4sTiB81NEiFGw/B/Ak
	 cG3oMd8Ws8rMj3y6IVJ86FngXwhAxEuJ8VJu9PJQSmYK9p9u0AJesvXS3Fv81z2Vk3gQ8
	 ffj3VSsGrBoUadXhfXxRRt4Bb/gjc4KrNY0YH17NjQotsIjr/Z63035/KcuxjFVAfFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866703;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=vV+ELwUauXAxcXhKIhZMc4p8HZDtFH4E12EX+/Id8BXCJKXNF3HQcc91VmkF1DuBsmmo
	 fj4Dc/tZQ1eEM9DJnQ1J3IcUFygnP6KFvKP9ban1gR1fd/Ua3yDmZmJBz2UIHaSnRy+RJ
	 OUNGvYwooLzILhOzBTqqbVONrnI3owMctTILfgSYdctniIRbiiiO/PsjC2gGjZzkI01fk
	 hSVqRqInfnE9ox1vk/lZXAI71VNXB0TTKDdWRI7jLrxGKVRaWeNaAjXEEBDhu//+zq/oo
	 8/WB/c6vu93G1fZGByhQoC/fgraWfPT+7UehxWSIDSRfjTJSuMdFttGpIQJbERNR8dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beANewO3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F5606A31C;
	Mon, 16 Nov 2026 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beANewO3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794866703;
	b=0DxHhqG8tgzfzZAqyAtTmsWiSrY0T39GH/58i361qItLClOItKX1MuxzrOewDjAcOYZW
	 0bU4MxEdKBxnXn0kwgB0SMD9v2Bb9ZxwAJ2otDF57e98mWlyjbmrfBKxJDRJaNaSdnKAl
	 8HN5RRdR32QphjE9sZx/xMsWMsvlQA9bBrLAdzK9dnzmL56ZZonoBp3AScGqAgbR6rPQV
	 PvrM42PuKSlA6+t8W1EMd5DYAq4KP31BwVYHKuV0qb7vlScvj2JQx3wmwBWAOgTTvfjSC
	 +nFoGbWbAhvrytUFFVUO7eEkxrTvlLBQgVCrNtaYRpXhRKRN+6XHH7n1NIvyTWVjpMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794866703;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=dsGBJefMDB8clI4bf7Lri57QZse7m7QsPhFRbC1+PGZLEB07GmW3nBH5b7Rv2TqyR/t6
	 bidLof+fSxWm10CoL4krf+K2u+RTTDceUpD16A6zqAyE4xoOLxmu7ryn3nHTiQeNGIkJT
	 PlIHX0qigDIfH/9kQ3tl1Gxts5c6evDVuWuTpk7RFzPME2G1/c2MRzm2/cxNYFGowFHhH
	 1YACgCnfk/a/ag1Xk5qpkPAx5XEkGlN9UJeiZf3KKMfqJAQ54VX6bVZexd5KL//4Sgh01
	 /9lG1n3PTvNUlhwUi2t3xCcM2LXZjK5p0AREkz5/My1tA6Bc7xIJr9xYKaLUqmXpTCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0167E1F000C4;
	Mon, 16 Nov 2026 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866703;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=beANewO3s1pmjb0qOgZ4wUAGh5zA4YucQpCQdowV4m6aaQ0W2n/LDBMNx1bivzJPm
	 YmLdKtvV2qJnvfrYVrCMhK75xsciy6MBrJAdOAxpyh7YoWGUfJ1NquiKMWecOvxQHS
	 xaK8Uy6ggy+ZMJPMD5ccEbxVUUAvQ2Ud9WBzV/soEf5O+i73TpdFUD+oCtj+X1HD2T
	 QxMbd3mn7IQW/GJVKU1rr/dTsMxUq72OCQRjK/oxo3NT9eMvOp2jflgYSyRfR2nSph
	 8Ik4S0zW64jJ71H2Edo6jrgQYUa1P2Cn/yDkfkltZsxqJBc4hGR31zNn3/N05fit7e
	 6yg+p5h664m4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 779EC4A5D5;
	Mon, 16 Nov 2026 22:05:02 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 16 Nov 2026 17:04:47 -0500
Subject: [PATCH v3 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock
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
Message-Id: <20261116-sf19a2890-sysm-v3-1-b07bc7833a87@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866701; l=4233;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=1hE1zhMG0OtBg9FcIR+gI4NTYVaU3Uop5FjyhLMYHqg=;
 b=1hTTtiHEqd2lgae1B60oM1HERoUGbTeh4h7cal186/Wp/vYkP+wKrZjSvz8dO6Lu9BnFyRWmI
 dylTyV1FHpcA5WsYZKWfXmphWpkxQJs9LXwekQxBh+IOWJ6rUCUPl+J
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



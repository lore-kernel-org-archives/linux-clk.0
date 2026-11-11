Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385311;
	b=QACuAfN2tpymOZSEihex6fMMTW24nd949Dg3ERmNPjPxh7xy3VNgKdepfKCJY8atKWcl
	 KrbUsbLpRXfyEdwKb+CJLewey6gwdwilLS932FpwZk5Ijg0u3l/lmRihAFf+/h6QzXB3G
	 mcF+78Sp3eClbtC7fJ2ajHnjZTQje0Oe2k9PHDZP7Z7lBHTqrzt/eLlF9yrnRuTrPM8Ix
	 jYmuYu8VzbQFpHRbn5o8eo7Qbr8OTDDqVbgaa/JXx0BxqOb4fMj/feZqMhp9/Tn0SwsuO
	 c5XsT7mlcZB7cJCkyraF7RxxuIgFY2rxKw/MGiCEKPLbyUZJqoST8NqykLSebliRWxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385311;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fjKk9rjyUF0aVv4e8HueuL4LUBIzY2jI2IszpWAcHQ8=;
	b=WVt6HTeduSfUeOmRoPWyLqyqIdzd/pxlnUX05YDgzYOZmLTWKDRpC7i2ThbICuP21DaX
	 Dezf+KPWWl55MNPB4pi5zGxYDUgP1oWLbkbWIrdQqgvM5af2EptQ4mFamhJ3+SuyP4tY5
	 F70/RIjAqMEtpBLTyxkTkQPzbz4mEVduZl66trNdPSj4XeheypbdQo7FYMW2oM+upFRAF
	 u27FBH8BKFeQjvhQSJkHJIQn16p4FHjWcmkoggUN+rbpIgNd5wSj0y3DSOmKREhjvozUJ
	 HLFVnzu68JE7+5gdJ88nTd6eNsmWbt5v8Y6mZE6YdnguX4Eo3ApUa6xZCwdnF82X0RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDgDCRWx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50927606A321;
	Wed, 11 Nov 2026 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDgDCRWx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385310;
	b=ncTqV6mE3AMUWBDpD/67nfLNJV8NzWAi7I7VvHWD5fXlkf8lM56bmml3Pe2g8r3LizP8
	 xa4YJ8iE+l8s5uboraJ8Cokojq05FFLt/gpyR9EBixCziHGsR5mgCFApCo9D+mIkIoAor
	 Cbo9YM2MebhAds516YV/k++jn/1vIpD/sdWyOKLunYjACG4D/CaEFCGi3TZCbGDR7J+pL
	 9wMpPs+5bc/rSmDpVRqfAPeeNZBcxbCm9RY6KIFw/2nVUe+hEYDrwlNcZc8Hy1pay9Y4Z
	 ELlLEyo0w15FzDho2+4eSXLKVegyT4ScFsVCEv6Ghg4h7z0DWTqhSfpeCK3dokPAC3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385310;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fjKk9rjyUF0aVv4e8HueuL4LUBIzY2jI2IszpWAcHQ8=;
	b=JVoPHIuL7eMYlU25LpT1mt892/YBQCWgllKC636Bi1edH6QTgQSsZY46g6i9YRVM/h7J
	 TY9cKXJLgiHbXzNVP33RKeqrzQW9KTQ4QO+NBSDZu2YIhIP/k7Xoa7UunnU4kJCY2bueV
	 H1TOo7s6fsp1RV1iX8AfxkEKIUjzEk4ERDlz/nKQNBNU5LQ0ll5m6y3TKDEStLgAPPb1E
	 0DIbQjzkXpEB3Xwfal6ON2clhCUTCrFRCZaKbqiFUMaZxwQDK+GQNjIqWHph7lwQ++jNF
	 iZiNzlBYcqwXuAzSusJiu7INIU1lAT33aAd7EszorQ/SXqjEvW4FVJBPfIptNAEX9cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D39C1F00A08;
	Wed, 11 Nov 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385310;
	bh=fjKk9rjyUF0aVv4e8HueuL4LUBIzY2jI2IszpWAcHQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eDgDCRWxJ9hSaQTcR+LtSsg/mxWJeIrhK7M4r0VNAIiWprrIRG5DXvBHKk0/fCPH2
	 yLOhARlhhPKQP71zMHNfUcALNur8sEZkTEQRMthz6+955jhgNicsLAsP5RUXDCSpkn
	 7VCRJSSugvLkF1sXjb3/86B/WZTjHiQPPrCJIwY7TIrBNJy5qFwiLUxs4wIZ9kro9E
	 boJE+H98f1ZtDSfL8dUjMrmdJyZ/E3uYeBI9E3ZVn+i+DX5MgjEo9FeLTjF3SAHmnW
	 9vemUpAkUeJSxHFQ3Y4Alj4cxvWWIqT5nGvxhImTaFUdP8tS/DRowOQBQaNiTqx7za
	 7kYWvrNTceQ5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8533148E5C;
	Wed, 11 Nov 2026 08:21:48 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:19:00 -0500
Subject: [PATCH v2 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock
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
Message-Id: <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev>
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
In-Reply-To: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385307; l=4120;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=7SegKlwW9WQlRjtItUJxbjVoSnEsOCaTcCC7t6eqzUw=;
 b=eUyVWjNa11YVFscgxKW6Wjv1AJ8TOTV3VBeJR+iK2CzTXITnWjg2O2jDfbQF8fys0YfJou0sh
 jST3wNLX9l7CrB8rnSez/yJClK9dnkWkv5u8Z25SxySMIlfH5+wxVp8
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
index 000000000000..a9fc9ecf4520
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
+#define CLK_MUXDIV_NPU_PE_CLK	20
+
+#endif /* __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H */

-- 
Git-155)



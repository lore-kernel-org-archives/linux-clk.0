Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638307;
	b=qp4VjNCB9xuSze0gkoqHNS154YtKl7ZKLLxgbKhKo2em1gZrA6qcPVoaCp5pdfly4oWn
	 klO4rj17YAd7aw+OLwstKobdUyF1aE7iZAoemsqGpzAv8RvzOuvrH5sLK/TbMv7EeTX1l
	 +oT6xD1E70df/87QMX39br3Yj53Wt7H3rH5x3haUz3CONBsBaqjd2Okb/CtyUJzz3gcOx
	 p9NA0VlQHlXextbvCtnxGiCBO1tgswHkaHfbFqHPFOBMTrWAkFEIMTJshDCu0r9ACVupK
	 Oy5u8d21YU/7AjLkSo0y41954f5OdnJkWvGsNRI582Bt3ks8eeqf9MOsKTsMjbBYz4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638307;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=OTrZxN5F6wRfFCqbaprFGNloWcux2wjdwQ7oAadQE8SM+du+k+K1o3aUtOI8rcU877sT
	 MaAoDV4oQi2V2+07T4YUMOIHGU9ZldvbMex5I/Xvbwzlekts5h12A2R2ulZuKhg4bJ8Yu
	 PsclxYdb8mfXN1mV1JaIFB/3YD6euI8ChmjTVJ9cLihX8GIsQMqqJ8Ee2Q4bPPDWOQoDp
	 qPKML1uY+VAFbf8DrSWrcmYf2kW4dqe2nNMjxaZ39r/lBIItO/y1wehSBoW54z0Ie/Ohm
	 iR5UKJEE5/FFd25Gh2osUTGV+Omerw654K/HHanqjpCLIaD9j3JuFj9vDWXErFZZSgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3JCjDeQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE33606A321;
	Wed, 25 Nov 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3JCjDeQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795638307;
	b=S2sDywW5EHbKBrUVXNQHqz7JYv53f6h+zt9XhnWob0vp0f77PSLuLWaNvpdgbc8tdabo
	 1eMZJZl0a3z6gjE0FHZJksdChf5javZfBRgswYmItQWgFCQNRg8SRk2Wnhp6YWP9Hw8um
	 cXF+mz7SZKKRVQeELBMfUkRIKqc5iyss8QwF46n9zqZvno2+2vWHHNoZS8G4X8RdKqnM4
	 knh02aVICqGeG0XyErKDXRvryvLUPhEsTnXRMTflFWpg+MWiRXbqxFcINTYN6xCSNwTHW
	 EcugujkPdQg2udgIFa/WLD6SacuSVtFXWGAv8KROEeIClcL7bMFFN1DMsIJ4iiS3oYA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795638307;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	b=gFncyNstazOqA9LsKD+nxIpt/LXqE+Rs9BhTRw9TXvWbr3P+ULOh8VYZnOpaH3P9ejf3
	 TSzGH4u7fkzZ2ml+3VEy8Q512gXbfczswFfqZQ0TZlf1P6SJMEXo0ZTmWOh79tBY2+2TR
	 6zyDaDhQang4lOwc56y6ZfJqy0VOYGZRMvip+N7AsFqhRGq4Q7y2uMRdQyWGuS+1q26f5
	 61tFsZVTSyJupI5d2e3GfdpcPFflO48+C4nSu686I2/PleF0HPr7xr3VussmfYGk9YFiV
	 u6Pem2Z+RlJLVHVgSKuBPJEwtRw9L8Er1S5P0TyM+OroFxMGYj2D2HLcNFjKMy7gABQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5D6F1F000CA;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795638307;
	bh=kj54KKqus3DpCyZNB5aVCoc87sy3Q+Ne+YOlrdr6juM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H3JCjDeQy8qz57GAn0wZcJ6uigR7MFkPkWkIkOcX6hjhTyCnYQUeKJV/fxWpawnc1
	 dT7cFTDfJqYDp3ASJDCiNXgJSustfPvT9lRGId8jjC4gnNpGzMOv1psVTBoxUx2TnU
	 FFjaIYYsBupMmocB2YV/OnbOwLeTNMAqqPNLZ5hKzPF6G7P+ECE0+hdBYrwZbSZRRd
	 q0EHDYf0hqoRY81Ku+oCUGYwV9KGEXDOLrsDWjjQL0cGZssSqJbQi04kOmqTc8dssd
	 MZ4Tw5nSCeDFA7kI/14JfLqz4+xitZ/sF/Gi3dVAGeyidDELEIndpXu+1yJW2X1P4a
	 k6ic6jc34CCIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 632CC4D025;
	Wed, 25 Nov 2026 20:24:55 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 25 Nov 2026 15:24:49 -0500
Subject: [PATCH v6 2/6] dt-bindings: clock: Add Siflower SF19A2890 clock
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
Message-Id: <20261125-sf19a2890-sysm-v6-2-181875c10682@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795638294; l=4233;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=1hE1zhMG0OtBg9FcIR+gI4NTYVaU3Uop5FjyhLMYHqg=;
 b=mq2jyvl3kdXvY6Ino4A+5nTYpuCoL+gpP4OL02cjWS+0kzuhKPnYRs7OKDhWhDQPToE6RGAZs
 rcNCgj/RCvzCpjwxuAkaom3xp5b7yguURQc/UGK5P92VB5O/7eahxvq
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



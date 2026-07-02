Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CF9230BD5
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024119; cv=none; b=gbBw68ll0zyf1Xa5H/CyJF0reIk6nWXrpkp9vRxN54+nrANyYkz0onREtng4GAne1UeP4KC6kW61GaGEeR/gqLt1G1H6EChwixZ5Jj8qrA/S3HL5IUlKOBxJH5e0qmFsYT77IOxgmNYINtTBJBId7NgxfnYrdRwT/RTh0PoyfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024119; c=relaxed/simple;
	bh=kh99N3ZASfit1Slqc9aNo8AxP+Bs6Pn+/htrYGed7g0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOkNh8ljzD9uyLSxRrME/cinjnJX3z/yZdCBefIBkJf8dC7WVKUQXeQPwKr7eO8+OX0/H1QmPCwPdKC3s7Un4Q7kMNdnsSx9q4ZJjJpTIUkwTGcP0CAD2vawZCLJY4dPGU5pyRLAQPwo1Hi3+ss0Hysvo59vk/pKtfS4vNRj480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUELsqHS; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUELsqHS"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c54e205aso8786755e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024116; x=1783628916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0JDDV6Q39+7/wpdWHr3nJow0Ls3mDNcHtuzy023QQw=;
        b=XUELsqHSrFQi5N/74BkoS9RcUWSpQnkYULWjUDfkSP5b0Txubqdiri3v3OT6EaSrRP
         U7tyCUzc0VlZhzLMM9rstDeObWCZw308stTghr4eFv7L3J1RLzctoM6PBHBZIiUtC5mB
         3gQr84Js7Pqc8vV6w2ClJEnFicKdVO/1nAcSM6bbx4+DO333NiAT9a4PoHTYNKgo6RcG
         4LYCK0rYwNFUYiVM7boPkWx4ljKTi8qJsM7ssr+w8ezDkytoevKHhuwsBx/V3tDurJtE
         0Y9BxS4a5xvZwD1fR+TyPshERheXypQThxo01qPajxWAQMICuAaRHwnoRvAGaH3OUnMc
         VLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024116; x=1783628916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0JDDV6Q39+7/wpdWHr3nJow0Ls3mDNcHtuzy023QQw=;
        b=lo8IVtfRZgw5++TF9PfJ6+FytbZsq+O9lDHWKb7gSjdfxvhBCITLyTBwwqxvujBXgb
         Jp7fb2A0dMsLKqOFciLHHNaKTAB7jYCB0sY/nbuUsllaKxG78GPyFzogmBTg2nH0wcXJ
         V2wZZ/BJ1Q1fRiT5e5BmXcItKaCbMEjJVUsEjFkIP3Jlf/kAP14+yskNzYrvUS9dBJ0B
         b9ol4TQXh5Y2SoQ+N4vDsRhkl+HSVv7sCDSTzabmU/nx2ZtJVmhPmcNC6Gyj4yNkYVs6
         LsqiZBhxPm83J9vA7X6FTt3OFIkb53yy39K3QHmdOWpSzPJzITh+R9yZOp/JN7vbL3Z9
         2IgA==
X-Gm-Message-State: AOJu0Yyc2A/S92uev2g4bofriu5q/W0sq0KuPo8hQv8STlf5bCKTSLtV
	jnSnNVDjPh6YvQHokMJFkc7DfYtzz5IubVNR1o8sKyQrDdpSb7WLy6QL
X-Gm-Gg: AfdE7ckbpFKDErj6Vp7e2jYmoo5S7NmkxS1h/2H2kY1H6db/sobS+EtfNXgk4AIDrdA
	P3ntT2nsu6/D2/6ErkfK4F/0IgdEy1TbX9wvmATIOQ3pHuDMLslpS2GV1iBGkdlnfCPbGLA0tq2
	NuTSoYJhWR/jhdQpmW1bKtAZ8euHqN7cUKfxpDEXcZRZINngV0KonPni8jh3Ay7faYn1rjYM8Lr
	L8/uNcxFuCAN+YwXJOJI6OUttYh5CpxfkEQNeImNU4OatKg8nyZ9qotTJWgdiSjPGncKEY4Lrm5
	ZYLhF+MC5j9KPfupP3lc1yDzuy8JMWOS6+GTGrizqWsfGBkYs6DOhpwDCHn8884DWzWHlbeTx++
	zZCA5aNw2R1wtkqJkzwdqrIGk1ej5KZSZUUxML5dn8TTpFzJfsZ7Zh58yS2xkZWBSU169LYiLXB
	fM6Ha7xJsaVl0WqviOP61YA3I=
X-Received: by 2002:a05:600d:8654:10b0:493:bdcb:9292 with SMTP id 5b1f17b1804b1-493c3cd48f9mr76957195e9.6.1783024116488;
        Thu, 02 Jul 2026 13:28:36 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:35 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:27:57 +0300
Subject: [PATCH v6 02/12] dt-bindings: soc: zte: Add zx297520v3 matrix
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-2-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10954;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=kh99N3ZASfit1Slqc9aNo8AxP+Bs6Pn+/htrYGed7g0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpRIiAuS/945qJ83DiWC+hVNDhK1cJXdT4/
 f/GjdNjntyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL4qQ//ViGYoYfanPdKHG5SN4WAiesNjxNZr6Y
 2KmbwfM/+GatztuATVhbGCvqRleLq4J6Bv+Hy3PXGX2rjsuz88WdUN8jM/90/uFtM2XBXBfDVUX
 Usf6a8C0LamFKVYUrhh9z4H/ZOpOYVQ/cBx+fo1CDYkQdq6zAJgY9qgXXDeD7vqPx/NudOuCMSk
 o6ecp+y7ETVJgNV7papPra1XyKDxIWpRAVYYW1REua8vYvZCHwnDiCzmWczKEAmwlno43tGPwUD
 qgY7NKCNIx29dpeIMvMxiHQfFc32OgE2ZT/UsYyo2eax1DZd5tO73YSWJjBKF1Xdu+YDl9Wc139
 YWe2gqnL4/C5x4i9V1v+gDQTSfa+cc7l43zYlXFmK9yzTKhBQSQ86b0xOHS2A7Afo4wdCoZFgD4
 KpzRksTZOR8kTMGyFp0NbKjfS0eJWMRJWyD8vNIRpaHgMoO1Fetyx2rNRn0fjE3740RFz4yZoy9
 tINkTfdNb/TOa4itJkWKn6AB5ZYMsjrMyrwK/tQzrLp3qDVvJ7nrUV0/oFCThSuw29r2m8Dvn4M
 AjbeiDKYy+18X7MOd05gi4olFpO6GM2/NCViDZYhhAVG9rmTUBqJJrk5t9go5O0N3TWwd4U0QPn
 VxAxQzvB4xLXVG96+sCWsw1hksU9Z3frCeCXhSO85Wy5tHlevgGw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob.

A simple MFD driver will instantiate independent clock, reset and hwlock
drivers.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes
v5->v6:
Add syscon compatible - Conor suggested this after v4 and I forgot it in v5.

v4->v5:
Move binding to soc/zte
Remove topclk from the example
Add #hwlock-cells for hw spinlock registers
Add more clocks I stumbled into: sram0 and another LTE related device

v3->v4:
Split matrixclk into its own controller again because syscon/regmap
deals poorly with device nodes that have more than one memory region. As
a consequence I am passing all PLL outputs generated on Topclk down to
Matrixclk.
---
 .../bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml | 178 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 +++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  10 ++
 3 files changed, 225 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..90224ee35703
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/zte/zte,zx297520v3-matrixcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC matrix clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains clock and reset controls for high speed devices on
+  the zx297520v3 board: The CPU, RAM, SDIO and Ethernet clocks and resets are
+  found here. This controller requires PLL-generated clocks from Topcrm as well
+  as the fixed 26 MHz and 32 KHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. Resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-matrixcrm
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+      - description: Main PLL output from topcrm (usually 624 MHz)
+      - description: Main PLL subdivision factor 2
+      - description: Main PLL subdivision factor 3
+      - description: Main PLL subdivision factor 4
+      - description: Main PLL subdivision factor 5
+      - description: Main PLL subdivision factor 6
+      - description: Main PLL subdivision factor 8
+      - description: Main PLL subdivision factor 12
+      - description: Main PLL subdivision factor 16
+      - description: Main PLL subdivision factor 26
+      - description: Upll output from topcrm (Usually 480 MHz)
+      - description: Upll subdivision factor 2
+      - description: Upll subdivision factor 3
+      - description: Upll subdivision factor 4
+      - description: Upll subdivision factor 5
+      - description: Upll subdivision factor 6
+      - description: Upll subdivision factor 8
+      - description: Upll subdivision factor 12
+      - description: Upll subdivision factor 16
+      - description: Dpll output from topcrm (usually 492.88 MHz)
+      - description: Dpll subdivision factor 2
+      - description: Dpll subdivision factor 3
+      - description: Dpll subdivision factor 4
+      - description: Dpll subdivision factor 5
+      - description: Dpll subdivision factor 6
+      - description: Dpll subdivision factor 8
+      - description: Dpll subdivision factor 12
+      - description: Dpll subdivision factor 16
+      - description: Gpll output from topcrm (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: Gpll subdivision factor 3
+      - description: Gpll subdivision factor 4
+      - description: Gpll subdivision factor 5
+      - description: Gpll subdivision factor 6
+      - description: Gpll subdivision factor 8
+      - description: Gpll subdivision factor 12
+      - description: Gpll subdivision factor 16
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: mpll
+      - const: mpll_d2
+      - const: mpll_d3
+      - const: mpll_d4
+      - const: mpll_d5
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: mpll_d16
+      - const: mpll_d26
+      - const: upll
+      - const: upll_d2
+      - const: upll_d3
+      - const: upll_d4
+      - const: upll_d5
+      - const: upll_d6
+      - const: upll_d8
+      - const: upll_d12
+      - const: upll_d16
+      - const: dpll
+      - const: dpll_d2
+      - const: dpll_d3
+      - const: dpll_d4
+      - const: dpll_d5
+      - const: dpll_d6
+      - const: dpll_d8
+      - const: dpll_d12
+      - const: dpll_d16
+      - const: gpll
+      - const: gpll_d2
+      - const: gpll_d3
+      - const: gpll_d4
+      - const: gpll_d5
+      - const: gpll_d6
+      - const: gpll_d8
+      - const: gpll_d12
+      - const: gpll_d16
+
+  "#clock-cells":
+    const: 1
+
+  "#hwlock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - "#hwlock-cells"
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixcrm", "syscon";
+        reg = <0x01306000 0x400>;
+        clocks = <&osc26m>, <&osc32k>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D2>,
+                 <&topcrm ZX297520V3_MPLL_D3>, <&topcrm ZX297520V3_MPLL_D4>,
+                 <&topcrm ZX297520V3_MPLL_D5>, <&topcrm ZX297520V3_MPLL_D6>,
+                 <&topcrm ZX297520V3_MPLL_D8>, <&topcrm ZX297520V3_MPLL_D12>,
+                 <&topcrm ZX297520V3_MPLL_D16>, <&topcrm ZX297520V3_MPLL_D26>,
+                 <&topcrm ZX297520V3_UPLL>, <&topcrm ZX297520V3_UPLL_D2>,
+                 <&topcrm ZX297520V3_UPLL_D3>, <&topcrm ZX297520V3_UPLL_D4>,
+                 <&topcrm ZX297520V3_UPLL_D5>, <&topcrm ZX297520V3_UPLL_D6>,
+                 <&topcrm ZX297520V3_UPLL_D8>, <&topcrm ZX297520V3_UPLL_D12>,
+                 <&topcrm ZX297520V3_UPLL_D16>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_DPLL_D2>,
+                 <&topcrm ZX297520V3_DPLL_D3>, <&topcrm ZX297520V3_DPLL_D4>,
+                 <&topcrm ZX297520V3_DPLL_D5>, <&topcrm ZX297520V3_DPLL_D6>,
+                 <&topcrm ZX297520V3_DPLL_D8>, <&topcrm ZX297520V3_DPLL_D12>,
+                 <&topcrm ZX297520V3_DPLL_D16>,
+                 <&topcrm ZX297520V3_GPLL>, <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GPLL_D3>, <&topcrm ZX297520V3_GPLL_D4>,
+                 <&topcrm ZX297520V3_GPLL_D5>, <&topcrm ZX297520V3_GPLL_D6>,
+                 <&topcrm ZX297520V3_GPLL_D8>, <&topcrm ZX297520V3_GPLL_D12>,
+                 <&topcrm ZX297520V3_GPLL_D16>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
+                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d3",
+                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4",
+                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll_d16",
+                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
+                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index de1c08b6a5a9..8a6aa456a708 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -94,4 +94,41 @@
 #define ZX297520V3_HSIC_WCLK			86
 #define ZX297520V3_HSIC_PCLK			87
 
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_EDCP_WCLK			4
+#define ZX297520V3_EDCP_PCLK			5
+#define ZX297520V3_SD0_WCLK			6
+#define ZX297520V3_SD0_PCLK			7
+#define ZX297520V3_SD0_CDET			8
+#define ZX297520V3_SD1_WCLK			9
+#define ZX297520V3_SD1_PCLK			10
+#define ZX297520V3_SD1_CDET			11
+#define ZX297520V3_NAND_WCLK			12
+#define ZX297520V3_NAND_PCLK			13
+#define ZX297520V3_DMA_PCLK			14
+#define ZX297520V3_MBOX_PCLK			15
+#define ZX297520V3_PDCFG_WCLK			16
+#define ZX297520V3_PDCFG_PCLK			17
+#define ZX297520V3_SSC_WCLK			18
+#define ZX297520V3_SSC_PCLK			19
+#define ZX297520V3_GMAC_WCLK			20
+#define ZX297520V3_GMAC_PCLK			21
+#define ZX297520V3_GMAC_AHB			22
+#define ZX297520V3_VOU_WCLK			23
+#define ZX297520V3_VOU_PCLK			24
+#define ZX297520V3_LSP_MPLL_D5_WCLK		25
+#define ZX297520V3_LSP_MPLL_D4_WCLK		26
+#define ZX297520V3_LSP_MPLL_D6_WCLK		27
+#define ZX297520V3_LSP_MPLL_D8_WCLK		28
+#define ZX297520V3_LSP_MPLL_D12_WCLK		29
+#define ZX297520V3_LSP_OSC26M_WCLK		30
+#define ZX297520V3_LSP_OSC32K_WCLK		31
+#define ZX297520V3_LSP_PCLK			32
+#define ZX297520V3_LSP_TDM_WCLK			33
+#define ZX297520V3_LSP_DPLL_D4_WCLK		34
+#define ZX297520V3_SRAM0_PCLK			35
+#define ZX297520V3_GSM_CFG_PCLK			36
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 43db72bb59de..81ffc8bc34c5 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -29,4 +29,14 @@
 #define ZX297520V3_HSIC_PHY_RESET		20
 #define ZX297520V3_HSIC_RESET			21
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_EDCP_RESET			1
+#define ZX297520V3_SD0_RESET			2
+#define ZX297520V3_SD1_RESET			3
+#define ZX297520V3_NAND_RESET			4
+#define ZX297520V3_PDCFG_RESET			5
+#define ZX297520V3_SSC_RESET			6
+#define ZX297520V3_GMAC_RESET			7
+#define ZX297520V3_VOU_RESET			8
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02E3A7F69
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024123; cv=none; b=ExfIKfWJ5vrPl+8DSTwgQAF5PE/v+QGccJaJifq8sBbZ2NVkmwSOQ8XrDffQ1nQZTnSnGxgTZNNp4RQDy1aa1wuEymYgbbLksdYNMFXMFeKUzIc6tQyBR/8hlDqDvD+uf+gZFZVifTI4abwujjldrJKl27PwRNYvpaYqraKv9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024123; c=relaxed/simple;
	bh=YwAaviAiI99N0nPb5b1YtMmeFZuTEPdjFOmGt4hXrNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpKsSmM/vOQIwXcmIySbc9L+atOeihVSAml1Nqk4naa4mTEqCo0FAzIBfC6ZjOuI7VVfRirYUOCls0Djji6tg6amRUyOh0WuBf9Gvf1oPkPy4+i0qbtai+vrpn1gWTYq8xalWMYzzKXYoIEo2HWKSH33OvSHc2JFEPKp78n1gZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFCuAOP0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFCuAOP0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so8347895e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024120; x=1783628920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8/d2fA+B3hujBNrRgW3Ki1+UBYpRhJxFw6zSzFTsN8=;
        b=JFCuAOP04plhD8nmJ8748ty+gt4+1tWbGCEUnO/arDZnorHzqp6kmBvHLfjfPj+/DP
         KsUC41gJO42es808c8bQnFbCdSJuAN9CITLwhksgM70gwxvE9fBIocbwSHkIevVU1+fm
         ZLEi8pxGenV+nhOJUhF9NTZtf7RFZTxR672UYFwQ8SAX+JvtgJwmC39cxwpKq4X0LQtn
         dnDkX7H7S+FJT/RSliZqj+0ss1lRvmWyBGY9qEqIOXIeqLtcGZ3FoCWkphYHIVxLQ5xO
         iM28vZ9fbW/FvMlrgoI1V2rC76l676ZaxvP+B3otQvN8Go3Ho5H7oQr16B/8cvsmJmBF
         +zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024120; x=1783628920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c8/d2fA+B3hujBNrRgW3Ki1+UBYpRhJxFw6zSzFTsN8=;
        b=Eh5Ws2/oI0hKj7xaJP1zoGwETcKqDPF5SXahCLZyqCzmyJpwoL4NYiAv9X46S43wkv
         hOrMs0GXhcJ+Z8j05k6UftTtmfCsabObREcqv7pG+B+VP2UGCmcsXCz3HeuGOhogH9Jh
         6B+xd154V0wduLjAycnOm78gKjs4G4IFljnFPoxwIV9Iw5MK+XU6mWnT+dY0PeNRIrYI
         pZ3RG7OVwON7TtbCRi1qV+QrWjFDYKS6XZtafg3K6888ugMQa5bIrpqayo5koQxtyrmd
         +lteJ72k5DU85SyQlsE3EgVdeOgMTXmySaJ+gYhnHQcbZw3BjosVxPfzwVzbAVJ4+jEu
         s6VQ==
X-Gm-Message-State: AOJu0Yzay/EKJM8L268+qygrvwYR8rV/S9d7pFxTeYq7Z2b7b4Rycd86
	OQGb66UV9mj61a/SdbZqdSQQt5BpfAlHOQnyCtOvBiZAGlcZYQ2aonyL
X-Gm-Gg: AfdE7ckqmxcG68QEs3Lz3VyeQJmufrfAHF6BweqqAbwl5JQF6XEmRdmD3jMWNHJXo6t
	cHY/bedd/t9fO74kC+HvRFvVICNKpVhnSR31aIi/qW0pZD0vwKntCU0Fd09DZwwI1FvXyCGRs0w
	h+jQD8MgY7ZRSK44KokKnSwWihKxVOxWJyWtEgYN+eSi8GoUFp+t04UCmDqKFpUe096Y5lLSOfX
	Yj9A78yBGJFXnO+g4C7AX/SJebXkSNkighmBTd58VPRuTb/PMsU6DlZMQ3EvT/yZRrf2gKrafBI
	/yo64VW94YJoemT+AzaFmV2SPhbbSFg5SS2D9v/RvnA7+DfCqR82Bd40D5caBKBmhBZVuUfv8GI
	ujoK/IGGlJak1Ers14/TyfFmseq3caGAGwSxxQcBraqoMEfh/u6GIfiOLqteo6cFn1AzwxlTcFs
	cdR1HLkSYy6zuKTpfuY64SGFc=
X-Received: by 2002:a05:600c:c4a6:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-493c9b580dbmr19969635e9.11.1783024119818;
        Thu, 02 Jul 2026 13:28:39 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:39 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:27:58 +0300
Subject: [PATCH v6 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-3-377b704f80c4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8046;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=YwAaviAiI99N0nPb5b1YtMmeFZuTEPdjFOmGt4hXrNA=;
 b=kA0DAAgBPRO8yFRPGiIByyZiAGpGyemjKJ0TdBb+3x2hIZju3zqwcSIT/9lq7TkMWvalhsnzm
 4kCTwQAAQgAORYhBEMW9LaqBVsnlTJdbD0TvMhUTxoiBQJqRsnpGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMgAKCRA9E7zIVE8aIiSgEACkQUy7qbNtb/9S2T4zd17Qssa+tU0RAq9RaU/SCxj
 KAgYJKw043u433e7ml1pWakzdkZ31a9Hl2r/Cb9JyK3LlGwlNXhdSNo7NoeHxHRAKmWh807F3nL
 BFd1gLwQJV0ED2O3MoAsel77XFwjo5Od9S+MC18Ak2cPP5Yxl8rrWQQGVBqmFvkQvXjU8M2Ha6U
 45eR0JwIECd72oj0YTwX8E6Q2mowoh1xh4D4fD4qaNYtat5tbBedOLDeMFZOdusAhRBSRxCS0/f
 N47g+gZb54LXaCw1olpdvIEJrvkZxAzOt5k6rGTwUc9f1uDrLNrZAlazRxlJZzTpL+BHGPZQ3mB
 +SMLhgE9G9RgsUIk9dSc2sVguEBb6ROWG/BGJsau2KRdHGahHuHh2WojxtNnuJeRHyvJtuQMjZe
 zN7V1TkqvlOfU03NAvO47ddlpSObK0Z2OuDNnrF2VuZAm8spzYt2sGYVWbZG6IrnNXWcexSLfF2
 dd3cjIQLCuGbXWT3rxNnVIrtGECaxzI/CBf8D87UqKlt6bjiFcP5xHcR5HlQKxjdoUwwJY8ej8o
 qo0rPzNtoSAGn9GOHt5GHIUIuS4d42sUbebmgMkblTLeJawEGNN70UlmNp4Gul6L+7uou8G8D9d
 tLXs5AnSY1D7q4axXElJv3xNwPAmzwFydfE+3s+S+xg==
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are however a few more registers that are
likely extra dividers for TDM and I2S devices

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 37 +++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 19 +++++
 4 files changed, 153 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..c510129068de
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The controller is responsible for bringing the devices out of reset
+  and enabling their clocks as needed.
+
+  The controller receives its clock signal from the matrix controller and need
+  to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. Resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixcrm (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixcrm (156 MHz)
+      - description: Main PLL divided by 6 output from matrixcrm (104 MHz)
+      - description: Main PLL divided by 8 output from matrixcrm (78 MHz)
+      - description: Main PLL divided by 12 output from matrixcrm (52 MHz)
+      - description: Main oscillator output from matrixcrm (26 MHz)
+      - description: Timer oscillator output from matrixcrm (32 KHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll_d5
+      - const: mpll_d4
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm_wclk
+      - const: dpll_d4
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
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspcrm";
+        reg = <0x01400000 0x100>;
+        clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_PCLK>,
+                 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1cf28dff5d..ceedfa359d47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 8a6aa456a708..3c390211f897 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -131,4 +131,41 @@
 #define ZX297520V3_SRAM0_PCLK			35
 #define ZX297520V3_GSM_CFG_PCLK			36
 
+#define ZX297520V3_TIMER_L1_WCLK		1
+#define ZX297520V3_TIMER_L1_PCLK		2
+#define ZX297520V3_WDT_L2_WCLK			3
+#define ZX297520V3_WDT_L2_PCLK			4
+#define ZX297520V3_WDT_L3_WCLK			5
+#define ZX297520V3_WDT_L3_PCLK			6
+#define ZX297520V3_PWM_WCLK			7
+#define ZX297520V3_PWM_PCLK			8
+#define ZX297520V3_I2S0_WCLK			9
+#define ZX297520V3_I2S0_PCLK			10
+#define ZX297520V3_I2S1_WCLK			11
+#define ZX297520V3_I2S1_PCLK			12
+#define ZX297520V3_QSPI_WCLK			13
+#define ZX297520V3_QSPI_PCLK			14
+#define ZX297520V3_UART1_WCLK			15
+#define ZX297520V3_UART1_PCLK			16
+#define ZX297520V3_I2C1_WCLK			17
+#define ZX297520V3_I2C1_PCLK			18
+#define ZX297520V3_SPI0_WCLK			19
+#define ZX297520V3_SPI0_PCLK			20
+#define ZX297520V3_TIMER_LB_WCLK		21
+#define ZX297520V3_TIMER_LB_PCLK		22
+#define ZX297520V3_TIMER_LC_WCLK		23
+#define ZX297520V3_TIMER_LC_PCLK		24
+#define ZX297520V3_UART2_WCLK			25
+#define ZX297520V3_UART2_PCLK			26
+#define ZX297520V3_WDT_LE_WCLK			27
+#define ZX297520V3_WDT_LE_PCLK			28
+#define ZX297520V3_TIMER_LF_WCLK		29
+#define ZX297520V3_TIMER_LF_PCLK		30
+#define ZX297520V3_SPI1_WCLK			31
+#define ZX297520V3_SPI1_PCLK			32
+#define ZX297520V3_TIMER_L11_WCLK		33
+#define ZX297520V3_TIMER_L11_PCLK		34
+#define ZX297520V3_TDM_WCLK			35
+#define ZX297520V3_TDM_PCLK			36
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 81ffc8bc34c5..85a2f0707cdc 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -39,4 +39,23 @@
 #define ZX297520V3_GMAC_RESET			7
 #define ZX297520V3_VOU_RESET			8
 
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_PWM_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C1_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0


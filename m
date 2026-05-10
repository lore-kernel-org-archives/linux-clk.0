Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835EC346A07
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449820; cv=none; b=JkzwISeHzOO/5jWOMaFwFfeW+bIx+fc11F9TjJmLZk+PfGEVk3D+r4s4OlAufE3GXtgIe9GWTEJDMsZJvMrBJghcRiQVaKHtSpS5ik9ZXKpfr2Ic13MkIcEv7ZCDUHmf7ICHeoY/m/j7xLKxX4PIWVyTJFPeiYYkddXwbNk36co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449820; c=relaxed/simple;
	bh=9PBytlOdxzrPJbIqiajYqPTsWWSCL3zrgDIhFWyyBXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDUZCEjtMSYsY370dhbmTcAbEG+WvYt+0C8DRhVtlzmYI6KcnxTDELLY6X1ThGJ9TDgHeqb/WuVzk7ZEdeBlB4GWY9ryX94tk2LZcfF96hBXvjzR6OzKgYVY76iZZNZTusXaZsRQArTk3v59ObjDLn4E0X9pSF2b+vqeaXQKC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6Eysp8Z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6Eysp8Z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso34598135e9.2
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449817; x=1779054617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=;
        b=b6Eysp8Zlqnc14kHWrb7q9LzEY/9gGu6Hwe078H+kh/BhT9Dfl0zsXg2/PwjKXD85h
         BePbVq97OgQcQxhXas7guA7XUsQxJqVnxseCvqrVG04j4n+Yuxr0QPZ/H/4aa6b7/NR3
         oSjSdwaATgcPiG3uxJi9tGw/PeLASHLib5qDY4yIE6H62UH4Oy3RP05OXNgN3b7R50Li
         rx7Ko/6ikq2rEleFmH0UYJtoTT/HS/YViaahoEsp8Q8cudPD0QylNXHN62QvGL8Hxh+1
         NyzMfu3/TeBUUMeFAm/e2kWVADboeJZR+eU64ojvZ/rFBxqMuBB/SLu3UAHqWGR1AfwZ
         1JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449817; x=1779054617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=;
        b=A1Ewi+WgvZQLeAiIT7icZ4qrZQkvx1DqpK9dyYKuQzfRFhHKxyT39Ls9fKA3Ri5e8w
         Flsyi2cevch1zjVuyGcnckjl6G3bsKLpImYuUHjgoX3l1k64LdGRdi8/nVF/c2/3/Uwo
         L6dV1qqV4C67tMfssuFJY6BvdentoZko/E7fDVBN+yLdVRRTfM2PDdgjuXCBgjjQNu1d
         B9s/1Bu3LD82DKI8Vt8uWDBNrFiRh5ZrhE+vzW5gLzyyWwJejc+GOr/KUp02Bq+i8GVL
         LIL0xAsONI4SjWyavpaKlcbfbwbYWcaPOzkJcZBtXLmXD5J1MKr1k7eNNrrRvanp2nqn
         aFug==
X-Gm-Message-State: AOJu0YzsDQhxRvAD/p6vBTcf0f4Vle+UbfD6G5e2jNCAK3q8UHjJIBks
	otdDS+z/wnQKSb+QrcPIcoLg4zBjG1eB11z8AuItX6AsLpymtYHqnoJ0
X-Gm-Gg: Acq92OFYKY9nmXR5SruyjeYvIOtdasxcDQurmrjU58ED5F1ZAk1P99hFoZ9brfU2lAv
	5akfiv5popz3STvjnPPYFcnVB4UgZrPI7jHyOp2bDa9JoQCVRHCp9MubNv277JXgK+9Bm4Z5Dpw
	TYSxgWXZefIEX0uXWLYXUNrK2mYGJXKYAmrfkscOOvUuS61YchX8IfrKzFUFKFvKTXx0VFm9Vv6
	VK/vgqqhoNsWEBtL+rrAwWH7cFjAHoIHdNF7pjK9PklCrX2ZzYEiDCAJQFdX2OPg9sCxaIny1yI
	bDLEeoN/QzCQMtYD68mXTIIzZmxkBhSFJs7olxjS2W2j/pUYcngkzPBBgPVHutVvuCFxH82R3Q9
	6XVDHTWW5eR79dgqvdIJLOgEF4p576d+R4eqJcXq6hCUMH7e45H2A5xlyABVOChU3NFERTs3Zly
	x6TGZRHQzWMP+Kemy1/kXSr59XNV5BU/Y=
X-Received: by 2002:a05:600c:34c8:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48e51f2f85emr378011005e9.13.1778449816804;
        Sun, 10 May 2026 14:50:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19207317f8f.1.2026.05.10.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:50:16 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:49:50 +0300
Subject: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock and
 reset bindings.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-zx29clk-v2-1-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
In-Reply-To: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15475;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=9PBytlOdxzrPJbIqiajYqPTsWWSCL3zrgDIhFWyyBXI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqAP2S9B1LIt1KJ+HwCrHRa4BXsdn2/rsql1chF
 y0MwBxwOTGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagD9khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJbWg/+LH69aRYgH2rn9Aju+c6tIuEzqDkIKxg
 Iz5jnJJOSnwnqUqK/eOvynD9if2mKdx/7fa2xehwrX1R4IB6g6inytBW+lCx4gHv0xfNBDnSxdg
 JKPCEs4F7ymPvlF/Xb8ezk4LCPnOQVV9vGBuDXe/I4/7TofH/rOCGLpZz8AK2nQ9Z/8ua9TSZ0a
 trd7cqDSi9U6713P02rrDJPNBuWSSfxJXege5ZOVyNE6RUhv9zyTbO18D42veuSv97ULTfYFYka
 EqlhDA+fJdm4VtXf87XxWPZ8rqjMP3X4xEK96ewJqSdteJ8lzGCqGoJD6lh/x8MJM/fMeqjmaHY
 ADptBfcNKErWfud8rqYzbFsvU3f2b4Q5GCXtI5vr2SP44uIEUoMnndiBJlNlfLTVx3JEIKrtweP
 B5zX5DXjomWdh9AnJBk7qxi72KRAWlY373iJS7w/2L9eWEOdOSECc4LPjAv8jhCOsV6u+gbMFfm
 STsQQCmryAFiGqzy4o9GeMhb98iXHPsz1X9KEbILm2ldlghsLMHjqIPpm094O2nlZH2f2+kU78V
 SMF3aAoc7YDqaI1zxPRBjUB6rdOqcNX5F4EHrmd3OoN+btMB95qEyJXhwceYNu7I7+Lq1KJGyej
 NoYqTahSqlMRU/fEMklZyMvNiHoWuDiagvgU3i5s09KSJUDHCCAs=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

These SoCs have 3 clock and reset controllers. The "top" controller -
all names follow ZTE's naming - controls core devices like the AHB bus,
most timers and the Cortex M0 that brings up the board. The register
layout is fairly chaotic. Some patterns can be found, but nothing that
holds true for all devices it controls.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted) and one mux. Some devices,
like the GPIO controller, only have reset bits and no clocks.

The top clock controller is fed by a 26mhz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel does not manipulate the
PLLs at all and relies on BROM and the boot loader to set them up. The
bitfields in the control registers are somewhat documented in a
Lauterback TRACE32 debug file in the kernel sources though. At the
moment, my driver extracts clock rates from the PLLs, but cannot change
them. A proper PLL clk is on my TODO list before I remove the [RFC] tag
from the submission. It will be necessary for the LTE hardware with
replacement boot loaders because BROM does not set up the LTE-related
PLL.

The "matrix" controller controls the main Cortex A53 CPU, the LTE ZSP,
SDIO and a few others. It is even more chaotic than the "top"
controller.

The "LSP" controller - I suspect it stands for "low speed peripherals" -
is very regular. One 32 bit register for 2 clock gates, two resets, one
mux (1-3 bit) and in some cases a 4 bit divider.

Not all clocks will have an explicit user in the end. I am defining a
lot of them simply to shut them off. The boot loader sets up a few of
the proprietary timers, which will send regular IRQs (although the
kernel of course doesn't need to listen to them). I don't plan to add a
driver for the proprietary timer as I see no use for them - the ARM arch
timer works just fine. I will add a driver for the very similar
proprietary watchdog though.

The top and matrix list is not exhaustive. There are other bits
that are enabled, but I couldn't deduce what they are controlling by
trial and error. Some of them seem to do nothing. Others cause an
instant hang of the board when disabled. I isolated a few (SRAM PCLK,
arm arch timer clock) where I don't see a reason to manipulate them. It
is quite likely that a handful more clocks will be added in the future,
but not a large number.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../bindings/clock/zte,zx297520v3-clk.yaml         | 173 ++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 179 +++++++++++++++++++++
 2 files changed, 352 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml
new file mode 100644
index 000000000000..3b7084a18a97
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-clk.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3's clock controller consists of 3 controllers, which generate
+  clocks for internal SoC devices. In addition to clocks it also has reset
+  controls for most, but not all, devices.
+
+  While there is a certain hierarchy among the controllers ("top" controlls core
+  parts like the boot-up Cortex M0, "matrix" controls the main CPU and LTE DSP,
+  "lsp" controls peripherals"), in practise all 3 are required to reasonably
+  operate the SoC.
+
+  The top controller has two inputs: a 26 MHz and a 32 KHz external oscillator.
+  They need to be provided as input clocks. The matrix controller controlls 10
+  clock lines that get fed into the LSP controller. The LSP device node needs
+  to list these input clocks.
+
+  The matrix controller consumes clocks generated by PLLs in the top
+  controller, but there are no controls in the top controller to sever this
+  link. The interface between these controllers is not expressed in the device
+  tree, but the matrix controller cannot work without the clock handles
+  registered by the top controller.
+
+  All available clocks are defined as preprocessor macros in
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    enum:
+      - zte,zx297520v3-topclk
+      - zte,zx297520v3-matrixclk
+      - zte,zx297520v3-lspclk
+
+  clocks:
+    minItems: 2
+    maxItems: 10
+
+  clock-names:
+    minItems: 2
+    maxItems: 10
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx297520v3-topclk
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: External reference clock (32 KHz)
+        clock-names:
+          items:
+            - const: osc26m
+            - const: osc32k
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: zte,zx297520v3-lspclk
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main PLL divided by 5 output from matrixclk (124.8 MHz)
+            - description: Main PLL divided by 4 output from matrixclk (156 MHz)
+            - description: Main PLL divided by 6 output from matrixclk (104 MHz)
+            - description: Main PLL divided by 8 output from matrixclk (78 MHz)
+            - description: Main PLL divided by 12 output from matrixclk (52 MHz)
+            - description: Main oscillator output from matrixclk (26 MHz)
+            - description: Timer oscillator output from matrixclk (32 KHz)
+            - description: LSP pclk output from matrixclk (26 MHz)
+            - description: TDM wclk mux output from matrixclk
+            - description: DPLL divided by 4 output from matrixclk (122.88 MHz)
+        clock-names:
+          items:
+            - const: mpll_d5
+            - const: mpll_d4
+            - const: mpll_d6
+            - const: mpll_d8
+            - const: mpll_d12
+            - const: osc26m
+            - const: osc32k
+            - const: pclk
+            - const: tdm_wclk
+            - const: dpll_d4
+      required:
+        - clocks
+        - clock-names
+
+additionalProperties: false
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - '#reset-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    osc26m: osc26m {
+      compatible = "fixed-clock";
+      clock-output-names = "osc26m";
+      #clock-cells = <0>;
+    };
+
+    osc32k: osc32k {
+      compatible = "fixed-clock";
+      clock-output-names = "osc32k";
+      #clock-cells = <0>;
+    };
+
+    topclk: topclk@13b000 {
+        compatible = "zte,zx297520v3-topclk";
+        reg = <0x0013b000 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+    };
+
+    matrixclk: matrixclk@1306000 {
+        compatible = "zte,zx297520v3-matrixclk";
+        reg = <0x01306000 0x400>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    lspclk: lspclk@1400000 {
+        compatible = "zte,zx297520v3-lspclk";
+        reg = <0x01400000 0x100>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        clocks = <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_PCLK>,
+                 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..322b53be8b12
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_AHB_WCLK			0
+#define ZX297520V3_AHB_PCLK			1
+#define ZX297520V3_PMM_WCLK			2
+#define ZX297520V3_PMM_PCLK			3
+#define ZX297520V3_USB_24M			4
+#define ZX297520V3_USB_AHB			5
+#define ZX297520V3_TIMER_T08_WCLK		6
+#define ZX297520V3_TIMER_T08_PCLK		7
+#define ZX297520V3_TIMER_T09_WCLK		8
+#define ZX297520V3_TIMER_T09_PCLK		9
+#define ZX297520V3_TIMER_T12_WCLK		10
+#define ZX297520V3_TIMER_T12_PCLK		11
+#define ZX297520V3_TIMER_T13_WCLK		12
+#define ZX297520V3_TIMER_T13_PCLK		13
+#define ZX297520V3_TIMER_T14_WCLK		14
+#define ZX297520V3_TIMER_T14_PCLK		15
+#define ZX297520V3_TIMER_T15_WCLK		16
+#define ZX297520V3_TIMER_T15_PCLK		17
+#define ZX297520V3_TIMER_T16_WCLK		18
+#define ZX297520V3_TIMER_T16_PCLK		19
+#define ZX297520V3_TIMER_T17_WCLK		20
+#define ZX297520V3_TIMER_T17_PCLK		21
+#define ZX297520V3_WDT_T18_WCLK			22
+#define ZX297520V3_WDT_T18_PCLK			23
+#define ZX297520V3_UART0_WCLK			24
+#define ZX297520V3_UART0_PCLK			25
+#define ZX297520V3_I2C0_WCLK			26
+#define ZX297520V3_I2C0_PCLK			27
+#define ZX297520V3_RTC_WCLK			28
+#define ZX297520V3_RTC_PCLK			29
+#define ZX297520V3_LPM_GSM_WCLK			30
+#define ZX297520V3_LPM_GSM_PCLK			31
+#define ZX297520V3_LPM_LTE_WCLK			32
+#define ZX297520V3_LPM_LTE_PCLK			33
+#define ZX297520V3_LPM_TD_WCLK			34
+#define ZX297520V3_LPM_TD_PCLK			35
+#define ZX297520V3_LPM_W_WCLK			36
+#define ZX297520V3_LPM_W_PCLK			37
+#define ZX297520V3_USIM1_WCLK			38
+#define ZX297520V3_USIM1_PCLK			39
+#define ZX297520V3_M0_WCLK			40
+#define ZX297520V3_TOPCLK_END			41
+
+#define ZX297520V3_AHB_RESET			0
+#define ZX297520V3_TIMER_T08_RESET		1
+#define ZX297520V3_TIMER_T09_RESET		2
+#define ZX297520V3_TIMER_T12_RESET		3
+#define ZX297520V3_TIMER_T13_RESET		4
+#define ZX297520V3_TIMER_T14_RESET		5
+#define ZX297520V3_TIMER_T15_RESET		6
+#define ZX297520V3_TIMER_T16_RESET		7
+#define ZX297520V3_TIMER_T17_RESET		8
+#define ZX297520V3_WDT_T18_RESET		9
+#define ZX297520V3_UART0_RESET			10
+#define ZX297520V3_I2C0_RESET			11
+#define ZX297520V3_RTC_RESET			12
+#define ZX297520V3_USIM1_RESET			13
+#define ZX297520V3_PMM_RESET			14
+#define ZX297520V3_GPIO8_RESET			15
+#define ZX297520V3_GPIO_RESET			16
+#define ZX297520V3_ZSP_RESET			17
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_TOPRST_END			19
+
+#define ZX297520V3_CPU_WCLK			0
+#define ZX297520V3_CPU_PCLK			1
+#define ZX297520V3_SD0_WCLK			2
+#define ZX297520V3_SD0_PCLK			3
+#define ZX297520V3_SD1_WCLK			4
+#define ZX297520V3_SD1_PCLK			5
+#define ZX297520V3_SD1_CDET			6
+#define ZX297520V3_NAND_WCLK			7
+#define ZX297520V3_NAND_PCLK			8
+#define ZX297520V3_SSC_WCLK			9
+#define ZX297520V3_SSC_PCLK			10
+#define ZX297520V3_EDCP_WCLK			11
+#define ZX297520V3_EDCP_PCLK			12
+#define ZX297520V3_EDCP_SYNCAXI			13
+#define ZX297520V3_VOU_WCLK			14
+#define ZX297520V3_VOU_PCLK			15
+#define ZX297520V3_PDCFG_WCLK			16
+#define ZX297520V3_PDCFG_PCLK			17
+#define ZX297520V3_GMAC_WCLK			18
+#define ZX297520V3_GMAC_RMII			19
+#define ZX297520V3_GMAC_PCLK			20
+#define ZX297520V3_ZSP_WCLK			21
+#define ZX297520V3_MBOX_PCLK			22
+#define ZX297520V3_DMA_PCLK			23
+#define ZX297520V3_LSP_MPLL_D5_WCLK		24
+#define ZX297520V3_LSP_MPLL_D4_WCLK		25
+#define ZX297520V3_LSP_MPLL_D6_WCLK		26
+#define ZX297520V3_LSP_MPLL_D8_WCLK		27
+#define ZX297520V3_LSP_MPLL_D12_WCLK		28
+#define ZX297520V3_LSP_OSC26M_WCLK		29
+#define ZX297520V3_LSP_OSC32K_WCLK		30
+#define ZX297520V3_LSP_PCLK			31
+#define ZX297520V3_LSP_TDM_WCLK			32
+#define ZX297520V3_LSP_DPLL_D4_WCLK		33
+#define ZX297520V3_MATRIXCLK_END		34
+
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_SD0_RESET			1
+#define ZX297520V3_SD1_RESET			2
+#define ZX297520V3_NAND_RESET			3
+#define ZX297520V3_SSC_RESET			4
+#define ZX297520V3_EDCP_RESET			5
+#define ZX297520V3_VOU_RESET			6
+#define ZX297520V3_PDCFG_RESET			7
+#define ZX297520V3_GMAC_RESET			8
+#define ZX297520V3_DMA_RESET			9
+#define ZX297520V3_MATRIXRST_END		10
+
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_I2C1_WCLK			6
+#define ZX297520V3_I2C1_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C2_WCLK			16
+#define ZX297520V3_I2C2_PCLK			17
+#define ZX297520V3_SPI0_WCLK			18
+#define ZX297520V3_SPI0_PCLK			19
+#define ZX297520V3_TIMER_LB_WCLK		20
+#define ZX297520V3_TIMER_LB_PCLK		21
+#define ZX297520V3_TIMER_LC_WCLK		22
+#define ZX297520V3_TIMER_LC_PCLK		23
+#define ZX297520V3_UART2_WCLK			24
+#define ZX297520V3_UART2_PCLK			25
+#define ZX297520V3_WDT_LE_WCLK			26
+#define ZX297520V3_WDT_LE_PCLK			27
+#define ZX297520V3_TIMER_LF_WCLK		28
+#define ZX297520V3_TIMER_LF_PCLK		29
+#define ZX297520V3_SPI1_WCLK			30
+#define ZX297520V3_SPI1_PCLK			31
+#define ZX297520V3_TIMER_L11_WCLK		32
+#define ZX297520V3_TIMER_L11_PCLK		33
+#define ZX297520V3_TDM_WCLK			34
+#define ZX297520V3_TDM_PCLK			35
+#define ZX297520V3_LSPCLK_END			36
+
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_I2C1_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C2_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+#define ZX297520V3_LSPRST_END			18
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0


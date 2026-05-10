Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E66321F5E
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439685; cv=none; b=C2FSUF2ao0zZ1ZEetY3KJMatoFj2cfFTzMRMUbRB49l0J6Xonf9Iv7Hwz7U//UJvxFTp3AKZl/L6FE9ifqCi4r4Tc1nApVNBUTj3XSdc8p/7BKIS9WPvS3oZmtVl81QI2nljrg5iWQh2JhzqFwbB4iVIesyKhKacypBuBI0zrZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439685; c=relaxed/simple;
	bh=9PBytlOdxzrPJbIqiajYqPTsWWSCL3zrgDIhFWyyBXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eczchD1QKmzA5Lt+PdfQPUh+qARv6a6w2aR0JsTPnuiflBW0b7TCrZ7qirKZnRGuwd0bIU3zuekLbZ315mjcoMLCGG11edBPRf0LRQJ1tshcXp6LlGaagE1RuNZQvsk+78zQcD8V86/yH4MuB1BljCUr0uw683PVloUlUFdxg+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkcaavAD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkcaavAD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891b0786beso23636515e9.1
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778439682; x=1779044482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=;
        b=lkcaavADtg0GmI/8oaSRGQgX5zMrlnPX+F0xyL1pacysYRwpjFKHoU0zZq2bT3+REc
         vev1gyB+2kepSVKUnwu5QrNNsYSNeW9kP5cH/wlapU7UdavMh59NoB3LQ1ej4JmSPsuR
         eYG3fnKRJlOXLpDgEjctCtwYtW7Cz0FuimzBVCvTiY/kWH1WoaipDPmnREUZXRXLeCxv
         UqkOHjLAmVY9Qkpjijb4TvmVHW1tL/Ibn7kGApFkngfjhyC8biu1zH19F4ggBi/bQE34
         OwSAUa3PJiJbqQ6tpKCTb2CA5do6fB8Hq3FhER9m4C5YZxUz7delU4hMmNN7OGUzUUsH
         2Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778439682; x=1779044482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Y4bpMXA9dLIyws/xAA80YyQ4eVqEzh8/1BvF+CshSE=;
        b=IKyVw6AOb4NqdvJEq8NbZ4IliI/yAD7TEpICBPJjsD/fjVvh/5hfx++9D2yp3DVS7d
         L7VDkv3NwZA/eI7rwmK0nZDt8F1dNPddiY754zpKbqClxTrtYXNVLeBMXd9+Q4iV/9qI
         72lMIy15lnL503RrUgOfjo23kIQLod3WQcifoW2y7bhRXq9i3YZnj6bt7Ng9x9pa1JEB
         8AGIO84wrWgdcUiy45j2+fWHyLL/zIUNCkubLxZUvWEc+VYHIxOjwefn56x5UVEuKain
         zRj6lTfPuzgYBjG/clT8KPldktvhdU96VDdOQvMi+flLTVkvekrE1ubvWXrKA/YEgtjw
         UOng==
X-Gm-Message-State: AOJu0YzDPiTHfbJHXqbxl9rC/Q1LpSLBkc7G/pNSzxFKoE7y5Ni2J2HP
	amekg4o5SOv9lpL7nGgD1PVg2Y99B9y2V7S9utVk3bH4F6l8PHuAqf9N
X-Gm-Gg: Acq92OH9QgVQeIiFQ4Bd4xYXWHZFiaZOFRfz30pq8jrs84p20GQozNU6X0KTPBCelhS
	aOWtOuFKAEXdeHJeQSx/dUqCFqQU07V6p3vMYq+FkeEqs85vP4nZMlOvVs1GA4LoQOLJaZh7PDw
	xhz5y88+/v/4DBk5aCqamlb2Hb9uWWvEsYLh/9ura+xcOZqrTdNV9PE3iDt710/pE6cM8VZoD4P
	+ZUWhepUzlLgYXHmu67PwbsEtZQ+au6MDWBLEQd1islyekfhT9qfroJNWDeiNV72Ij/5mZJ3D83
	epfyEM+Ik4wERAE6lx6mGhF4K9f78DbKWTsUvqYQYVQ4scmZq5P4hOUnE02OldMo4Esf6uZFPP3
	n3GD+rUKP/fx4m3jm3jX6I/hC2Hwqv8AKFtPl+JSBoXDSUBOHK7km15PkqY66b3MUEYLc9NW2tr
	x6ShCglWOUraBXdxM85EQvTvxqWb9q44lcbw==
X-Received: by 2002:a05:600c:8b06:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48e51e223ccmr357669875e9.11.1778439681476;
        Sun, 10 May 2026 12:01:21 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm132877475e9.5.2026.05.10.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:01:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 10 May 2026 22:01:00 +0300
Subject: [PATCH RFC 1/4] dt-bindings: clk: zte: Add zx297520v3 clock and
 reset bindings.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-zx29clk-v1-1-e1bacfffe967@gmail.com>
References: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
In-Reply-To: <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqANX5V03cs0gJ0Oc/d8zFavnicMOpSIpXjDQnx
 LMcB4+MLv2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagDV+RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJSqRAAs+RumGyi9fbbK4DOPc2GaHd1aytK+Jh
 mFxTUvmuynn91svibBpLBKA2fAXsE8BkMkXSkySHiIz/VdgOUZp0bnBYq0BqhXpHLJhv5tMw4GN
 Z6w9+vGDW3fO4UogQx7mRzaBe9rLwcEEKgfJf+/WBs/mi6vZ5F7wd8qrbreU0UXkvCZHlWlna5x
 NUrDskLqaXIVgaULns/EsSLm9h8Dw8idBv0Q8OWqd/ACK+KErb9whwZ/uNLjz0a+KNs6ZVw1lsK
 qVbtNq8KIis/wuAmTBL/pSnEFP42BzAnsKndFjN3k7aOWBvVsQUWqwlH6WwbRJXtllc+mbOlQ2s
 wJgGUGkeqmRnPjhWpjqksnrUXS86yKcJ13KzYTtd25Rlf0MxNdw1o6ZuXSTwijZtMuI70wjmS1A
 2sylctqm2bU2pjBOLq83RiWsgfpZHBLeWsOzSLpl8dZiPSxhtHwQsSVjWfkzvQBsqtfoa3DkY4x
 ZvF/xubsa0uGE9QJyEagw15jO3/NoQdEg0g5ABAh2zJ2bi5oTpmAJ0IhYsHK32aI7o1Io4A37vN
 5cIMd3tUoyOyLnBtskpjovd7mOXOGBg5u5xwrhclnlM9p4dxI+M7xlXoBn6AvrwXZeydvu52zBJ
 XrnTljyKnyaHj9bM+yhMtEOKL3MEPxKVIHA9RqHzv/DR33/GfA48=
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


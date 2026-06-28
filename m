Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F873B19AA
	for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676766; cv=none; b=H3mA7+CFklfebO/RAmgukNlO3f9NqhZ9nHdNMbYVFEiTnUugSKWSGLLihnweE2HqdmELCeoRNQAncxN0VZpGNOFApX0tdKeL2lYQcOIES8ZumdOxyNPkFmLCLsvYsGLIXNUEd6FD0Nabn+WGBhBAOB1erl1kDj4JeLn6AmAMJpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676766; c=relaxed/simple;
	bh=zvZGJR9GVEAgcx8e1Pz0NT46j1AcTs4BaB3UpphCnp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEpidbDUrGzDbkwrKV3QsfTjrxvfRDI8PI+TqEHxEHtdAl4EvhwaDVUt1Jzn5/pf5G0uut4lK55pQZ5lY+HlPNAekTQoXUn6ptNh+w8hX4ElflZlpwpg07qZEqH8VWQrm9nXoqEVBOs6njmv9RRuV0En0QYolxT0xPqi1aRuIrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+pCEp7d; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+pCEp7d"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924593f45dso34273105e9.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676763; x=1783281563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xLJUm1pDnsMe4p4+8LgRzkTr4SuhHCp9C2f1jh5tJk=;
        b=m+pCEp7dxu8REzib/51tGDgzcSqiFPrQCZCX5e6M+/VhFF2GLNVDe7WF/Ni6b03k4I
         NzrTTjGRea52Sg0y98lrLLhfeQ4faVfM6zu1QvebpEo/axkzkwrhU5XfuSmMpKoNGmtK
         tt8rCgmzywDu7hZYNrKIwnMC1GzQ1BlEnIGa9vRijFl7UOhEcB21DoXUpKoUgMRL0ltt
         S3s+JYaMpChzH4u3L+pd8gAMh+ApHkI4UhwQxScX0zVZaT20yKlakqGjf3BpzVk4VTqq
         yb8IkoTarVGlllZUdwBcRXBB2Ro/L4+lrzfYXaD2nzQISqAmaFsWT2KaxoxGOvQ31kew
         ZExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676763; x=1783281563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xLJUm1pDnsMe4p4+8LgRzkTr4SuhHCp9C2f1jh5tJk=;
        b=ZL8iJyfUSdVd4oaW3/LVQG96I9rNZIAkN+UTKuUZs5Y6gRJW/CMLpzkK7eAvgGIQtc
         lOcS7Jq5Xc1q3wfLfc9Gg7O4UAiIpZfdhUp9vEnXTW/TlUfds/ohiCvATWoHkjhKO/Z7
         ysumavtCjxd4AHSlJ1l0nKpjrvotdHtWWhl4RHM32loRrvFc5wAOiwtqBuQCNDx61WUS
         Cawli24T+oI7iVv4rTytTThbqBTIRRJodElFQUxw47N44nrSke/n/m+JAwWJYD08pZBs
         Dc1PcMdI3+2w6YpIv0yJg7+otWcdcg20EkKWNMxwq4FYNWDEW23imnY7zYjLnSMvQViv
         Y8vw==
X-Gm-Message-State: AOJu0YxGrtWgpGBwurnK54S5fN1DCmEtdit0Ri3IswbRO0tTAi3xmpab
	6Ct8vtlJQ65Xb7xljCYIM7loeZeYk0A0Z66BZ1vOxurdx8Fv1BWC+5Qi
X-Gm-Gg: AfdE7cmc/zbYIr307/c3D7ISv0r3ugWWhxuqRZT+WK1tdgf5HnfR/em1QRr2PO3l651
	QDFP4Ol3hfB0YC3j7v1QMW8l803Uv4jteTJXxKeda7HI0XD8yTQXN5ImG2JeFdefxTbI+Dy+5fW
	1rQXmulXAwqrRZEu/nTTT4epOwDHM/l65BprtufIouL7Q9prRwEzHpEi0A1B6m0dfukDDSUmDFk
	fnwS+FIhKhoUguoU4goKD2zvaMMJkZt1h2dk1RY4l7DmrQbitlRCWjIg8ic35Lppnh0O8P+vHYy
	jk5/7vjLp09p1TTqSLzkAnfL6Nmq/LEGBqFHFTAW1o8Lw0ndgZRGGymnBm6o5XR+zfOciXwHGqs
	MQN8EE5MrQ4J7CDOhIEvdV5y1Z8AEi5pzYZDAvdheLsCjF0yO7ZZBL8fvLL0CCjHZqqj4W2QpI5
	+LgktPymatmte1byTLxlbOQIk=
X-Received: by 2002:a05:600c:a016:b0:492:e5a5:5a46 with SMTP id 5b1f17b1804b1-492e5a55a84mr91636065e9.35.1782676763392;
        Sun, 28 Jun 2026 12:59:23 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:22 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:58:56 +0300
Subject: [PATCH RFC v5 01/12] dt-bindings: soc: zte: Add zx297520v3 top
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-1-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10800;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=zvZGJR9GVEAgcx8e1Pz0NT46j1AcTs4BaB3UpphCnp0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0TSVdhdVWdQXf3RE6R3F6XfjSeAUK7bkBvT
 C3cN9Dt1ymJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9ExsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJU2g/7BkpYbjBEexEgTldxPCdvPCznCICtR2s
 UqpFlonGHXlVDfeJWE2B23Ex0FPz2qVS4FY4QOD3aJEuM79K4YGql185xXGBzxxSbIGa+vsk2IY
 DbSLYroYbj0zWONqTTggX4eGDDSufOnC681yXtMs8NFTBiKnriJtrX5kBt6iV0ZyhHLW97pbFrE
 xAfhgJmiqvO8g+zZkE7OQl1Z+UB53XgZKa4/1jPFzg60FYQyZAJFz1CXoZAsvpk/wA6nPKQUURz
 1VvLSoaLzeg4rwwxOe9ifRxpD3AnJMf9r4I16rzvllwXJcWiPDKjSJXVYrLKpRn+q3JiSqc5jPP
 F2ZhpD7+xDewWosTsQthYDmOP8EHMAX0CGIT0MNHaUCXe5Zbw3UqRjrvHU3Cncik41fwIesZJ61
 AqpioNfWum6FYP+cpsnFTx33KWBgvsnbmIG1M+xGMCOdOxc8b3AScU9P4dAy/OlPbiR6Z78ymEs
 E55U0fDoSVRlrhRb18DZGHioxQcDnHViyVEzKkdBp6IBUrrSoClD0hMw8oS/Ykpv79yWAZmBad+
 +iWZ2KFuRDi7efrJG87sKpZFpt4wR+kpCkcE9lciy99WI9cX4WiXU5OrVdkT0EDepBFjVUFVZ26
 mr3lcQoaK8f5iIjvi8+Ps1x0bKrb7tiDuQqeQIq0XsYFaN1ha3Dw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

These SoCs have 3 clock and reset controllers: Top, Matrix and LSP. The
separation of concerns between Top and Matrix and the interface between
them is poorly defined in the hardware, so the bindings list all
potential PLL clocks that might be passed between them.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted). PCLK and WCLK are
controlled by individual gates. Some devices have a mux and/or a
divider for their work clock. Some devices, like the GPIO controller,
only have reset bits and no clocks.

The top clock controller is fed by a 26mhz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel mostly relies on the
boot ROM to set up PLLs, but one LTE-Related PLL is not configured
on some boards. Therefore my driver contains code to program PLLs. It
produces identical settings as the boot ROM for the pre-programmed
frequencies.

Not all clocks will have an explicit user in the end. I am defining a
lot of them simply to shut them off. The boot loader sets up a few of
the proprietary timers, which will send regular IRQs (although the
kernel of course doesn't need to listen to them). I don't plan to add a
driver for the proprietary timer as I see no use for them - the ARM arch
timer works just fine. I will add a driver for the very similar
proprietary watchdog though.

The clock list in this patch is pretty complete but not exhaustive.
There are other bits that are enabled, but I couldn't deduce what they
are controlling by trial and error. Some of them seem to do nothing.
Others cause an instant hang of the board when disabled. It is quite
likely that a handful more clocks will be added in the future, but not a
large number.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes v4->v5:

Rename from zte,zx297520v3-topclk to zte,zx297520v3-topcrm and move to
soc/zte
Fix path in MAINTAINERS
Add syscon-reboot node to the binding
Give the USB and HSIC PHY resets their own reset control
---
 .../bindings/soc/zte/zte,zx297520v3-topcrm.yaml    | 85 +++++++++++++++++++
 MAINTAINERS                                        |  3 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 97 ++++++++++++++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 32 +++++++
 4 files changed, 217 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml
new file mode 100644
index 000000000000..6baab5c98d25
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/zte/zte,zx297520v3-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3's top clock and reset controller generates clocks for core
+  devices on the board like the main bus, USB and timers. In addition to clocks
+  it has reset controls for peripherals, a global board reset, watchdog reset
+  controls and a USB status register.
+
+  The controller has two clock inputs: a 26 MHz and a 32 KHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  clocks to the downstream Matrix clock controller.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. The resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-topcrm
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  syscon-reboot:
+    type: object
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    description:
+      Reboot method for the SoC.
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
+    clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        reg = <0x0013b000 0x400>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        syscon-reboot {
+          compatible = "syscon-reboot";
+          offset = <0x0>;
+          mask = <0x1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8629ed2aa82f..0f9e588e4839 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3867,8 +3867,11 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
+F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..de1c08b6a5a9
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_M0_WCLK			1
+#define ZX297520V3_SRAM1_PCLK			2
+#define ZX297520V3_SRAM2_PCLK			3
+#define ZX297520V3_UART0_WCLK			4
+#define ZX297520V3_UART0_PCLK			5
+#define ZX297520V3_I2C0_WCLK			6
+#define ZX297520V3_I2C0_PCLK			7
+#define ZX297520V3_RTC_WCLK			8
+#define ZX297520V3_RTC_PCLK			9
+#define ZX297520V3_LPM_GSM_WCLK			10
+#define ZX297520V3_LPM_GSM_PCLK			11
+#define ZX297520V3_LPM_LTE_WCLK			12
+#define ZX297520V3_LPM_LTE_PCLK			13
+#define ZX297520V3_LPM_TD_WCLK			14
+#define ZX297520V3_LPM_TD_PCLK			15
+#define ZX297520V3_LPM_W_WCLK			16
+#define ZX297520V3_LPM_W_PCLK			17
+#define ZX297520V3_TIMER_T08_WCLK		18
+#define ZX297520V3_TIMER_T08_PCLK		19
+#define ZX297520V3_TIMER_T09_WCLK		20
+#define ZX297520V3_TIMER_T09_PCLK		21
+#define ZX297520V3_MPLL				22
+#define ZX297520V3_MPLL_D2			23
+#define ZX297520V3_MPLL_D3			24
+#define ZX297520V3_MPLL_D4			25
+#define ZX297520V3_MPLL_D5			26
+#define ZX297520V3_MPLL_D6			27
+#define ZX297520V3_MPLL_D8			28
+#define ZX297520V3_MPLL_D12			29
+#define ZX297520V3_MPLL_D16			30
+#define ZX297520V3_MPLL_D26			31
+#define ZX297520V3_UPLL				32
+#define ZX297520V3_UPLL_D2			33
+#define ZX297520V3_UPLL_D3			34
+#define ZX297520V3_UPLL_D4			35
+#define ZX297520V3_UPLL_D5			36
+#define ZX297520V3_UPLL_D6			37
+#define ZX297520V3_UPLL_D8			38
+#define ZX297520V3_UPLL_D12			39
+#define ZX297520V3_UPLL_D16			40
+#define ZX297520V3_DPLL				41
+#define ZX297520V3_DPLL_D2			42
+#define ZX297520V3_DPLL_D3			43
+#define ZX297520V3_DPLL_D4			44
+#define ZX297520V3_DPLL_D5			45
+#define ZX297520V3_DPLL_D6			46
+#define ZX297520V3_DPLL_D8			47
+#define ZX297520V3_DPLL_D12			48
+#define ZX297520V3_DPLL_D16			49
+#define ZX297520V3_GPLL				50
+#define ZX297520V3_GPLL_D2			51
+#define ZX297520V3_GPLL_D3			52
+#define ZX297520V3_GPLL_D4			53
+#define ZX297520V3_GPLL_D5			54
+#define ZX297520V3_GPLL_D6			55
+#define ZX297520V3_GPLL_D8			56
+#define ZX297520V3_GPLL_D12			57
+#define ZX297520V3_GPLL_D16			58
+#define ZX297520V3_PMM_WCLK			59
+#define ZX297520V3_PMM_PCLK			60
+#define ZX297520V3_OUT0_WCLK			61
+#define ZX297520V3_OUT1_WCLK			62
+#define ZX297520V3_OUT2_WCLK			63
+#define ZX297520V3_OUT32K_WCLK			64
+#define ZX297520V3_RMIIPHY_WCLK			65
+#define ZX297520V3_TIMER_T12_WCLK		66
+#define ZX297520V3_TIMER_T12_PCLK		67
+#define ZX297520V3_TIMER_T13_WCLK		68
+#define ZX297520V3_TIMER_T13_PCLK		69
+#define ZX297520V3_TIMER_T14_WCLK		70
+#define ZX297520V3_TIMER_T14_PCLK		71
+#define ZX297520V3_TIMER_T15_WCLK		72
+#define ZX297520V3_TIMER_T15_PCLK		73
+#define ZX297520V3_TIMER_T16_WCLK		74
+#define ZX297520V3_TIMER_T16_PCLK		75
+#define ZX297520V3_TIMER_T17_WCLK		76
+#define ZX297520V3_TIMER_T17_PCLK		77
+#define ZX297520V3_WDT_T18_WCLK			78
+#define ZX297520V3_WDT_T18_PCLK			79
+#define ZX297520V3_USIM1_WCLK			80
+#define ZX297520V3_USIM1_PCLK			81
+#define ZX297520V3_AHB_WCLK			82
+#define ZX297520V3_AHB_PCLK			83
+#define ZX297520V3_USB_WCLK			84
+#define ZX297520V3_USB_PCLK			85
+#define ZX297520V3_HSIC_WCLK			86
+#define ZX297520V3_HSIC_PCLK			87
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
new file mode 100644
index 000000000000..43db72bb59de
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_RESET_ZX297520V3_H
+#define __DT_BINDINGS_RESET_ZX297520V3_H
+
+#define ZX297520V3_ZSP_RESET			0
+#define ZX297520V3_UART0_RESET			1
+#define ZX297520V3_I2C0_RESET			2
+#define ZX297520V3_RTC_RESET			3
+#define ZX297520V3_TIMER_T08_RESET		4
+#define ZX297520V3_TIMER_T09_RESET		5
+#define ZX297520V3_PMM_RESET			6
+#define ZX297520V3_GPIO_RESET			7
+#define ZX297520V3_GPIO8_RESET			8
+#define ZX297520V3_TIMER_T12_RESET		9
+#define ZX297520V3_TIMER_T13_RESET		10
+#define ZX297520V3_TIMER_T14_RESET		11
+#define ZX297520V3_TIMER_T15_RESET		12
+#define ZX297520V3_TIMER_T16_RESET		13
+#define ZX297520V3_TIMER_T17_RESET		14
+#define ZX297520V3_WDT_T18_RESET		15
+#define ZX297520V3_USIM1_RESET			16
+#define ZX297520V3_AHB_RESET			17
+#define ZX297520V3_USB_PHY_RESET		18
+#define ZX297520V3_USB_RESET			19
+#define ZX297520V3_HSIC_PHY_RESET		20
+#define ZX297520V3_HSIC_RESET			21
+
+#endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.53.0


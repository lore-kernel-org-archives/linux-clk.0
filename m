Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F43914E4
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641618; cv=none; b=AGjSE0qIjLv+o5RASP7pDdXAhvmGt213jF0eU0YELFXJ5UtUAB9uGSsiQFSRf7ZPI4XQyCLPd4OYouMjAUgXYFN+ZK5eIgtvi0WlbcmR5hCLFq6L96aMMHE7TZLNSc8lj+zA90CQQ+flALqRwmywfYWn+IC3BlTKIkiXYQFdfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641618; c=relaxed/simple;
	bh=EhdBvdiVrO8rOSTQ2CUBEIa8UYk8Rkh7tz54zYD05Qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJmMBYvgOZ8pqgnXpAw9SOTE19uRisWZYEI+F8on4qYQBFaulG8jqhZosbXL44kMquvPZxAKMgnX8JJMeOPM5F1m6PD0YtkkirQSxEEBhzOo9Bs5zMNVNNlhNfbps5AzqsKHcil6j1P+EMYgBZ7TMyyPYNXrTBvSeiHThic8IH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ppebw2p6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ppebw2p6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-492329c5514so1255745e9.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641615; x=1782246415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUmYrMa2a929oow4K0kGQmeQ8euSAQ5ozU/DAB8krW0=;
        b=Ppebw2p6oIspHkcwKFZz7vGTl98SWlkOsxl0g9qzkcn7e+8DshTFNRQK2WC56yigXH
         iY1olUjbaoouEwN9hW6V8cnpCdCMwq2y8LKPfCXfhTV65iglbErrkPhMB8EqJy8Ueias
         Yl43eQz/F11fReOMb+Y1RlM0rZgwT/s3vpEzmS01ynFdSmW3ULNgxUv2xwhsXEYrRmXx
         W8FjuPAkG5ju05tbCrZvotFjo4lV3/wXNMviGU40nXPPd4W9HeU4GStMF6bZ68UKJOjL
         SAw2lT+eXztOTdy4w8fujomWWrnmUTN7tlKxexLh7nLFCPlrGO+Pl/fhZb25g6koyWHi
         fdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641615; x=1782246415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUmYrMa2a929oow4K0kGQmeQ8euSAQ5ozU/DAB8krW0=;
        b=VOwnvgLfgbsT1d2XMVKdMUw+cBFvwf2mcypwFf823qk/8+qFjofCfQ1TkC1dINrWH/
         gXQWutOaXlqNv+P4XmI8upC9lTgTXzH/Fl6AQmWcNY/M9CofmWnNDw3A0na9B5hfYPWC
         m34AXX8sLqpx5y/Oe20mfTXi7W/UEtlJVI1o4dmOMIHH1k/vI8icCHcK52oCO4jvE/3T
         Di1hOavjh4Ma/oySifCpTanCz3XZufd0UOyUk6vWz6vHZoy8vRxsoLtK9QA60cG3qPK3
         ZjlkT98svFbPZDprmp5bBlVDFk4Q31J8zNvPAiLIqB1hKX8/tlcDYPirczMTTIN9BqkP
         ukVQ==
X-Gm-Message-State: AOJu0YzcC8xM7hgjYDK87NwuX/C2fnc3ndL7ff3/MuBJjKmXOAkdOTua
	XuLYfp2Km0UysZkpNPsjB9z0OpDWnkeh9Ijs5LusYQJnQZ1gMYQW0N1t
X-Gm-Gg: Acq92OEUju8CI50w7LiotSo06LHX4xbYAXLg3nmumlxbmk/sgsR9p/KvkQHpS+Gzo2O
	1pwIb6bvEKIU3HbMTcsfog2QFb2a/ccMOrvZnqEOvp+iTcAcC5t2ZsAgHbc6KON3irYaO2MIShN
	U5j6/+AEEctIA5PYtA+opTpXskFddeawcApsatVyeuUy13zSzBntm1npWrEa/Ds1vUxyqnEw4h3
	41UsmNZTU/FGJDJ5cD11/J4jMsv9lRCpqn50AjVGBwkkK0tEO/F8cQYELl6/XFD9mQH0yCDvIHu
	Iv7qwiOnHRLaic4IkW6aCUwD1S23Mn0Uq5hc1ozn88brTvVijdnT5tHrDBX/HPy7RRLGZjlODzK
	FNWBCdvTsPFaDTYdi/Uy2WwipKf1VUkQXiKWJqEtTDFGBocCjuzBN1GrvOA6rCqIER6RgUHw3OC
	6OZ/EHgFzikmZosbFo7Uihim2RcVXWH8vyAQ==
X-Received: by 2002:a05:600c:8b83:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-492340c5eb5mr3321645e9.6.1781641614915;
        Tue, 16 Jun 2026 13:26:54 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:26:54 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:21 +0300
Subject: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-1-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9380;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=EhdBvdiVrO8rOSTQ2CUBEIa8UYk8Rkh7tz54zYD05Qk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGN3MQD58npdh76POdP4gdkZzPN/KGEJEmI
 DYwcSBZmKiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJxMQ//dg9SlBJQ1UP2n6iVcOpfOYchqn0lSiV
 O33z7NFotUzB5JIjX7aZqEfFOvjPZIgRXhmn0vJCLhT0janHH6Un//79duLKb22k0ZVlnZjI9ph
 xFJ5egU9kU4rWhDF7W9AiWqcrMGQDFThWiPW7lyPmOzUeqJYqu76ucPFfA01ovE2ZWIOSj6tNZf
 ownA4vjBzzeZis802xJ3fUaPbQ0Vwswb5UiZ1c5v2/4S8igElO71YnGOjtR+KKUQRJ74VGTMZfp
 dV3VYbQem/KSJh6dyH8y0lmjizSKzaf81TYGByRa+zOdRuEx/MvnEzqmPUwMizrerCHNXhXqFTN
 SbqJD2ivCCOgwamCO9N6pG5aYJ+sjAAc3Hbda55icVQH/p/oeNvQH5rGVYdrc6nxQ+jRbGIEt9A
 DBJ4zxALEoP3KqTfh7SjKFpjOhHpVw/88QxTwUBPyIp0lDSUb7jwckOmLi1p9T1d6bgGT/Yq+Dv
 Oz4yqmQ4B5dFvac0NkSO6xCn6LQ8Fd6sLNS0G05rK8D3Ke1mTdC8EnOKwAIg5K4A/90XHJQNd1+
 y88DdUKEJHs/Ccz6JL6rIkay4FFUc7+rRX9YK900ht8pdRPG69B18d2cjCNhlQpeiqt0zT99esF
 JxsL6QEg/7iNIC+QnsY7meeb8P0joAavw1beIVyeD0JWipZ65diM=
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
 .../bindings/clock/zte,zx297520v3-topclk.yaml      |  70 ++++++++++++
 MAINTAINERS                                        |   2 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 118 +++++++++++++++++++++
 3 files changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
new file mode 100644
index 000000000000..374f63891288
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topclk.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3's top clock controller generates clocks for core devices on the
+  board like the main bus, USB and timers. In addition to clocks it has reset
+  controls for peripherals, a global board reset and watchdog reset controls.
+
+  The controller has two clock inputs: a 26 MHz and a 32 KHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  clocks to the downstream Matrix clock controller.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-topclk
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
+
+    clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topclk", "syscon";
+        reg = <0x0013b000 0x400>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8629ed2aa82f..0cc1ede3c80c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3867,8 +3867,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/zte,zx297520v3-*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..cf436ff20dfe
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,118 @@
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
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_HSIC_RESET			19
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0


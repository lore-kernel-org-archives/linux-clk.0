Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D5E3A5449
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024117; cv=none; b=KY/zTG34EGosAs66zewesRnVMU7uwVR0F4XCPlhYDeUpfSPGgoPr0Dl2KMWMTW14SIezpeR9Cvluzw4kTC7ixoGulhdITDM+bgkZhdmEKjiw8EQUzm5ODYrRRns0ALpUDm0xqOD5LA7JI5SG5T7WU++YBJC61LMhTQc6rUDRc54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024117; c=relaxed/simple;
	bh=f3Fj02WYO3WZre7Y9GP706mvqY1HJWgYm2Ae1WY0xvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUgVph3mLRY/PzsGj0NNHf0O/OBfEzR1+U8Zzu4xwnlLSMPzxjxBnixmlFD1xKCB1r0ol8Tmc15uR+Xiipu/2RsPonzmseoVIz2cS8CK6g6PW073R4y5afISJ/i415VbjHsmfjaQvTmNYIf/m/XD/EG9xbKTnD98Eii7s2jbk/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eztjbUpH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eztjbUpH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso14401315e9.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024113; x=1783628913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW6m2KHsSev3G8oVqLS3slkz7olL4ONFIOCdoUaeEVw=;
        b=eztjbUpH/A9Idr2Kgd8SgrWNey4Sk6R9mwkidj8mLhtXgDrYKZD4qoiOjUyTDSBd2x
         nDgQiikRsz2TncZYfcUxEoHPo326NlrrnNHcifdQOuf03AzgcaYvffxYCNvLURWg2U7D
         N6/rVngx8Vp2Nwj2WedtmAzBXuioNqP1AQH0P0/sfn3Rqwq27C5p0zSOGIImXU9L6CWb
         hAiyK6eIZT9n+klbABhxrMcYXI/OcecUmVahmEi5PdlGB8FjSGt/1aD6Xoz8PmcfXVYk
         Gyn8S41snZ6M9bdONfcylsuNwmh9eHceNySjTCJOuCDEMAoZRiozJLXKD3ZfKvl9qqje
         /EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024113; x=1783628913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IW6m2KHsSev3G8oVqLS3slkz7olL4ONFIOCdoUaeEVw=;
        b=b+7qx7kC9dyIpJWHhaWxRlRQABGaPDCidXtIAeRVr+WzPm1BY52AKIJRiABzhyUMwv
         CIP37LNgvUIIuQt20Z+YP6cWM2vcR4A+Z8Miwzwxrs8O+qXLSWXhoqm8DA0/21eeqUiP
         p2lPzsrDEe0n39eTQHDVRt++OG3BJmN08KvjhFxvQNz4Nmjv2By9+w8tRhvC9X7ZIqM0
         i6lcQcSy4uPk+q01K6M2AjFCNag2KqzEFK6SfymUxnHtGIu2wuD4artNR0C4qR1dH+JY
         3qA1WwhgL8CRl2eGkrCxDEOQm83ryDfm1/+HtqSsz3/AqfhwJzWydqZxRmnYaU4/9AQZ
         aRwQ==
X-Gm-Message-State: AOJu0YyUaXk9RXs/jXv2PseGsFH7rImi0fivtRBFFlxkvpaBawvyzol9
	+Rh2YLz3rdIXJXZ4fywxZW+QR8tCfV8xNk26RUPaJ2ycF1YOXyvPZVbR
X-Gm-Gg: AfdE7ckEvxrm/Bz2fphROR0NDcOWYEgREhuEt/GUjwvC9987PpT3V/iQvttUBEW0lO/
	Z1qoq+oSn+wd+aogNsuIlNFBpFjg20TPIkmPfsM/jeyULWbSuWZDV9K7WAhUMAhYO3Bubak2z2t
	Wk4jwG/cN7m0QjzlOM7RDgIPdxnKOcG2EJKIlSa3V2Dx+zMU9dohQJAEMxXnTHqT6K2i5Bqk+F6
	htpTcqxV8qiY0jeyXVeVr24uC2xGYPtJUOEhZiRBuyI4PEMDGzt4vReLG083HiOxbMdgwPCfPEq
	XYAeaAAmx+laF3xYPhQZNKyRoKTxNvN3nqL2E+Wxj24sfbJBD2FcmHkN5Fo/ttl2HY27BsgnpjC
	Gn99XdxFajEB5rSAEhrVVD+VII3sqU+gkcKRZ9J4rZYpYWKKpin8CwENUQluRzS+5f4ApggaMNn
	WzhCt8WAYMJ1gCm2PaxX33+Ufv1mEjG+8Inw==
X-Received: by 2002:a05:600c:37c3:b0:491:91cc:d12d with SMTP id 5b1f17b1804b1-493c2b73aacmr104073205e9.25.1783024112929;
        Thu, 02 Jul 2026 13:28:32 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:32 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:27:56 +0300
Subject: [PATCH v6 01/12] dt-bindings: soc: zte: Add zx297520v3 top clock
 and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11375;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=f3Fj02WYO3WZre7Y9GP706mvqY1HJWgYm2Ae1WY0xvc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpRIx/kgIBYTWHwgIDZ9QgpRfjNV2WsIbv4
 bT4Y1tVw2CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiILtg//e0s1bvlf+XY0vcolxCV67tUwTo/0XDE
 dr5qu4pRg5aGHADyDButSGAe6CCsDTIPWbrRbN3mWcbgTuqTQnpRaFQ7qJdmTOiLVWR/P6yYqnk
 qdFkLNgPd+Q8OkYBbWxnE59Gea+fLhXD7grd3G4PGIULSuPETgCunyCxk+8Wq88YZTGf8Yib3CH
 +RRlenrR4aysm4PSYylbOEy98MvduocUr3C2NIgnu0uEiZsqnSbALDveVL9yjoeKjCs8FZ9IB6S
 IMtBJzfZSiboIFFiaEkUGJ/ZeGOrG5eHpK27YF5YT+ldTO4VkyYqvg4/dV7D2FcuHf98wik0rAM
 QpRugBl//MU4DpjdPqX+1CTnT8ftrYvd4uCzAOxuo13tNMKlppYhj+kPMTIATx90Hy8GdoOBY0R
 OvIwhMY6Xom0CQ9vWuOUHpESCyC7shMPvlYfo8BaKaPI9ow7zdNAu8OEvNDdeB8c/eEEAdNKzNg
 WygBK73ugNzqb9ccWwKhMKCAyWTXUZeGtqA0v2J9iqnhncN073GfrZo3uWOepLB+E4FH2beefcl
 pMRN4SGL6SF3DWV0OAh7kJILkbzvKcGD7Gn2Ol1dTU3U3R0gtx3vYru5zGEuastmTKBoh8L3ZsQ
 ZDIKbCjB0jOGB2Wp/i6G9yA/94vgGfsnXw0BuNUyrLQyLv1LEPQw=
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

Changes v5->v6:
Set value for syscon-reboot example (Sashiko). It was my intention to
set only the lowest bit, and I think Sashiko is right that without
'value' being set, all other bits are actively set to 0. It shouldn't
matter given my understanding of the hardware (afaics all other bits are
ignored), but actively clearing bits was not my intention.

I haven't changed the name match for "syscon-reboot". I see plenty of
examples of hardcoding this string as opposed to having a regex for
syscon-reboot@12345678 in other bindings.

Changes v4->v5:

Rename from zte,zx297520v3-topclk to zte,zx297520v3-topcrm and move to
soc/zte
Fix path in MAINTAINERS
Add syscon-reboot node to the binding
Give the USB and HSIC PHY resets their own reset control
---
 .../bindings/soc/zte/zte,zx297520v3-topcrm.yaml    | 86 +++++++++++++++++++
 MAINTAINERS                                        |  3 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 97 ++++++++++++++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 32 +++++++
 4 files changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml
new file mode 100644
index 000000000000..5a5d97120056
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-topcrm.yaml
@@ -0,0 +1,86 @@
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
+          value = <0x1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2f0a4192b0e9..2b1cf28dff5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,8 +3878,11 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
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
2.54.0


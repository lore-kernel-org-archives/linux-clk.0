Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8524C3C8728
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237762; cv=none; b=oam/K/TeROtum1NJ9wMoYv9Yaf8lyQkpn9reqXlBRoVHkQd58KhizooGnNKBiSLtnL/jlWlK8nxD6nDBD++1B15tCrPuVEF2Vt1Fa6Te8AQvIXNR0qp6vTw+7ZrMIGaDcVUyVJ/X0ku4biPmWTUz4MkYSmevFKyBDvriIiEZmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237762; c=relaxed/simple;
	bh=MQOZUN5sOfzC0LslhdTuSv6dboTN5sRWAZchx7fQT2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgSo3WMGRVJY7vzdu08XB+QSUVba7Htgk4ORpTcO8c97wD2McpewPR+TsQhAOW/cazcLbUKkh835Wyg1pM4bExDLvHe7zpdAeK5xcCO+/wsi0Tf9cSdShIXiegaLMQuc19yuuivN0ca4/g4ILViskGP0+1kn9/gEteVXNuTMRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKgF2MaG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKgF2MaG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49546c690ffso4699895e9.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237759; x=1784842559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ba7h/YS4G0id6u8P/3TJ7kh/2tCKNINWqwY3DjpUpw=;
        b=WKgF2MaGFz2SX/VNRnijfIA7TfNEBZaaQnjFYW0bHS/MCWl1ukx6PRRYSlMI1zcgT5
         XJ9PKuKKDj7TVSbOZJec7J0LZQ5IejgEJP8k9Np6sxBRamTmHS5eBf2sxKmFJZ1LraKQ
         ojX7ckboGsJDAYJMKJNH6Ib78UEJx4aYo/HF1D5/8MTFr7QiNLhG+XJuf+m0/aQI9AKi
         IzM8k48GwTmY9v4+qUsk7g8B8m/Xt3mMPw8lJmqyMQZg0fgHP+tELksnn0Qt910wT60l
         lMzAfn+30/FCsIin+jI75GYv8yVJZVSjhSPDko2fShSdeYqKzEIulNskUAxR1o2wlIGE
         ddMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237759; x=1784842559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ba7h/YS4G0id6u8P/3TJ7kh/2tCKNINWqwY3DjpUpw=;
        b=AnJnOTcWLxC/R2Dp/F9rWfvNP2A0/9IoXVRWYKEUKsJd3xnvPaVfXbeYp8VKwD+1My
         DDzpxg9fcCpxlTCx8jMAY/OApXUrjk2uYx7YjL3p2dE+wHIAAEpQI+9u2h1oK7oBOy5M
         ZcGFRdKnZSsZ07Jppu+akRn8q3t+4el4aV5b7+Yik6HzM8sXpVCfcPvSLopGJaxIypIh
         UdW1secDwPLeq1yKmlIc57RhHO8toprW089gGZiQPaJhppibnNgzEUvH67+VdND49OGs
         cvlD+7zB0cBZT50Ff9nlGxBz+73Y0hJ7q8R0DzApTSCuCO6rqWpZ6rVSlNR4pDxbpDuG
         TAFg==
X-Gm-Message-State: AOJu0YwGmNYlNWlFblPvt+086hTO1l4ur2M9Z6NZUjYebyBmw2ZVCy37
	AuWUdirzuvfRI+S5fYcKfzLhNJBzY4R096tIy7bcb/asf6WPTjx2ewEs
X-Gm-Gg: AfdE7cnA/vGdMFu4hrGyDGvm1s/mf4KkA4MGsfi8TcU+V8mc2ymxShR85BKnN7++JPK
	2RHHbKE8kL1Z7Hw/KZIoJOkM2vxwJX/VjT8rGj6qto2jP+OGKTcf14an+dqpHxwqhxNGCA3trtd
	QKoemH2t8dXfkq2ulpxhId2zj+rmzsYShMi6VgN7gNhaIAYPbqW8a1Qq2/RVCOXi3rLj/MLM4NM
	dpQdJwlXRmRpD9EcZgoqmqZ0TANsS58v2GgGPP/EoleXoCyPj0Fu8sFJ0SHe2WS+FZb0P9Y4nfy
	RstUXhCMntUBuwQwemMhQmXqet94mO4A2gbuT/EdjcC1W6FUkGBfeK0HELEe8g0XthGVlDDTFh3
	yM53L/1ZC2oN98G+Li9lsEU6+xYfJLPZKz6kJsKsIeaD4yXeTwFXNVkxOhJzxjwZkYpKzsAEoMG
	2PUDnYIeWP66Qe
X-Received: by 2002:a05:600c:a08e:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-4953c390347mr101375915e9.39.1784237758557;
        Thu, 16 Jul 2026 14:35:58 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:35:57 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:38 +0300
Subject: [PATCH v7 02/13] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-2-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12301;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=MQOZUN5sOfzC0LslhdTuSv6dboTN5sRWAZchx7fQT2w=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xtGznIdCfPJUfhgpJxhbIOzG4d7e6HVqQl
 mjsxRVgYGOJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLL9hAAnsDmDKYLfHgDXsIYjqgRZOLaah6TPK6
 nF9CDj0IxuXvayU0vUpYD1Z9g6hs4QIZJfj/PdQUWqlob7lECKBfK6EluEeE6iYrvv8SRsGMYsH
 TeMQX1xie2y9Zv+hieDpJwv8gjwer20SlGOLmyTaUJW7d2oJc1W3dU7MQqnDeDbjPFmbCVdJuQ6
 lree89rZTBwR2oZH1zw/iPuqREGEKo9eIxR/cOsWLolUgbV+8PArylZ1bovU2wFuTHJlcYIQILr
 rk3i0Tk7MMlv0ibU2ADMxTVMtaoTh7+Zged9qZ9wBdWlQYC363wCkCnw8HLXTpB7t4ouMbjqHWL
 VbdhJc4NxhCdF4CgwkHkDfDRaeegBmtJ4AO1du+7Ae4wCpl+vZtUwJmLJVuWtnnJo7LN1JcOHd6
 W0t9jDshQo+iw5KXLES3C5UazEyymANB4DZBDQuzebu08EjwsmzZoPAU271oXizisM6/mojp3QX
 yoJRmD5rsyBbNXD50t6OiWlA5GWalKN0Ut+vJ25EIX/uk21yub0z+Y5RJ7Ld/kePpLs7M+Sm/yw
 Upcv5gyDfxD10ZWJ+FGDxwq7kpbaS57IrBRkOioKqDcMbDL1IsrY5f+v8TOWB86EbsDZMDJTDmp
 H2NI5kV7jB0uBGgQwcsMbviPMvhZ0dE1mR4LWtWSKRGXSAJe7cTc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
Clocks go from oscillator -> top -> matrix -> LSP, with a register in
top controlling most clocks that get passed to matrix and a register in
matrix controlling all the clocks that get passed to LSP.

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

Changes v6->v7:
*) Moved the bingings back into clock/ (Krzysztof). use clock-controller@
in example and in the later DTSI patch.

*) With as lucky find in strings in LTE's cpko.ko blob I could make sense
of the register that controls which clocks get passed from PLLs into
the clock distribution inside topcrm. Importantly that also narrows
which clocks can possibly be passed to Matrix, so I could slim down the
bindings considerably.

*) Add a usb phy child node with the phy schema added in the previous
patch. I don't expect the USB status register to ever be in another
place, so the binding expresses the @84 expectation.

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
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      | 123 +++++++++++++++++++++
 MAINTAINERS                                        |   3 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  66 +++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  32 ++++++
 4 files changed, 224 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
new file mode 100644
index 000000000000..454997063573
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3 top clock and reset controller generates clocks for core
+  devices on the board like the main bus, USB and timers. In addition to clocks
+  it has reset controls for peripherals, a global board reset, watchdog reset
+  controls and a USB status register.
+
+  The controller has two clock inputs: a 26 MHz and a 32 KHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  PLL output frequencies to downstream clock controllers.
+
+  The USB PHY functionality is exposed as a child node documented in
+  zte,zx297520v3-usb-phy.yaml.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. The resets are
+  defined in the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+  usb-phy@84:
+    type: object
+    $ref: /schemas/phy/zte,zx297520v3-usb-phy.yaml#
+    description:
+      USB and HSIC PHY controller.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - syscon-reboot
+  - usb-phy@84
+  - "#address-cells"
+  - "#size-cells"
+  - "#clock-cells"
+  - "#reset-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+    #include <dt-bindings/phy/phy-zte-zx297520v3-usb.h>
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    topcrm: clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        reg = <0x0013b000 0x400>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        syscon-reboot {
+          compatible = "syscon-reboot";
+          offset = <0x0>;
+          mask = <0x1>;
+          value = <0x1>;
+        };
+
+        usb-phy@84 {
+          compatible = "zte,zx297520v3-usb-phy";
+          reg = <0x84>;
+          interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+            <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+          interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+          resets = <&topcrm ZX297520V3_USB_PHY_RESET>,
+            <&topcrm ZX297520V3_HSIC_PHY_RESET>;
+          reset-names = "usb", "hsic";
+          #phy-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cb50c2e3b4ea..5f962b9947ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,10 +3878,13 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
+F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..1f010ff4e6ca
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,66 @@
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
+#define ZX297520V3_MPLL_D5			23
+#define ZX297520V3_DPLL				24
+#define ZX297520V3_GPLL				25
+#define ZX297520V3_GPLL_D2			26
+#define ZX297520V3_GATED_OSC26M			27
+#define ZX297520V3_PMM_WCLK			28
+#define ZX297520V3_PMM_PCLK			29
+#define ZX297520V3_OUT0_WCLK			30
+#define ZX297520V3_OUT1_WCLK			31
+#define ZX297520V3_OUT2_WCLK			32
+#define ZX297520V3_OUT32K_WCLK			33
+#define ZX297520V3_RMIIPHY_WCLK			34
+#define ZX297520V3_TIMER_T12_WCLK		35
+#define ZX297520V3_TIMER_T12_PCLK		36
+#define ZX297520V3_TIMER_T13_WCLK		37
+#define ZX297520V3_TIMER_T13_PCLK		38
+#define ZX297520V3_TIMER_T14_WCLK		39
+#define ZX297520V3_TIMER_T14_PCLK		40
+#define ZX297520V3_TIMER_T15_WCLK		41
+#define ZX297520V3_TIMER_T15_PCLK		42
+#define ZX297520V3_TIMER_T16_WCLK		43
+#define ZX297520V3_TIMER_T16_PCLK		44
+#define ZX297520V3_TIMER_T17_WCLK		45
+#define ZX297520V3_TIMER_T17_PCLK		46
+#define ZX297520V3_WDT_T18_WCLK			47
+#define ZX297520V3_WDT_T18_PCLK			48
+#define ZX297520V3_USIM1_WCLK			49
+#define ZX297520V3_USIM1_PCLK			50
+#define ZX297520V3_AHB_WCLK			51
+#define ZX297520V3_AHB_PCLK			52
+#define ZX297520V3_USB_WCLK			53
+#define ZX297520V3_USB_PCLK			54
+#define ZX297520V3_HSIC_WCLK			55
+#define ZX297520V3_HSIC_PCLK			56
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


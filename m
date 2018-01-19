Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 9/9] ARM: suniv: f1c100s: add device tree for Lichee Pi Nano
Date: Sat, 20 Jan 2018 07:17:35 +0800
Message-Id: <20180119231735.61504-10-icenowy@aosc.io>
In-Reply-To: <20180119231735.61504-1-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Lichee Pi Nano is a F1C100s board by Lichee Pi.

Add initial device tree for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts

diff --git a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
new file mode 100644
index 000000000000..11c891716acc
--- /dev/null
+++ b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR X11)
+/*
+ * Copyright 2018 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+/dts-v1/;
+#include "suniv-f1c100s.dtsi"
+
+/ {
+	model = "Lichee Pi Nano";
+	compatible = "licheepi,licheepi-nano", "allwinner,suniv-f1c100s",
+		     "allwinner,suniv";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
-- 
2.14.2

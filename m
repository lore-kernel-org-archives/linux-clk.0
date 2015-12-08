Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:33955 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932347AbbLHKiI (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 8 Dec 2015 05:38:08 -0500
From: Russell King <rmk+kernel@arm.linux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: add Marvell core PLL and clock divider
 PMU documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1a6Fei-0004de-1W@rmk-PC.arm.linux.org.uk>
Date: Tue, 08 Dec 2015 10:38:00 +0000
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add documentation for the Marvell clock divider driver, which is used
to source clocks for the AXI bus, video decoder, GPU and LCD blocks.

Acked-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 .../bindings/clock/dove-divider-clock.txt          | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/dove-divider-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
new file mode 100644
index 000000000000..e3eb0f657c5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
@@ -0,0 +1,28 @@
+PLL divider based Dove clocks
+
+Marvell Dove has a 2GHz PLL, which feeds into a set of dividers to provide
+high speed clocks for a number of peripherals.  These dividers are part of
+the PMU, and thus this node should be a child of the PMU node.
+
+The following clocks are provided:
+
+ID	Clock
+-------------
+0	AXI bus clock
+1	GPU clock
+2	VMeta clock
+3	LCD clock
+
+Required properties:
+- compatible : shall be "marvell,dove-divider-clock"
+- reg : shall be the register address of the Core PLL and Clock Divider
+   Control 0 register.  This will cover that register, as well as the
+   Core PLL and Clock Divider Control 1 register.  Thus, it will have
+   a size of 8.
+- #clock-cells : from common clock binding; shall be set to 1
+
+divider_clk: core-clock@0064 {
+	compatible = "marvell,dove-divider-clock";
+	reg = <0x0064 0x8>;
+	#clock-cells = <1>;
+};
-- 
2.1.0


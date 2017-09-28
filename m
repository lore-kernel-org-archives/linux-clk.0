Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM IPROC ARM ARCHITECTURE),
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH v2 02/10] dt-bindings: Add documentation for Broadcom Hurricane 2 SoCs
Date: Thu, 28 Sep 2017 16:14:54 -0700
Message-Id: <20170928231502.27069-3-f.fainelli@gmail.com>
In-Reply-To: <20170928231502.27069-1-f.fainelli@gmail.com>
References: <20170928231502.27069-1-f.fainelli@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Add binding documentation for the Broadcom Hurricane 2 SoCs used in
switching control planes.

Acked-by: Jon Mason <jon.mason@broadcom.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt
new file mode 100644
index 000000000000..a124c7fc4dcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt
@@ -0,0 +1,14 @@
+Broadcom Hurricane 2 device tree bindings
+---------------------------------------
+
+Broadcom Hurricane 2 family of SoCs are used for switching control. These SoCs
+are based on Broadcom's iProc SoC architecture and feature a single core Cortex
+A9 ARM CPUs, DDR2/DDR3 memory, PCIe GEN-2, USB 2.0 and USB 3.0, serial and NAND
+flash and a PCIe attached integrated switching engine.
+
+Boards with Hurricane SoCs shall have the following properties:
+
+Required root node property:
+
+BCM53342
+compatible = "brcm,bcm53342", "brcm,hr2";
-- 
2.14.1

Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>
Cc: Nadav Haklai <nadavh@marvell.com>,
	Lior Amsalem <alior@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 2/6] dt-bindings: clock: add DT bindings for AP806 core clocks
Date: Wed, 24 Feb 2016 16:14:22 +0100
Message-Id: <1456326866-30854-3-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1456326866-30854-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1456326866-30854-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

This commit adds the Device Tree binding description for the AP806
core clocks, used on Marvell Armada 7K/8K SOCs.

Since the AP806 core clocks register is part of the "DFX Server"
register area, the DT binding is meant to be used as a sub-node of the
DFX Server DT binding, which is described separately.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../clock/mvebu-armada-ap806-core-clock.txt        | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-armada-ap806-core-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/mvebu-armada-ap806-core-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-armada-ap806-core-clock.txt
new file mode 100644
index 0000000..996c47f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mvebu-armada-ap806-core-clock.txt
@@ -0,0 +1,35 @@
+* Clock bindings for Marvell MVEBU AP806 Core clocks
+
+The Marvell MVEBU Armada 7K/8K SoCs contain a block called AP806,
+hosting the CPU and other core components of the CPU. This Device Tree
+binding allows to describe the core clocks of the AP806, whose
+frequencies are determined by reading the Sample-At-Reset (SAR)
+register. This register is part of the DFX server register area,
+covered by the DT binding described at
+Documentation/devicetree/bindings/arm/marvell/marvell,ap806-dfx-server.txt. Therefore,
+the DT node for the AP806 Core clocks must appear as a child node of
+the DFX server Device Tree node.
+
+Clock consumers must specify the desired clock by having the clock ID
+in its "clocks" phandle cell.
+
+The following is a list of provided IDs and clock names for the core
+Armada AP806 clocks:
+
+ 0 = DDR
+ 1 = Ring
+ 2 = CPU
+
+Required properties:
+- compatible: must be be one of the following:
+	"marvell,armada-ap806-core-clock"
+- #clock-cells: from common clock binding; shall be set to 1
+- clock-output-names: name of the output clocks
+
+Example:
+
+	coreclk: clk@204 {
+		compatible = "marvell,armada-ap806-core-clock";
+		#clock-cells = <1>;
+		clock-output-names = "ddr", "ring", "cpu";
+	};
-- 
2.6.4

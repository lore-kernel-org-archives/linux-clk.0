Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Nadav Haklai <nadavh@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Omri Itach <omrii@marvell.com>,
	Shadi Ammouri <shadi@marvell.com>
Subject: [PATCH v2 2/7] dt-bindings: ap806: do not depend anymore of the *-clock-output-names
Date: Wed, 31 May 2017 16:07:23 +0200
Message-Id: <d502b5abc68cbb5739ce72ba8be27528f9042a28.1496239589.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the documentation according to the change made in the
patch "clk: mvebu: ap806: do not depend anymore of the
*-clock-output-names": the clock names are no more part of the binding.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 8968371d84e2..3faab71dff9f 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -21,15 +21,11 @@ Required properties:
      "marvell,ap806-system-controller", "syscon"
  - reg: register area of the AP806 system controller
  - #clock-cells: must be set to 1
- - clock-output-names: must be defined to:
-    "ap-cpu-cluster-0", "ap-cpu-cluster-1", "ap-fixed", "ap-mss"
 
 Example:
 
 	syscon: system-controller@6f4000 {
 		compatible = "marvell,ap806-system-controller", "syscon";
 		#clock-cells = <1>;
-		clock-output-names = "ap-cpu-cluster-0", "ap-cpu-cluster-1",
-				     "ap-fixed", "ap-mss";
 		reg = <0x6f4000 0x1000>;
 	};
-- 
git-series 0.9.1

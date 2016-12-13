Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Marcin Wojtas <mw@semihalf.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Hanna Hawa <hannah@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 1/3] dt-bindings: arm: update Armada CP110 system controller binding
Date: Tue, 13 Dec 2016 13:41:18 +0100
Message-Id: <1481632880-9198-2-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1481632880-9198-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1481632880-9198-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

It turns out that in the CP110 HW block present in Marvell Armada
7K/8K SoCs, gatable clock n°18 not only controls SD/MMC, but also the
GOP block. This commit updates the Device Tree binding for this piece
of hardware accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../devicetree/bindings/arm/marvell/cp110-system-controller0.txt    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index 30c5469..07dbb35 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -45,7 +45,7 @@ The following clocks are available:
    - 1 15	SATA
    - 1 16	SATA USB
    - 1 17	Main
-   - 1 18	SD/MMC
+   - 1 18	SD/MMC/GOP
    - 1 21	Slow IO (SPI, NOR, BootROM, I2C, UART)
    - 1 22	USB3H0
    - 1 23	USB3H1
@@ -65,7 +65,7 @@ Required properties:
 	"cpm-audio", "cpm-communit", "cpm-nand", "cpm-ppv2", "cpm-sdio",
 	"cpm-mg-domain", "cpm-mg-core", "cpm-xor1", "cpm-xor0", "cpm-gop-dp", "none",
 	"cpm-pcie_x10", "cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor", "cpm-sata",
-	"cpm-sata-usb", "cpm-main", "cpm-sd-mmc", "none", "none", "cpm-slow-io",
+	"cpm-sata-usb", "cpm-main", "cpm-sd-mmc-gop", "none", "none", "cpm-slow-io",
 	"cpm-usb3h0", "cpm-usb3h1", "cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 
 Example:
@@ -78,6 +78,6 @@ Example:
 		gate-clock-output-names = "cpm-audio", "cpm-communit", "cpm-nand", "cpm-ppv2", "cpm-sdio",
 			"cpm-mg-domain", "cpm-mg-core", "cpm-xor1", "cpm-xor0", "cpm-gop-dp", "none",
 			"cpm-pcie_x10", "cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor", "cpm-sata",
-			"cpm-sata-usb", "cpm-main", "cpm-sd-mmc", "none", "none", "cpm-slow-io",
+			"cpm-sata-usb", "cpm-main", "cpm-sd-mmc-gop", "none", "none", "cpm-slow-io",
 			"cpm-usb3h0", "cpm-usb3h1", "cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 	};
-- 
2.7.4

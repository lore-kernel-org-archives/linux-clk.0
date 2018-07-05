Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Faiz Abbas <faiz_abbas@ti.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>
Subject: [PATCH v4 6/6] ARM: dts: dra76x: Add MCAN node
Date: Thu, 5 Jul 2018 19:53:19 +0530
Message-ID: <20180705142319.19583-7-faiz_abbas@ti.com>
In-Reply-To: <20180705142319.19583-1-faiz_abbas@ti.com>
References: <20180705142319.19583-1-faiz_abbas@ti.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, paul@pwsan.com, tony@atomide.com, faiz_abbas@ti.com,
 t-kristo@ti.com, robh+dt@kernel.org, bcousson@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Franklin S Cooper Jr <fcooper@ti.com>

Add support for the MCAN peripheral which supports both classic
CAN messages along with the new CAN-FD message.

Add MCAN node to evm and enable it with a maximum datarate of 5 mbps

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 arch/arm/boot/dts/dra76-evm.dts |  6 ++++++
 arch/arm/boot/dts/dra76x.dtsi   | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index c07f0051844d..0ac533784b11 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -436,3 +436,9 @@
 	phys = <&pcie1_phy>, <&pcie2_phy>;
 	phy-names = "pcie-phy0", "pcie-phy1";
 };
+
+&m_can0 {
+	can-transceiver {
+		max-bitrate = <5000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index 5157cc431574..613e4dc0ed3e 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -26,6 +26,19 @@
 			ti,syss-mask = <1>;
 			clocks = <&wkupaon_clkctrl DRA7_ADC_CLKCTRL 0>;
 			clock-names = "fck";
+
+			m_can0: mcan@1a00 {
+				compatible = "bosch,m_can";
+				reg = <0x1a00 0x4000>, <0x0 0x18FC>;
+				reg-names = "m_can", "message_ram";
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "int0", "int1";
+				clocks = <&mcan_clk>, <&l3_iclk_div>;
+				clock-names = "cclk", "hclk";
+				bosch,mram-cfg = <0x0 0 0 32 0 0 1 1>;
+			};
 		};
 	};
 
-- 
2.17.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

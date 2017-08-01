Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:40366 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751884AbdHANPE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Aug 2017 09:15:04 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 12/13] [NOT FOR REVIEW NOW] ARM: sun8i: h3: enable DesignWare HDMI controller
Date: Tue,  1 Aug 2017 21:13:03 +0800
Message-Id: <20170801131304.7741-13-icenowy@aosc.io>
In-Reply-To: <20170801131304.7741-1-icenowy@aosc.io>
References: <20170801131304.7741-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The H3 SoC has a DesignWare HDMI controller with some Allwinner-specific
glues.

Add the related device nodes.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 75ad7b65a7fc..cd38d7e04606 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -197,6 +197,11 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+
+					tcon0_out_hdmi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hdmi_in_tcon0>;
+					};
 				};
 			};
 		};
@@ -240,6 +245,36 @@
 				};
 			};
 		};
+
+		hdmi: hdmi@1ee0000 {
+			compatible = "allwinner,h3-dw-hdmi";
+			reg = <0x01ee0000 0x10000>,
+			      <0x01ef0000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI>,
+				 <&ccu CLK_HDMI_DDC>;
+			clock-names = "iahb", "isfr", "iddc";
+			resets = <&ccu RST_BUS_HDMI0>, <&ccu RST_BUS_HDMI1>;
+			reset-names = "hdmi", "ddc";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					hdmi_in_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_out_hdmi>;
+					};
+				};
+			};
+		};
 	};
 
 	timer {
-- 
2.13.0


Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 18/19] ARM: sun5i: r8: Add AHB gates to the DTSI
Date: Fri, 30 Oct 2015 15:21:04 +0100
Message-Id: <1446214865-3972-19-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Add the gates definition to the R8 DTSI.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-r8.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
index 691d3de75b35..d69df3a73cbf 100644
--- a/arch/arm/boot/dts/sun5i-r8.dtsi
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -57,4 +57,33 @@
 			status = "disabled";
 		};
 	};
+
+	clocks {
+		ahb_gates: clk@01c20060 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun5i-r8-ahb-gates-clk";
+			reg = <0x01c20060 0x8>;
+			clocks = <&ahb>;
+			clock-indices = <0>, <1>,
+					<2>, <5>, <6>,
+					<7>, <8>, <9>,
+					<10>, <13>,
+					<14>, <20>,
+					<21>, <22>,
+					<28>, <32>, <34>,
+					<36>, <40>, <44>,
+					<46>, <51>,
+					<52>;
+			clock-output-names = "ahb_usbotg", "ahb_ehci",
+					     "ahb_ohci", "ahb_ss", "ahb_dma",
+					     "ahb_bist", "ahb_mmc0", "ahb_mmc1",
+					     "ahb_mmc2", "ahb_nand",
+					     "ahb_sdram", "ahb_spi0",
+					     "ahb_spi1", "ahb_spi2",
+					     "ahb_stimer", "ahb_ve", "ahb_tve",
+					     "ahb_lcd", "ahb_csi", "ahb_de_be",
+					     "ahb_de_fe", "ahb_iep",
+					     "ahb_mali400";
+		};
+	};
 };
-- 
2.6.2

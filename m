Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC331F9A6;
	Thu,  5 Mar 2026 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696637; cv=none; b=fPaq/lgGqN5Tf15a/VWlfvp9fyq6jkdT6sZEfwBTljoMhXTpZbHp6FcTygqQv2R2aWTx6Dz3nKNsdg3jKkEHLIe4kInyTNhIPNcI8kkOOv61/x4Ah/E5wy77ppjW8UhcJlFsNfg3qlm7S3U4RXv8EoMhfwv65bb8RT6X1vNGGrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696637; c=relaxed/simple;
	bh=zG9U1xX13l6MHhCD0C7qV5ky/pBEDneYdYb2A/3MZk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEiqJDCQ6YeNVKY7wTNjPdyVL0/GV9oRmO6Detp8OgNofMSxjJu1pPm6/dZUpNVr6KFDaknxoDlDs2Tgc4ntQIKiy03guUKCJAtVJp0peRVX3XDxBg71Yxu9n/vURL3pC6OiZjf9KppIEvMgNf2GC+2f1LXoGkKNbFOTPjG3IfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 4 Mar
 2026 23:42:58 -0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>
Subject: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
Date: Thu, 5 Mar 2026 15:43:27 +0800
Message-ID: <20260305074328.639993-4-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260305074328.639993-1-jian.hu@amlogic.com>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)

Add the required clock controller nodes for Amlogic T7 SoC family:
- SCMI clock controller
- PLL clock controller
- Peripheral clock controller

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6510068bcff9..6ea1b583b13d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -6,6 +6,9 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
 #include "amlogic-t7-reset.h"
+#include <dt-bindings/clock/amlogic,t7-scmi.h>
+#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -201,6 +204,33 @@ pwrc: power-controller {
 		};
 	};
 
+	sram@f7042000 {
+		compatible = "mmio-sram";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0xf7042000 0x100>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000c1>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -224,6 +254,42 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_periphs:clock-controller@0 {
+				compatible = "amlogic,t7-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x1c8>;
+				#clock-cells = <1>;
+				clocks = <&xtal>,
+					 <&scmi_clk CLKID_SYS_CLK>,
+					 <&scmi_clk CLKID_FIXED_PLL>,
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&scmi_clk CLKID_FCLK_DIV2P5>,
+					 <&scmi_clk CLKID_FCLK_DIV3>,
+					 <&scmi_clk CLKID_FCLK_DIV4>,
+					 <&scmi_clk CLKID_FCLK_DIV5>,
+					 <&scmi_clk CLKID_FCLK_DIV7>,
+					 <&hifi CLKID_HIFI_PLL>,
+					 <&gp0 CLKID_GP0_PLL>,
+					 <&gp1 CLKID_GP1_PLL>,
+					 <&mpll CLKID_MPLL1>,
+					 <&mpll CLKID_MPLL2>,
+					 <&mpll CLKID_MPLL3>;
+				clock-names = "xtal",
+					      "sys",
+					      "fix",
+					      "fdiv2",
+					      "fdiv2p5",
+					      "fdiv3",
+					      "fdiv4",
+					      "fdiv5",
+					      "fdiv7",
+					      "hifi",
+					      "gp0",
+					      "gp1",
+					      "mpll1",
+					      "mpll2",
+					      "mpll3";
+			};
+
 			reset: reset-controller@2000 {
 				compatible = "amlogic,t7-reset";
 				reg = <0x0 0x2000 0x0 0x98>;
@@ -234,6 +300,7 @@ watchdog@2100 {
 				compatible = "amlogic,t7-wdt";
 				reg = <0x0 0x2100 0x0 0x10>;
 				clocks = <&xtal>;
+
 			};
 
 			periphs_pinctrl: pinctrl@4000 {
@@ -269,6 +336,64 @@ uart_a: serial@78000 {
 				status = "disabled";
 			};
 
+			gp0:clock-controller@8080 {
+				compatible = "amlogic,t7-gp0-pll";
+				reg = <0x0 0x8080 0x0 0x20>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			gp1:clock-controller@80c0 {
+				compatible = "amlogic,t7-gp1-pll";
+				reg = <0x0 0x80c0 0x0 0x14>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			hifi:clock-controller@8100 {
+				compatible = "amlogic,t7-hifi-pll";
+				reg = <0x0 0x8100 0x0 0x20>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			pcie:clock-controller@8140 {
+				compatible = "amlogic,t7-pcie-pll";
+				reg = <0x0 0x8140 0x0 0x1c>;
+				clocks = <&scmi_clk CLKID_PCIE_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			mpll:clock-controller@8180 {
+				compatible = "amlogic,t7-mpll";
+				reg = <0x0 0x8180 0x0 0x28>;
+				clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			hdmi:clock-controller@81c0 {
+				compatible = "amlogic,t7-hdmi-pll";
+				reg = <0x0 0x81c0 0x0 0x20>;
+				clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			mclk:clock-controller@8300 {
+				compatible = "amlogic,t7-mclk-pll";
+				reg = <0x0 0x8300 0x0 0x18>;
+				clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "in0", "in1", "in2";
+				#clock-cells = <1>;
+			};
+
 			sec_ao: ao-secure@10220 {
 				compatible = "amlogic,t7-ao-secure",
 					     "amlogic,meson-gx-ao-secure",
-- 
2.47.1


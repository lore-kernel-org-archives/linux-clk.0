Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884272;
	b=QugP7+UkTniLuHqBPISerzU7w6LK6JtT77Gy0bpPDUSn7dt6v+RK4uZf+s76kAGHUzhn
	 bvKpk438FMcNaHHy0g7bh+AlLswAv5+qsezSidkVUn/cLdjc3sfCPGqhK4d0ZsgY85Kwk
	 MHrU/yoHLRQ5yFnDE+lQrwGiT7g+svlQMFx8ze/1m7SNkFctx776O0aqqB+fUVp2ao2jW
	 ZP0pTz8+nYwZUaxVyeKQdQ0mJrtp1bJt9ST32oGhU0HpvUJzBE8FZ58QovuZqVD2FSIQL
	 NaYbc4pOCXy9eVJZF2qIXL/nugaRvodQ2hPdISzpMNoIwXIZM8LvQSQEA4ROeUg05bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884272;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ruLa86P18Fdumb7ujKjvBhfoYLZlsxik3WmFEGPEtSw=;
	b=H8uyP9jMBJxlxSEpZcVs9pzcvYv93mdWHv3OiRfDqeVJOJUixmh7vkcPWd3W1BrStpKg
	 sJhHbuguCzr39DG88VkJGvU6wdXb1Z7vyU7n6UXl4b/EN2mwlgVJPPyBke145ncyAO5OR
	 EGTAfjcobTy1xQvyIs5s1KLmc9m4kWwv8WFBrVQBec3iYoNU2NGNeyAVKrScltuRuqfAw
	 pIyTnmnS8rDtuxkRGVp6emNa9FmduZuwc9vZFMpDECUFqjO8uUvu8UL0/yzhZbH27H5xK
	 Cu1vOB3P/PW/83YOrO1HlQiiD6u3x517j4eTKREHD7GV2b71f3cfxy+NmQWBksFvvzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b="DMkqs/u5";
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FA606D820;
	Thu,  5 Nov 2026 13:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906FA606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=DMkqs/u5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31D681496565;
	Thu, 05 Nov 2026 14:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884304; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ruLa86P18Fdumb7ujKjvBhfoYLZlsxik3WmFEGPEtSw=;
	b=DMkqs/u57bx8sgzU58rMIZSU/dC9zA3f94Wpak/2QdRSCoNhD++JK/LyzZF0S2I/0qsc1u
	xxUoRYqJJ/l9YdW4UDNOcnz4C1ArE6BjkGvGYWQoKue0UGMDr9XbdhFabVc1mBq5+7ks64
	sHx/3TJ9T/k1rjIuEEFSDC5jF9hi/heS3Dsw4PpZPSPKNPRbPzK2LuCPIMl0WPnkiL1PyK
	jQfyDbX8fs3BJWLrS/b4YpWKcVXLXGPQr00NRG1tMeiggpITeg7MnsTce5bv8WvX2PxhXr
	ieGNMGHlUH2taiYZjWKXT3XfydAwGj6Mo3haToKJyBNC7XW92qe0sOclEq8zQA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 12/16] ARM: dts: microchip: Use new per SoC PMC bindings
Date: Thu,  5 Nov 2026 12:06:48 +0100
Message-ID: <20261105110715.2486432-13-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The bindings were split up per SoC before adding new members for
missing clocks.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Adapted to renamed defines
    
    v3:
    - extend to all at91 family SoCs
    
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/at91rm9200.dtsi  |  3 ++-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi | 19 ++++++++-------
 arch/arm/boot/dts/microchip/at91sam9261.dtsi |  7 +++---
 arch/arm/boot/dts/microchip/at91sam9263.dtsi |  9 +++----
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi | 11 +++++----
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi |  7 +++---
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi  |  9 +++----
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi  | 11 +++++----
 arch/arm/boot/dts/microchip/sam9x60.dtsi     | 15 ++++++------
 arch/arm/boot/dts/microchip/sam9x7.dtsi      | 13 +++++-----
 arch/arm/boot/dts/microchip/sama5d2.dtsi     | 25 ++++++++++----------
 arch/arm/boot/dts/microchip/sama5d3.dtsi     |  9 +++----
 arch/arm/boot/dts/microchip/sama5d4.dtsi     |  9 +++----
 arch/arm/boot/dts/microchip/sama7d65.dtsi    | 15 ++++++------
 arch/arm/boot/dts/microchip/sama7g5.dtsi     | 23 +++++++++---------
 15 files changed, 100 insertions(+), 85 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
index e105ad855ce8b..f158c1d70ac2d 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91rm9200-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -601,7 +602,7 @@ dbgu: serial@fffff200 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91RM9200_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
index fc0b6a73204f8..76184155e6746 100644
--- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -127,20 +128,20 @@ pmc: clock-controller@fffffc00 {
 			reset-controller@fffffd00 {
 				compatible = "atmel,at91sam9260-rstc";
 				reg = <0xfffffd00 0x10>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
 			};
 
 			shdwc: poweroff@fffffd10 {
 				compatible = "atmel,at91sam9260-shdwc";
 				reg = <0xfffffd10 0x10>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
 			};
 
 			pit: timer@fffffd30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffd30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			};
 
 			tcb0: timer@fffa0000 {
@@ -151,7 +152,7 @@ tcb0: timer@fffa0000 {
 				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 0>,
 					     <18 IRQ_TYPE_LEVEL_HIGH 0>,
 					     <19 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&pmc PMC_TYPE_PERIPHERAL 18>, <&pmc PMC_TYPE_PERIPHERAL 19>, <&pmc PMC_TYPE_CORE PMC_SLOW>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&pmc PMC_TYPE_PERIPHERAL 18>, <&pmc PMC_TYPE_PERIPHERAL 19>, <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
 				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
 			};
 
@@ -163,7 +164,7 @@ tcb1: timer@fffdc000 {
 				interrupts = <26 IRQ_TYPE_LEVEL_HIGH 0>,
 					     <27 IRQ_TYPE_LEVEL_HIGH 0>,
 					     <28 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_PERIPHERAL 28>, <&pmc PMC_TYPE_CORE PMC_SLOW>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_PERIPHERAL 28>, <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
 				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
 			};
 
@@ -537,7 +538,7 @@ dbgu: serial@fffff200 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -720,7 +721,7 @@ rtc@fffffd20 {
 				compatible = "atmel,at91sam9260-rtt";
 				reg = <0xfffffd20 0x10>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
 				status = "disabled";
 			};
 
@@ -728,7 +729,7 @@ watchdog: watchdog@fffffd40 {
 				compatible = "atmel,at91sam9260-wdt";
 				reg = <0xfffffd40 0x10>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
 				atmel,watchdog-type = "hardware";
 				atmel,reset-type = "all";
 				atmel,dbg-halt;
@@ -766,7 +767,7 @@ ebi: ebi@10000000 {
 				  0x5 0x0 0x60000000 0x10000000
 				  0x6 0x0 0x70000000 0x10000000
 				  0x7 0x0 0x80000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
diff --git a/arch/arm/boot/dts/microchip/at91sam9261.dtsi b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
index d1d678b77e84b..57643738b7c9a 100644
--- a/arch/arm/boot/dts/microchip/at91sam9261.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -112,7 +113,7 @@ ebi: ebi@10000000 {
 				  0x5 0x0 0x60000000 0x10000000
 				  0x6 0x0 0x70000000 0x10000000
 				  0x7 0x0 0x80000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -309,7 +310,7 @@ dbgu: serial@fffff200 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -624,7 +625,7 @@ pit: timer@fffffd30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffd30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			};
 
 			rtc@fffffd20 {
diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
index a4b5d1f228f9c..48feaa2415bb6 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -139,7 +140,7 @@ pit: timer@fffffd30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffd30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			};
 
 			tcb0: timer@fff7c000 {
@@ -545,7 +546,7 @@ dbgu: serial@ffffee00 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -790,7 +791,7 @@ ebi0: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller0: nand-controller {
@@ -811,7 +812,7 @@ ebi1: ebi@70000000 {
 			reg = <0x80000000 0x20000000>;
 			ranges = <0x0 0x0 0x80000000 0x10000000
 				  0x1 0x0 0x90000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller1: nand-controller {
diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
index 4e00ed2d3ecdf..edc703e2a003d 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9g45-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -148,7 +149,7 @@ pit: timer@fffffd30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffd30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9G45_PMC_MCK>;
 			};
 
 
@@ -681,7 +682,7 @@ dbgu: serial@ffffee00 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9G45_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -918,7 +919,7 @@ usb2: gadget@fff78000 {
 				reg = <0x00600000 0x80000
 				       0xfff78000 0x400>;
 				interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE AT91SAM9G45_PMC_UPLLCK>;
 				clock-names = "pclk", "hclk";
 				status = "disabled";
 			};
@@ -977,7 +978,7 @@ usb1: usb@800000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00800000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9G45_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 22>;
 			clock-names = "usb_clk", "ehci_clk";
 			status = "disabled";
 		};
@@ -995,7 +996,7 @@ ebi: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9G45_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
index af41c3dbb4bfb..ee7027387292f 100644
--- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9n12-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -137,7 +138,7 @@ pit: timer@fffffe30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9N12_PMC_MCK>;
 			};
 
 			poweroff@fffffe10 {
@@ -581,7 +582,7 @@ dbgu: serial@fffff200 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9N12_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -770,7 +771,7 @@ ebi: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9N12_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
diff --git a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
index de74cf2980a04..78ede09d34861 100644
--- a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/pinctrl/at91.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pwm/pwm.h>
@@ -112,7 +113,7 @@ ebi: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -287,7 +288,7 @@ usb0: gadget@fffd4000 {
 				reg = <0x00600000 0x100000>,
 				      <0xfffd4000 0x4000>;
 				interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 22>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 22>, <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_UTMI>;
 				clock-names = "pclk", "hclk";
 				status = "disabled";
 			};
@@ -331,7 +332,7 @@ dbgu: serial@fffff200 {
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_dbgu>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -788,7 +789,7 @@ pit: timer@fffffd30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffd30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_MCK>;
 			};
 
 			watchdog@fffffd40 {
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
index 9070fd06995a0..bae6c510364cb 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9x5-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -151,7 +152,7 @@ pit: timer@fffffe30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe30 0xf>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9X5_PMC_MCK>;
 			};
 
 			clk32k: clock-controller@fffffe50 {
@@ -682,7 +683,7 @@ dbgu: serial@fffff200 {
 				dmas = <&dma1 1 AT91_DMA_CFG_PER_ID(8)>,
 				       <&dma1 1 (AT91_DMA_CFG_PER_ID(9) | AT91_DMA_CFG_FIFOCFG_ASAP)>;
 				dma-names = "tx", "rx";
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9X5_PMC_MCK>;
 				clock-names = "usart";
 				status = "disabled";
 			};
@@ -852,7 +853,7 @@ usb2: gadget@f803c000 {
 				reg = <0x00500000 0x80000
 				       0xf803c000 0x400>;
 				interrupts = <23 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 23>;
+				clocks = <&pmc PMC_TYPE_CORE AT91SAM9X5_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 23>;
 				clock-names = "hclk", "pclk";
 				status = "disabled";
 			};
@@ -899,7 +900,7 @@ usb1: usb@700000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9X5_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 22>;
 			clock-names = "usb_clk", "ehci_clk";
 			status = "disabled";
 		};
@@ -917,7 +918,7 @@ ebi: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE AT91SAM9X5_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index e708b3df4ccd3..4b777c61c1e09 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x60-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 #include <dt-bindings/mfd/atmel-flexcom.h>
 
@@ -79,9 +80,9 @@ usb0: gadget@500000 {
 			reg = <0x00500000 0x100000
 				0xf803c000 0x400>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_CORE SAM9X60_PMC_UPLLCK>;
 			clock-names = "pclk", "hclk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_UPLLCK>;
 			assigned-clock-rates = <480000000>;
 			status = "disabled";
 		};
@@ -99,9 +100,9 @@ usb2: usb@700000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 22>;
 			clock-names = "usb_clk", "ehci_clk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_UPLLCK>;
 			assigned-clock-rates = <480000000>;
 			status = "disabled";
 		};
@@ -119,7 +120,7 @@ ebi: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -1061,7 +1062,7 @@ hlcdc: hlcdc@f8038000 {
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_GCK 25>, <&clk32k 1>;
 				clock-names = "periph_clk","sys_clk", "slow_clk";
 				assigned-clocks = <&pmc PMC_TYPE_GCK 25>;
-				assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MCK>;
 				status = "disabled";
 
 				hlcdc-display-controller {
@@ -1367,7 +1368,7 @@ pit: timer@fffffe40 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe40 0x10>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MCK>;
 			};
 
 			clk32k: clock-controller@fffffe50 {
diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index c680a5033b6b4..76294dd6c4771 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x7-pmc.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -288,7 +289,7 @@ AT91_XDMAC_DT_PERID(26))>,
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 35>, <&pmc PMC_TYPE_GCK 35>;
 			clock-names = "pclk", "gclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 35>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_PLLADIV2>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X7_PMC_PLLADIV2>;
 			status = "disabled";
 		};
 
@@ -500,9 +501,9 @@ can0: can@f8000000 {
 			interrupt-names = "int0", "int1";
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 29>, <&pmc PMC_TYPE_GCK 29>;
 			clock-names = "hclk", "cclk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_GCK 29>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UPLLCK>, <&pmc PMC_TYPE_GCK 29>;
 			assigned-clock-rates = <480000000>, <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UPLLCK>, <&pmc PMC_TYPE_CORE SAM9X7_PMC_UPLLCK>;
 			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -516,9 +517,9 @@ can1: can@f8004000 {
 			interrupt-names = "int0", "int1";
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 30>, <&pmc PMC_TYPE_GCK 30>;
 			clock-names = "hclk", "cclk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_GCK 30>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UPLLCK>, <&pmc PMC_TYPE_GCK 30>;
 			assigned-clock-rates = <480000000>, <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UPLLCK>, <&pmc PMC_TYPE_CORE SAM9X7_PMC_UPLLCK>;
 			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -1158,7 +1159,7 @@ pmecc: ecc-engine@ffffe000 {
 		mpddrc: mpddrc@ffffe800 {
 			compatible = "microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc";
 			reg = <0xffffe800 0x200>;
-			clocks = <&pmc PMC_TYPE_SYSTEM 2>, <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_SYSTEM 2>, <&pmc PMC_TYPE_CORE SAM9X7_PMC_MCK>;
 			clock-names = "ddrck", "mpddr";
 		};
 
diff --git a/arch/arm/boot/dts/microchip/sama5d2.dtsi b/arch/arm/boot/dts/microchip/sama5d2.dtsi
index fde890f18d201..f23280f04e5c6 100644
--- a/arch/arm/boot/dts/microchip/sama5d2.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d2.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,sama5d2-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 #include <dt-bindings/iio/adc/at91-sama5d2_adc.h>
 
@@ -47,7 +48,7 @@ etb@740000 {
 		compatible = "arm,coresight-etb10", "arm,primecell";
 		reg = <0x740000 0x1000>;
 
-		clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+		clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_MCK>;
 		clock-names = "apb_pclk";
 
 		in-ports {
@@ -63,7 +64,7 @@ etm@73c000 {
 		compatible = "arm,coresight-etm3x", "arm,primecell";
 		reg = <0x73c000 0x1000>;
 
-		clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+		clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_MCK>;
 		clock-names = "apb_pclk";
 
 		out-ports {
@@ -133,7 +134,7 @@ usb0: gadget@300000 {
 			reg = <0x00300000 0x100000
 			       0xfc02c000 0x400>;
 			interrupts = <42 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 42>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 42>, <&pmc PMC_TYPE_CORE SAMA5D2_PMC_UPLLCK>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 		};
@@ -151,7 +152,7 @@ usb2: usb@500000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00500000 0x100000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 41>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 41>;
 			clock-names = "usb_clk", "ehci_clk";
 			status = "disabled";
 		};
@@ -176,7 +177,7 @@ ebi: ebi@10000000 {
 				  0x1 0x0 0x60000000 0x10000000
 				  0x2 0x0 0x70000000 0x10000000
 				  0x3 0x0 0x80000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK2>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_MCK2>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -195,7 +196,7 @@ sdmmc0: sdio-host@a0000000 {
 			compatible = "atmel,sama5d2-sdhci";
 			reg = <0xa0000000 0x300>;
 			interrupts = <31 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 31>, <&pmc PMC_TYPE_GCK 31>, <&pmc PMC_TYPE_CORE PMC_MAIN>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 31>, <&pmc PMC_TYPE_GCK 31>, <&pmc PMC_TYPE_CORE SAMA5D2_PMC_MAIN>;
 			clock-names = "hclock", "multclk", "baseclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 31>;
 			assigned-clock-rates = <480000000>;
@@ -206,7 +207,7 @@ sdmmc1: sdio-host@b0000000 {
 			compatible = "atmel,sama5d2-sdhci";
 			reg = <0xb0000000 0x300>;
 			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 32>, <&pmc PMC_TYPE_GCK 32>, <&pmc PMC_TYPE_CORE PMC_MAIN>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 32>, <&pmc PMC_TYPE_GCK 32>, <&pmc PMC_TYPE_CORE SAMA5D2_PMC_MAIN>;
 			clock-names = "hclock", "multclk", "baseclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 32>;
 			assigned-clock-rates = <480000000>;
@@ -696,7 +697,7 @@ pit: timer@f8048030 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xf8048030 0x10>;
 				interrupts = <3 IRQ_TYPE_LEVEL_HIGH 5>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK2>;
+				clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_MCK2>;
 			};
 
 			watchdog: watchdog@f8048040 {
@@ -734,7 +735,7 @@ AT91_XDMAC_DT_PERID(31))>,
 				dma-names = "tx", "rx";
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 54>, <&pmc PMC_TYPE_GCK 54>;
 				clock-names = "pclk", "gclk";
-				assigned-clocks = <&pmc PMC_TYPE_CORE PMC_I2S0_MUX>;
+				assigned-clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_I2S0_MUX>;
 				assigned-clock-parents = <&pmc PMC_TYPE_GCK 54>;
 				status = "disabled";
 			};
@@ -749,7 +750,7 @@ can0: can@f8054000 {
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 56>, <&pmc PMC_TYPE_GCK 56>;
 				clock-names = "hclk", "cclk";
 				assigned-clocks = <&pmc PMC_TYPE_GCK 56>;
-				assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+				assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_UPLLCK>;
 				assigned-clock-rates = <40000000>;
 				bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
 				status = "disabled";
@@ -1134,7 +1135,7 @@ AT91_XDMAC_DT_PERID(33))>,
 				dma-names = "tx", "rx";
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 55>, <&pmc PMC_TYPE_GCK 55>;
 				clock-names = "pclk", "gclk";
-				assigned-clocks = <&pmc PMC_TYPE_CORE PMC_I2S1_MUX>;
+				assigned-clocks = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_I2S1_MUX>;
 				assigned-clock-parents = <&pmc PMC_TYPE_GCK 55>;
 				status = "disabled";
 			};
@@ -1149,7 +1150,7 @@ can1: can@fc050000 {
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 57>, <&pmc PMC_TYPE_GCK 57>;
 				clock-names = "hclk", "cclk";
 				assigned-clocks = <&pmc PMC_TYPE_GCK 57>;
-				assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+				assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA5D2_PMC_UPLLCK>;
 				assigned-clock-rates = <40000000>;
 				bosch,mram-cfg = <0x1c00 0 0 64 0 0 32 32>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/microchip/sama5d3.dtsi b/arch/arm/boot/dts/microchip/sama5d3.dtsi
index 00ba59ac1968c..cefad06cd67e0 100644
--- a/arch/arm/boot/dts/microchip/sama5d3.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,sama5d3-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 
 / {
@@ -1028,7 +1029,7 @@ pit: timer@fffffe30 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe30 0xf>;
 				interrupts = <3 IRQ_TYPE_LEVEL_HIGH 5>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE SAMA5D3_PMC_MCK>;
 			};
 
 			watchdog: watchdog@fffffe40 {
@@ -1071,7 +1072,7 @@ usb0: gadget@500000 {
 			reg = <0x00500000 0x100000
 			       0xf8030000 0x4000>;
 			interrupts = <33 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 33>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 33>, <&pmc PMC_TYPE_CORE SAMA5D3_PMC_UPLLCK>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 		};
@@ -1089,7 +1090,7 @@ usb2: usb@700000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 32>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA5D3_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 32>;
 			clock-names = "usb_clk", "ehci_clk";
 			status = "disabled";
 		};
@@ -1105,7 +1106,7 @@ ebi: ebi@10000000 {
 				  0x1 0x0 0x40000000 0x10000000
 				  0x2 0x0 0x50000000 0x10000000
 				  0x3 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA5D3_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
diff --git a/arch/arm/boot/dts/microchip/sama5d4.dtsi b/arch/arm/boot/dts/microchip/sama5d4.dtsi
index ec1d68c640dea..318d3bdb47e31 100644
--- a/arch/arm/boot/dts/microchip/sama5d4.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d4.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,sama5d4-pmc.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/mfd/at91-usart.h>
 #include <dt-bindings/pinctrl/at91.h>
@@ -116,7 +117,7 @@ usb0: gadget@400000 {
 			reg = <0x00400000 0x100000
 			       0xfc02c000 0x4000>;
 			interrupts = <47 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 47>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 47>, <&pmc PMC_TYPE_CORE SAMA5D4_PMC_UPLLCK>;
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 		};
@@ -134,7 +135,7 @@ usb2: usb@600000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00600000 0x100000>;
 			interrupts = <46 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA5D4_PMC_UPLLCK>, <&pmc PMC_TYPE_PERIPHERAL 46>;
 			clock-names = "usb_clk", "ehci_clk";
 			status = "disabled";
 		};
@@ -159,7 +160,7 @@ ebi: ebi@10000000 {
 				  0x1 0x0 0x60000000 0x10000000
 				  0x2 0x0 0x70000000 0x10000000
 				  0x3 0x0 0x80000000 0x8000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA5D4_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -753,7 +754,7 @@ pit: timer@fc068630 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfc068630 0x10>;
 				interrupts = <3 IRQ_TYPE_LEVEL_HIGH 5>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK2>;
+				clocks = <&pmc PMC_TYPE_CORE SAMA5D4_PMC_MCK2>;
 			};
 
 			watchdog: watchdog@fc068640 {
diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index ec200848c153f..aec4244f99972 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7d65-pmc.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -30,7 +31,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
 			device_type = "cpu";
-			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_CPUPLL>;
 			clock-names = "cpu";
 			d-cache-size = <0x8000>;	// L1, 32 KB
 			i-cache-size = <0x8000>;	// L1, 32 KB
@@ -191,7 +192,7 @@ can0: can@e0828000 {
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 58>;
 			assigned-clock-rates = <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_USBPLL>;
 			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -207,7 +208,7 @@ can1: can@e082c000 {
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 59>;
 			assigned-clock-rates = <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_USBPLL>;
 			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -223,7 +224,7 @@ can2: can@e0830000 {
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 60>;
 			assigned-clock-rates = <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_USBPLL>;
 			bosch,mram-cfg = <0xbc00 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -239,7 +240,7 @@ can3: can@e0834000 {
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 61>;
 			assigned-clock-rates = <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_USBPLL>;
 			bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -255,7 +256,7 @@ can4: can@e0838000 {
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 62>;
 			assigned-clock-rates = <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_USBPLL>;
 			bosch,mram-cfg = <0x4400 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -279,7 +280,7 @@ sdmmc1: mmc@e1208000 {
 			clock-names = "hclock", "multclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 76>;
 			assigned-clock-rates = <200000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK1>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_MCK1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 03ef3d9aaeec6..b8296391fc696 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7g5-pmc.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/at91-usart.h>
@@ -34,7 +35,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_CPUPLL>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -202,7 +203,7 @@ ebi: ebi@40000000 {
 				  0x1 0x0 0x48000000 0x8000000
 				  0x2 0x0 0x50000000 0x8000000
 				  0x3 0x0 0x58000000 0x8000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MCK1>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -385,7 +386,7 @@ can0: can@e0828000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 61>, <&pmc PMC_TYPE_GCK 61>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 61>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -401,7 +402,7 @@ can1: can@e082c000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 62>, <&pmc PMC_TYPE_GCK 62>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 62>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -417,7 +418,7 @@ can2: can@e0830000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 63>, <&pmc PMC_TYPE_GCK 63>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 63>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0xbc00 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -433,7 +434,7 @@ can3: can@e0834000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 64>, <&pmc PMC_TYPE_GCK 64>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 64>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -449,7 +450,7 @@ can4: can@e0838000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 65>, <&pmc PMC_TYPE_GCK 65>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 65>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x4400 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -465,7 +466,7 @@ can5: can@e083c000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 66>, <&pmc PMC_TYPE_GCK 66>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 66>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x8800 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -496,7 +497,7 @@ sdmmc0: mmc@e1204000 {
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 80>, <&pmc PMC_TYPE_GCK 80>;
 			clock-names = "hclock", "multclk";
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clocks = <&pmc PMC_TYPE_GCK 80>;
 			assigned-clock-rates = <200000000>;
 			microchip,sdcal-inverted;
@@ -509,7 +510,7 @@ sdmmc1: mmc@e1208000 {
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 81>, <&pmc PMC_TYPE_GCK 81>;
 			clock-names = "hclock", "multclk";
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clocks = <&pmc PMC_TYPE_GCK 81>;
 			assigned-clock-rates = <200000000>;
 			microchip,sdcal-inverted;
@@ -522,7 +523,7 @@ sdmmc2: mmc@e120c000 {
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 82>, <&pmc PMC_TYPE_GCK 82>;
 			clock-names = "hclock", "multclk";
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clocks = <&pmc PMC_TYPE_GCK 82>;
 			assigned-clock-rates = <200000000>;
 			microchip,sdcal-inverted;
-- 
2.47.3


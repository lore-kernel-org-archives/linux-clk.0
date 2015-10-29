Return-Path: <wenyou.yang@atmel.com>
From: Wenyou Yang <wenyou.yang@atmel.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni
	<alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard
	<plagnioj@jcrosoft.com>
CC: Russell King <linux@arm.linux.org.uk>, Stephen Boyd
	<sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar
 Gala" <galak@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Wenyou Yang
	<wenyou.yang@atmel.com>
Subject: [RFC PATCH 2/2] ARM: at91/dt: sama5d2_xplained: add pmc_fast_restart node
Date: Thu, 29 Oct 2015 13:55:47 +0800
Message-ID: <1446098147-32487-3-git-send-email-wenyou.yang@atmel.com>
In-Reply-To: <1446098147-32487-1-git-send-email-wenyou.yang@atmel.com>
References: <1446098147-32487-1-git-send-email-wenyou.yang@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: wenyou.yang@atmel.com
List-ID: <linux-clk.vger.kernel.org>

Add pmc_fast_restart node as a pmc child node.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

 arch/arm/boot/dts/at91-sama5d2_xplained.dts |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index e8d63afd..711d82f 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -91,6 +91,14 @@
 		};
 
 		apb {
+			pmc: pmc@f0014000 {
+				pmc_fast_restart {
+					compatible = "atmel,sama5d2-pmc-fast-startup";
+					atmel,fast-startup-wake-up;
+					atmel,fast-startup-rtc-alarm;
+				};
+			};
+
 			spi0: spi@f8000000 {
 				status = "okay";
 
-- 
1.7.9.5

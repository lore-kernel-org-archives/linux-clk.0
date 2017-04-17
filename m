Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: arm-soc <arm@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 6/7] arm: spear6xx: add DT description of the ADC on SPEAr600
Date: Mon, 17 Apr 2017 14:46:44 +0200
Message-Id: <1492433205-13376-7-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The SPEAr600 has a built-in ADC, which already has a Device Tree binding
described in
Documentation/devicetree/bindings/staging/iio/adc/spear-adc.txt. This
commit adds the description in the SPEAr600 Device Tree of this ADC
device.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear600.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
index 8459286..6b32d20 100644
--- a/arch/arm/boot/dts/spear600.dtsi
+++ b/arch/arm/boot/dts/spear600.dtsi
@@ -204,6 +204,14 @@
 				interrupt-parent = <&vic0>;
 				interrupts = <16>;
 			};
+
+			adc: adc@d820b000 {
+				compatible = "st,spear600-adc";
+				reg = <0xd820b000 0x1000>;
+				interrupt-parent = <&vic1>;
+				interrupts = <6>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.7.4

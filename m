Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 3/8] ARM: bcm2835: Add DT for the firmware clocks driver.
Date: Mon, 20 Jul 2015 12:33:02 -0700
Message-Id: <1437420787-32137-4-git-send-email-eric@anholt.net>
In-Reply-To: <1437420787-32137-1-git-send-email-eric@anholt.net>
References: <1437420787-32137-1-git-send-email-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Eric Anholt <eric@anholt.net>
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
---

v2: Rename our compat string to mention bcm2835, and make our firmware
    phandle be under a vendor-namespaced property.

 arch/arm/boot/dts/bcm2835-rpi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index ab5474e..7cc47fb 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -20,6 +20,12 @@
 			compatible = "raspberrypi,bcm2835-firmware";
 			mboxes = <&mailbox>;
 		};
+
+		firmware_clocks: firmware-clocks {
+			compatible = "raspberrypi,bcm2835-firmware-clocks";
+			#clock-cells = <1>;
+			raspberrypi,firmware = <&firmware>;
+		};
 	};
 };
 
-- 
2.1.4

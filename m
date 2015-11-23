Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 4/4] ARM: dts: enable audio clock support for Cygnus
Date: Mon, 23 Nov 2015 09:50:27 -0800
Message-ID: <1448301027-27061-5-git-send-email-rjui@broadcom.com>
In-Reply-To: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
References: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

From: Simran Rai <ssimran@broadcom.com>

Add audio clock to the existing Broadcom Cygnus clock DT

Signed-off-by: Simran Rai <ssimran@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
index 32bcd45..80b6ba4 100644
--- a/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus-clock.dtsi
@@ -121,4 +121,13 @@ clocks {
 		clocks = <&osc>;
 		clock-output-names = "keypad", "adc/touch", "pwm";
 	};
+
+	audiopll: audiopll {
+		#clock-cells = <1>;
+		compatible = "brcm,cygnus-audiopll";
+		reg = <0x180aeb00 0x68>;
+		clocks = <&osc>;
+		clock-output-names = "audiopll", "ch0_audio",
+					"ch1_audio", "ch2_audio";
+	};
 };
-- 
1.9.1

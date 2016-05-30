Return-Path: <peter.ujfalusi@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>, <tony@atomide.com>,
        <lee.jones@linaro.org>, <robh+dt@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>
CC: <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <alsa-devel@alsa-project.org>
Subject: [PATCH v1 09/14] ARM: dts: omap4-var-som-om44: Add pdmclk binding for audio
Date: Mon, 30 May 2016 11:55:17 +0300
Message-ID: <20160530085522.30398-10-peter.ujfalusi@ti.com>
In-Reply-To: <20160530085522.30398-1-peter.ujfalusi@ti.com>
References: <20160530085522.30398-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The twl6040 codec is generating the pdmclk, which is used by the McPDM as
functional clock.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/omap4-var-som-om44.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-var-som-om44.dtsi b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
index a17997f4e9aa..873cfc87260c 100644
--- a/arch/arm/boot/dts/omap4-var-som-om44.dtsi
+++ b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
@@ -189,6 +189,7 @@
 
 	twl6040: twl@4b {
 		compatible = "ti,twl6040";
+		#clock-cells = <0>;
 		reg = <0x4b>;
 
 		pinctrl-names = "default";
@@ -252,6 +253,10 @@
 &mcpdm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcpdm_pins>;
+
+	clocks = <&twl6040>;
+	clock-names = "pdmclk";
+
 	status = "okay";
 };
 
-- 
2.8.3

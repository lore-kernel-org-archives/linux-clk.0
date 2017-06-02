Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:52132 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751297AbdFBKKk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Jun 2017 06:10:40 -0400
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH 19/19] ARM: sun6i: a31s: Enable HDMI display output on the MSI Primo81 tablet
Date: Fri,  2 Jun 2017 18:10:24 +0800
Message-Id: <20170602101024.18940-20-wens@csie.org>
In-Reply-To: <20170602101024.18940-1-wens@csie.org>
References: <20170602101024.18940-1-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The MSI Primo81 tablet has a micro HDMI connector at the bottom.
This is connected to the SoCs HDMI output.

Enable the display pipeline and the HDMI output.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun6i-a31s-primo81.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
index f3712753fa42..26154b2f87a3 100644
--- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
@@ -52,17 +52,42 @@
 / {
 	model = "MSI Primo81 tablet";
 	compatible = "msi,primo81", "allwinner,sun6i-a31s";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &cpu0 {
 	cpu-supply = <&reg_dcdc3>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	/* rtl8188etv wifi is connected here */
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &i2c0 {
 	/* pull-ups and device VDDIO use AXP221 DLDO3 */
 	pinctrl-names = "default";
-- 
2.11.0


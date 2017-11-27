Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:32931 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752291AbdK0Pl7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Nov 2017 10:41:59 -0500
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        plaes@plaes.org, icenowy@aosc.io,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        jernej.skrabec@siol.net
Subject: [PATCH v2 15/18] ARM: dts: sun8i: a83t: Add LVDS pins group
Date: Mon, 27 Nov 2017 16:41:39 +0100
Message-Id: <8aa6ab23aaf36493c8f0bbef54043c030e1d4eff.1511797218.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The A83T has an LVDS bus that can be connected to a panel or a bridge. Add
the pinctrl group for it.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 2cb71e460ea2..b4615f150dbf 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -415,6 +415,12 @@
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
+			lcd_lvds_pins: lcd-lvds-pins {
+				pins = "PD18", "PD19", "PD20", "PD21", "PD22",
+				       "PD23", "PD24", "PD25", "PD26", "PD27";
+				function = "lvds0";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2",
 				       "PF3", "PF4", "PF5";
-- 
git-series 0.9.1

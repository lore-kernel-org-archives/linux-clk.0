Return-Path: <icenowy@aosc.xyz>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Russell King <linux@armlinux.org.uk>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	Hans de Goede <hdegoede@redhat.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 3/6] ARM: dts: sun8i: add a cpu0 label to cpu@0 node on A23/33
Date: Tue, 13 Dec 2016 23:22:49 +0800
Message-Id: <20161213152252.53749-4-icenowy@aosc.xyz>
In-Reply-To: <20161213152252.53749-1-icenowy@aosc.xyz>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>

A "cpu0" label is needed on cpu@0 for cpufreq-dt to work.

Add such a label, in order to prepare for cpufreq support of A23/33.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 817747f41288..5931cc4d1567 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -84,7 +84,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
-- 
2.11.0

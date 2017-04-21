Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45057 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1041721AbdDUShi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2017 14:37:38 -0400
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com,
        cw00.choi@samsung.com, javier@osg.samsung.com, krzk@kernel.org,
        jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 5/7] ASoC: Add Odroid sound DT bindings documentation
Date: Fri, 21 Apr 2017 19:19:49 +0200
Message-id: <1492795191-31298-6-git-send-email-s.nawrocki@samsung.com>
In-reply-to: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170421172040epcas5p2ee7191a899c52ea3f077837dc2e865ca@epcas5p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch adds DT binding documentation for Odroid XU3/4
sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 .../devicetree/bindings/sound/samsung,odroid.txt   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
new file mode 100644
index 0000000..c1ac70c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
@@ -0,0 +1,57 @@
+Samsung Exynos Odroid XU3/XU4 audio complex with MAX98090 codec
+
+Required properties:
+
+ - compatible - "samsung,odroidxu3-audio" - for Odroid XU3 board,
+		"samsung,odroidxu4-audio" - for Odroid XU4 board
+ - model - the user-visible name of this sound complex
+ - 'cpu' subnode with a 'sound-dai' property containing the phandle of the I2S
+    controller
+ - 'codec' subnode with a 'sound-dai' property containing list of phandles
+    to the CODEC nodes, first entry must be corresponding to the MAX98090
+    CODEC and the second entry must be the phandle of the HDMI IP block node
+ - clocks - should contain entries matching clock names in the clock-names
+    property
+ - clock-names - should contain following entries:
+    - "epll" - indicating the EPLL output clock
+    - "i2s_rclk" - indicating the RCLK (root) clock of the I2S0 controller
+ - samsung,audio-widgets - this property specifies off-codec audio elements
+   like headphones or speakers, for details see widgets.txt
+ - samsung,audio-routing - a list of the connections between audio
+   components;  each entry is a pair of strings, the first being the
+   connection's sink, the second being the connection's source;
+   valid names for sources and sinks are the MAX98090's pins (as
+   documented in its binding), and the jacks on the board
+
+   For Odroid X2:
+     "Headphone Jack", "Mic Jack", "DMIC"
+
+   For Odroid U3, XU3:
+     "Headphone Jack", "Speakers"
+
+   For Odroid XU4:
+     no entries
+
+Example:
+
+sound {
+	compatible = "samsung,odroidxu3-audio";
+	samsung,cpu-dai = <&i2s0>;
+	samsung,codec-dai = <&max98090>;
+	model = "Odroid-XU3";
+	samsung,audio-routing =
+		"Headphone Jack", "HPL",
+		"Headphone Jack", "HPR",
+		"IN1", "Mic Jack",
+		"Mic Jack", "MICBIAS";
+
+	clocks = <&clock CLK_FOUT_EPLL>, <&i2s0 CLK_I2S_RCLK_SRC>;
+	clock-names = "epll", "sclk_i2s";
+
+	cpu {
+		sound-dai = <&i2s0 0>;
+	};
+	codec {
+		sound-dai = <&hdmi>, <&max98090>;
+	};
+};
-- 
1.9.1


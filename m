Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57750 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161951AbdDUSeH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2017 14:34:07 -0400
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        jy0922.shim@samsung.com, javier@osg.samsung.com,
        b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
        inki.dae@samsung.com, cw00.choi@samsung.com, broonie@kernel.org,
        robh+dt@kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <1492795191-31298-6-git-send-email-s.nawrocki@samsung.com>
Message-Id: <E1d1cLy-0001qc-PC@debutante>
Date: Fri, 21 Apr 2017 18:28:18 +0100
Subject: Applied "ASoC: Add Odroid sound DT bindings documentation" to the asoc tree
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The patch

   ASoC: Add Odroid sound DT bindings documentation

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 92c9f05ebc7290e638c7b1b85288918c4fc65d4e Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 21 Apr 2017 19:19:49 +0200
Subject: [PATCH] ASoC: Add Odroid sound DT bindings documentation

This patch adds DT binding documentation for Odroid XU3/4
sound subsystem.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/samsung,odroid.txt   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
new file mode 100644
index 000000000000..c1ac70cb0afb
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
2.11.0


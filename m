Return-Path: <mylene.josserand@free-electrons.com>
From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
To: vinod.koul@intel.com,
	maxime.ripard@free-electrons.com,
	wens@csie.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lee.jones@linaro.org,
	mark.rutland@arm.com,
	robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	thomas.petazzoni@free-electrons.com,
	mylene.josserand@free-electrons.com,
	alexandre.belloni@free-electrons.com
Subject: [PATCH 09/14] dt-bindings: sound: Add sun8i codec documentation
Date: Tue,  4 Oct 2016 11:46:22 +0200
Message-Id: <a5b0bdc6b50dfcc2dc0145d00edd08fee3ce7764.1475571575.git.mylene.josserand@free-electrons.com>
In-Reply-To: <cover.1475569400.git.mylene.josserand@free-electrons.com>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
In-Reply-To: <cover.1475571575.git.mylene.josserand@free-electrons.com>
References: <cover.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add the documentation for dt-binding of the digital audio codec driver
for sun8i SoC.

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
---
 .../devicetree/bindings/sound/sun8i-codec.txt      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec.txt

diff --git a/Documentation/devicetree/bindings/sound/sun8i-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-codec.txt
new file mode 100644
index 0000000..1808869
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sun8i-codec.txt
@@ -0,0 +1,24 @@
+* Allwinner A23/A33 Codec
+
+Required properties:
+- compatible: must be either "allwinner,sun4i-a23-codec" or
+  "allwinner,sun7i-a33-codec"
+- reg: must contain the registers location and length
+- interrupts: must contain the codec interrupt
+- clocks: a list of phandle + clock-specifer pairs, one for each entry
+  in clock-names.
+- clock-names: should contain followings:
+   - "apb": the parent APB clock for this controller
+   - "codec": the parent module clock
+
+Example:
+codec: codec@01c22e00 {
+	#sound-dai-cells = <0>;
+	compatible = "allwinner,sun8i-a33-codec";
+	reg = <0x01c22e00 0x400>; /* SUNXI_AUDIO_PBASE + 0x200 */
+	reg-names = "audio";
+	interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
+	clock-names = "apb", "codec";
+	status = "disabled";
+};
-- 
2.9.3

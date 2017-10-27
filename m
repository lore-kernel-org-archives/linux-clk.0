Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 06/10] arm64: allwinner: h5: add compatible string for DE2 CCU
Date: Fri, 27 Oct 2017 23:06:54 +0800
Message-Id: <20171027150658.18509-7-icenowy@aosc.io>
In-Reply-To: <20171027150658.18509-1-icenowy@aosc.io>
References: <20171027150658.18509-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The DE2 CCU on Allwinner H5 SoC has a slightly different behavior than
the one on H3, so the compatible string is not set in the common DTSI
file.

Add the compatible string of H5 DE2 CCU in H5 DTSI file.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index d9a720bff05d..e237c05cfdb4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -98,6 +98,10 @@
 	compatible = "allwinner,sun50i-h5-ccu";
 };
 
+&display_clocks {
+	compatible = "allwinner,sun50i-h5-de2-clk";
+};
+
 &mmc0 {
 	compatible = "allwinner,sun50i-h5-mmc",
 		     "allwinner,sun50i-a64-mmc";
-- 
2.13.6

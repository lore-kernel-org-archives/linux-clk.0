Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	linux-sh@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 02/11] ARM: shmobile: r8a7790 dtsi: Add device node for RST module
Date: Tue,  7 Jul 2015 16:10:08 +0200
Message-Id: <1436278217-20522-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
References: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add a device node for the RST module, which provides reset control.
Declare it to be a system controller (syscon), so other device nodes can
refer to its registers.

TODO Add DT binding documentation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 837090ec9b4fb987..08067ae177643b8f 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1495,6 +1495,11 @@
 		};
 	};
 
+	rst: reset-controller@e616000 {
+		compatible = "renesas,rst-r8a7790", "syscon";
+		reg = <0 0xe6160000 0 0x0100>;
+	};
+
 	sysc: system-controller@e6180000 {
 		compatible = "renesas,sysc-r8a7790", "renesas,sysc-rcar";
 		reg = <0 0xe6180000 0 0x0200>;
-- 
1.9.1

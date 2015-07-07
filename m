Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH/RFC 08/11] ARM: shmobile: r8a7793: Link CPG to RST using
 "renesas, modemr"
Date: Tue,  7 Jul 2015 16:10:14 +0200
Message-Id: <1436278217-20522-9-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
References: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Add a link from the Clock Pulse Generator node to the Reset Controller
node, so the CPG can read the Mode Monitoring Register (MODEMR) to
obtain the MD pin values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index fbb1aa3740e2b55e..4bddaf2fbd0b2e1c 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -192,6 +192,7 @@
 					     "lb", "qspi", "sdh", "sd0", "z",
 					     "rcan", "adsp";
 			#power-domain-cells = <0>;
+			renesas,modemr = <&rst 0x60>;
 		};
 
 		/* Variable factor clocks */
-- 
1.9.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

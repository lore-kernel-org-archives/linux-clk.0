Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33077 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751242AbdE3IJR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2017 04:09:17 -0400
Received: by mail-lf0-f51.google.com with SMTP id m18so44684480lfj.0
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2017 01:09:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>,
        Paulius Zaleckas <paulius.zaleckas@gmail.com>,
        linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: Add Gemini DMA controller
Date: Tue, 30 May 2017 10:08:57 +0200
Message-Id: <20170530080857.13806-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds the Faraday Technology FTDMAC020 DMA controller to
the Gemini SoC DTSI file. It is only used for memcpy work so
we can activate it for all users of the chipset.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
The driver has been merged to the DMA tree. The clock and reset
lines are added with numerical values as we do not want to
depend on <dt-bindings/*> headers in the merge window. Will
be fixed post-rc1.
---
 arch/arm/boot/dts/gemini.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index 80abf84f8a80..0beaa4ef757e 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -175,5 +175,22 @@
 				#interrupt-cells = <1>;
 			};
 		};
+
+		dma-controller@67000000 {
+			compatible = "faraday,ftdma020", "arm,pl080", "arm,primecell";
+			/* Faraday Technology FTDMAC020 variant */
+			arm,primecell-periphid = <0x0003b080>;
+			reg = <0x67000000 0x1000>;
+			interrupts = <9 IRQ_TYPE_EDGE_RISING>;
+			resets = <&syscon 10>;
+			clocks = <&syscon 1>;
+			clock-names = "apb_pclk";
+			/* Bus interface AHB1 (AHB0) is totally tilted */
+			lli-bus-interface-ahb2;
+			mem-bus-interface-ahb2;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			#dma-cells = <2>;
+		};
 	};
 };
-- 
2.9.4


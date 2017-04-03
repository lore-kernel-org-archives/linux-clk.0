Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:37640 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752336AbdDCKIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2017 06:08:12 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: r8a7791: Drop _clk suffix from external CAN clock node name
Date: Mon,  3 Apr 2017 12:08:08 +0200
Message-Id: <1491214089-14093-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
References: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The current practice is to not add _clk suffixes to clock node names in
DT, as these names are used as the actual clock names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index a6478ca3f4ca7554..4d0c2ce59900f811 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1126,7 +1126,7 @@
 		};
 
 		/* External CAN clock */
-		can_clk: can_clk {
+		can_clk: can {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			/* This value must be overridden by the board. */
-- 
2.7.4


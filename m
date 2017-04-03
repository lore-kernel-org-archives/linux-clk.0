Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51044 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752426AbdDCKIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2017 06:08:12 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: r8a7795: salvator-x: Drop _clk suffix from X12 clock node name
Date: Mon,  3 Apr 2017 12:08:09 +0200
Message-Id: <1491214089-14093-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
References: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The current practice is to not add _clk suffixes to clock node names in
DT, as these names are used as the actual clock names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index f25241921067dcef..639aa085d9966676 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -56,7 +56,7 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
-	x12_clk: x12_clk {
+	x12_clk: x12 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24576000>;
-- 
2.7.4


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:53419 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755242AbeFYKxb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jun 2018 06:53:31 -0400
From: Adam Ford <aford173@gmail.com>
To: adam.ford@logicpd.com
Cc: t-kristo@ti.com, woods.technical@gmail.com,
        linux-clk@vger.kernel.org, sboyd@codeaurora.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org,
        tony@atomide.com, Adam Ford <aford173@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH V2] clk: ti: omap3: Fix am3517 mdio clock alias
Date: Mon, 25 Jun 2018 05:53:13 -0500
Message-Id: <20180625105313.4201-1-aford173@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

A previous patch removed OMAP clock aliases that were perceived
to be unnecessary.  Unfortunately, it broke the ethernet on the
am3517-evm.  This patch enables the MDIO clock and EMAC clock.

Fixes: 0ed266d7ae5e ("clk: ti: omap3: cleanup unnecessary clock aliases")
Cc: stable@vger.kernel.org #4.16+

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Instead of modifying clk-3xxx.c, this patch modifie the device tree
     to work like the original patch intended.

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index ca294914bbb1..4b6062b631b1 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -39,6 +39,8 @@
 			ti,davinci-ctrl-ram-size = <0x2000>;
 			ti,davinci-rmii-en = /bits/ 8 <1>;
 			local-mac-address = [ 00 00 00 00 00 00 ];
+			clocks = <&emac_ick>;
+			clock-names = "ick";
 		};
 
 		davinci_mdio: ethernet@5c030000 {
@@ -49,6 +51,8 @@
 			bus_freq = <1000000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&emac_fck>;
+			clock-names = "fck";
 		};
 
 		uart4: serial@4809e000 {
-- 
2.17.1


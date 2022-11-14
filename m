Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E3C43219
	for <linux-clk@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235813AbiKNTB3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Nov 2022 14:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235617AbiKNTB2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2022 14:01:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4BCB44
        for <linux-clk@vger.kernel.org>; Mon, 14 Nov 2022 11:01:27 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oueg8-0003bU-IL; Mon, 14 Nov 2022 19:59:32 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oueg5-004IJn-5x; Mon, 14 Nov 2022 19:59:30 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oueg5-004IDm-9p; Mon, 14 Nov 2022 19:59:29 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        alexandre.belloni@bootlin.com, mturquette@baylibre.com,
        sboyd@kernel.org, claudiu.beznea@microchip.com,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v4 1/2] ARM: at91: rm9200: fix usb device clock id
Date:   Mon, 14 Nov 2022 19:59:22 +0100
Message-Id: <20221114185923.1023249-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114185923.1023249-1-m.grzeschik@pengutronix.de>
References: <20221114185923.1023249-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Referring to the datasheet the index 2 is the MCKUDP. When enabled, it
"Enables the automatic disable of the Master Clock of the USB Device
Port when a suspend condition occurs". We fix the index to the real UDP
id which "Enables the 48 MHz clock of the USB Device Port".

Cc: nicolas.ferre@microchip.com
Cc: ludovic.desroches@microchip.com
Cc: alexandre.belloni@bootlin.com
Cc: mturquette@baylibre.com
Cc: sboyd@kernel.org
Cc: claudiu.beznea@microchip.com
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de
Fixes: 02ff48e4d7f7 ("clk: at91: add at91rm9200 pmc driver")
Fixes: 0e0e528d8260 ("ARM: dts: at91: rm9200: switch to new clock bindings")
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - removed ; from patch description
          - added fixes tag
v2 -> v3: - updated the fixes tag
v3 -> v4: - merged patches 1 and 2

 arch/arm/boot/dts/at91rm9200.dtsi | 2 +-
 drivers/clk/at91/at91rm9200.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
index 7a113325abb9ed..6f9004ebf42456 100644
--- a/arch/arm/boot/dts/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/at91rm9200.dtsi
@@ -666,7 +666,7 @@ usb1: gadget@fffb0000 {
 				compatible = "atmel,at91rm9200-udc";
 				reg = <0xfffb0000 0x4000>;
 				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 2>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 11>, <&pmc PMC_TYPE_SYSTEM 2>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 11>, <&pmc PMC_TYPE_SYSTEM 1>;
 				clock-names = "pclk", "hclk";
 				status = "disabled";
 			};
diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index b174f727a8ef8d..16870943a13e54 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -40,7 +40,7 @@ static const struct clk_pll_characteristics rm9200_pll_characteristics = {
 };
 
 static const struct sck at91rm9200_systemck[] = {
-	{ .n = "udpck", .p = "usbck",    .id = 2 },
+	{ .n = "udpck", .p = "usbck",    .id = 1 },
 	{ .n = "uhpck", .p = "usbck",    .id = 4 },
 	{ .n = "pck0",  .p = "prog0",    .id = 8 },
 	{ .n = "pck1",  .p = "prog1",    .id = 9 },
-- 
2.30.2


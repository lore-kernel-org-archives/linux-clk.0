Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C678C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 12:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiKIMrD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Nov 2022 07:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiKIMrC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 07:47:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA8C28E1D
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 04:47:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oskTg-00082x-Ph; Wed, 09 Nov 2022 13:46:48 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oskTe-003Frd-9J; Wed, 09 Nov 2022 13:46:47 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oskTe-000cKe-7j; Wed, 09 Nov 2022 13:46:46 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, claudiu.beznea@microchip.com,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v3 1/3] clk: at91: rm9200: fix usb device clock id
Date:   Wed,  9 Nov 2022 13:46:36 +0100
Message-Id: <20221109124638.147270-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109124638.147270-1-m.grzeschik@pengutronix.de>
References: <20221109124638.147270-1-m.grzeschik@pengutronix.de>
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

Cc: mturquette@baylibre.com
Cc: sboyd@kernel.org
Cc: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com
Cc: ludovic.desroches@microchip.com
Cc: claudiu.beznea@microchip.com
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de
Fixes: 02ff48e4d7f7 ("clk: at91: add at91rm9200 pmc driver")
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - removed ; from patch description
          - added fixes tag
v2 -> v3: - updated the fixes tag

 drivers/clk/at91/at91rm9200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


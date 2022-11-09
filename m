Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB43C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  9 Nov 2022 12:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiKIMq7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Nov 2022 07:46:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiKIMq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Nov 2022 07:46:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8696024F3E
        for <linux-clk@vger.kernel.org>; Wed,  9 Nov 2022 04:46:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oskTg-00082y-7Y; Wed, 09 Nov 2022 13:46:48 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oskTe-003Fri-Lm; Wed, 09 Nov 2022 13:46:47 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oskTe-000cKc-75; Wed, 09 Nov 2022 13:46:46 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v3 0/3] ARM: at91: USB Device Port fixes
Date:   Wed,  9 Nov 2022 13:46:35 +0100
Message-Id: <20221109124638.147270-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series fixes the UDP (USB Device Port) on the
at91rm9200 and at91sam9g20.

Cc: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org
Cc: kernel@pengutronix.de

Michael Grzeschik (3):
  clk: at91: rm9200: fix usb device clock id
  ARM: dts: at91: rm9200: fix usb device clk id
  ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl

 arch/arm/boot/dts/at91rm9200.dtsi           | 2 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi | 9 +++++++++
 drivers/clk/at91/at91rm9200.c               | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.30.2


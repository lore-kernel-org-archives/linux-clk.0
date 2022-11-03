Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFE1C433FE
	for <linux-clk@archiver.kernel.org>; Thu,  3 Nov 2022 19:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiKCT6X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Nov 2022 15:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiKCT57 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Nov 2022 15:57:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C536205C8
        for <linux-clk@vger.kernel.org>; Thu,  3 Nov 2022 12:57:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oqgLK-0006ay-P9; Thu, 03 Nov 2022 20:57:38 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oqgLK-00287R-DS; Thu, 03 Nov 2022 20:57:37 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oqgLI-0073Zx-Nw; Thu, 03 Nov 2022 20:57:36 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 0/4] ARM: at91: USB Device Port fixes
Date:   Thu,  3 Nov 2022 20:57:26 +0100
Message-Id: <20221103195730.1681967-1-m.grzeschik@pengutronix.de>
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

Cc: gregkh@linuxfoundation.org
Cc: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com
Cc: linux-usb@vger.kernel.org
Cc: linux-clk@vger.kernel.org

Michael Grzeschik (4):
  usb: gadget: at91-udc: simplify at91rm9200_udc_pullup callback
  clk: at91: rm9200: fix usb device clock id
  ARM: dts: at91: rm9200: fix usb device clk id
  ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl

 arch/arm/boot/dts/at91rm9200.dtsi           |  2 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi | 10 ++++++++++
 drivers/clk/at91/at91rm9200.c               |  2 +-
 drivers/usb/gadget/udc/at91_udc.c           |  5 +----
 4 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.30.2


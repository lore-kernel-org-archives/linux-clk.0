Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC63C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 19 Dec 2022 17:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiLSRLp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Dec 2022 12:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbiLSRLV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2022 12:11:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FE113F05
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 09:11:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p7JfI-0003x5-S9; Mon, 19 Dec 2022 18:11:00 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p7JfH-000OAk-U9; Mon, 19 Dec 2022 18:10:59 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p7JfH-000gmH-10; Mon, 19 Dec 2022 18:10:59 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Anson.Huang@nxp.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] dt-bindings: clocks: imx8mp: make sai4 a dummy clock
Date:   Mon, 19 Dec 2022 18:10:58 +0100
Message-Id: <20221219171058.164381-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221219171058.164381-1-m.felsch@pengutronix.de>
References: <20221219171058.164381-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The hardware don't have a SAI4 instance so remove the define. Use a
comment to keep it as reference and to avoid confusion.

Fixes: 108869144739 ("dt-bindings: imx: Add clock binding doc for i.MX8MP")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 include/dt-bindings/clock/imx8mp-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 9d5cc2ddde89..61418ae4bcfa 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -130,7 +130,7 @@
 #define IMX8MP_CLK_SAI1				123
 #define IMX8MP_CLK_SAI2				124
 #define IMX8MP_CLK_SAI3				125
-#define IMX8MP_CLK_SAI4				126
+/* #define IMX8MP_CLK_SAI4				126 */
 #define IMX8MP_CLK_SAI5				127
 #define IMX8MP_CLK_SAI6				128
 #define IMX8MP_CLK_ENET_QOS			129
-- 
2.30.2


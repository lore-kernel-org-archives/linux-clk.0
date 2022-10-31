Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7AEFA3741
	for <linux-clk@archiver.kernel.org>; Mon, 31 Oct 2022 20:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiJaUsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Oct 2022 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJaUsq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Oct 2022 16:48:46 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D57514016
        for <linux-clk@vger.kernel.org>; Mon, 31 Oct 2022 13:48:45 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CEB8B85508;
        Mon, 31 Oct 2022 21:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667249324;
        bh=qNBLRYuEoiJWHAu06LNUBPhqI4/VuNJ7u+W5oihXzFM=;
        h=From:To:Cc:Subject:Date:From;
        b=P4BK2Bu298ZloubrkaSQEfEj/fzi/DBPbs85lYGKVxXIPDIoTEwPqbVNiq56bQoie
         QbEZmNnBhrotyCNvvOwVsM7HAbTvhdhSIgQX3aaDKxe1MqhDAwdiRaquJoENTBwyrv
         1q7RBt19tTXwqk3iftIDAP+MxhMBZoaSqDeUK0KKicyHWevK5l1/n/495xdRQxj506
         I77vlmnBKb2fJQRrxmgFeSe5NRTtILEZYWKrz4irCs9nIQhEPBNxsGL4hTDqhpjKXW
         hvLyNFozt7WMpZF4oxiAq3LtHJjISI0AYZL0tPz27D6J8KmxFJL7Yx9qnFccMAbIs/
         YOun0zkz7lVSg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: pll14xx: Add 320 MHz and 640 MHz entries for PLL146x
Date:   Mon, 31 Oct 2022 21:48:38 +0100
Message-Id: <20221031204838.195292-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLL146x is used to implement SYS_PLL3 on i.MX8MP and can be used
to drive UARTn_ROOT clock. By setting the PLL3 to 320 MHz or 640 MHz,
the PLL3 output can be divided down to supply UARTn_ROOT clock with
precise 64 MHz, which divided down further by 16x oversampling factor
used by the i.MX UART core yields 4 Mbdps baud base for the UART IP.
This is useful e.g. for BCM bluetooth chips, which can operate up to
4 Mbdps.

Add 320 MHz and 640 MHz entries so the PLL can be configured accordingly.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
To: linux-clk@vger.kernel.org
---
 drivers/clk/imx/clk-pll14xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 1d0f79e9c3467..828336873a98f 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -54,7 +54,9 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
 	PLL_1416X_RATE(800000000U,  200, 3, 1),
 	PLL_1416X_RATE(750000000U,  250, 2, 2),
 	PLL_1416X_RATE(700000000U,  350, 3, 2),
+	PLL_1416X_RATE(640000000U,  320, 3, 2),
 	PLL_1416X_RATE(600000000U,  300, 3, 2),
+	PLL_1416X_RATE(320000000U,  160, 3, 2),
 };
 
 static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
-- 
2.35.1


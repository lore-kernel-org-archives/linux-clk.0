Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B20C4360F
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8274B2133D
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfCSKBv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:01:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49165 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbfCSKBu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:01:50 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ7-0003IG-CQ; Tue, 19 Mar 2019 11:01:49 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ6-00016f-Lw; Tue, 19 Mar 2019 11:01:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 2/4] clk: zynqmp: do not export zynqmp_clk_register_* functions
Date:   Tue, 19 Mar 2019 11:01:45 +0100
Message-Id: <20190319100147.4178-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190319100147.4178-1-m.tretter@pengutronix.de>
References: <20190319100147.4178-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The zynqmp_clk_register_* functions are internal functions of the
driver. Only clkc.c uses these functions to register these clocks.
Therefore, there is no need to export these functions.

The gate and pll already don't export their register_* functions.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v1 -> v2:
- remove export of zynqmp_clk_register_divider
---
 drivers/clk/zynqmp/clk-mux-zynqmp.c | 1 -
 drivers/clk/zynqmp/divider.c        | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index 4143f560c28d..0af8f74c5fa5 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -138,4 +138,3 @@ struct clk_hw *zynqmp_clk_register_mux(const char *name, u32 clk_id,
 
 	return hw;
 }
-EXPORT_SYMBOL_GPL(zynqmp_clk_register_mux);
diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index a371c66e72ef..16a1f021b4f2 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -214,4 +214,3 @@ struct clk_hw *zynqmp_clk_register_divider(const char *name,
 
 	return hw;
 }
-EXPORT_SYMBOL_GPL(zynqmp_clk_register_divider);
-- 
2.20.1


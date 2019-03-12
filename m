Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16715C10F0F
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 11:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4F6220883
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 11:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfCLLAX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 07:00:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59197 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfCLLAU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Mar 2019 07:00:20 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h3f8s-0005nU-Bx; Tue, 12 Mar 2019 12:00:18 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h3f8r-0007bP-Hs; Tue, 12 Mar 2019 12:00:17 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Date:   Tue, 12 Mar 2019 12:00:12 +0100
Message-Id: <20190312110016.29174-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190312110016.29174-1-m.tretter@pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
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

CLK_FRAC is not set in the divider->flags, but in the hw->flags.

The firmware sets CLK_FRAC for fractional clocks in the clkflag field.
When registering the devider, these clkflags are copied to hw->flags.

Moreover, divider->flags field is a u8 type, but CLK_FRAG is BIT(13). So
this check would never work.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/clk/zynqmp/divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index a371c66e72ef..fc70950c1e24 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -117,7 +117,7 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 	bestdiv = zynqmp_divider_get_val(*prate, rate);
 
 	if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
-	    (divider->flags & CLK_FRAC))
+	    (clk_hw_get_flags(hw) & CLK_FRAC))
 		bestdiv = rate % *prate ? 1 : bestdiv;
 	*prate = rate * bestdiv;
 
-- 
2.20.1


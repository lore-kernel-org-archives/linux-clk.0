Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CFEC10F0D
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E4F2B20857
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfCSKBv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:01:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50827 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbfCSKBv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:01:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ7-0003IH-CI; Tue, 19 Mar 2019 11:01:49 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ6-00016o-MX; Tue, 19 Mar 2019 11:01:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 3/4] clk: zynqmp: fix check for fractional clock
Date:   Tue, 19 Mar 2019 11:01:46 +0100
Message-Id: <20190319100147.4178-4-m.tretter@pengutronix.de>
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

The firmware sets BIT(13) in clkflag to mark a divider as fractional
divider. The clock driver copies the clkflag straight to the flags of
the common clock framework. In the common clk framework flags, BIT(13)
is defined as CLK_DUTY_CYCLE_PARENT.

Add a new field to the zynqmp_clk_divider to specify if a divider is a
fractional devider. Set this field based on the clkflag when registering
a divider.

At the same time, unset BIT(13) from clkflag when copying the flags to
the common clk framework flags.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v1 -> v2:
- add is_frac field to zynqmp_clk_divider
- remove CLK_FRAC from flags when copying to common clock framework
---
 drivers/clk/zynqmp/divider.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 16a1f021b4f2..7ee54c3fe20f 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -31,12 +31,14 @@
  * struct zynqmp_clk_divider - adjustable divider clock
  * @hw:		handle between common and hardware-specific interfaces
  * @flags:	Hardware specific flags
+ * @is_frac:	The divider is a fractional divider
  * @clk_id:	Id of clock
  * @div_type:	divisor type (TYPE_DIV1 or TYPE_DIV2)
  */
 struct zynqmp_clk_divider {
 	struct clk_hw hw;
 	u8 flags;
+	bool is_frac;
 	u32 clk_id;
 	u32 div_type;
 };
@@ -116,8 +118,7 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
 
 	bestdiv = zynqmp_divider_get_val(*prate, rate);
 
-	if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
-	    (divider->flags & CLK_FRAC))
+	if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && divider->is_frac)
 		bestdiv = rate % *prate ? 1 : bestdiv;
 	*prate = rate * bestdiv;
 
@@ -195,11 +196,13 @@ struct clk_hw *zynqmp_clk_register_divider(const char *name,
 
 	init.name = name;
 	init.ops = &zynqmp_clk_divider_ops;
-	init.flags = nodes->flag;
+	/* CLK_FRAC is not defined in the common clk framework */
+	init.flags = nodes->flag & ~CLK_FRAC;
 	init.parent_names = parents;
 	init.num_parents = 1;
 
 	/* struct clk_divider assignments */
+	div->is_frac = !!(nodes->flag & CLK_FRAC);
 	div->flags = nodes->type_flag;
 	div->hw.init = &init;
 	div->clk_id = clk_id;
-- 
2.20.1


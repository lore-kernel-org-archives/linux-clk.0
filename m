Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37942 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753596AbeGCHYz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jul 2018 03:24:55 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w637OKkP063293
        for <linux-clk@vger.kernel.org>; Tue, 3 Jul 2018 03:24:55 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2k00m58ed3-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-clk@vger.kernel.org>; Tue, 03 Jul 2018 03:24:55 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-clk@vger.kernel.org> from <benh@linux.vnet.ibm.com>;
        Tue, 3 Jul 2018 08:24:53 +0100
Subject: [PATCH] clk: aspeed: Treat a gate in reset as disabled
From: Benjamin Herrenschmidt <benh@linux.vnet.ibm.com>
To: linux-clk@vger.kernel.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
Date: Tue, 03 Jul 2018 17:24:47 +1000
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Message-Id: <c31c3652829e8e7064f750d219237c4eb32773e4.camel@linux.vnet.ibm.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On some systems, we come out of the bootloader with some
gates set with the clock "enabled" but the reset also
asserted.

Since 8a53fc511c5e "clk: aspeed: Prevent reset if clock is enabled"
we check that enabled bit in aspeed_clk_enabled(), and do
nothing if already set.

This breaks when the above scenario occurs, as the clock
is enabled, but the reset still needs to be lifted.

This patch fixes it by also checking the reset bit (if any)
and treating a gate in "reset" as being disabled.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Fixes: 8a53fc511c5e "clk: aspeed: Prevent reset if clock is enabled"
CC: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/clk/clk-aspeed.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index c17032bc853a..c555eac2c528 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -212,9 +212,22 @@ static int aspeed_clk_is_enabled(struct clk_hw *hw)
 {
 	struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
 	u32 clk = BIT(gate->clock_idx);
+	u32 rst = BIT(gate->reset_idx);
 	u32 enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
 	u32 reg;
 
+	/*
+	 * If the IP is in reset, treat the clock as not enabled,
+	 * this happens with some clocks such as the USB one when
+	 * coming from cold reset. Without this, aspeed_clk_enable()
+	 * will fail to lift the reset.
+	 */
+	if (gate->reset_idx >= 0) {
+		regmap_read(gate->map, ASPEED_RESET_CTRL, &reg);
+		if (reg & rst)
+			return 0;
+	}
+
 	regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
 
 	return ((reg & clk) == enval) ? 1 : 0;


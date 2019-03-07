Return-Path: <SRS0=2CmL=RK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F9CC10F03
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 20:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CC3120840
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 20:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfCGULA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Mar 2019 15:11:00 -0500
Received: from muru.com ([72.249.23.125]:41504 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbfCGULA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 Mar 2019 15:11:00 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DD37C80C5;
        Thu,  7 Mar 2019 20:11:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH] clk: ti: clkctrl: Fix clkdm_name regression for TI_CLK_CLKCTRL_COMPAT
Date:   Thu,  7 Mar 2019 12:10:56 -0800
Message-Id: <20190307201056.59985-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit a72d785021cb ("clk: ti: Prepare for remove of OF node name")
changed the code to use kasprintf() for provider->clkdm_name but also
changed the offset used later on by three. We don't need to change the
offset as we already have the extra three characters in the format for
kasprintf with "%pOFnxxx".

This caused the clocks with TI_CLK_CLKCTRL_COMPAT to have NULL
clk->clkdm_name for omap4 and 5. And null clkdm_name can cause module
reset, enable, and idle to fail.

The issue can also be seen also when enabling DEBUG for clkctrl.c
and then we start seeing "clock: could not associate" messages for
omap4 and 5 as the generated name is something like "l4_wkclkdm" instead
of "l4_wkup_clkdm" that's needed.

Let's fix the issue with a partial revert of commit a72d785021cb ("clk:
ti: Prepare for remove of OF node name").

ALso note that in general code should not depend on the dts node names.
And the node names should be generic types like clock-domain in this case.
This could be fixed later by using separate compatible properties for the
clockdomains, or by adding soc_device_match() table with reg offsets
to the driver. But let's fix the regression first.

Fixes: a72d785021cb ("clk: ti: Prepare for remove of OF node name")
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clkctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -530,7 +530,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		 * Create default clkdm name, replace _cm from end of parent
 		 * node name with _clkdm
 		 */
-		provider->clkdm_name[strlen(provider->clkdm_name) - 5] = 0;
+		provider->clkdm_name[strlen(provider->clkdm_name) - 2] = 0;
 	} else {
 		provider->clkdm_name = kasprintf(GFP_KERNEL, "%pOFn", node);
 		if (!provider->clkdm_name) {
-- 
2.21.0

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919F8C2D0E4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 12:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E92A2224E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 12:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgKSMvB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 07:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgKSMvB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 07:51:01 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAF9C0613CF
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 04:51:00 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id uCqx230034C55Sk01CqxKH; Thu, 19 Nov 2020 13:50:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjOq-003poU-SC; Thu, 19 Nov 2020 13:50:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjOq-00H3hJ-7X; Thu, 19 Nov 2020 13:50:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: sh73a0: Stop using __raw_*() I/O accessors
Date:   Thu, 19 Nov 2020 13:50:53 +0100
Message-Id: <20201119125053.4065746-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no reason to keep on using the __raw_{read,write}l() I/O
accessors in Renesas ARM driver code.  Switch to using the plain
{read,write}l() I/O accessors, to have a chance that this works on
big-endian.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.11.

 drivers/clk/renesas/clk-sh73a0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index 5f25a70bc61c4046..4146c1d717b96f93 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -121,7 +121,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 			(phy_no ? CPG_DSI1PHYCR : CPG_DSI0PHYCR);
 
 		parent_name = phy_no ? "dsi1pck" : "dsi0pck";
-		mult = __raw_readl(dsi_reg);
+		mult = readl(dsi_reg);
 		if (!(mult & 0x8000))
 			mult = 1;
 		else
-- 
2.25.1


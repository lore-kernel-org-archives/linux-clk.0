Return-Path: <SRS0=vPCn=US=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC75C31E49
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 12:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E79621530
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 12:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731742AbfFSMoF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jun 2019 08:44:05 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:48264 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFSMoF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jun 2019 08:44:05 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Sck22000e3XaVaC06ck3wV; Wed, 19 Jun 2019 14:44:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZwY-00041U-SG; Wed, 19 Jun 2019 14:44:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZwY-0003G4-QL; Wed, 19 Jun 2019 14:44:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Use [] to denote a flexible array member
Date:   Wed, 19 Jun 2019 14:44:01 +0200
Message-Id: <20190619124401.12478-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Flexible array members should be denoted using [] instead of [0], else
gcc will not warn when they are no longer at the end of the structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.3.

 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7c241ff3ae2f0153..52bbb9ce3807db31 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -450,7 +450,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 struct cpg_mssr_clk_domain {
 	struct generic_pm_domain genpd;
 	unsigned int num_core_pm_clks;
-	unsigned int core_pm_clks[0];
+	unsigned int core_pm_clks[];
 };
 
 static struct cpg_mssr_clk_domain *cpg_mssr_clk_domain;
-- 
2.17.1


Return-Path: <SRS0=/2Yr=RE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106F8C43381
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 12:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9C6620850
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 12:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbfCAMi1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Mar 2019 07:38:27 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:33398 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfCAMi1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Mar 2019 07:38:27 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id iceQ1z00R3XaVaC06ceQE3; Fri, 01 Mar 2019 13:38:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzhQm-0006du-D1; Fri, 01 Mar 2019 13:38:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gzhQm-0000E2-A8; Fri, 01 Mar 2019 13:38:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen3: Pass name/offset to cpg_sd_clk_register()
Date:   Fri,  1 Mar 2019 13:38:22 +0100
Message-Id: <20190301123822.808-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Explicitly pass the clock's name and register offset to
cpg_sd_clk_register(), so the latter doesn't have to extract them from
the cpg_core_clk object.

This keeps all cpg_core_clk parsing and unmarshalling contained in a
single function (rcar_gen3_cpg_clk_register()).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.2.

 drivers/clk/renesas/rcar-gen3-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 9a8071a8114daec9..dcd4ac389326b932 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -369,8 +369,8 @@ static u32 cpg_quirks __initdata;
 #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
 #define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
 
-static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
-	void __iomem *base, const char *parent_name,
+static struct clk * __init cpg_sd_clk_register(const char *name,
+	void __iomem *base, unsigned int offset, const char *parent_name,
 	struct raw_notifier_head *notifiers)
 {
 	struct clk_init_data init;
@@ -383,13 +383,13 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	if (!clock)
 		return ERR_PTR(-ENOMEM);
 
-	init.name = core->name;
+	init.name = name;
 	init.ops = &cpg_sd_clock_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-	clock->csn.reg = base + core->offset;
+	clock->csn.reg = base + offset;
 	clock->hw.init = &init;
 	clock->div_table = cpg_sd_div_table;
 	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
@@ -606,8 +606,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		break;
 
 	case CLK_TYPE_GEN3_SD:
-		return cpg_sd_clk_register(core, base, __clk_get_name(parent),
-					   notifiers);
+		return cpg_sd_clk_register(core->name, base, core->offset,
+					   __clk_get_name(parent), notifiers);
 
 	case CLK_TYPE_GEN3_R:
 		if (cpg_quirks & RCKCR_CKSEL) {
-- 
2.17.1


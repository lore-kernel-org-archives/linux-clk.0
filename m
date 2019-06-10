Return-Path: <SRS0=Sfi7=UJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D60C282DD
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jun 2019 11:06:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B12152082E
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jun 2019 11:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388572AbfFJLGn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jun 2019 07:06:43 -0400
Received: from inva021.nxp.com ([92.121.34.21]:60852 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388373AbfFJLGn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Jun 2019 07:06:43 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0C46A200775;
        Mon, 10 Jun 2019 13:06:41 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F30E3200773;
        Mon, 10 Jun 2019 13:06:40 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (gw_auto.ea.freescale.net [10.171.94.100])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 926D02061D;
        Mon, 10 Jun 2019 13:06:40 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] clk: Add clk_parent entry in debugfs
Date:   Mon, 10 Jun 2019 14:06:38 +0300
Message-Id: <82d6e1d63959ecb23bdcd363e93a27d08eee6859.1560164542.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This allows to easily determine the parent in shell scripts without
parsing more complex files.

Add the clk_parent file for all clks which can have a parent, not just
muxes. This way it can be used to determine the clk tree structure
without parsing more complex files.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
Changes since v1: Only add clk_parent if num_parents > 0

It seems that num_parents is only initialized once and never changes so
having a check here makes sense: skip the clk_parent file if the clk can
never have parent (num_parent == 0) but keep it if the parent is
constant (num_parents == 1).

It seems the parent can be set to NULL later so keep the check for
(core->parent != NULL) in the show function.

Link to v1: https://patchwork.kernel.org/patch/10959347/
---
 drivers/clk/clk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..d21a219deef8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3009,10 +3009,21 @@ static int possible_parents_show(struct seq_file *s, void *data)
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(possible_parents);
 
+static int current_parent_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+
+	if (core->parent)
+		seq_printf(s, "%s\n", core->parent->name);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(current_parent);
+
 static int clk_duty_cycle_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
 	struct clk_duty *duty = &core->duty;
 
@@ -3041,10 +3052,14 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
 	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
 	debugfs_create_file("clk_duty_cycle", 0444, root, core,
 			    &clk_duty_cycle_fops);
 
+	if (core->num_parents > 0)
+		debugfs_create_file("clk_parent", 0444, root, core,
+				    &current_parent_fops);
+
 	if (core->num_parents > 1)
 		debugfs_create_file("clk_possible_parents", 0444, root, core,
 				    &possible_parents_fops);
 
 	if (core->ops->debug_init)
-- 
2.17.1


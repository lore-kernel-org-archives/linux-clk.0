Return-Path: <SRS0=q34n=U2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F935C48BD7
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 15:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A0E920663
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jun 2019 15:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfF0PWA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jun 2019 11:22:00 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37070 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbfF0PV7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Jun 2019 11:21:59 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 91244200C47;
        Thu, 27 Jun 2019 17:21:57 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 82D48200C45;
        Thu, 27 Jun 2019 17:21:57 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 25F39205DB;
        Thu, 27 Jun 2019 17:21:57 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-clk@vger.kernel.org,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: Add clk_min/max_rate entries in debugfs
Date:   Thu, 27 Jun 2019 18:21:49 +0300
Message-Id: <35dca44e929f49c7a00125bf18c3455198d4e18e.1561648504.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add two files to expose min/max clk rates as determined by
clk_core_get_boundaries, taking all consumer requests into account.

This information does not appear to be otherwise exposed to userspace.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/clk.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fbf63daa62bc..a51d8ffb2d40 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3031,10 +3031,34 @@ static int clk_duty_cycle_show(struct seq_file *s, void *data)
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
 
+static int clk_min_rate_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long min_rate, max_rate;
+
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	seq_printf(s, "%lu\n", min_rate);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_min_rate);
+
+static int clk_max_rate_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long min_rate, max_rate;
+
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	seq_printf(s, "%lu\n", max_rate);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_max_rate);
+
 static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *root;
 
 	if (!core || !pdentry)
@@ -3042,10 +3066,12 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 
 	root = debugfs_create_dir(core->name, pdentry);
 	core->dentry = root;
 
 	debugfs_create_ulong("clk_rate", 0444, root, &core->rate);
+	debugfs_create_file("clk_min_rate", 0444, root, core, &clk_min_rate_fops);
+	debugfs_create_file("clk_max_rate", 0444, root, core, &clk_max_rate_fops);
 	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
 	debugfs_create_u32("clk_phase", 0444, root, &core->phase);
 	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
 	debugfs_create_u32("clk_prepare_count", 0444, root, &core->prepare_count);
 	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
-- 
2.17.1


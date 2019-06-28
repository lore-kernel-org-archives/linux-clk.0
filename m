Return-Path: <SRS0=HIww=U3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5228FC4321A
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 08:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24D6F2070D
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jun 2019 08:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfF1ITV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jun 2019 04:19:21 -0400
Received: from inva021.nxp.com ([92.121.34.21]:49448 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbfF1ITU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Jun 2019 04:19:20 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 23B76200373;
        Fri, 28 Jun 2019 10:19:18 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1700520034C;
        Fri, 28 Jun 2019 10:19:18 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C945A205D5;
        Fri, 28 Jun 2019 10:19:17 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] clk: Add clk_min/max_rate entries in debugfs
Date:   Fri, 28 Jun 2019 11:19:15 +0300
Message-Id: <0c12208398cadb7450b6b7745e99c55770c0ccf8.1561709827.git.leonard.crestez@nxp.com>
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
 drivers/clk/clk.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

Changes since v1:
* Call clk_prepare_lock/clk_prepare_unlock (Geert)
* Also include in clk_dump, but only with non-default values
Link to v1: https://patchwork.kernel.org/patch/11019873/

Didn't add to clk_summary because min/max rates are rarely used and
clk_summary already has too many columns.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index efa593ecbfa9..8cec1954580b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -591,10 +591,12 @@ static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
 				    unsigned long *max_rate)
 {
 	struct clk *clk_user;
 
+	lockdep_assert_held(&prepare_lock);
+
 	*min_rate = core->min_rate;
 	*max_rate = core->max_rate;
 
 	hlist_for_each_entry(clk_user, &core->clks, clks_node)
 		*min_rate = max(*min_rate, clk_user->min_rate);
@@ -2894,19 +2896,26 @@ static int clk_summary_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_summary);
 
 static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 {
+	unsigned long min_rate, max_rate;
+
 	if (!c)
 		return;
 
 	/* This should be JSON format, i.e. elements separated with a comma */
 	seq_printf(s, "\"%s\": { ", c->name);
 	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
 	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
 	seq_printf(s, "\"protect_count\": %d,", c->protect_count);
 	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
+	clk_core_get_boundaries(c, &min_rate, &max_rate);
+	if (min_rate != 0)
+		seq_printf(s, "\"min_rate\": %lu,", min_rate);
+	if (max_rate != ULONG_MAX)
+		seq_printf(s, "\"max_rate\": %lu,", max_rate);
 	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
 	seq_printf(s, "\"phase\": %d,", clk_core_get_phase(c));
 	seq_printf(s, "\"duty_cycle\": %u",
 		   clk_core_get_scaled_duty_cycle(c, 100000));
 }
@@ -3062,10 +3071,38 @@ static int clk_duty_cycle_show(struct seq_file *s, void *data)
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
 
+static int clk_min_rate_show(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long min_rate, max_rate;
+
+	clk_prepare_lock();
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	seq_printf(s, "%lu\n", min_rate);
+	clk_prepare_unlock();
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
+	clk_prepare_lock();
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	seq_printf(s, "%lu\n", max_rate);
+	clk_prepare_unlock();
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(clk_max_rate);
+
 static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *root;
 
 	if (!core || !pdentry)
@@ -3073,10 +3110,12 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 
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


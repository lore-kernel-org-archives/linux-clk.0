Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A54C433E6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 17:12:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54CE364EB8
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 17:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhBIRMQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 12:12:16 -0500
Received: from mga18.intel.com ([134.134.136.126]:63091 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232963AbhBIRML (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 12:12:11 -0500
IronPort-SDR: a1BrcmLZ+pMCEV0xitqyXacbqIH1QYTBImhEJRJecLfiT7nDrxLqMGXPbTYxlSxWE7t28NE9bd
 /dXNKO/HKqYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="169597136"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="169597136"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 09:09:55 -0800
IronPort-SDR: NtXp9lu1oZWe5t0NVdHVHCPkHuV/3DBjW90Z4JvWvNqdc4WERyglT9U0q84LpFtAbxvF+leh4j
 OfV60aqLpLBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="585437548"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2021 09:09:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 06FBB1C7; Tue,  9 Feb 2021 19:09:52 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] clk: Move struct clk_core to use struct fwnode_handle
Date:   Tue,  9 Feb 2021 19:09:52 +0200
Message-Id: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

fwnode is an abstraction on the different types of firmware nodes.
In order to allow clocks to be linked with any type of such node,
start a conversion to the struct fwnode_handle instead of being
stuck with struct device_node.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clk.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3d751ae5bc70..dd8e11e4312d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -19,6 +19,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/sched.h>
 #include <linux/clkdev.h>
 
@@ -59,7 +60,7 @@ struct clk_core {
 	struct clk_hw		*hw;
 	struct module		*owner;
 	struct device		*dev;
-	struct device_node	*of_node;
+	struct fwnode_handle	*fwnode;
 	struct clk_core		*parent;
 	struct clk_parent_map	*parents;
 	u8			num_parents;
@@ -396,7 +397,7 @@ static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
 	struct clk_hw *hw = ERR_PTR(-ENOENT);
 	struct device *dev = core->dev;
 	const char *dev_id = dev ? dev_name(dev) : NULL;
-	struct device_node *np = core->of_node;
+	struct device_node *np = to_of_node(core->fwnode);
 	struct of_phandle_args clkspec;
 
 	if (np && (name || index >= 0) &&
@@ -3189,7 +3190,7 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
 		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
 	else if (core->parents[i].index >= 0)
 		seq_puts(s,
-			 of_clk_get_parent_name(core->of_node,
+			 of_clk_get_parent_name(to_of_node(core->fwnode),
 						core->parents[i].index));
 	else
 		seq_puts(s, "(missing)");
@@ -3814,7 +3815,7 @@ static void clk_core_free_parent_map(struct clk_core *core)
 }
 
 static struct clk *
-__clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
+__clk_register(struct device *dev, struct fwnode_handle *fwnode, struct clk_hw *hw)
 {
 	int ret;
 	struct clk_core *core;
@@ -3848,7 +3849,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	if (dev && pm_runtime_enabled(dev))
 		core->rpm_enabled = true;
 	core->dev = dev;
-	core->of_node = np;
+	core->fwnode = fwnode;
 	if (dev && dev->driver)
 		core->owner = dev->driver->owner;
 	core->hw = hw;
@@ -3906,18 +3907,18 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
  * @dev->parent if dev doesn't have a device node, or NULL if neither
  * @dev or @dev->parent have a device node.
  */
-static struct device_node *dev_or_parent_of_node(struct device *dev)
+static struct fwnode_handle *dev_or_parent_fwnode(struct device *dev)
 {
-	struct device_node *np;
+	struct fwnode_handle *fwnode;
 
 	if (!dev)
 		return NULL;
 
-	np = dev_of_node(dev);
-	if (!np)
-		np = dev_of_node(dev->parent);
+	fwnode = dev_fwnode(dev);
+	if (!fwnode)
+		fwnode = dev_fwnode(dev->parent);
 
-	return np;
+	return fwnode;
 }
 
 /**
@@ -3935,7 +3936,7 @@ static struct device_node *dev_or_parent_of_node(struct device *dev)
  */
 struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 {
-	return __clk_register(dev, dev_or_parent_of_node(dev), hw);
+	return __clk_register(dev, dev_or_parent_fwnode(dev), hw);
 }
 EXPORT_SYMBOL_GPL(clk_register);
 
@@ -3951,8 +3952,7 @@ EXPORT_SYMBOL_GPL(clk_register);
  */
 int clk_hw_register(struct device *dev, struct clk_hw *hw)
 {
-	return PTR_ERR_OR_ZERO(__clk_register(dev, dev_or_parent_of_node(dev),
-			       hw));
+	return PTR_ERR_OR_ZERO(__clk_register(dev, dev_or_parent_fwnode(dev), hw));
 }
 EXPORT_SYMBOL_GPL(clk_hw_register);
 
@@ -3969,7 +3969,7 @@ EXPORT_SYMBOL_GPL(clk_hw_register);
  */
 int of_clk_hw_register(struct device_node *node, struct clk_hw *hw)
 {
-	return PTR_ERR_OR_ZERO(__clk_register(NULL, node, hw));
+	return PTR_ERR_OR_ZERO(__clk_register(NULL, of_fwnode_handle(node), hw));
 }
 EXPORT_SYMBOL_GPL(of_clk_hw_register);
 
-- 
2.30.0


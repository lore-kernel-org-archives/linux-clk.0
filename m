Return-Path: <SRS0=QrZd=7B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16EBC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 19 May 2020 17:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97B28207D3
	for <linux-clk@archiver.kernel.org>; Tue, 19 May 2020 17:07:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I/ymuisp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgESRHl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 May 2020 13:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbgESRHl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 May 2020 13:07:41 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19C8C08C5C0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2020 10:07:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z72so4062wmc.2
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2020 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=muft4GcNATjEV4x01YH/79QbRCrzio+OZVwdxHw5SPY=;
        b=I/ymuisp2aK26Obn2TT/OWU63j23sp1lm9thePiJAWx1TgitUiDRnh/kqHQJ6rOKWU
         Y5TqOPiUq1Qt4ZN/kdhy1GdxUHrYlnPJoRGggXV0sBsTkKiuwEetV0gj/UujOMQ2/4kp
         lRcz+ib8TXtBBCOg8wA/7yVMsOJe4SvQumTeK08wzLR/PE/Dvui1IdYjgi1zLTBMwXug
         SmHOCD2+1tHRyA/jd2M8RLLMw4eXWCvpteOhCq26+N0WK5+CIieRkctsEnMcjAfDXvpi
         DmW0wmNX0DcpYrUOvXHxQRQWaePZf3qknF1cKi051MJvNi+0YlmbmB1Y+zxF8M5toOTW
         M3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=muft4GcNATjEV4x01YH/79QbRCrzio+OZVwdxHw5SPY=;
        b=WVelooVYl07fki9P+UMUc6D/0oqkxUNjFVuua/GrNb+dGAI97JewWUiwb6lqzjImpP
         oSbr9IygNej8GxB6WOZ+eWP3lHGR2FG9H1ze4eaiSxWFtjp8ys9NB8cv5Z4AZdQzU0mK
         uHYZj+WfwnPveC1Vx4g5vxue8AUHiGOMo7srmRaY7gFVr+D2NYo/hJAub3tr1/z9+duL
         4D5D0rmAWFqhgHaua85v9Xp+Qx0MhAdhOcmzgVdXI3Jeon+Q3PaC0YyFDEE5DAvpkY9j
         G0BgTXZWywvvK3XApyEPxycUgJhs0uL6Z24rnJbqu7h728XeofWY3poFC3AAQzWT5GP9
         2EVw==
X-Gm-Message-State: AOAM531X8vo2OeFWCWJbyTYN3GNu/9v/2HLogwgPl7zy+I1K2kJSkiqp
        oqMZmVrDQPWDWJ4Z9tIKS5L2Ig==
X-Google-Smtp-Source: ABdhPJyxewN7nNTcKNjJl7CerBfnul15agl1TPMcFp4JkElJdJZiwyXJymCrchHwGn7+zobVBPor7w==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr377327wmk.168.1589908058332;
        Tue, 19 May 2020 10:07:38 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 89sm61592wrj.37.2020.05.19.10.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 10:07:37 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org
Subject: [RFC PATCH] clk: rework clk_register to use the clk_hw API
Date:   Tue, 19 May 2020 19:07:33 +0200
Message-Id: <20200519170733.295100-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This rework the clk_register/unregister functions to use the clk_hw API.
The goal is to pave the way for the removal of the 'clk' member in
struct clk_hw.

This member is used in about 60 drivers, most of them in drivers/clk/.
Some cases will be trivial to remove but some drivers are hacking around
it and will be tougher to deal with.

This change is sent as an RFC because, until there is a clear plan to deal
with drivers above, there is memory penality when using clk_register()
(struct clk is allocated in __clk_hw_register() and clk_register())

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 110 ++++++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d9946e192cbc..d93062673b2c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3736,8 +3736,8 @@ static void clk_core_free_parent_map(struct clk_core *core)
 	kfree(core->parents);
 }
 
-static struct clk *
-__clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
+static int
+__clk_hw_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 {
 	int ret;
 	struct clk_core *core;
@@ -3801,7 +3801,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 
 	ret = __clk_core_init(core);
 	if (!ret)
-		return hw->clk;
+		return 0;
 
 	clk_prepare_lock();
 	clk_core_unlink_consumer(hw->clk);
@@ -3818,7 +3818,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 fail_name:
 	kfree(core);
 fail_out:
-	return ERR_PTR(ret);
+	return ret;
 }
 
 /**
@@ -3843,6 +3843,24 @@ static struct device_node *dev_or_parent_of_node(struct device *dev)
 	return np;
 }
 
+
+/**
+ * clk_hw_register - register a clk_hw and return an error code
+ * @dev: device that is registering this clock
+ * @hw: link to hardware-specific clock data
+ *
+ * clk_hw_register is the primary interface for populating the clock tree with
+ * new clock nodes. It returns an integer equal to zero indicating success or
+ * less than zero indicating failure. Drivers must test for an error code after
+ * calling clk_hw_register().
+ */
+int clk_hw_register(struct device *dev, struct clk_hw *hw)
+{
+	return __clk_hw_register(dev, dev_or_parent_of_node(dev),
+				 hw);
+}
+EXPORT_SYMBOL_GPL(clk_hw_register);
+
 /**
  * clk_register - allocate a new clock, register it and return an opaque cookie
  * @dev: device that is registering this clock
@@ -3858,26 +3876,19 @@ static struct device_node *dev_or_parent_of_node(struct device *dev)
  */
 struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 {
-	return __clk_register(dev, dev_or_parent_of_node(dev), hw);
-}
-EXPORT_SYMBOL_GPL(clk_register);
+	struct clk *clk;
+	int ret = clk_hw_register(dev, hw);
 
-/**
- * clk_hw_register - register a clk_hw and return an error code
- * @dev: device that is registering this clock
- * @hw: link to hardware-specific clock data
- *
- * clk_hw_register is the primary interface for populating the clock tree with
- * new clock nodes. It returns an integer equal to zero indicating success or
- * less than zero indicating failure. Drivers must test for an error code after
- * calling clk_hw_register().
- */
-int clk_hw_register(struct device *dev, struct clk_hw *hw)
-{
-	return PTR_ERR_OR_ZERO(__clk_register(dev, dev_or_parent_of_node(dev),
-			       hw));
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	clk = clk_hw_get_clk(hw);
+	if (IS_ERR_OR_NULL(clk))
+		clk_hw_unregister(hw);
+
+	return clk;
 }
-EXPORT_SYMBOL_GPL(clk_hw_register);
+EXPORT_SYMBOL_GPL(clk_register);
 
 /*
  * of_clk_hw_register - register a clk_hw and return an error code
@@ -3892,7 +3903,7 @@ EXPORT_SYMBOL_GPL(clk_hw_register);
  */
 int of_clk_hw_register(struct device_node *node, struct clk_hw *hw)
 {
-	return PTR_ERR_OR_ZERO(__clk_register(NULL, node, hw));
+	return __clk_hw_register(NULL, node, hw);
 }
 EXPORT_SYMBOL_GPL(of_clk_hw_register);
 
@@ -3972,25 +3983,25 @@ static void clk_core_evict_parent_cache(struct clk_core *core)
 }
 
 /**
- * clk_unregister - unregister a currently registered clock
- * @clk: clock to unregister
+ * clk_hw_unregister - unregister a currently registered clk_hw
+ * @hw: hardware-specific clock data to unregister
  */
-void clk_unregister(struct clk *clk)
+void clk_hw_unregister(struct clk_hw *hw)
 {
 	unsigned long flags;
 	const struct clk_ops *ops;
 
-	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
+	if (!hw || WARN_ON_ONCE(IS_ERR(hw)))
 		return;
 
-	clk_debug_unregister(clk->core);
+	clk_debug_unregister(hw->core);
 
 	clk_prepare_lock();
 
-	ops = clk->core->ops;
+	ops = hw->core->ops;
 	if (ops == &clk_nodrv_ops) {
 		pr_err("%s: unregistered clock: %s\n", __func__,
-		       clk->core->name);
+		       hw->core->name);
 		goto unlock;
 	}
 	/*
@@ -3998,50 +4009,53 @@ void clk_unregister(struct clk *clk)
 	 * a reference to this clock.
 	 */
 	flags = clk_enable_lock();
-	clk->core->ops = &clk_nodrv_ops;
+	hw->core->ops = &clk_nodrv_ops;
 	clk_enable_unlock(flags);
 
 	if (ops->terminate)
-		ops->terminate(clk->core->hw);
+		ops->terminate(hw);
 
-	if (!hlist_empty(&clk->core->children)) {
+	if (!hlist_empty(&hw->core->children)) {
 		struct clk_core *child;
 		struct hlist_node *t;
 
 		/* Reparent all children to the orphan list. */
-		hlist_for_each_entry_safe(child, t, &clk->core->children,
+		hlist_for_each_entry_safe(child, t, &hw->core->children,
 					  child_node)
 			clk_core_set_parent_nolock(child, NULL);
 	}
 
-	clk_core_evict_parent_cache(clk->core);
+	clk_core_evict_parent_cache(hw->core);
 
-	hlist_del_init(&clk->core->child_node);
+	hlist_del_init(&hw->core->child_node);
 
-	if (clk->core->prepare_count)
+	if (hw->core->prepare_count)
 		pr_warn("%s: unregistering prepared clock: %s\n",
-					__func__, clk->core->name);
+					__func__, hw->core->name);
 
-	if (clk->core->protect_count)
+	if (hw->core->protect_count)
 		pr_warn("%s: unregistering protected clock: %s\n",
-					__func__, clk->core->name);
+					__func__, hw->core->name);
 
-	kref_put(&clk->core->ref, __clk_release);
-	free_clk(clk);
+	kref_put(&hw->core->ref, __clk_release);
+	free_clk(hw->clk);
 unlock:
 	clk_prepare_unlock();
 }
-EXPORT_SYMBOL_GPL(clk_unregister);
+EXPORT_SYMBOL_GPL(clk_hw_unregister);
 
 /**
- * clk_hw_unregister - unregister a currently registered clk_hw
- * @hw: hardware-specific clock data to unregister
+ * clk_unregister - unregister a currently registered clock
+ * @clk: clock to unregister
  */
-void clk_hw_unregister(struct clk_hw *hw)
+void clk_unregister(struct clk *clk)
 {
-	clk_unregister(hw->clk);
+	struct clk_hw *hw = clk->core->hw;
+
+	clk_put(clk);
+	clk_hw_unregister(hw);
 }
-EXPORT_SYMBOL_GPL(clk_hw_unregister);
+EXPORT_SYMBOL_GPL(clk_unregister);
 
 static void devm_clk_release(struct device *dev, void *res)
 {
-- 
2.25.4


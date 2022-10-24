Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85297C67871
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 20:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbiJXUSh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 16:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234162AbiJXUSM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 16:18:12 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7CDED9BF
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 11:35:19 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a14so14739473wru.5
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a5wmw7XwD+ppaZR2w3Z9il63MoJr3+QslIiVrYauqc4=;
        b=tOcfAA3FdBlp+oU8hIpAafb52EX0dDovvBrvTfAhwgBO9uH+TBPkajNOY8PAkgGT2L
         GNdHzsmWFuI7hGyEehTLjg7PHkppHJ12ooSzMElD+c8+r7xPEnYZ/e9Mdn283DCub8iS
         JGq2+JwsNhHDMr7TiuQnAaS2lhtnmVsWigKtjpEMtqlQzQmZ/Qm4gmToRDJ13UzTshhd
         hb6PuUjQh6vy5IBbcVYuA8Q/JdPkJcAtk/8vKPIcVVw+YfDpPmxO7W9/VGB3SBstpnGO
         YA3wfBANugkPFz6H9ibnDno5FXe3KOaxXSGS1yUec+88PI/LugHM16+uVKAMhlswgFTm
         3JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5wmw7XwD+ppaZR2w3Z9il63MoJr3+QslIiVrYauqc4=;
        b=EBt4D474FEHjI2mBKzEL5estkik0Rgcs1/hDIocYho69vm32qWxeP5eFnV5gxMDAU5
         8aPyKAyNPOrhHR36Mk2qH1XSo3W3gMQu9NBRud0Cg5Bt2GBkxYLtFcv1Vwso64WiGZrs
         1MJRh/ZWqtqfMHpKQkeHDMmeMj9vUPrdEtKqC29qvqOZgtyodnzb1uW9ahUs8xNN6h3r
         ShjBEv/cYJ7JWigjhzbk6AUD/9YR1pax61q+jUTQRxCQSN+A8EzEs6/3T3ZQc6VDpUSF
         /D+jZ8tH/k2BMTCLP+FYHiEZAWitiTvFEAMShUSdrd+TKkFbWcWiNRgZq3PSeU8gPDu7
         Znwg==
X-Gm-Message-State: ACrzQf21zoKzN2mVDvIVzz2lJMK81E9o6C0oGsIYFey/ZKijUlYGhMKy
        cfYb8joW/ApT0HrD52RKaopW2w==
X-Google-Smtp-Source: AMsMyM7Ocm/YzwX6tHR2SReSGwytvm9K+LGAsDYabOb8Le76wl3BUIVn3rGLPSnRe4tqqbGPBh5+Mw==
X-Received: by 2002:a5d:4745:0:b0:22e:3521:a557 with SMTP id o5-20020a5d4745000000b0022e3521a557mr21993951wrs.125.1666636450728;
        Mon, 24 Oct 2022 11:34:10 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n11-20020adff08b000000b00228692033dcsm280323wro.91.2022.10.24.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 11:34:10 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH 1/2] clk: Add generic sync_state callback for disabling unused clocks
Date:   Mon, 24 Oct 2022 21:33:57 +0300
Message-Id: <20221024183358.569765-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are unused clocks that need to remain untouched by clk_disable_unused,
and most likely could be disabled later on sync_state. So provide a generic
sync_state callback for the clock providers that register such clocks.
Then, use the same mechanism as clk_disable_unused from that generic
callback, but pass the device to make sure only the clocks belonging to
the current clock provider get disabled, if unused. Also, during the
default clk_disable_unused, if the driver that registered the clock has
the generic clk_sync_state_disable_unused callback set for sync_state,
skip disabling its clocks.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Here is the link to the RFC:

https://lore.kernel.org/all/20220929151047.wom3m2ydgxme5nhh@builder.lan/

Changes since RFC:
 * Added from_sync_state local variable, as Bjorn suggested
 * Dropped the addition extra condition for the CLK_IGNORE_UNUSED
 * Changed the comments above the sync_state checking
 * Moved back the clk_ignore_unused check to clk_disable_unused_subtree
 function, as Bjorn suggested

 drivers/clk/clk.c            | 55 ++++++++++++++++++++++++++++++------
 include/linux/clk-provider.h |  1 +
 2 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c3c3f8c07258..acf5139e16d8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1292,14 +1292,27 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static void clk_unprepare_unused_subtree(struct clk_core *core,
+						struct device *dev)
 {
+	bool from_sync_state = !!dev;
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		clk_unprepare_unused_subtree(child, dev);
+
+	if (from_sync_state && core->dev != dev)
+		return;
+
+	/*
+	 * clock will be unprepared on sync_state,
+	 * so leave as is for now
+	 */
+	if (!from_sync_state && dev_has_sync_state(core->dev) &&
+		core->dev->driver->sync_state == clk_sync_state_disable_unused)
+		return;
 
 	if (core->prepare_count)
 		return;
@@ -1322,15 +1335,28 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	clk_pm_runtime_put(core);
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core,
+					struct device *dev)
 {
+	bool from_sync_state = !!dev;
 	struct clk_core *child;
 	unsigned long flags;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+		clk_disable_unused_subtree(child, dev);
+
+	if (from_sync_state && core->dev != dev)
+		return;
+
+	/*
+	 * clock will be disabled on sync_state,
+	 * so leave as is for now
+	 */
+	if (!from_sync_state &&
+		core->dev->driver->sync_state == clk_sync_state_disable_unused)
+		return;
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
@@ -1376,7 +1402,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static void __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 
@@ -1388,23 +1414,34 @@ static int __init clk_disable_unused(void)
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	clk_prepare_unlock();
+}
+
+static int __init clk_disable_unused(void)
+{
+	__clk_disable_unused(NULL);
 
 	return 0;
 }
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state_disable_unused(struct device *dev)
+{
+	__clk_disable_unused(dev);
+}
+EXPORT_SYMBOL_GPL(clk_sync_state_disable_unused);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 267cd06b54a0..06a8622f90cf 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -718,6 +718,7 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		void __iomem *reg, u8 shift, u8 width,
 		u8 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock);
+void clk_sync_state_disable_unused(struct device *dev);
 /**
  * clk_register_divider - register a divider clock with the clock framework
  * @dev: device registering this clock
-- 
2.34.1


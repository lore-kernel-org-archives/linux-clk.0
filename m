Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053CAC3DA7A
	for <linux-clk@archiver.kernel.org>; Sun, 25 Dec 2022 16:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiLYQrQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Dec 2022 11:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiLYQrO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 11:47:14 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C6DE87
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 08:47:12 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso6491754wmb.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 08:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJSRHwGgSQsIgnd1ziT5DVB7secN8//21s4cglbkjsI=;
        b=OwYNmML6Qi1WxRgnDi95+Q6UGEOFHsX0RzzURE1yyZ1VPvRebZxXn1yOAMERCq23cV
         Qvd/8FPjAtm5qkvNlgpzPewQSsUVbBQYiiKu9/bBmYUYYjFPPhGXwciXRqpTaCXppOjg
         P0ekRQWHncfmm+WVyTA8fOU4LanckORvwC57AbsBjkC0h5vq7XeULjmx5csbCPZlrBF8
         RDjFVz9H4k66mru2ZWUXlNE52wuRuyviaI6vEVaswdhV2TZQhoJZFuRlsWbEur+M/K2a
         WEaLlP/wmsHd3mje0gHE9Zb7lN2L/zh7ZgC730yudztHp0zR/EwQKJp+ZimIFXvA+RpX
         FDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJSRHwGgSQsIgnd1ziT5DVB7secN8//21s4cglbkjsI=;
        b=3JP9JWD9aopicSXMr1tgMd/4aEhnalHtrDkIdC9sowECsB9/AucnokU7T3+yP2dQ91
         t8uEBR8C5rQ+3DbiYlcdgg1KEZ/XxaAIbY31jjTk+Zr6Hl8wdruDTMNGNCBymczrDpHe
         SuEwwqPYAAZkXStnxQb2zNR94ieFkzh5ydd1h01KYG589CR9PCsMx+XT16npNP4ulx7l
         FfHagU91dhZuS83JsA3A53vZX35fgd2D0UnTPFlnyVFbUDVPOebRYl+1JoE3FCYh/POy
         kAeKFEU00+e62saKyjVwejEuxBo5+P+wSjcd3DzzT8rgkvlqwpThUK5GNt90qzrHag6M
         8mKQ==
X-Gm-Message-State: AFqh2kqes5F0UsPDdFTiho7bdLTJ9k1tKaYF1C35PHNm7Nh+vV6HPd21
        8RpXsBvKq1hErPdAnQeqmi2Ukg==
X-Google-Smtp-Source: AMrXdXtVexBf8lzbMFmlaHdKrIcnaqWySkpsYWR2qMQfpHVq1jFB4O1fHaaAyCXzTghTiDuaAdJpVw==
X-Received: by 2002:a05:600c:21c1:b0:3d3:45c6:b641 with SMTP id x1-20020a05600c21c100b003d345c6b641mr11547895wmj.22.1671986830532;
        Sun, 25 Dec 2022 08:47:10 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b003d973d4fb28sm5507545wms.4.2022.12.25.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 08:47:10 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] clk: Add generic sync_state callback for disabling unused clocks
Date:   Sun, 25 Dec 2022 18:47:04 +0200
Message-Id: <20221225164705.437944-1-abel.vesa@linaro.org>
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

Changes since v1:
 * Dropped the 0 returned by __clk_disable_unused when clk_ignore_unused
   is set.
 * Dropped __initdata for clk_ignore_unused

 drivers/clk/clk.c            | 59 +++++++++++++++++++++++++++++-------
 include/linux/clk-provider.h |  1 +
 2 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e62552a75f08..5185b857fc65 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1302,14 +1302,27 @@ static void clk_core_disable_unprepare(struct clk_core *core)
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
@@ -1332,15 +1345,28 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
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
@@ -1378,7 +1404,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1386,35 +1412,46 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static void __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 
 	if (clk_ignore_unused) {
 		pr_warn("clk: Not disabling unused clocks\n");
-		return 0;
+		return;
 	}
 
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
index 842e72a5348f..cf1adfeaf257 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -720,6 +720,7 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		void __iomem *reg, u8 shift, u8 width,
 		u8 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock);
+void clk_sync_state_disable_unused(struct device *dev);
 /**
  * clk_register_divider - register a divider clock with the clock framework
  * @dev: device registering this clock
-- 
2.34.1


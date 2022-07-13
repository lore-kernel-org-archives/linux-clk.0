Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86372C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 08:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbiGMIXq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 04:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235597AbiGMIXO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 04:23:14 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0EF2A421
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 01:21:19 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id v7so7553913pfb.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OZzK5y0eIxncPQQ3hhM9CtKDdXTROOL9hGvuVufD4R0=;
        b=LVI7afIdx9YSScvsEUrrMCzTkjoehM3oIiQd60Ag7fskFqaUqKhz59wT/5iO31iaAQ
         ISJkReGxxe8n7SMMi+PSUi2U8QN/QnaJ6OC15vnwjpMlv7UF27CCtQEBPf/eR87Ns0wF
         yS/CI1F71Aftmnf8Z4VRjx/9AP5po0GUnxw/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZzK5y0eIxncPQQ3hhM9CtKDdXTROOL9hGvuVufD4R0=;
        b=c9luY6p6O/oEJw1/iIBUfydISmg3brk6QYQsbWDwsKkvVvPKh1S7pmbWNgW/mIigu6
         8to9FXj+Oxg5MBQnIXoo3sE+Uhv+7hkzDd4qJZCWQUtAspAwqiLDHeyDsbHwnna4qlOp
         XC+k4W0aGGqmc9a3TCmw4Gw9AnSKjTi+q8dwgV/HX+dCtYeQbYh9GEsfdYhTloVC8bFl
         cInKJIYTl6NE4v/mU/1zm1NJWY8od/WJ80VIntxl7uIOQ2iMnLKhx2uoAJ/9EwVGlaiP
         qPTP8g81Emen1SyJFuhoaPcgsHc9+XQa5xbi4sseajXRTIeEn3SDw1A3XWICFVL6WDFo
         U3lw==
X-Gm-Message-State: AJIora/T4q+LdEeeiScdgbkcr1/ctfmRwpX2GfjLxpZ0UNIGCKw+NAaI
        IkC324eCh6k0tOGxh4RSF4H1jA==
X-Google-Smtp-Source: AGRyM1tvbTHGQRx2DcT1j1U+cdRg2iAmTleWHqHp1zVByPK8suxmR9yVUKvda5Yb1GsU3pIIGbZ8Cg==
X-Received: by 2002:a63:27c3:0:b0:412:99f2:e483 with SMTP id n186-20020a6327c3000000b0041299f2e483mr1915203pgn.483.1657700479028;
        Wed, 13 Jul 2022 01:21:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1a9:ca7d:e86f:cf6f])
        by smtp.gmail.com with ESMTPSA id k11-20020aa7972b000000b005281d926733sm8220461pfg.199.2022.07.13.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:21:18 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH v2 1/2] clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
Date:   Wed, 13 Jul 2022 16:21:10 +0800
Message-Id: <20220713082111.2233016-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220713082111.2233016-1-wenst@chromium.org>
References: <20220713082111.2233016-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the previous commits that added CLK_OPS_PARENT_ENABLE, support for
this flag was only added to rate change operations (rate setting and
reparent) and disabling unused subtree. It was not added to the
clock gate related operations. Any hardware driver that needs it for
these operations will either see bogus results, or worse, hang.

This has been seen on MT8192 and MT8195, where the imp_ii2_* clk
drivers set this, but dumping debugfs clk_summary would cause it
to hang.

Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents enable (part 2)")
Fixes: a4b3518d146f ("clk: core: support clocks which requires parents enable (part 1)")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/clk.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc191c15507..9b365cd6d14b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -196,6 +196,9 @@ static bool clk_core_rate_is_protected(struct clk_core *core)
 	return core->protect_count;
 }
 
+static int clk_core_prepare_enable(struct clk_core *core);
+static void clk_core_disable_unprepare(struct clk_core *core);
+
 static bool clk_core_is_prepared(struct clk_core *core)
 {
 	bool ret = false;
@@ -208,7 +211,11 @@ static bool clk_core_is_prepared(struct clk_core *core)
 		return core->prepare_count;
 
 	if (!clk_pm_runtime_get(core)) {
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_prepare_enable(core->parent);
 		ret = core->ops->is_prepared(core->hw);
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_disable_unprepare(core->parent);
 		clk_pm_runtime_put(core);
 	}
 
@@ -244,7 +251,13 @@ static bool clk_core_is_enabled(struct clk_core *core)
 		}
 	}
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_prepare_enable(core->parent);
+
 	ret = core->ops->is_enabled(core->hw);
+
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_unprepare(core->parent);
 done:
 	if (core->rpm_enabled)
 		pm_runtime_put(core->dev);
@@ -812,6 +825,9 @@ int clk_rate_exclusive_get(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
 
+static int clk_core_enable_lock(struct clk_core *core);
+static void clk_core_disable_lock(struct clk_core *core);
+
 static void clk_core_unprepare(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
@@ -835,6 +851,9 @@ static void clk_core_unprepare(struct clk_core *core)
 
 	WARN(core->enable_count > 0, "Unpreparing enabled %s\n", core->name);
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_enable_lock(core->parent);
+
 	trace_clk_unprepare(core);
 
 	if (core->ops->unprepare)
@@ -843,6 +862,9 @@ static void clk_core_unprepare(struct clk_core *core)
 	clk_pm_runtime_put(core);
 
 	trace_clk_unprepare_complete(core);
+
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_lock(core->parent);
 	clk_core_unprepare(core->parent);
 }
 
@@ -891,6 +913,9 @@ static int clk_core_prepare(struct clk_core *core)
 		if (ret)
 			goto runtime_put;
 
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_enable_lock(core->parent);
+
 		trace_clk_prepare(core);
 
 		if (core->ops->prepare)
@@ -898,6 +923,9 @@ static int clk_core_prepare(struct clk_core *core)
 
 		trace_clk_prepare_complete(core);
 
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_disable_lock(core->parent);
+
 		if (ret)
 			goto unprepare;
 	}
-- 
2.37.0.170.g444d1eabd0-goog


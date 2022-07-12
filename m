Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B29CCA47C
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 11:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbiGLLeN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 07:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbiGLLeM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 07:34:12 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92F0AB7C9
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 04:34:10 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id bh13so7307826pgb.4
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2kOxzZkRxT+SCDc/hWVbeiMQchYapmJ5tgcoSnW9NfA=;
        b=K38rRvmuZwuHeV6S3mbZFNYaUh+iQnDJiTeHryLUFX6A4Sa361BXHcjCCufV/u/0tQ
         S1CjpD8Eo1dtBiG30ORyACtnbkIZT0m1pIzantyWMCy57+O0mrKWAp5FQTOEtuV8Jr2/
         DNPcYFr3kIRGXgphvzGSfVUyoVRNxXEsBdNSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2kOxzZkRxT+SCDc/hWVbeiMQchYapmJ5tgcoSnW9NfA=;
        b=3DkgZmPuwbD8aCovSPpBmu/Ja4mJqscs2U3W5mWOsCg6T3DM5FFBKkWdGO9wwVzFHs
         Kg5iaWU/gAAcNZzahsHx+uzhdpA2AtGLAhJKDJAuVGNSaU1vG6IVrmNVlmxE0j7SZOOk
         UkEMZjziSDxVYs37Up3a8jYl0ZcZb4KBVPO/YyefHxTPK9LylOK1npqncwn6iNRWLVtN
         BV0c8TYSdTJdqz3/2DkGZyTcxTtrk43TL1onzg5FFkoWc0nlHLLlfJlPZWNMmRI+M7ew
         OQGT6VV59/xUZLnTyDe6Q9dqnOzdEUHh5ZD+BLvr692WGueR1Td1zg1FR3HAxfWamIeQ
         qycw==
X-Gm-Message-State: AJIora+SkYQnlcXoOVFdNtim3pKEn0bSIyCdBxujgUrZaoNf41pi5yIw
        cAjHIythZHEIwLeM0+u+INpyAQ==
X-Google-Smtp-Source: AGRyM1tn283Rt4KAICZxZjkCqC4Dqisu5OgjAM1jSZZTEhExCZIzgXS5foi0gjTiljvGWvcroMLYMg==
X-Received: by 2002:a65:6b94:0:b0:3fb:16f4:3620 with SMTP id d20-20020a656b94000000b003fb16f43620mr20278951pgw.464.1657625650461;
        Tue, 12 Jul 2022 04:34:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1a9:ca7d:e86f:cf6f])
        by smtp.gmail.com with ESMTPSA id 80-20020a621653000000b0052890d61628sm6537967pfw.60.2022.07.12.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 04:34:09 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH 1/2] clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
Date:   Tue, 12 Jul 2022 19:34:01 +0800
Message-Id: <20220712113402.871838-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220712113402.871838-1-wenst@chromium.org>
References: <20220712113402.871838-1-wenst@chromium.org>
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

I'm guessing Stephen might have some things to say about adding forward
declarations. Moving code around would make the patch larger though.

 drivers/clk/clk.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc191c15507..b3de636eec84 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -215,6 +215,9 @@ static bool clk_core_is_prepared(struct clk_core *core)
 	return ret;
 }
 
+static int clk_core_prepare_enable(struct clk_core *core);
+static void clk_core_disable_unprepare(struct clk_core *core);
+
 static bool clk_core_is_enabled(struct clk_core *core)
 {
 	bool ret = false;
@@ -226,6 +229,9 @@ static bool clk_core_is_enabled(struct clk_core *core)
 	if (!core->ops->is_enabled)
 		return core->enable_count;
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_prepare_enable(core->parent);
+
 	/*
 	 * Check if clock controller's device is runtime active before
 	 * calling .is_enabled callback. If not, assume that clock is
@@ -249,6 +255,9 @@ static bool clk_core_is_enabled(struct clk_core *core)
 	if (core->rpm_enabled)
 		pm_runtime_put(core->dev);
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable_unprepare(core->parent);
+
 	return ret;
 }
 
@@ -812,6 +821,9 @@ int clk_rate_exclusive_get(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
 
+static int clk_core_enable(struct clk_core *core);
+static void clk_core_disable(struct clk_core *core);
+
 static void clk_core_unprepare(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
@@ -835,6 +847,9 @@ static void clk_core_unprepare(struct clk_core *core)
 
 	WARN(core->enable_count > 0, "Unpreparing enabled %s\n", core->name);
 
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_enable(core->parent);
+
 	trace_clk_unprepare(core);
 
 	if (core->ops->unprepare)
@@ -843,6 +858,9 @@ static void clk_core_unprepare(struct clk_core *core)
 	clk_pm_runtime_put(core);
 
 	trace_clk_unprepare_complete(core);
+
+	if (core->flags & CLK_OPS_PARENT_ENABLE)
+		clk_core_disable(core->parent);
 	clk_core_unprepare(core->parent);
 }
 
@@ -891,6 +909,9 @@ static int clk_core_prepare(struct clk_core *core)
 		if (ret)
 			goto runtime_put;
 
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_enable(core->parent);
+
 		trace_clk_prepare(core);
 
 		if (core->ops->prepare)
@@ -898,6 +919,9 @@ static int clk_core_prepare(struct clk_core *core)
 
 		trace_clk_prepare_complete(core);
 
+		if (core->flags & CLK_OPS_PARENT_ENABLE)
+			clk_core_disable(core->parent);
+
 		if (ret)
 			goto unprepare;
 	}
-- 
2.37.0.144.g8ac04bfd2-goog


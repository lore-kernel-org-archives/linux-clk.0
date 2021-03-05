Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40959C433E0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Mar 2021 00:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 087B264FFD
	for <linux-clk@archiver.kernel.org>; Fri,  5 Mar 2021 00:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCEAdk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Mar 2021 19:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhCEAdk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Mar 2021 19:33:40 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387F5C061756
        for <linux-clk@vger.kernel.org>; Thu,  4 Mar 2021 16:33:38 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id w1so104164ejf.11
        for <linux-clk@vger.kernel.org>; Thu, 04 Mar 2021 16:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UERQO4egOHXp3lfQJ/sHEH1TG5FquGO2TdMFVt16Qp0=;
        b=Gi09YjnZ8XiisKl6ZPp/ol6m5jzpaVysKvVemGggbWEt4G9eN0T+z0MF5xvHOkb6rN
         Q5diwLSfZ+gYDpm4TOUdB2NhGMjiRL3Gnho1H8RwiXJtoH6/e9KRX465ScXr87B27M33
         n3KFFs6amgzDp6wg1dNVvW1J4xj+ZUjuxSPXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UERQO4egOHXp3lfQJ/sHEH1TG5FquGO2TdMFVt16Qp0=;
        b=lC/3N+gh5loVlwDv1DHvtVyAf84yFObtQv0MI0spwoTUILWt/ff+8TwibxGAsZGcnY
         NmRnJHjG8AREB74yFdt6pUpBxRB47Ex/wNZvj3WGQCD75C5s8FYiVA4qSBhDnyYgtHSx
         kqFaUAdsTo5VWjDu56lHeDR1n1XAc2dXE2B0lKS1Gjt1nV4+ZDitEp9zbWGKbOkh/NM5
         s2VY1dtsYwUsAkbdanZ4nRhFUtRLKSTSEzTlDBs2D0z6Ej2hVE+W58G9NDRPSXq1sLhM
         ksxK7SWe88SfCO+y0tPYWVkC584jAgQrO65YCWatx7dVF3AcMBqSGF5TdoBnecA7fKbn
         QYng==
X-Gm-Message-State: AOAM531JqCEDqpH7ok6rVxuIvOQiQTMB/50iIY36aR3eWsgJtcK6rlkh
        RWf+tXV/10/jqnW3lbAh5g4BGw==
X-Google-Smtp-Source: ABdhPJxCOohUu+cWq4gro8zy06L2dPjtaZpCUWVSEqxDSbI5zc1MwpXZedAWWvlZiYyw+XUSJVfTxg==
X-Received: by 2002:a17:907:2075:: with SMTP id qp21mr93448ejb.451.1614904416948;
        Thu, 04 Mar 2021 16:33:36 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id r13sm549501edy.3.2021.03.04.16.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 16:33:36 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: use clk_core_enable_lock() a bit more
Date:   Fri,  5 Mar 2021 01:33:34 +0100
Message-Id: <20210305003334.575831-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use clk_core_enable_lock() and clk_core_disable_lock() in a few places
rather than open-coding them.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/clk/clk.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5052541a0986..8c1ed844b97e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2078,12 +2078,8 @@ static void clk_change_rate(struct clk_core *core)
 		return;
 
 	if (core->flags & CLK_SET_RATE_UNGATE) {
-		unsigned long flags;
-
 		clk_core_prepare(core);
-		flags = clk_enable_lock();
-		clk_core_enable(core);
-		clk_enable_unlock(flags);
+		clk_core_enable_lock(core);
 	}
 
 	if (core->new_parent && core->new_parent != core->parent) {
@@ -2116,11 +2112,7 @@ static void clk_change_rate(struct clk_core *core)
 	core->rate = clk_recalc(core, best_parent_rate);
 
 	if (core->flags & CLK_SET_RATE_UNGATE) {
-		unsigned long flags;
-
-		flags = clk_enable_lock();
-		clk_core_disable(core);
-		clk_enable_unlock(flags);
+		clk_core_disable_lock(core);
 		clk_core_unprepare(core);
 	}
 
@@ -3564,8 +3556,6 @@ static int __clk_core_init(struct clk_core *core)
 	 * reparenting clocks
 	 */
 	if (core->flags & CLK_IS_CRITICAL) {
-		unsigned long flags;
-
 		ret = clk_core_prepare(core);
 		if (ret) {
 			pr_warn("%s: critical clk '%s' failed to prepare\n",
@@ -3573,9 +3563,7 @@ static int __clk_core_init(struct clk_core *core)
 			goto out;
 		}
 
-		flags = clk_enable_lock();
-		ret = clk_core_enable(core);
-		clk_enable_unlock(flags);
+		ret = clk_core_enable_lock(core);
 		if (ret) {
 			pr_warn("%s: critical clk '%s' failed to enable\n",
 			       __func__, core->name);
-- 
2.29.2


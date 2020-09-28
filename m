Return-Path: <SRS0=4QiE=DF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52665C2D0A8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Sep 2020 08:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CBE921531
	for <linux-clk@archiver.kernel.org>; Mon, 28 Sep 2020 08:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tW1BN7cy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgI1IsA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Sep 2020 04:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1IsA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Sep 2020 04:48:00 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E8C0613CE
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2020 01:48:00 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mn7so230906pjb.5
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2020 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wY/Phh7haMCfrTDSqngzJDGR4pk8ZSUHFlVi1FrntNA=;
        b=tW1BN7cydHn8bciyQaMKZ51ecy0MhjdVxSWTovppv/D74ZDTobDVJ2HUeOgH6w+c/j
         U4S6rFlt/0Ym+XqpJ4b9S+ygvml27p3t1rLCUrAiAePqVGfvdgO85F/5H2m1GIpLqJJm
         sK2jICuluuxBGOtDL5twBNxIQqclFgY9q/TyrzlRDxR1pwJEcxBzP0aWgtItW7RF8A7R
         aTbasQaNJ2ffSJ6wudKkStpLWuBppzIf8gPBcpFF+ygNay8/5SGAGoQFSNQhUSs6quPh
         cQSddtkGeY7gWkn6mE85GMYYvZLeNqifBIknRvD+C+1YpdIhJamerVYyxiAtrrH2Eei+
         GM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wY/Phh7haMCfrTDSqngzJDGR4pk8ZSUHFlVi1FrntNA=;
        b=q4CPR0CEqtBbE4mSg12ZPFa4iUzNd0W3cc6RjD47D/jF4gfmNMW3laqsc1oLZXcgPA
         kwmZ4i2sRhtR5zI9ZaSmIFWQVz0wuHRAj4D+aoqeuvxMdzMwZuHhVPU/tNEFAWAKBdL8
         oTeemyVLk9bIjtos3vMNnujPc9QGlNLGG7nswG827XqCt9emBWrpXPuZB7zr+hh6uYTL
         9xpHq3goLNtyv8jRlYr3Ne2KceuthvSMM0IiswcaQ66e5Od2oFlLDCDko6XPWKgCSVQk
         rTshjIqWJWJooXYASqUvM7FQZu88uZQufqtgzj2Pd2D2wWRP36bAjcHQHPqjoDR+SKMp
         mUqg==
X-Gm-Message-State: AOAM531MBYucAMNzoMIzERdBBrZOqw4Lp9tnLdskvbFAqUdEzIgKsM6u
        PNKJdl3sLTzAD0LavdeHatSUew==
X-Google-Smtp-Source: ABdhPJye6u3HOi8ZQVN02jipYNmuwO9krjvzCg+PZj+Fb/NHiBRugHZMXouOiOECLimIC0oDDjZmzA==
X-Received: by 2002:a17:90a:9505:: with SMTP id t5mr380570pjo.121.1601282880163;
        Mon, 28 Sep 2020 01:48:00 -0700 (PDT)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id u18sm623181pgk.18.2020.09.28.01.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 01:47:59 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     sboyd@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     shawn.guo@linaro.org, Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] clk: emit warning if fail to get parent clk
Date:   Mon, 28 Sep 2020 16:47:44 +0800
Message-Id: <20200928084744.32478-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Emit warning if fail to get parent clk to expose potential issue earlier.
For example, clk_hw_get_rate() will return 0 for a clock without parent core
while parent number is not zero. This cause opp always think it is switching
frequency from 0 to some other frequency. Crash may happen if we switch
from high frequency to low frequency and lower CPU voltage before clk rate
switching.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/clk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1a27e99ccb17..78b21b888e56 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -424,6 +424,7 @@ static void clk_core_fill_parent_index(struct clk_core *core, u8 index)
 {
 	struct clk_parent_map *entry = &core->parents[index];
 	struct clk_core *parent = ERR_PTR(-ENOENT);
+	int emit_warn = 0;
 
 	if (entry->hw) {
 		parent = entry->hw->core;
@@ -443,6 +444,12 @@ static void clk_core_fill_parent_index(struct clk_core *core, u8 index)
 	/* Only cache it if it's not an error */
 	if (!IS_ERR(parent))
 		entry->core = parent;
+	else if (parent != ERR_PTR(-EPROBE_DEFER))
+		emit_warn = 1;
+
+	if (emit_warn || (!parent && core->num_parents))
+		pr_warn("Fail to get indexed %d parent for clk %s.",
+			index, core->name);
 }
 
 static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
-- 
2.17.1


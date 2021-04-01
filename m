Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630ACC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 22:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2990261104
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 22:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbhDAWwB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 18:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbhDAWwA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 18:52:00 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F859C0613E6
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 15:52:00 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u10so3887407lju.7
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 15:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=a4t9lKL01C/6vOZi1P7d+8Bm3weoCJmP+hIwg0y+51U=;
        b=wMUW8yx5nxIqZfuGyNb+A74nQGpLA9jkplKFj47eu4f7tvb7ixMIuneCU5RL1iv4fe
         Y5JaOusvHHlYGwyLzJIKXNSLXr8EXXtVVka03bQ5qhm9vhagXtHiAvLzRFIw8LKIXx8u
         VEQ7dyCtN1V5AEamhE8wUcCRaufQ6YhtiWffdehaC+0Aemg+uM5Zm8FONwII/LwUH1hn
         bEzQREjWxC9dYBKfqXkOt79PZiF4z5iLPf/p6cLfzcilmdT22F/qvyuLDXpt7l51E/P1
         3T0LK08N20uW1BaHnodHLO+3AoF//ONpeYHper2mg6SGSC28EsNdXD6sx/31MXmXik0A
         5FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=a4t9lKL01C/6vOZi1P7d+8Bm3weoCJmP+hIwg0y+51U=;
        b=NLPGJpNyiZnS6+HpNBQHEJSnXekmZnb19gY2EV0ABo0R1U9wqjcDePiu/2pS/XF+eJ
         xRe8hrzy5uMgb02vB6HkyBJ8UkoD0MKFB1xnjPCf855RU5yl5TT/aI5t03O5Y6/uMH9x
         AJfCfZTqPIeawN/tDR1K1l7eXF7mvdJDO2H9NILF5QMP2whnGHbTnPTu1/OyEA3/p4JC
         qp3KYXuT0BC9NShALe58eme5NkHsoAe7YLVX6wZasZeBdwqntnds/CiOjuX12XhKADWI
         tTIQ2Coys3qsvaeMb83cCeQCBFc3RGx2iJTnfE+bmTS5UvBN6/CaEXDGeacYGTfd4Aal
         kWMA==
X-Gm-Message-State: AOAM533d7Z33kqfJTpLbAkq9f836SNcJa0U22fqlY+/unembhjMkZ1ik
        NJgG9t1be7+17mCpwogqdvEyCAtze4yA
X-Google-Smtp-Source: ABdhPJyeF7frpZgdks2R/ELCBp78ub4YH82xS4lxkxKXxA/eOCWJnGaK0hu13YkdnbdA0s8/T1BW8g==
X-Received: by 2002:a2e:7409:: with SMTP id p9mr6403066ljc.165.1617317518967;
        Thu, 01 Apr 2021 15:51:58 -0700 (PDT)
Received: from luke.int.semihalf.com (host-193.106.246.138.static.3s.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id r27sm671882lfm.188.2021.04.01.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:51:58 -0700 (PDT)
From:   Lukasz Bartosik <lb@semihalf.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v4 1/2] clk: fix invalid usage of list cursor in register
Date:   Fri,  2 Apr 2021 00:51:48 +0200
Message-Id: <20210401225149.18826-1-lb@semihalf.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix invalid usage of a list_for_each_entry cursor in
clk_notifier_register(). When list is empty or if the list
is completely traversed (without breaking from the loop on one
of the entries) then the list cursor does not point to a valid
entry and therefore should not be used.

The issue was dicovered when running 5.12-rc1 kernel on x86_64
with KASAN enabled:
BUG: KASAN: global-out-of-bounds in clk_notifier_register+0xab/0x230
Read of size 8 at addr ffffffffa0d10588 by task swapper/0/1

CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc1 #1
Hardware name: Google Caroline/Caroline,
BIOS Google_Caroline.7820.430.0 07/20/2018
Call Trace:
 dump_stack+0xee/0x15c
 print_address_description+0x1e/0x2dc
 kasan_report+0x188/0x1ce
 ? clk_notifier_register+0xab/0x230
 ? clk_prepare_lock+0x15/0x7b
 ? clk_notifier_register+0xab/0x230
 clk_notifier_register+0xab/0x230
 dw8250_probe+0xc01/0x10d4
...
Memory state around the buggy address:
 ffffffffa0d10480: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
 ffffffffa0d10500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
>ffffffffa0d10580: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
                      ^
 ffffffffa0d10600: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
 ffffffffa0d10680: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 00 00 00
 ==================================================================

Fixes: b2476490ef11 ("clk: introduce the common clock framework")
Reported-by: Lukasz Majczak <lma@semihalf.com>
Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
---
 drivers/clk/clk.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d181c6d31d22..ba9252591f44 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4345,20 +4345,19 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
 	/* search the list of notifiers for this clk */
 	list_for_each_entry(cn, &clk_notifier_list, node)
 		if (cn->clk == clk)
-			break;
+			goto found;
 
 	/* if clk wasn't in the notifier list, allocate new clk_notifier */
-	if (cn->clk != clk) {
-		cn = kzalloc(sizeof(*cn), GFP_KERNEL);
-		if (!cn)
-			goto out;
+	cn = kzalloc(sizeof(*cn), GFP_KERNEL);
+	if (!cn)
+		goto out;
 
-		cn->clk = clk;
-		srcu_init_notifier_head(&cn->notifier_head);
+	cn->clk = clk;
+	srcu_init_notifier_head(&cn->notifier_head);
 
-		list_add(&cn->node, &clk_notifier_list);
-	}
+	list_add(&cn->node, &clk_notifier_list);
 
+found:
 	ret = srcu_notifier_chain_register(&cn->notifier_head, nb);
 
 	clk->core->notifier_count++;
-- 
2.31.0.208.g409f899ff0-goog


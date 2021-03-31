Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EB6C43460
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 16:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24FFD61005
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 16:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhCaQAK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhCaP7i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 11:59:38 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A655C061574
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 08:59:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z8so24395805ljm.12
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vo8FNryQSezvwrA/aoc89Jd0FZ44NlFLXjZpn6pPSjw=;
        b=L/KbLaR8QcSJnMcJpRmiqCjHXeNqSdfaPzFNxk8/6CMAfm/Z2fu58sdA+LOLcKF248
         82BGUd+gQ9yg40P1QR0U3JnH0G5tJYGqfakU6+JlM4arHZP/z1+vGwwDIOn5w8P0TDLN
         HOPiQ/B4juaDyUVawhrL2TiYHlYBy+zeWITnYg8gkaS5X0QHKs3aY05TT3FLz3FnRzto
         UnWmN1PyUiOLEh78/R+61Ky3PP/0hp3r3jaW0n/Li0QYd5+QzsjW5FtMb9EUzvsLageB
         REMI/IIPzkQ9wOju6CujYmnWShTicxjaw8IVohE4koX1v7jea7Z+kcjxBLv5iS6m+RMf
         ZgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vo8FNryQSezvwrA/aoc89Jd0FZ44NlFLXjZpn6pPSjw=;
        b=m3DZlhgE3lse60gwCmDboEjS2CVXqq4Bjfdtc9H+ESJK3Y70N3VXRIO13e5mZhhdte
         jji5pY/CHOzumUSANvYFiLs4keeTWd6GTiLDQYsqd6euxcB9lct8eOVXa2K7eThcE6GM
         CLO8Cf818QJeFBEFE0bY3qAtMPAira43svWKYesQtupCbd77gT6zXVaSSoBOIms3kxHz
         4q+i24M27u0TrXc07YKB/x4XPitwH10PvaP9le5K2HQgZSoqJ4e1ZiHU+Fz9GA6csaN2
         C+grgIlRDWnd0Y++Qu8TyVumMU8RtiE3aRFNOnf19XRw9MLqwImDulogsMHtzpDjZPTj
         h2CA==
X-Gm-Message-State: AOAM532j4EygynFTEjPBAMRQqAqQ4CXr5ViivK/JDK5Xn71gPcvtRyH1
        x2okwY6dSELrZ6Rw2bMMHHRTQgqPRLsZ
X-Google-Smtp-Source: ABdhPJyolsgZCq5bJ8lvCGe29RszrQuiRCUZN9+HNiuC/25HbCwVMCxzS0SUtmEdfGEVUxMEdWO4yg==
X-Received: by 2002:a2e:2d02:: with SMTP id t2mr2446233ljt.488.1617206376573;
        Wed, 31 Mar 2021 08:59:36 -0700 (PDT)
Received: from luke.int.semihalf.com (host-193.106.246.138.static.3s.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id x8sm271457lfc.8.2021.03.31.08.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:59:36 -0700 (PDT)
From:   Lukasz Bartosik <lb@semihalf.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v3] clk: fix invalid usage of a list_for_each_entry cursor
Date:   Wed, 31 Mar 2021 17:58:22 +0200
Message-Id: <20210331155822.3648-1-lb@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317160545.14309-1-lb@semihalf.com>
References: <20210317160545.14309-1-lb@semihalf.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix invalid usage of a list_for_each_entry cursor. When
list is empty or if the list is completely traversed (without
breaking from the loop on one of the entries) then the list
cursor does not point to a valid entry and therefore should
not be used.

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
 drivers/clk/clk.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d181c6d31d22..742cb8611ad4 100644
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
@@ -4393,24 +4392,24 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
 
 	list_for_each_entry(cn, &clk_notifier_list, node)
 		if (cn->clk == clk)
-			break;
+			goto found;
 
-	if (cn->clk == clk) {
-		ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
+	ret = -ENOENT;
+	goto out;
 
-		clk->core->notifier_count--;
+found:
+	ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
 
-		/* XXX the notifier code should handle this better */
-		if (!cn->notifier_head.head) {
-			srcu_cleanup_notifier_head(&cn->notifier_head);
-			list_del(&cn->node);
-			kfree(cn);
-		}
+	clk->core->notifier_count--;
 
-	} else {
-		ret = -ENOENT;
+	/* XXX the notifier code should handle this better */
+	if (!cn->notifier_head.head) {
+		srcu_cleanup_notifier_head(&cn->notifier_head);
+		list_del(&cn->node);
+		kfree(cn);
 	}
 
+out:
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.17.1


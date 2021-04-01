Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653D5C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 22:52:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F056610FA
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 22:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhDAWwC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 18:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbhDAWwB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 18:52:01 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C41C061788
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 15:52:01 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m12so5091232lfq.10
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 15:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tcAyqLb9DKwRI8AB+Qm8WtY87y9HSo79z1Kf5teM6V0=;
        b=dCHG9PcTzNNzVGeBogSFupsGI2wHZ+STbPrpas7+qLOUHXgFZGo/eOVRsJ63jNSWQP
         RBtW/tV7jqZowlfUU5ErYaXKTyFYTtCxfBPl91FxoL24SFZspmMbmCwrpFZkvi16n8cx
         kbuCwFl8nfXkm9jYTISxIkOdVYMAflSwbKHuEWmDfub+FG60vDjDwIiGmSHCxw0tM3TB
         ABfVGWFu85PIZWCPQnsXCk5O5DJmglkJabRa0Hz/Y9hqgYNwPIbE6EoMc2+jcKVPXNgJ
         ha5CiDrulzggREFDephvQQcxX/xAdWRqJZFHLCXqkDQ5rzlJ8PnfTf+hHjcfbhPprKP1
         yasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tcAyqLb9DKwRI8AB+Qm8WtY87y9HSo79z1Kf5teM6V0=;
        b=J5OwVULDsNwDraOJlfjQ/9MN1i0C4a6o/S3fB47meoaph3qsSk/QDJLl1q20+xhXLR
         pA+FQrtT66trHxFkX0OynIzRMMEQ1EF6yhPgg34/0JOtS+j5Wii2KMT83RwkKsBbpQaP
         uNr3pDjvJ37/mRO2Edsma9sZcx/LbHe3wtEcnJh1hZQ6qDYQJPj6WYDldS8iJXAwPb7E
         orJCgPof/9jZGU3RSWA742SI21OsmnPH5TULcbSGGWFeYQRogau1p/ZgYCDaP3iiZuKy
         6s6uS5XSFFOi61UZHZX137ddWzXMfwHLxppfyKz3xBhP6BAhO8VO6dKoS9jgzS7zRx+Y
         yXZw==
X-Gm-Message-State: AOAM530jV+kIVwiNZ7YbHqgXIDLRY42qLW5fxthU3lSB/p46u5XQzeb4
        mB+c0fzxbeN9CyQ0ZzFNWDHu
X-Google-Smtp-Source: ABdhPJyFe9WX7PjMgmUZ/gzuD2rJR/q6qraYyIDo3ko4BhuAZ93Bu03dR8aLeMGxqmfeZ8jijJTQ2A==
X-Received: by 2002:a19:7cc:: with SMTP id 195mr6999859lfh.134.1617317519744;
        Thu, 01 Apr 2021 15:51:59 -0700 (PDT)
Received: from luke.int.semihalf.com (host-193.106.246.138.static.3s.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id r27sm671882lfm.188.2021.04.01.15.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:51:59 -0700 (PDT)
From:   Lukasz Bartosik <lb@semihalf.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v4 2/2] clk: fix invalid usage of list cursor in unregister
Date:   Fri,  2 Apr 2021 00:51:49 +0200
Message-Id: <20210401225149.18826-2-lb@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401225149.18826-1-lb@semihalf.com>
References: <20210401225149.18826-1-lb@semihalf.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix invalid usage of a list_for_each_entry cursor in
clk_notifier_unregister(). When list is empty or if the list
is completely traversed (without breaking from the loop on one
of the entries) then the list cursor does not point to a valid
entry and therefore should not be used. The patch fixes a logical
bug that hasn't been seen in pratice however it is analogus
to the bug fixed in clk_notifier_register().

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
 drivers/clk/clk.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ba9252591f44..d6301a3351f2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4382,32 +4382,28 @@ EXPORT_SYMBOL_GPL(clk_notifier_register);
  */
 int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
 {
-	struct clk_notifier *cn = NULL;
-	int ret = -EINVAL;
+	struct clk_notifier *cn;
+	int ret = -ENOENT;
 
 	if (!clk || !nb)
 		return -EINVAL;
 
 	clk_prepare_lock();
 
-	list_for_each_entry(cn, &clk_notifier_list, node)
-		if (cn->clk == clk)
-			break;
-
-	if (cn->clk == clk) {
-		ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
+	list_for_each_entry(cn, &clk_notifier_list, node) {
+		if (cn->clk == clk) {
+			ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
 
-		clk->core->notifier_count--;
+			clk->core->notifier_count--;
 
-		/* XXX the notifier code should handle this better */
-		if (!cn->notifier_head.head) {
-			srcu_cleanup_notifier_head(&cn->notifier_head);
-			list_del(&cn->node);
-			kfree(cn);
+			/* XXX the notifier code should handle this better */
+			if (!cn->notifier_head.head) {
+				srcu_cleanup_notifier_head(&cn->notifier_head);
+				list_del(&cn->node);
+				kfree(cn);
+			}
+			break;
 		}
-
-	} else {
-		ret = -ENOENT;
 	}
 
 	clk_prepare_unlock();
-- 
2.31.0.208.g409f899ff0-goog


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D9DC433E0
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 16:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32A464DD1
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 16:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhCQQG0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 12:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbhCQQFu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 12:05:50 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DCBC06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 09:05:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k9so3752580lfo.12
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e1Zr9jO6aZ+dMn3WvGc7NeUPWrxmV41lKywPaG5lfEg=;
        b=wMJUuSpV7aLCnthfC95hBSso06RFN+PTpvJAGM71R6Vaus65bCceZEFmqnlBfayEvk
         0bC/ARqQ9H2XV1pEyCHQoylycTfkeEaynRL6EC99ZA7NRCxsQM4x6J7rR2QEgyShtHBu
         5ffjMf+EjAa5QhW2aW4IgjjKJIyl9EPMMsi76de7O/+XOfkgmr92AEIN+Bw8BdV65X43
         qHAGe26ST3ZE7Ryo77xzGM8JJRKFnzS1xS789m2zJmvZqSLqdEqwula3GeqbvULtgN92
         rf+f3xWQrvK3Nx/GGe1tIixxo3ABNSkSnfPYM85hcNa4CY9MCXKzb2CO68msguqvihab
         dAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e1Zr9jO6aZ+dMn3WvGc7NeUPWrxmV41lKywPaG5lfEg=;
        b=tQP4ZpDC3Qa9t/2mLbeKewiE2PYgtcVcSlMmPZcEClqhuazM/GOdYQr+1r1UmobdYt
         O4AEjXUXsWx8j3BX9Jii3HxX8I+g7uSY9mQAwvu5dmNhLWnJA5qLHigNNMpkBTuSUMQ/
         ZJ8P6921ypZdh+KNiJ8/DOC5K9ddPtqeFWXkrnNCtsuVt078TbtrNzUXZwGKf0YdaBD0
         V4UcuZJWkzOJ86Tj97dyd3u+axXeXv4nfa6dohEDFvsO4B7PQPSdoJocs9JBuAaIBJ2I
         tqLPMPQtUoreu+yA8oA62HhAhf1K27iC3sbFMJMQwgMAkJO+rKq0IcVzwfrRuZY8k6w0
         6y9g==
X-Gm-Message-State: AOAM533ovNyHFdYyVSMgNOGGG5MSOkL5e21elDG2yGK5TgoPOdrIeptF
        inG7IHH3u2xGnH5ibcLcNRr8
X-Google-Smtp-Source: ABdhPJwLspUCqCRdJ9UtbKxAD1DfPSLQ0DUWQx2/Ya7/1VyGKJArIDih6HVX5Tiw7apMq3k6rQDUng==
X-Received: by 2002:a19:e216:: with SMTP id z22mr2655043lfg.27.1615997148512;
        Wed, 17 Mar 2021 09:05:48 -0700 (PDT)
Received: from luke.int.semihalf.com (host-193.106.246.138.static.3s.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b9sm3416913lfo.237.2021.03.17.09.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:05:48 -0700 (PDT)
From:   Lukasz Bartosik <lb@semihalf.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v2] clk: fix invalid usage of a list_for_each_entry cursor
Date:   Wed, 17 Mar 2021 17:05:45 +0100
Message-Id: <20210317160545.14309-1-lb@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305191307.15915-1-lb@semihalf.com>
References: <20210305191307.15915-1-lb@semihalf.com>
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
 drivers/clk/clk.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c1ed844b97e..d41dfbcfeba0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4336,6 +4336,7 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
 {
 	struct clk_notifier *cn;
 	int ret = -ENOMEM;
+	bool entry_found = false;
 
 	if (!clk || !nb)
 		return -EINVAL;
@@ -4343,12 +4344,15 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
 	clk_prepare_lock();
 
 	/* search the list of notifiers for this clk */
-	list_for_each_entry(cn, &clk_notifier_list, node)
-		if (cn->clk == clk)
+	list_for_each_entry(cn, &clk_notifier_list, node) {
+		if (cn->clk == clk) {
+			entry_found = true;
 			break;
+		}
+	}
 
 	/* if clk wasn't in the notifier list, allocate new clk_notifier */
-	if (cn->clk != clk) {
+	if (!entry_found) {
 		cn = kzalloc(sizeof(*cn), GFP_KERNEL);
 		if (!cn)
 			goto out;
@@ -4385,17 +4389,21 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
 {
 	struct clk_notifier *cn = NULL;
 	int ret = -EINVAL;
+	bool entry_found = false;
 
 	if (!clk || !nb)
 		return -EINVAL;
 
 	clk_prepare_lock();
 
-	list_for_each_entry(cn, &clk_notifier_list, node)
-		if (cn->clk == clk)
+	list_for_each_entry(cn, &clk_notifier_list, node) {
+		if (cn->clk == clk) {
+			entry_found = true;
 			break;
+		}
+	}
 
-	if (cn->clk == clk) {
+	if (entry_found) {
 		ret = srcu_notifier_chain_unregister(&cn->notifier_head, nb);
 
 		clk->core->notifier_count--;
-- 
2.17.1


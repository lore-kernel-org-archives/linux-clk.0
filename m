Return-Path: <SRS0=rTxN=ID=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7219AC433E6
	for <linux-clk@archiver.kernel.org>; Fri,  5 Mar 2021 19:13:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42F9864F69
	for <linux-clk@archiver.kernel.org>; Fri,  5 Mar 2021 19:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhCETNY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Mar 2021 14:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCETNN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Mar 2021 14:13:13 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7431CC061574
        for <linux-clk@vger.kernel.org>; Fri,  5 Mar 2021 11:13:13 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id m11so4123764lji.10
        for <linux-clk@vger.kernel.org>; Fri, 05 Mar 2021 11:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=3GKGzv8vDMt2VBW8tVmUh30Ue3oIYcjLILvqtVzhXBQ=;
        b=nCQ51OtKPNWmk+zEwuTEd6kugMBon8dTSE9AyKIo5ED6ZBmpL7hApeiX8vzK4FbENF
         IwMMOZsdU6Uuf0PbibJktfiWKYzXVTxupSiAdSJHQE/4dtkA70n71s5/oMEWnulbKrpg
         BJtThfCc88PwYwXR4bKhKe/B0pAp6KVAnYE1KHuHiEpPWUhKAYUZ9xcQUejCKBJ/+KpG
         5ORpbqFPXOhCryIDvn5jGyEYE19mktuUDfATlq0/gUFjCN5BrVMJUGCuhcidnWYOr5Dv
         TeoBUNODKOWEPrJl46Jj2fSyJLNZnTjYC3v2DWB+lcQ+//Xbe+k4z6u4/QFHnoO86Lcd
         aI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3GKGzv8vDMt2VBW8tVmUh30Ue3oIYcjLILvqtVzhXBQ=;
        b=ac16MtKvU0DX5KdtB0rFbLTRy65QFlJ3TBCvZFL5CODMaPxA/3xQ4NTpmcEbOv0Lcg
         cPMSZO/zAe04IRo+ANTgUpJoN590ddW/dZFUx3/j4lefYzp2qflDztWWaDbZ9CvKm/E+
         v9wRBpLhnzzmZzqfpV2sSBVFAoyRLWKZcKaqrYRCkNFrC5ufj2DoM/V7t7Vh4U513joi
         1ues2i6NBXV9o2zvQCiRpv2pUMAVJlRyua1qjyQvxB3/v/QtT5EN2/AcUZp+kX0tADMR
         7NNWg+u82rOqBms48cy69jFo8iWaHW7ADizZioT+Tq9tf4zhwIruIbQiE0o+4EfBJwce
         N2Ig==
X-Gm-Message-State: AOAM530uA9brABBEc21s+41p2kLqK5Q1ZYs+Wu6wwfEMwmVI+oEe1L70
        DlGMNnIE0CKScRItNX8O9KuX
X-Google-Smtp-Source: ABdhPJwUkiqVkUTrM8Ooxsgm+VmuKNxx8d3H1zcOShgLlIuvffaCm9eLwWF1n10kbpEbDGQR8wbhVg==
X-Received: by 2002:a2e:9148:: with SMTP id q8mr6085414ljg.356.1614971592044;
        Fri, 05 Mar 2021 11:13:12 -0800 (PST)
Received: from luke.int.semihalf.com (host-193.106.246.138.static.3s.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id g21sm404067lfr.212.2021.03.05.11.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 11:13:11 -0800 (PST)
From:   Lukasz Bartosik <lb@semihalf.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
Subject: [PATCH v1] clk: fix invalid usage of list_for_each_entry cursor
Date:   Fri,  5 Mar 2021 20:13:07 +0100
Message-Id: <20210305191307.15915-1-lb@semihalf.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix invalid usage of list_for_each_entry cursor. When list
is empty then list cursor does not point to a valid entry
and therefore should not be used.

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

Fixes: (b2476490ef11 clk: introduce the common clock framework)

Reported-by: Lukasz Majczak <lma@semihalf.com>
Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
---
 drivers/clk/clk.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3412a7cc03fd..bd90de885392 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4360,6 +4360,7 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
 {
 	struct clk_notifier *cn;
 	int ret = -ENOMEM;
+	bool entry_found = false;
 
 	if (!clk || !nb)
 		return -EINVAL;
@@ -4367,12 +4368,15 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
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
@@ -4409,17 +4413,21 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
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


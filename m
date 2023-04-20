Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A663C77B72
	for <linux-clk@archiver.kernel.org>; Thu, 20 Apr 2023 08:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbjDTICD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234014AbjDTICC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2023 04:02:02 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 22087213F;
        Thu, 20 Apr 2023 01:02:00 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 5377518014D2A8;
        Thu, 20 Apr 2023 16:01:58 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Suhui <suhui@nfschina.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suhui <suhui@nfschina.com>
Subject: [PATCH] clk: Remove unnecessary (void*) conversions
Date:   Thu, 20 Apr 2023 16:01:54 +0800
Message-Id: <20230420080154.2356480-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

No need cast (void*) to (struct hlist_head **).

Signed-off-by: Suhui <suhui@nfschina.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae07685c7588..9410a4e1b04b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3194,7 +3194,7 @@ static void clk_summary_show_subtree(struct seq_file *s, struct clk_core *c,
 static int clk_summary_show(struct seq_file *s, void *data)
 {
 	struct clk_core *c;
-	struct hlist_head **lists = (struct hlist_head **)s->private;
+	struct hlist_head **lists = s->private;
 
 	seq_puts(s, "                                 enable  prepare  protect                                duty  hardware\n");
 	seq_puts(s, "   clock                          count    count    count        rate   accuracy phase  cycle    enable\n");
@@ -3253,7 +3253,7 @@ static int clk_dump_show(struct seq_file *s, void *data)
 {
 	struct clk_core *c;
 	bool first_node = true;
-	struct hlist_head **lists = (struct hlist_head **)s->private;
+	struct hlist_head **lists = s->private;
 
 	seq_putc(s, '{');
 	clk_prepare_lock();
-- 
2.30.2


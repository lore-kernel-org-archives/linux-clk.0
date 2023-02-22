Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AC4C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 05:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjBUF1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 00:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbjBUF1S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 00:27:18 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B09A1C7FF;
        Mon, 20 Feb 2023 21:27:17 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id CD4D81A009F1;
        Tue, 21 Feb 2023 13:27:54 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wRel6M8OWtfb; Tue, 21 Feb 2023 13:27:54 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
        (Authenticated sender: zeming@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id EB0271A009BB;
        Tue, 21 Feb 2023 13:27:53 +0800 (CST)
From:   Li zeming <zeming@nfschina.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, michal.simek@xilinx.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>
Subject: [PATCH] zynq: clkc: Add kmalloc allocation flag
Date:   Thu, 23 Feb 2023 05:58:34 +0800
Message-Id: <20230222215834.3507-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The kmalloc could crash if allocation fails. Add the __GFP_NOFAIL flag
to ensure that allocation succeeds every time.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/clk/zynq/clkc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynq/clkc.c b/drivers/clk/zynq/clkc.c
index 7bdeaff2bfd6..7621c2f00468 100644
--- a/drivers/clk/zynq/clkc.c
+++ b/drivers/clk/zynq/clkc.c
@@ -427,7 +427,7 @@ static void __init zynq_clk_setup(struct device_node *np)
 			SLCR_GEM1_CLK_CTRL, 0, 0, &gem1clk_lock);
 
 	tmp = strlen("mio_clk_00x");
-	clk_name = kmalloc(tmp, GFP_KERNEL);
+	clk_name = kmalloc(tmp, GFP_KERNEL | __GFP_NOFAIL);
 	for (i = 0; i < NUM_MIO_PINS; i++) {
 		int idx;
 
-- 
2.18.2


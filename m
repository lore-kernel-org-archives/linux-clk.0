Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B6CC433E0
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 18:53:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39C7164E32
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 18:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbhBJSwl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 13:52:41 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53127 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbhBJSug (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2021 13:50:36 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l9uYU-0007ag-NO; Wed, 10 Feb 2021 18:49:38 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] soc: xilinx: vcu: remove deadcode on null divider check
Date:   Wed, 10 Feb 2021 18:49:38 +0000
Message-Id: <20210210184938.146124-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'divider' has previously been null checked followed by
a return, hence the subsequent null check is redundant deadcode
that can be removed.  Clean up the code and remove it.

Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index d66b1315114e..607936d7a413 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -512,9 +512,6 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
 
 	mux = clk_hw_get_parent(divider);
 	clk_hw_unregister_mux(mux);
-	if (!divider)
-		return;
-
 	clk_hw_unregister_divider(divider);
 }
 
-- 
2.30.0


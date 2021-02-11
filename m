Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B692BC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 10:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A7F64E9C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 10:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhBKKAJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 05:00:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45523 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhBKJ5r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 04:57:47 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lA8ib-0004VP-1m; Thu, 11 Feb 2021 09:57:01 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] soc: xilinx: vcu: fix error check on clk_hw_get_parent call
Date:   Thu, 11 Feb 2021 09:57:00 +0000
Message-Id: <20210211095700.158960-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for failur on the call to clk_hw_get_parent
is checking for a null return in the divider pointer instead of
checking the mux pointer. Fix this.

Thanks to Michael Tretter for suggesting the correct fix.

Addresses-Coverity: ("Logically Dead Code")
Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Check on mux pointer rather than removing deadcode that wasn't
    actually really dead code.

---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index d66b1315114e..256b8c4b9ee4 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -512,7 +512,7 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
 
 	mux = clk_hw_get_parent(divider);
 	clk_hw_unregister_mux(mux);
-	if (!divider)
+	if (!mux)
 		return;
 
 	clk_hw_unregister_divider(divider);
-- 
2.30.0


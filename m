Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:52383 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753866AbcINSki (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Sep 2016 14:40:38 -0400
To: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matt Porter <mporter@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Vaishali Thakkar <vaishali.thakkar@oracle.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] clk-kona-setup: Use kmalloc_array() in parent_process()
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <1fb2e894-93d3-3dbe-ca05-7e29e4c60e2a@users.sourceforge.net>
Date: Wed, 14 Sep 2016 20:40:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 20:26:05 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/bcm/clk-kona-setup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index 526b0b0..a2e7e91 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -586,8 +586,9 @@ static u32 *parent_process(const char *clocks[],
 	}
 
 	/* There is at least one parent, so allocate a selector array */
-
-	parent_sel = kmalloc(parent_count * sizeof(*parent_sel), GFP_KERNEL);
+	parent_sel = kmalloc_array(parent_count,
+				   sizeof(*parent_sel),
+				   GFP_KERNEL);
 	if (!parent_sel) {
 		pr_err("%s: error allocating %u parent selectors\n", __func__,
 				parent_count);
-- 
2.10.0


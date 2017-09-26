Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:59752 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S967121AbdIZPF1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Sep 2017 11:05:27 -0400
To: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] [media] clk-kona-setup: Delete two error messages for a
 failed memory allocation in parent_process()
Message-ID: <022c9ba4-f3c4-e4e3-f804-2bd54937a138@users.sourceforge.net>
Date: Tue, 26 Sep 2017 17:05:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 16:54:20 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/bcm/clk-kona-setup.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index c37a7f0e83aa..281f4322355c 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -579,18 +579,13 @@ static u32 *parent_process(const char *clocks[],
 	 */
 	parent_names = kmalloc_array(parent_count, sizeof(*parent_names),
 			       GFP_KERNEL);
-	if (!parent_names) {
-		pr_err("%s: error allocating %u parent names\n", __func__,
-				parent_count);
+	if (!parent_names)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	/* There is at least one parent, so allocate a selector array */
 	parent_sel = kmalloc_array(parent_count, sizeof(*parent_sel),
 				   GFP_KERNEL);
 	if (!parent_sel) {
-		pr_err("%s: error allocating %u parent selectors\n", __func__,
-				parent_count);
 		kfree(parent_names);
 
 		return ERR_PTR(-ENOMEM);
-- 
2.14.1


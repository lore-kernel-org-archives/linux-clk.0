Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:49546 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751158AbdI0Tjy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Sep 2017 15:39:54 -0400
Subject: [PATCH 1/2] clk/versatile: Delete two error messages for a failed
 memory allocation in icst_clk_setup()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
Message-ID: <fe677e31-35b3-fc18-e63a-0f3d24c9f926@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:39:48 +0200
MIME-Version: 1.0
In-Reply-To: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:21:23 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/versatile/clk-icst.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 09fbe66f1f11..20ab4ceffb28 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -360,15 +360,12 @@ static struct clk *icst_clk_setup(struct device *dev,
 	struct icst_params *pclone;
 
 	icst = kzalloc(sizeof(struct clk_icst), GFP_KERNEL);
-	if (!icst) {
-		pr_err("could not allocate ICST clock!\n");
+	if (!icst)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	pclone = kmemdup(desc->params, sizeof(*pclone), GFP_KERNEL);
 	if (!pclone) {
 		kfree(icst);
-		pr_err("could not clone ICST params\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
-- 
2.14.2


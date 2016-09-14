Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:51709 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1763863AbcINUAm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Sep 2016 16:00:42 -0400
Subject: [PATCH 1/4] clk/Renesas-MSTP: Use kmalloc_array() in
 cpg_mstp_clocks_init()
To: linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@lip6.fr>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <2f96a36e-fae9-5992-7259-67c92692bbc3@users.sourceforge.net>
Date: Wed, 14 Sep 2016 22:00:06 +0200
MIME-Version: 1.0
In-Reply-To: <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 21:10:47 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/renesas/clk-mstp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 5093a25..9375777 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -167,7 +167,7 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	unsigned int i;
 
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
-	clks = kmalloc(MSTP_MAX_CLOCKS * sizeof(*clks), GFP_KERNEL);
+	clks = kmalloc_array(MSTP_MAX_CLOCKS, sizeof(*clks), GFP_KERNEL);
 	if (group == NULL || clks == NULL) {
 		kfree(group);
 		kfree(clks);
-- 
2.10.0


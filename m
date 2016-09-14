Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:54840 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753427AbcINUCA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Sep 2016 16:02:00 -0400
Subject: [PATCH 2/4] clk/Renesas-MSTP: Delete an error message for a failed
 memory allocation
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
        Julia Lawall <julia.lawall@lip6.fr>,
        Wolfram Sang <wsa@the-dreams.de>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <04cf79a5-df91-d8c2-83b2-ad9e9130ee7a@users.sourceforge.net>
Date: Wed, 14 Sep 2016 22:01:41 +0200
MIME-Version: 1.0
In-Reply-To: <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 21:17:18 +0200

Omit an extra message for a memory allocation failure in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/renesas/clk-mstp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 9375777..1fdc44b 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -171,7 +171,6 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	if (group == NULL || clks == NULL) {
 		kfree(group);
 		kfree(clks);
-		pr_err("%s: failed to allocate group\n", __func__);
 		return;
 	}
 
-- 
2.10.0


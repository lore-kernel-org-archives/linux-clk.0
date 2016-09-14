Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:53905 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933409AbcINUEb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Sep 2016 16:04:31 -0400
Subject: [PATCH 4/4] clk/Renesas-MSTP: Rename jump labels in
 cpg_mstp_attach_dev()
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
Message-ID: <e28d35f9-e519-5f3b-c27d-958605b5b851@users.sourceforge.net>
Date: Wed, 14 Sep 2016 22:04:14 +0200
MIME-Version: 1.0
In-Reply-To: <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 21:41:50 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/renesas/clk-mstp.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 6c82e0e..2f90718 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -256,19 +256,18 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 					   &clkspec)) {
 		if (of_device_is_compatible(clkspec.np,
 					    "renesas,cpg-mstp-clocks"))
-			goto found;
+			goto get_clk;
 
 		/* BSC on r8a73a4/sh73a0 uses zb_clk instead of an mstp clock */
 		if (!strcmp(clkspec.np->name, "zb_clk"))
-			goto found;
+			goto get_clk;
 
 		of_node_put(clkspec.np);
 		i++;
 	}
 
 	return 0;
-
-found:
+ get_clk:
 	clk = of_clk_get_from_provider(&clkspec);
 	of_node_put(clkspec.np);
 
@@ -278,20 +277,19 @@ found:
 	error = pm_clk_create(dev);
 	if (error) {
 		dev_err(dev, "pm_clk_create failed %d\n", error);
-		goto fail_put;
+		goto put_clk;
 	}
 
 	error = pm_clk_add_clk(dev, clk);
 	if (error) {
 		dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
-		goto fail_destroy;
+		goto destroy_clk;
 	}
 
 	return 0;
-
-fail_destroy:
+ destroy_clk:
 	pm_clk_destroy(dev);
-fail_put:
+ put_clk:
 	clk_put(clk);
 	return error;
 }
-- 
2.10.0


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195E0C49361
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2B6E613CB
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhFRKAo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 06:00:44 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11947 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233098AbhFRKAn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 06:00:43 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84769017"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:33 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 681F8401BC11;
        Fri, 18 Jun 2021 18:58:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/7] drivers: clk: renesas: renesas-rzg2l-cpg: Add multi clock PM support
Date:   Fri, 18 Jun 2021 10:58:18 +0100
Message-Id: <20210618095823.19885-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add multi clock PM support for cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 51 ++++++++++++++-----------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index ef308cb2368f..f32a270319e5 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -594,42 +594,49 @@ static int rzg2l_cpg_attach_dev(struct generic_pm_domain *unused, struct device
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
+	bool once = true;
 	struct clk *clk;
 	int error;
 	int i = 0;
 
 	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
 					   &clkspec)) {
-		if (rzg2l_cpg_is_pm_clk(&clkspec))
-			goto found;
-
-		of_node_put(clkspec.np);
+		if (rzg2l_cpg_is_pm_clk(&clkspec)) {
+			if (once) {
+				once = false;
+				error = pm_clk_create(dev);
+				if (error) {
+					of_node_put(clkspec.np);
+					goto err;
+				}
+			}
+			clk = of_clk_get_from_provider(&clkspec);
+			of_node_put(clkspec.np);
+			if (IS_ERR(clk)) {
+				error = PTR_ERR(clk);
+				goto fail_destroy;
+			}
+
+			error = pm_clk_add_clk(dev, clk);
+			if (error) {
+				dev_err(dev, "pm_clk_add_clk failed %d\n",
+					error);
+				goto fail_put;
+			}
+		} else {
+			of_node_put(clkspec.np);
+		}
 		i++;
 	}
 
 	return 0;
 
-found:
-	clk = of_clk_get_from_provider(&clkspec);
-	of_node_put(clkspec.np);
-
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	error = pm_clk_create(dev);
-	if (error)
-		goto fail_put;
-
-	error = pm_clk_add_clk(dev, clk);
-	if (error)
-		goto fail_destroy;
-
-	return 0;
+fail_put:
+	clk_put(clk);
 
 fail_destroy:
 	pm_clk_destroy(dev);
-fail_put:
-	clk_put(clk);
+err:
 	return error;
 }
 
-- 
2.17.1


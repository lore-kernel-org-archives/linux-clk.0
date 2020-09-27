Return-Path: <SRS0=mS9l=DE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE28EC4346E
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 20:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8489B2399A
	for <linux-clk@archiver.kernel.org>; Sun, 27 Sep 2020 20:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgI0UCW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Sep 2020 16:02:22 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:14476
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726634AbgI0UCW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Sep 2020 16:02:22 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Sep 2020 16:02:21 EDT
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; 
   d="scan'208";a="360169487"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256; 27 Sep 2020 21:55:11 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] clk: uniphier: use semicolons rather than commas to separate statements
Date:   Sun, 27 Sep 2020 21:12:11 +0200
Message-Id: <1601233948-11629-2-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-cpugear.c b/drivers/clk/uniphier/clk-uniphier-cpugear.c
index 1a33a08abf2f..a2f01a4da127 100644
--- a/drivers/clk/uniphier/clk-uniphier-cpugear.c
+++ b/drivers/clk/uniphier/clk-uniphier-cpugear.c
@@ -90,7 +90,7 @@ struct clk_hw *uniphier_clk_register_cpugear(struct device *dev,
 	init.ops = &uniphier_clk_cpugear_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = data->parent_names;
-	init.num_parents = data->num_parents,
+	init.num_parents = data->num_parents;
 
 	gear->regmap = regmap;
 	gear->regbase = data->regbase;
diff --git a/drivers/clk/uniphier/clk-uniphier-mux.c b/drivers/clk/uniphier/clk-uniphier-mux.c
index c0f4631601e2..462c84321b2d 100644
--- a/drivers/clk/uniphier/clk-uniphier-mux.c
+++ b/drivers/clk/uniphier/clk-uniphier-mux.c
@@ -70,7 +70,7 @@ struct clk_hw *uniphier_clk_register_mux(struct device *dev,
 	init.ops = &uniphier_clk_mux_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = data->parent_names;
-	init.num_parents = data->num_parents,
+	init.num_parents = data->num_parents;
 
 	mux->regmap = regmap;
 	mux->reg = data->reg;


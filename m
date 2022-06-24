Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A672C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 10:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiFXKi0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 06:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiFXKiZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 06:38:25 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D42654F45E
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cAnvD
        eVQl1emneIyrN2q7Xqz2Lr7MWYgRoxCa4Y04rs=; b=RqQF6HyFnDUsEQwZWkhTA
        tKmwT3onpsOWfzoIOe0DD6hdpbQsFEqKJUIPfeEQ/omGiSq9JrEyFCuQuLH/bAWZ
        vE+eWxVtDXEhSbPjKw45McAkcr5d20g3CIgDZ8mWpkSkyx/Y4w1zih6WJZ2lFDoA
        VnLlvdpr6zjPLd2MMXMnjA=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowACX2PcSlLVi3BWgDw--.39557S2;
        Fri, 24 Jun 2022 18:38:11 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH] clk/sprd: Hold reference returned by of_get_parent()
Date:   Fri, 24 Jun 2022 18:38:09 +0800
Message-Id: <20220624103809.4167753-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACX2PcSlLVi3BWgDw--.39557S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4xKw18JF4UKryrCrg_yoW8Zw4Dpr
        yxGFWFvFsrGr45WrnayryrZFyYqr9avrWF93s7G3Z29wnxtF18Gr13Wa48uF9YyF95Ga15
        t34qyayxXa1UWF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4a0QUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhQqF18RPXZnGAAAsd
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_out() for refcount balance.

Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
Signed-off-by: Liang He <windhl@126.com>
---
 these bugs are found in 5.19rc2
 these bugs are confirmed not fixed by lore.kernel.org
 these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig

 drivers/clk/sprd/common.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index d620bbbcdfc8..08c1d7a9ec8b 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -41,35 +41,41 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 {
 	void __iomem *base;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
+	struct device_node *node = dev->of_node, *np;
 	struct regmap *regmap;
 
+	np = of_get_parent(dev->of_node);
 	if (of_find_property(node, "sprd,syscon", NULL)) {
 		regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
 		if (IS_ERR(regmap)) {
 			pr_err("%s: failed to get syscon regmap\n", __func__);
+			of_node_put(np);
 			return PTR_ERR(regmap);
 		}
-	} else if (of_device_is_compatible(of_get_parent(dev->of_node),
-			   "syscon")) {
-		regmap = device_node_to_regmap(of_get_parent(dev->of_node));
+	} else if (of_device_is_compatible(np, "syscon")) {
+		regmap = device_node_to_regmap(np);
 		if (IS_ERR(regmap)) {
+			of_node_put(np);
 			dev_err(dev, "failed to get regmap from its parent.\n");
 			return PTR_ERR(regmap);
 		}
 	} else {
 		base = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(base))
+		if (IS_ERR(base)) {
+			of_node_put(np);
 			return PTR_ERR(base);
+		}
 
 		regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					       &sprdclk_regmap_config);
 		if (IS_ERR(regmap)) {
+			of_node_put(np);
 			pr_err("failed to init regmap\n");
 			return PTR_ERR(regmap);
 		}
 	}
 
+	of_node_put(np);
 	sprd_clk_set_regmap(desc, regmap);
 
 	return 0;
-- 
2.25.1


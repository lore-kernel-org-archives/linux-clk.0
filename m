Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A358C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 02:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbiGACq0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 22:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiGACq0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 22:46:26 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D649F64D40
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 19:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=mtWje
        Gty7CYcLzZO6VFJ/b7714wAgt1Ou9+XOar0qMw=; b=BtIzRa2POrAP9VlfUehBz
        QaCKidAaxIuWuglQcl65YQ3gUApxo9EL6YRSSeJu7HZWwvZox30Ww+TTCcTgV5ro
        WHg5nneIOXDM3T2Ko91NbYUoeaE3ehrLrk8iSp8cA94C56bqvbCtVA8YOvIiuIqe
        IaxSkmmLmNyKTjgRVJiC3M=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgAHTojwX75iYLIxFw--.9456S2;
        Fri, 01 Jul 2022 10:46:10 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH v4] clk: sprd: Hold reference returned by of_get_parent()
Date:   Fri,  1 Jul 2022 10:46:06 +0800
Message-Id: <20220701024606.223438-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgAHTojwX75iYLIxFw--.9456S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4xKw4fJFWUtF15twb_yoW8AFW3pa
        4UGFW5ZFsrGrWUuF1ktF95ZFyFqw1SqayFv34xG3WI9wnrtFyrGw1Y9FyUur98AFZ5Ca45
        Jryqk3y8J3WUXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4a0QUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBIxF2JVkJsnOgAAst
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_put() for refcount balance.

Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v4: fix another bug in the same place, missing in v3
 v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
     (2) fix typo in commit-log: of_node_out --> of_node_put
 v2: minimize the effective range of of_get_parent() advised by Orson
 v1: hold reference returned by of_get_parent() 


 drivers/clk/sprd/common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index d620bbbcdfc8..1b9c2aa0836f 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 {
 	void __iomem *base;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
+	struct device_node *node = dev->of_node, *np;
 	struct regmap *regmap;
 
 	if (of_find_property(node, "sprd,syscon", NULL)) {
@@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 			pr_err("%s: failed to get syscon regmap\n", __func__);
 			return PTR_ERR(regmap);
 		}
-	} else if (of_device_is_compatible(of_get_parent(dev->of_node),
-			   "syscon")) {
-		regmap = device_node_to_regmap(of_get_parent(dev->of_node));
+	} else if (of_device_is_compatible(np =	of_get_parent(node), "syscon")
+		|| (of_node_put(np), 0)) {
+		regmap = device_node_to_regmap(np = of_get_parent(node));
+		of_node_put(np);
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "failed to get regmap from its parent.\n");
 			return PTR_ERR(regmap);
-- 
2.25.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F50C43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 14:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiF1OZo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346467AbiF1OZn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 10:25:43 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 53F242F38A
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Pd4cG
        P2w+6uZf8pRmGOdO+D6VbZ9h8pxw0I7d6yTLxU=; b=oxkhhf3tte/g48InD2hDN
        Mxoxjf302EtlStXX/0pP94StwZk5oXgSfSFCVYLTOQGqWKpsR1EpZcPFn5t3mSR9
        GEXpQcR7tnusjC6adi42nHKZhLK3BbTiERYFZA0XdUr0zNYi3NyIQ0yvY+WlFutc
        sWAFbFCN24EnxEAVrUefQc=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowACXdd6eB7ti_LYxFg--.32924S2;
        Tue, 28 Jun 2022 21:52:31 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, orsonzhai@gmail.com,
        baolin.wang7@gmail.com, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH v2] clk: sprd: Hold reference returned by of_get_parent()
Date:   Tue, 28 Jun 2022 21:52:30 +0800
Message-Id: <20220628135230.166601-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowACXdd6eB7ti_LYxFg--.32924S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4xKw47uF17Cry5XFb_yoW8uw4Dpw
        1xWFWYvF47Gr47GryftF18AF1rtr9aqa1Fywn7Gwnavrn8tF1rGw1Yg3W8Wr9YyFyrGay5
        t3s0kayxJa1UXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxuciUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QAuF1pEATGhIQAAs6
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_out() for refcount balance.

Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: minimize the effective range of of_get_parent() advised by Orson
 v1: hold reference returned by of_get_parent()

 v1-link: https://lore.kernel.org/all/20220624103809.4167753-1-windhl@126.com/

 Patched file has been compiled test in 5.19rc2.

 drivers/clk/sprd/common.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index d620bbbcdfc8..d85ba80c5931 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -50,23 +50,28 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 			pr_err("%s: failed to get syscon regmap\n", __func__);
 			return PTR_ERR(regmap);
 		}
-	} else if (of_device_is_compatible(of_get_parent(dev->of_node),
-			   "syscon")) {
-		regmap = device_node_to_regmap(of_get_parent(dev->of_node));
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "failed to get regmap from its parent.\n");
-			return PTR_ERR(regmap);
-		}
 	} else {
-		base = devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-
-		regmap = devm_regmap_init_mmio(&pdev->dev, base,
-					       &sprdclk_regmap_config);
-		if (IS_ERR(regmap)) {
-			pr_err("failed to init regmap\n");
-			return PTR_ERR(regmap);
+		struct device_node *np = of_get_parent(dev->of_node);
+
+		if (of_device_is_compatible(np, "syscon")) {
+			regmap = device_node_to_regmap(np);
+			of_node_put(np);
+			if (IS_ERR(regmap)) {
+				dev_err(dev, "failed to get regmap from its parent.\n");
+				return PTR_ERR(regmap);
+			}
+		} else {
+			of_node_put(np);
+			base = devm_platform_ioremap_resource(pdev, 0);
+			if (IS_ERR(base))
+				return PTR_ERR(base);
+
+			regmap = devm_regmap_init_mmio(&pdev->dev, base,
+							   &sprdclk_regmap_config);
+			if (IS_ERR(regmap)) {
+				pr_err("failed to init regmap\n");
+				return PTR_ERR(regmap);
+			}
 		}
 	}
 
-- 
2.25.1


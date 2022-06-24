Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0735AC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 10:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiFXKV2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 06:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiFXKV0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 06:21:26 -0400
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF9BF7C502
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DMc2e
        I+1osZbRID9dFyduBJ/EfZtPNvtEkr4O+8jO0c=; b=J5Vt5whiAdhA5afu9dNoE
        7gx8MKdh0A0jXbMRML03mHmNVdMDQ2M5aJx/GIET4HGexvfE5Z2RpezpqVrjoncB
        J7vII8/xw08SurbahJFTf6isJCPg4h4h+hM8NLF3vfz2hKPWybErJ4xOOvOszVVe
        Zvwds4GytZK8zuy2y3Zjqo=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp3 (Coremail) with SMTP id DcmowADngJLhj7ViMtfGDw--.39438S2;
        Fri, 24 Jun 2022 18:20:17 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH] clk/oxnas: Hold reference returned by of_get_parent()
Date:   Fri, 24 Jun 2022 18:20:17 +0800
Message-Id: <20220624102017.4164778-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADngJLhj7ViMtfGDw--.39438S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UuryrXFW7XF1rKr18AFb_yoW8GFWkpF
        WDCayFkFsrX3yrG3y0ya1kAa4Yg3y2yayrKrZ7Cw1S9rn8JF1UXFyrXa4jkFs5JrZ5GFWf
        JrnFyrZ7ZF4UXF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5uciUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QIqF1pEARV5yQAAso
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In oxnas_stdclk_probe(), we need to hold the reference returned by
of_get_parent() and use it to call of_node_put() for refcount
balance.

Fixes: 0bbd72b4c64f ("clk: Add Oxford Semiconductor OXNAS Standard Clocks")
Signed-off-by: Liang He <windhl@126.com>
---
 these bugs are found in 5.19rc2
 these bugs are confirmed not fixed by lore.kernel.org
 these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig


 drivers/clk/clk-oxnas.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
index cda5e258355b..23e1bbe3c4cd 100644
--- a/drivers/clk/clk-oxnas.c
+++ b/drivers/clk/clk-oxnas.c
@@ -207,7 +207,7 @@ static const struct of_device_id oxnas_stdclk_dt_ids[] = {
 
 static int oxnas_stdclk_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node, *tp;
 	const struct oxnas_stdclk_data *data;
 	struct regmap *regmap;
 	int ret;
@@ -215,7 +215,9 @@ static int oxnas_stdclk_probe(struct platform_device *pdev)
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	regmap = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(regmap)) {
 		dev_err(&pdev->dev, "failed to have parent regmap\n");
 		return PTR_ERR(regmap);
-- 
2.25.1


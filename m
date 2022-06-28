Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6583DC43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 14:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244229AbiF1OcO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiF1OcO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 10:32:14 -0400
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F4CC31359
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nwc2X
        zVIa+UTxbS1sMgliggObiuMny/MeNUaUR/xJMU=; b=gFxY81W041ETDNzl794UK
        lN+VIKAXRtGE5myF26I+711fDd+pStEvb+ieFReUMw8dVESLuLt8mP7H3S/zBSqk
        hUoArsME2fnTZsgPyCpO5NThEYmUYJ38qWnKh8gg2TRLzkYPie7kC5YqMfOSN4Mp
        k4qBRwmlMz1mDJLTwKkkZM=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp3 (Coremail) with SMTP id DcmowABX9JXbELtiZYGdEA--.51917S2;
        Tue, 28 Jun 2022 22:31:56 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH v2] clk: oxnas: Hold reference returned by of_get_parent()
Date:   Tue, 28 Jun 2022 22:31:55 +0800
Message-Id: <20220628143155.170550-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowABX9JXbELtiZYGdEA--.51917S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UuryrXw1UCFWUAw4DCFg_yoW8Wr15pF
        W8CayFkr42q3yrKrWFyanrZ3WFg3y2yayFgrykGw1S9rn5JF1UJF1rWa4UKFn5AFWrGFWf
        Jr1qyw4xAFWUXF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U04iUUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuB0uF2JVkGBU1wAAsY
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In oxnas_stdclk_probe(), we need to hold the reference returned by
of_get_parent() and use it to call of_node_put() for refcount
balance.

Fixes: 0bbd72b4c64f ("clk: Add Oxford Semiconductor OXNAS Standard Clocks")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: change 'tp' with 'parent_np', change title format to xx:yy:zz
 v1: hold reference returned by of_get_parent()

 v1-link: https://lore.kernel.org/all/20220624102017.4164778-1-windhl@126.com/

 Patched file has been copmiled test in 5.19rc2.

 drivers/clk/clk-oxnas.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
index cda5e258355b..584e293156ad 100644
--- a/drivers/clk/clk-oxnas.c
+++ b/drivers/clk/clk-oxnas.c
@@ -207,7 +207,7 @@ static const struct of_device_id oxnas_stdclk_dt_ids[] = {
 
 static int oxnas_stdclk_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node, *parent_np;
 	const struct oxnas_stdclk_data *data;
 	struct regmap *regmap;
 	int ret;
@@ -215,7 +215,9 @@ static int oxnas_stdclk_probe(struct platform_device *pdev)
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	regmap = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	regmap = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(regmap)) {
 		dev_err(&pdev->dev, "failed to have parent regmap\n");
 		return PTR_ERR(regmap);
-- 
2.25.1


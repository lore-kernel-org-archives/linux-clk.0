Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE437C43334
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 10:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiFXK2p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 06:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbiFXK2o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 06:28:44 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9014D60F1D
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YQEMA
        Jwho1dpvA2cYEpUQiIvp+xYug1V/GH8HoE8DYQ=; b=dtxKEtj/5HxIspYy5wJCN
        S9nr31G0CxC9i+n6BBgr0Nl5KRN0t+eL8VQBsSaYVOmF5ezk/yEcKFkbmP1+8PBg
        o21OzVWB2B+y2PsX78RNgKVP+ZR5EX6X0G418yYtCJY7dXbG2EyBkulweTCLom9w
        6MWc3T7QEmnv5Lbe6wxd2g=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAA34vuHkbViAIufDw--.39196S2;
        Fri, 24 Jun 2022 18:27:20 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, windhl@126.com
Subject: [PATCH] clk/meson: Hold reference returned by of_get_parent()
Date:   Fri, 24 Jun 2022 18:27:19 +0800
Message-Id: <20220624102719.4166125-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAA34vuHkbViAIufDw--.39196S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr18Kr18Cr17JF13Kr4kZwb_yoW5Cr47pF
        97JFySyF47Xr15Wr18trZrCFWSg34IgFWYk397Cw1rZwn3JFyUJFy3Jay8CFs0vFWrCa4r
        JrnYkrW8Ar47XF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4BTrUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gkqF1uwMRqlQgAAsJ
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_put() for refcount balance.

Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedicated file")
Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock controller drivers")
Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if available")
Signed-off-by: Liang He <windhl@126.com>
---
 these bugs are found in 5.19rc2
 these bugs are confirmed not fixed by lore.kernel.org
 these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig


 drivers/clk/meson/meson-aoclk.c | 5 ++++-
 drivers/clk/meson/meson-eeclk.c | 5 ++++-
 drivers/clk/meson/meson8b.c     | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 27cd2c1f3f61..434cd8f9de82 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -38,6 +38,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	struct meson_aoclk_reset_controller *rstc;
 	struct meson_aoclk_data *data;
 	struct device *dev = &pdev->dev;
+	struct device_node *np;
 	struct regmap *regmap;
 	int ret, clkid;
 
@@ -49,7 +50,9 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	if (!rstc)
 		return -ENOMEM;
 
-	regmap = syscon_node_to_regmap(of_get_parent(dev->of_node));
+	np = of_get_parent(dev->of_node);
+	regmap = syscon_node_to_regmap(np);
+	of_node_put(np);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "failed to get regmap\n");
 		return PTR_ERR(regmap);
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 8d5a5dab955a..0e5e6b57eb20 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -18,6 +18,7 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 {
 	const struct meson_eeclkc_data *data;
 	struct device *dev = &pdev->dev;
+	struct device_node *np;
 	struct regmap *map;
 	int ret, i;
 
@@ -26,7 +27,9 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	/* Get the hhi system controller node */
-	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
+	np = of_get_parent(dev->of_node);
+	map = syscon_node_to_regmap(np);
+	of_node_put(np);
 	if (IS_ERR(map)) {
 		dev_err(dev,
 			"failed to get HHI regmap\n");
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 8f3b7a94a667..54188319f349 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3796,8 +3796,11 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 	struct clk *notifier_clk;
 	struct regmap *map;
 	int i, ret;
+	struct device_node *tp;
 
-	map = syscon_node_to_regmap(of_get_parent(np));
+	tp = of_get_parent(np);
+	map = syscon_node_to_regmap(tp);
+	of_node_put(tp);
 	if (IS_ERR(map)) {
 		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
 		return;
-- 
2.25.1


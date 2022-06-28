Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAE1C43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 14:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345980AbiF1OMC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345830AbiF1OMB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 10:12:01 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2C7435DFA
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nbtdk
        VvI5oHd7r8n3n+kNerm1aS4yfmbZ+fLV7KGzDg=; b=goFiIUIUTrnxz0IeDVBAG
        nt+d8ABEcfk9yfJBFS+rowIZR70iUu96OMNnHgzbV72bBo8Gwu80JguWq9h+W8Nt
        emG7az4KqTHyuW5mWIYya8IPe7gmIQWPkhjCkvyuz/0gIhNBTO0PTLWFCUTp8T7C
        eBZAdggzQLWu8KiGywO6LE=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgA3xIDfC7titVbMGg--.17991S2;
        Tue, 28 Jun 2022 22:10:40 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.co, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org, windhl@126.com
Subject: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
Date:   Tue, 28 Jun 2022 22:10:38 +0800
Message-Id: <20220628141038.168383-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgA3xIDfC7titVbMGg--.17991S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr15WF1xXr4fGr4DXFykAFb_yoW5uF43pF
        ykJFWIyr47Xr15Ww18trZrAFWSgw1IgFWYka97Aw1rZrn3JFyUJFy3Jay8CFs0vFWrCa4r
        JrnYkr48Ar47XF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRjg4fUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gAuF1uwMTbhGwAAs1
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
 changelog:
 
 v2: change the name of 'tp', change the title format, keep reverse christmas tree
 v1: hold reference returned by of_get_parent()

 v1-link: https://lore.kernel.org/all/20220624102719.4166125-1-windhl@126.com/

 Patched files have been compiled test in 5.19rc2.


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
index 8f3b7a94a667..827e78fb16a8 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3792,12 +3792,15 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 			struct clk_hw_onecell_data *clk_hw_onecell_data)
 {
 	struct meson8b_clk_reset *rstc;
+	struct device_node *parent_np;
 	const char *notifier_clk_name;
 	struct clk *notifier_clk;
 	struct regmap *map;
 	int i, ret;
 
-	map = syscon_node_to_regmap(of_get_parent(np));
+	parent_np = of_get_parent(np);
+	map = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
 	if (IS_ERR(map)) {
 		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
 		return;
-- 
2.25.1


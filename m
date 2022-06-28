Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD5CC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 14:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346419AbiF1OZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 10:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiF1OZh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 10:25:37 -0400
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58FB32F01D
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cEF5r
        BJDQrKwnlF4BNqds9P4+69OYNe2RAYjOHc5yNg=; b=I/7Yl3Q+9O4MArD92jA6K
        tW90jsHQAyBliSPK+0eBSmHqtTIJlORpePmF0jOVoirvHDmZo6ugU1FQYLGcaHBt
        RiMwOaaHlevlV9liZDrKCRLQKoTpaw7boe2yozVI2xnjgyJ20kdpVv+1XCKbt/bE
        V3VSNoE7INRsp6Ddkjsq5k=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp3 (Coremail) with SMTP id DcmowACHmpsQD7tizQudEA--.51924S2;
        Tue, 28 Jun 2022 22:24:16 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH v2] clk: st: Hold reference returned by of_get_parent()
Date:   Tue, 28 Jun 2022 22:24:15 +0800
Message-Id: <20220628142416.169808-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowACHmpsQD7tizQudEA--.51924S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4DtF4ktw48CF1DGFg_yoW8KF1kpa
        1UGrWUZFWkKF4kWF4fAa4kZ3ZaqFn7XFWI9r97C3Z3uwn5JFyDJan2ga4Y9r15ArWrWFWS
        qr4vkwn7JF1UJF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U0385UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RguF1pEATG4JwABs8
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_put() for refcount balance.

Fixes: 3efe64ef5186 ("clk: st: clkgen-fsyn: search reg within node or parent")
Fixes: 810251b0d36a ("clk: st: clkgen-mux: search reg within node or parent")

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: replace 'tp' with 'parent_np', change title format to xx:yy:zz
 v1: hold reference returned by of_get_parent()

 v1-link: https://lore.kernel.org/all/20220624104810.4170266-1-windhl@126.com/

 Patched files have been compiled test in 5.19rc2.

 drivers/clk/st/clkgen-fsyn.c | 5 ++++-
 drivers/clk/st/clkgen-mux.c  | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 582a22c04919..d820292a381d 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -987,6 +987,7 @@ static void __init st_of_quadfs_setup(struct device_node *np,
 	const char *pll_name, *clk_parent_name;
 	void __iomem *reg;
 	spinlock_t *lock;
+	struct device_node *parent_np;
 
 	/*
 	 * First check for reg property within the node to keep backward
@@ -994,7 +995,9 @@ static void __init st_of_quadfs_setup(struct device_node *np,
 	 */
 	reg = of_iomap(np, 0);
 	if (!reg) {
-		reg = of_iomap(of_get_parent(np), 0);
+		parent_np = of_get_parent(np);
+		reg = of_iomap(parent_np, 0);
+		of_node_put(parent_np);
 		if (!reg) {
 			pr_err("%s: Failed to get base address\n", __func__);
 			return;
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index ee39af7a0b72..596e939ad905 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -56,6 +56,7 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np,
 	void __iomem *reg;
 	const char **parents;
 	int num_parents = 0;
+	struct device_node *parent_np;
 
 	/*
 	 * First check for reg property within the node to keep backward
@@ -63,7 +64,9 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np,
 	 */
 	reg = of_iomap(np, 0);
 	if (!reg) {
-		reg = of_iomap(of_get_parent(np), 0);
+		parent_np = of_get_parent(np);
+		reg = of_iomap(parent_np, 0);
+		of_node_put(parent_np);
 		if (!reg) {
 			pr_err("%s: Failed to get base address\n", __func__);
 			return;
-- 
2.25.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539A0C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 10:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiFXKsb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 06:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiFXKs3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 06:48:29 -0400
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F8D8120A5
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ccnYS
        VOyPfoNXQbZhn92CvAZdEyzGjRs/NlLwOsRdd4=; b=gz9+OaL2VeAj2Urmp+6Xg
        KKDqfUHMX2KvrnPP8d6o3GS7JroVXqZbzQaNNrydpPE1JP6uDrvMcUEKQsb0fPBo
        pSvK+gEsgqxRvH3ndVCuxNhXpS165DjhJzqkEv1toqclQIWeEPAprScdKSKdy8QF
        6QbXSz19draSGKJg14NwzI=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp9 (Coremail) with SMTP id NeRpCgBnh8trlrViPI13FQ--.60397S2;
        Fri, 24 Jun 2022 18:48:12 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, windhl@126.com
Subject: [PATCH] clk/st: Hold reference returned by of_get_parent()
Date:   Fri, 24 Jun 2022 18:48:10 +0800
Message-Id: <20220624104810.4170266-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgBnh8trlrViPI13FQ--.60397S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryDWF4DtF4ktw48CF1DGFg_yoW8uw4xpw
        47GrW5ZFZxGF4kWF4xAFWkuasIqF1xXFWI9rZrC3Za9wn5AFyDJw4IgFyY9w15ArWxWFWf
        Kr1vk3s7JF1UJF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziwZ2DUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgwqF1-HZXvxpQAAs5
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We should hold the reference returned by of_get_parent() and use it
to call of_node_put() for refcount balance.

Fixes: 3efe64ef5186 ("clk: st: clkgen-fsyn: search reg within node or parent")
Fixes: 810251b0d36a ("clk: st: clkgen-mux: search reg within node or parent")
Signed-off-by: Liang He <windhl@126.com>
---
 these bugs are found in 5.19rc2
 these bugs are confirmed not fixed by lore.kernel.org
 these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig

 drivers/clk/st/clkgen-fsyn.c | 5 ++++-
 drivers/clk/st/clkgen-mux.c  | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 582a22c04919..3f021659ce13 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -987,6 +987,7 @@ static void __init st_of_quadfs_setup(struct device_node *np,
 	const char *pll_name, *clk_parent_name;
 	void __iomem *reg;
 	spinlock_t *lock;
+	struct device_node *tp;
 
 	/*
 	 * First check for reg property within the node to keep backward
@@ -994,7 +995,9 @@ static void __init st_of_quadfs_setup(struct device_node *np,
 	 */
 	reg = of_iomap(np, 0);
 	if (!reg) {
-		reg = of_iomap(of_get_parent(np), 0);
+		tp = of_get_parent(np);
+		reg = of_iomap(tp, 0);
+		of_node_put(tp);
 		if (!reg) {
 			pr_err("%s: Failed to get base address\n", __func__);
 			return;
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index ee39af7a0b72..1b857ddb5c4e 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -56,6 +56,7 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np,
 	void __iomem *reg;
 	const char **parents;
 	int num_parents = 0;
+	struct device_node *tp;
 
 	/*
 	 * First check for reg property within the node to keep backward
@@ -63,7 +64,9 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np,
 	 */
 	reg = of_iomap(np, 0);
 	if (!reg) {
-		reg = of_iomap(of_get_parent(np), 0);
+		tp = of_get_parent(np);
+		reg = of_iomap(tp, 0);
+		of_node_put(tp);
 		if (!reg) {
 			pr_err("%s: Failed to get base address\n", __func__);
 			return;
-- 
2.25.1


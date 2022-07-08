Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BFBC43334
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jul 2022 08:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237336AbiGHIu3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jul 2022 04:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237254AbiGHIu3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jul 2022 04:50:29 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4CCDB823BB
        for <linux-clk@vger.kernel.org>; Fri,  8 Jul 2022 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3KS6s
        rQbMxrrDv4MFKfQa+LKAKzpUrO5cJF+YHkvCsw=; b=mn/kY0Jx1QYzgiOkMYvmZ
        1hHSbX5PjLyGHqkvzNtSv81F40ehIZEiRhxLADRX+h5R+kzRmsVccALHKEUvHgXP
        4pQJCkYeD+xtc4y9HAVW0k4C6DGATnw4IHbo5BICy3xEM2y4RPRvLOW9uWtQkBjG
        KCQ9P4AnYaE9oKTJ/5dZlI=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp2 (Coremail) with SMTP id DMmowABHWgV978dipTQREg--.17769S2;
        Fri, 08 Jul 2022 16:49:02 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, windhl@126.com,
        linux-clk@vger.kernel.org
Subject: [PATCH] clk: berlin: Add of_node_put() for of_get_parent()
Date:   Fri,  8 Jul 2022 16:49:00 +0800
Message-Id: <20220708084900.311684-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHWgV978dipTQREg--.17769S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr18tF17uFyrXF15AFyxXwb_yoW8Cw17pF
        95GFWYyr48Jr47ZFs7Za9Fvr1fZ3ZIgFW5WF92k3Z5Zrn5JayUJF4UKasYvas8ZFs5Xw4a
        qr1qvF45Zw4kJFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGQ6kUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7R44F1pEAXHpxAAAsf
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In berlin2_clock_setup() and berlin2q_clock_setup(), we need to
call of_node_put() for the reference returned by of_get_parent()
which has increased the refcount. We should call *_put() in fail
path or when it is not used anymore.

Fixes: 26b3b6b959b2 ("clk: berlin: prepare simple-mfd conversion")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/clk/berlin/bg2.c  | 5 ++++-
 drivers/clk/berlin/bg2q.c | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/berlin/bg2.c b/drivers/clk/berlin/bg2.c
index bccdfa00fd37..67a9edbba29c 100644
--- a/drivers/clk/berlin/bg2.c
+++ b/drivers/clk/berlin/bg2.c
@@ -500,12 +500,15 @@ static void __init berlin2_clock_setup(struct device_node *np)
 	int n, ret;
 
 	clk_data = kzalloc(struct_size(clk_data, hws, MAX_CLKS), GFP_KERNEL);
-	if (!clk_data)
+	if (!clk_data) {
+		of_node_put(parent_np);
 		return;
+	}
 	clk_data->num = MAX_CLKS;
 	hws = clk_data->hws;
 
 	gbase = of_iomap(parent_np, 0);
+	of_node_put(parent_np);
 	if (!gbase)
 		return;
 
diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
index e9518d35f262..dd2784bb75b6 100644
--- a/drivers/clk/berlin/bg2q.c
+++ b/drivers/clk/berlin/bg2q.c
@@ -286,19 +286,23 @@ static void __init berlin2q_clock_setup(struct device_node *np)
 	int n, ret;
 
 	clk_data = kzalloc(struct_size(clk_data, hws, MAX_CLKS), GFP_KERNEL);
-	if (!clk_data)
+	if (!clk_data) {
+		of_node_put(parent_np);
 		return;
+	}
 	clk_data->num = MAX_CLKS;
 	hws = clk_data->hws;
 
 	gbase = of_iomap(parent_np, 0);
 	if (!gbase) {
+		of_node_put(parent_np);
 		pr_err("%pOF: Unable to map global base\n", np);
 		return;
 	}
 
 	/* BG2Q CPU PLL is not part of global registers */
 	cpupll_base = of_iomap(parent_np, 1);
+	of_node_put(parent_np);
 	if (!cpupll_base) {
 		pr_err("%pOF: Unable to map cpupll base\n", np);
 		iounmap(gbase);
-- 
2.25.1


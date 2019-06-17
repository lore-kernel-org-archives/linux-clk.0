Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552E7C31E57
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 12:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33DCE20861
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 12:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfFQMkA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 08:40:00 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:40382 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfFQMj7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 08:39:59 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id Rofo2000C3XaVaC01ofoiE; Mon, 17 Jun 2019 14:39:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0001pw-Ac; Mon, 17 Jun 2019 14:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0003ON-9i; Mon, 17 Jun 2019 14:39:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: div6: Combine clock-private and parent array allocation
Date:   Mon, 17 Jun 2019 14:39:42 +0200
Message-Id: <20190617123943.12990-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617123943.12990-1-geert+renesas@glider.be>
References: <20190617123943.12990-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make div6_clock.parents[] a flexible array member, and use the new
struct_size() helper, to combine the allocation of the clock-private
structure and array of parent clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index e98a9f5b3c90cc98..5ca183e701667b46 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -30,8 +30,8 @@
  * @div: divisor value (1-64)
  * @src_shift: Shift to access the register bits to select the parent clock
  * @src_width: Number of register bits to select the parent clock (may be 0)
- * @parents: Array to map from valid parent clocks indices to hardware indices
  * @nb: Notifier block to save/restore clock state for system resume
+ * @parents: Array to map from valid parent clocks indices to hardware indices
  */
 struct div6_clock {
 	struct clk_hw hw;
@@ -39,8 +39,8 @@ struct div6_clock {
 	unsigned int div;
 	u32 src_shift;
 	u32 src_width;
-	u8 *parents;
 	struct notifier_block nb;
+	u8 parents[];
 };
 
 #define to_div6_clock(_hw) container_of(_hw, struct div6_clock, hw)
@@ -221,17 +221,10 @@ struct clk * __init cpg_div6_register(const char *name,
 	struct clk *clk;
 	unsigned int i;
 
-	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
+	clock = kzalloc(struct_size(clock, parents, num_parents), GFP_KERNEL);
 	if (!clock)
 		return ERR_PTR(-ENOMEM);
 
-	clock->parents = kmalloc_array(num_parents, sizeof(*clock->parents),
-				       GFP_KERNEL);
-	if (!clock->parents) {
-		clk = ERR_PTR(-ENOMEM);
-		goto free_clock;
-	}
-
 	clock->reg = reg;
 
 	/*
@@ -259,7 +252,7 @@ struct clk * __init cpg_div6_register(const char *name,
 		pr_err("%s: invalid number of parents for DIV6 clock %s\n",
 		       __func__, name);
 		clk = ERR_PTR(-EINVAL);
-		goto free_parents;
+		goto free_clock;
 	}
 
 	/* Filter out invalid parents */
@@ -282,7 +275,7 @@ struct clk * __init cpg_div6_register(const char *name,
 
 	clk = clk_register(NULL, &clock->hw);
 	if (IS_ERR(clk))
-		goto free_parents;
+		goto free_clock;
 
 	if (notifiers) {
 		clock->nb.notifier_call = cpg_div6_clock_notifier_call;
@@ -291,8 +284,6 @@ struct clk * __init cpg_div6_register(const char *name,
 
 	return clk;
 
-free_parents:
-	kfree(clock->parents);
 free_clock:
 	kfree(clock);
 	return clk;
-- 
2.17.1


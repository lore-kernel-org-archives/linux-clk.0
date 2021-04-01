Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DC9C41538
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 17:42:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AA2B613CA
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 17:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhDARmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbhDARjG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 13:39:06 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AA7C05BD29
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by baptiste.telenet-ops.be with bizsmtp
        id nR1h240034A7w6i01R1haJ; Thu, 01 Apr 2021 15:01:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkG-La; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mtQ-MW; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] clk: renesas: div6: Consider all parents for requested rate
Date:   Thu,  1 Apr 2021 15:01:37 +0200
Message-Id: <60e639692b462f99e0b6ab868c3675b3d97dbdb0.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281699.git.geert+renesas@glider.be>
References: <cover.1617281699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the .determine_rate() callback considers only the current
parent clock, limiting the range of achievable clock rates on DIV6
clocks with multiple parents, as found on SH/R-Mobile SoCs.

Extend the callback to consider all available parent clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 35 +++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 3af65ef5690e3d84..a9ac2a83c1d0daa0 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -103,10 +103,39 @@ static unsigned int cpg_div6_clock_calc_div(unsigned long rate,
 static int cpg_div6_clock_determine_rate(struct clk_hw *hw,
 					 struct clk_rate_request *req)
 {
-	unsigned int div = cpg_div6_clock_calc_div(req->rate,
-						   req->best_parent_rate);
+	unsigned long prate, calc_rate, diff, best_rate, best_prate;
+	unsigned int num_parents = clk_hw_get_num_parents(hw);
+	struct clk_hw *parent, *best_parent = NULL;
+	unsigned long min_diff = ULONG_MAX;
+	unsigned int i, div;
+
+	for (i = 0; i < num_parents; i++) {
+		parent = clk_hw_get_parent_by_index(hw, i);
+		if (!parent)
+			continue;
+
+		prate = clk_hw_get_rate(parent);
+		if (!prate)
+			continue;
+
+		div = cpg_div6_clock_calc_div(req->rate, prate);
+		calc_rate = prate / div;
+		diff = calc_rate > req->rate ? calc_rate - req->rate
+					     : req->rate - calc_rate;
+		if (diff < min_diff) {
+			best_rate = calc_rate;
+			best_parent = parent;
+			best_prate = prate;
+			min_diff = diff;
+		}
+	}
+
+	if (!best_parent)
+		return -EINVAL;
 
-	req->rate = req->best_parent_rate / div;
+	req->best_parent_rate = best_prate;
+	req->best_parent_hw = best_parent;
+	req->rate = best_rate;
 	return 0;
 }
 
-- 
2.25.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B0BC43600
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333F161285
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbhDARmR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbhDARic (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 13:38:32 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875A3C05BD27
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by baptiste.telenet-ops.be with bizsmtp
        id nR1h240024A7w6i01R1haH; Thu, 01 Apr 2021 15:01:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkF-Lr; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mtL-LA; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] clk: renesas: div6: Switch to .determine_rate()
Date:   Thu,  1 Apr 2021 15:01:36 +0200
Message-Id: <7fd8c45cd8bf5c6d928ca69c8b669be35b93de09.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281699.git.geert+renesas@glider.be>
References: <cover.1617281699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  Hence switch the DIV6 clocks on SH/R-Mobile and R-Car
SoCs from the old .round_rate() callback to the newer .determine_rate()
callback, which does not suffer from this limitation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 2920bec49bce0eb8..3af65ef5690e3d84 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -100,12 +100,14 @@ static unsigned int cpg_div6_clock_calc_div(unsigned long rate,
 	return clamp(div, 1U, 64U);
 }
 
-static long cpg_div6_clock_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cpg_div6_clock_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	unsigned int div = cpg_div6_clock_calc_div(rate, *parent_rate);
+	unsigned int div = cpg_div6_clock_calc_div(req->rate,
+						   req->best_parent_rate);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static int cpg_div6_clock_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -166,7 +168,7 @@ static const struct clk_ops cpg_div6_clock_ops = {
 	.get_parent = cpg_div6_clock_get_parent,
 	.set_parent = cpg_div6_clock_set_parent,
 	.recalc_rate = cpg_div6_clock_recalc_rate,
-	.round_rate = cpg_div6_clock_round_rate,
+	.determine_rate = cpg_div6_clock_determine_rate,
 	.set_rate = cpg_div6_clock_set_rate,
 };
 
-- 
2.25.1


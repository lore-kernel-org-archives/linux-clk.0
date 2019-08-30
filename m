Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51263C3A5A7
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 13:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2479023431
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 13:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3NuV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 09:50:21 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:55520 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfH3NuU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 09:50:20 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id vRqJ2000m05gfCL01RqJwR; Fri, 30 Aug 2019 15:50:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIA-0003KX-Nf; Fri, 30 Aug 2019 15:50:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hDK-00037c-QB; Fri, 30 Aug 2019 15:45:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/8] clk: renesas: rcar-gen3: Avoid double table iteration in SD .set_rate()
Date:   Fri, 30 Aug 2019 15:45:10 +0200
Message-Id: <20190830134515.11925-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830134515.11925-1-geert+renesas@glider.be>
References: <20190830134515.11925-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The .set_rate() callback for the SD clocks is always called with a valid
clock rate, returned by .round_rate().  Hence there is no need to
iterate through the divider table twice: once to repeat the work done by
.round_rate(), and a second time to find the corresponding divider
entry.

Just iterate once, looking for the divider that matches the passed clock
rate.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3480284a08308134..9f457411984b1ca4 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -339,14 +339,14 @@ static long cpg_sd_clock_round_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long parent_rate)
+				 unsigned long parent_rate)
 {
 	struct sd_clock *clock = to_sd_clock(hw);
-	unsigned int div = cpg_sd_clock_calc_div(clock, rate, parent_rate);
 	unsigned int i;
 
 	for (i = 0; i < clock->div_num; i++)
-		if (div == clock->div_table[i].div)
+		if (rate == DIV_ROUND_CLOSEST(parent_rate,
+					      clock->div_table[i].div))
 			break;
 
 	if (i >= clock->div_num)
-- 
2.17.1


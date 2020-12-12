Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B77DC4361B
	for <linux-clk@archiver.kernel.org>; Sat, 12 Dec 2020 13:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 400F6224D1
	for <linux-clk@archiver.kernel.org>; Sat, 12 Dec 2020 13:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgLLN6c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Dec 2020 08:58:32 -0500
Received: from aposti.net ([89.234.176.197]:47928 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437600AbgLLN62 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 12 Dec 2020 08:58:28 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        stable@vger.kernel.org
Subject: [PATCH] clk: ingenic: Fix divider calculation with div tables
Date:   Sat, 12 Dec 2020 13:57:33 +0000
Message-Id: <20201212135733.38050-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The previous code assumed that a higher hardware value always resulted
in a bigger divider, which is correct for the regular clocks, but is
an invalid assumption when a divider table is provided for the clock.

Perfect example of this is the PLL0_HALF clock, which applies a /2
divider with the hardware value 0, and a /1 divider otherwise.

Fixes: a9fa2893fcc6 ("clk: ingenic: Add support for divider tables")
Cc: <stable@vger.kernel.org> # 5.2
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index dac6edc670cc..c8e9cb6c8e39 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -392,15 +392,21 @@ static unsigned int
 ingenic_clk_calc_hw_div(const struct ingenic_cgu_clk_info *clk_info,
 			unsigned int div)
 {
-	unsigned int i;
+	unsigned int i, best_i = 0, best = (unsigned int)-1;
 
 	for (i = 0; i < (1 << clk_info->div.bits)
 				&& clk_info->div.div_table[i]; i++) {
-		if (clk_info->div.div_table[i] >= div)
-			return i;
+		if (clk_info->div.div_table[i] >= div &&
+		    clk_info->div.div_table[i] < best) {
+			best = clk_info->div.div_table[i];
+			best_i = i;
+
+			if (div == best)
+				break;
+		}
 	}
 
-	return i - 1;
+	return best_i;
 }
 
 static unsigned
-- 
2.29.2


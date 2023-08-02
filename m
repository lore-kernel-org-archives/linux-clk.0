Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECD1C00528
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 12:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbjHBMNr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 08:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234208AbjHBMNj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 08:13:39 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 319132D79;
        Wed,  2 Aug 2023 05:13:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,249,1684767600"; 
   d="scan'208";a="171674747"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2023 21:13:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.171])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D028141CEA81;
        Wed,  2 Aug 2023 21:13:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v2] clk: vc3: Fix 64 by 64 division
Date:   Wed,  2 Aug 2023 13:13:17 +0100
Message-Id: <20230802121317.273091-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the below cocci warnings by replacing do_div()->div64_ul() and
bound the result with a max value of U16_MAX.

cocci warnings:
	drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
	64-by-32 division, please consider using div64_ul instead.

Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202307270841.yr5HxYIl-lkp@intel.com/
Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added fixes tag.
---
 drivers/clk/clk-versaclock3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 4ceb7fcf7fcb..7ca413a5b1fb 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -401,9 +401,8 @@ static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		/* Determine best fractional part, which is 16 bit wide */
 		div_frc = rate % *parent_rate;
 		div_frc *= BIT(16) - 1;
-		do_div(div_frc, *parent_rate);
 
-		vc3->div_frc = (u32)div_frc;
+		vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);
 		rate = (*parent_rate *
 			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
 	} else {
-- 
2.25.1


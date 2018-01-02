Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from outils.crapouillou.net ([89.234.176.41]:55836 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751551AbeABPJD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jan 2018 10:09:03 -0500
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 02/15] clk: ingenic: Fix recalc_rate for clocks with fixed divider
Date: Tue,  2 Jan 2018 16:08:35 +0100
Message-Id: <20180102150848.11314-2-paul@crapouillou.net>
In-Reply-To: <20180102150848.11314-1-paul@crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Previously, the clocks with a fixed divider would report their rate
as being the same as the one of their parent, independently of the
divider in use. This commit fixes this behaviour.

This went unnoticed as neither the jz4740 nor the jz4780 CGU code
have clocks with fixed dividers yet.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ingenic/cgu.c | 2 ++
 1 file changed, 2 insertions(+)

 v2: No changes
 v3: No changes
 v4: No changes
 v5: No changes

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index ab393637f7b0..a2e73a6d60fd 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -328,6 +328,8 @@ ingenic_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 		div *= clk_info->div.div;
 
 		rate /= div;
+	} else if (clk_info->type & CGU_CLK_FIXDIV) {
+		rate /= clk_info->fixdiv.div;
 	}
 
 	return rate;
-- 
2.11.0


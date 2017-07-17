Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:48910 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751249AbdGQGBZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2017 02:01:25 -0400
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <dan.carpenter@oracle.com>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2] clk: mediatek: fixed static checker warning in clk_cpumux_get_parent call
Date: Mon, 17 Jul 2017 14:01:19 +0800
Message-ID: <e1f7ea2d9cc9717fce5c349bcfb81ce37306aad1.1500270942.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

Fixed the signedness bug returning '(-22)' on the return type as u8 with
removing the sanity checker in clk_cpumux_get_parent() since
clk_cpumux_set_parent() always ensures validity in clk_cpumux_get_parent()
got called.

Fixes: commit 1e17de9049da ("clk: mediatek: add missing cpu mux causing Mediatek cpufreq can't work")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index edd8e69..347d799 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -27,7 +27,6 @@ static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
 static u8 clk_cpumux_get_parent(struct clk_hw *hw)
 {
 	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
-	int num_parents = clk_hw_get_num_parents(hw);
 	unsigned int val;
 
 	regmap_read(mux->regmap, mux->reg, &val);
@@ -35,9 +34,6 @@ static u8 clk_cpumux_get_parent(struct clk_hw *hw)
 	val >>= mux->shift;
 	val &= mux->mask;
 
-	if (val >= num_parents)
-		return -EINVAL;
-
 	return val;
 }
 
-- 
2.7.4


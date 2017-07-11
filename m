Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:64311 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752333AbdGKCoA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jul 2017 22:44:00 -0400
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <dan.carpenter@oracle.com>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] clk: mediatek: fixed static checker warning in clk_cpumux_get_parent call
Date: Tue, 11 Jul 2017 10:43:51 +0800
Message-ID: <59fd4aa684632f1d9d2e7573a95bc42850e81690.1499701486.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

Fixed the signedness bug returning '(-22)' on the return type as u8 with
moving the sanity checker into clk_cpumux_set_parent() to ensure always
validity in clk_cpumux_get_parent() got called.

Fixes: commit 1e17de9049da ("clk: mediatek: add missing cpu mux causing Mediatek cpufreq can't work")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index edd8e69..c6a3a1a 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -27,7 +27,6 @@ static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
 static u8 clk_cpumux_get_parent(struct clk_hw *hw)
 {
 	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
-	int num_parents = clk_hw_get_num_parents(hw);
 	unsigned int val;
 
 	regmap_read(mux->regmap, mux->reg, &val);
@@ -35,17 +34,18 @@ static u8 clk_cpumux_get_parent(struct clk_hw *hw)
 	val >>= mux->shift;
 	val &= mux->mask;
 
-	if (val >= num_parents)
-		return -EINVAL;
-
 	return val;
 }
 
 static int clk_cpumux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct mtk_clk_cpumux *mux = to_mtk_clk_cpumux(hw);
+	int num_parents = clk_hw_get_num_parents(hw);
 	u32 mask, val;
 
+	if (index >= num_parents)
+		return -EINVAL;
+
 	val = index << mux->shift;
 	mask = mux->mask << mux->shift;
 
-- 
2.7.4


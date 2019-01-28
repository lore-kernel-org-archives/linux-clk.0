Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4E8C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 11:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E60E2086C
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548676571;
	bh=559CPLfcG5St/5z9rJpZ8EVehSIrsJuSZjAHbs7bDY0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Aj5HkfUZ+oGzl4tz8x9G2FRE1zdOUxfzNCSI6ULQSLUA8IvuLOUYbH0gzHEWbf+gr
	 qOl1uXRQ9rqGtUYQvQmh9FZKPCYIClod3rINrtd3kvRHfiqOm8T5cpel4XxUM0uaBh
	 ht8H84RxR3FzEGW6+zDARhCs9elphszH71rZnVvE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfA1L4L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 06:56:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:34210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbfA1L4K (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Jan 2019 06:56:10 -0500
Received: from localhost.localdomain (unknown [106.200.228.251])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E7BE2086C;
        Mon, 28 Jan 2019 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548676569;
        bh=559CPLfcG5St/5z9rJpZ8EVehSIrsJuSZjAHbs7bDY0=;
        h=From:To:Cc:Subject:Date:From;
        b=FlW51fWdpwmWeOkpHsDAmIJLbYWPa1GmefF70qwvSc8bWa5n6Joi2B68D+I9PzupT
         SZQI09SNjhbL1ml4xf7VDZmeLMWTOVpNYwEkM2UZ8kBJBvXPnrjKu9qULnUEud2IOo
         9TuRz+vX0FA0feL4A5ULgm7XnQjL800MwfRool9w=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Khasim Syed Mohammed <khasim.mohammed@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/2] clk: qcom: clk-rcg2: Introduce a cfg offset for RCGs
Date:   Mon, 28 Jan 2019 17:23:58 +0530
Message-Id: <20190128115359.30039-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The RCG CFG/M/N/D register base could be at a different offset than
the CMD register, so introduce a cfg_offset to identify the offset
with respect to the CMD register.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-rcg.h  |  2 ++
 drivers/clk/qcom/clk-rcg2.c | 30 +++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e5eca8a1abe4..f06783c20688 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -140,6 +140,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
  * @clkr: regmap clock handle
+ * @cfg_off: defines the cfg register offset from the CMD_RCGR
  *
  */
 struct clk_rcg2 {
@@ -150,6 +151,7 @@ struct clk_rcg2 {
 	const struct parent_map	*parent_map;
 	const struct freq_tbl	*freq_tbl;
 	struct clk_regmap	clkr;
+	u8			cfg_off;
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 6e3bd195d012..106848e3313f 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -74,7 +74,8 @@ static u8 clk_rcg2_get_parent(struct clk_hw *hw)
 	u32 cfg;
 	int i, ret;
 
-	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	ret = regmap_read(rcg->clkr.regmap,
+			  rcg->cmd_rcgr + rcg->cfg_off + CFG_REG, &cfg);
 	if (ret)
 		goto err;
 
@@ -123,7 +124,8 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	int ret;
 	u32 cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 
-	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
+	ret = regmap_update_bits(rcg->clkr.regmap,
+				 rcg->cmd_rcgr + rcg->cfg_off + CFG_REG,
 				 CFG_SRC_SEL_MASK, cfg);
 	if (ret)
 		return ret;
@@ -162,13 +164,16 @@ clk_rcg2_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	u32 cfg, hid_div, m = 0, n = 0, mode = 0, mask;
 
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	regmap_read(rcg->clkr.regmap,
+		    rcg->cmd_rcgr + rcg->cfg_off + CFG_REG, &cfg);
 
 	if (rcg->mnd_width) {
 		mask = BIT(rcg->mnd_width) - 1;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + M_REG, &m);
+		regmap_read(rcg->clkr.regmap,
+			    rcg->cmd_rcgr + rcg->cfg_off + M_REG, &m);
 		m &= mask;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + N_REG, &n);
+		regmap_read(rcg->clkr.regmap,
+			    rcg->cmd_rcgr + rcg->cfg_off + N_REG, &n);
 		n =  ~n;
 		n &= mask;
 		n += m;
@@ -263,17 +268,20 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + M_REG, mask, f->m);
+					 rcg->cmd_rcgr + rcg->cfg_off + M_REG,
+					 mask, f->m);
 		if (ret)
 			return ret;
 
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + N_REG, mask, ~(f->n - f->m));
+					 rcg->cmd_rcgr + rcg->cfg_off + N_REG,
+					 mask, ~(f->n - f->m));
 		if (ret)
 			return ret;
 
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + D_REG, mask, ~f->n);
+					 rcg->cmd_rcgr + rcg->cfg_off + D_REG,
+					 mask, ~f->n);
 		if (ret)
 			return ret;
 	}
@@ -284,9 +292,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
-
-	return regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-					mask, cfg);
+	return regmap_update_bits(rcg->clkr.regmap,
+				    rcg->cmd_rcgr + rcg->cfg_off + CFG_REG,
+				    mask, cfg);
 }
 
 static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
-- 
2.20.1


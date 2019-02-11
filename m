Return-Path: <SRS0=QcJy=QS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70BDC169C4
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 07:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A65B121479
	for <linux-clk@archiver.kernel.org>; Mon, 11 Feb 2019 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549870814;
	bh=Nzp/hm+HXwku9rUt5Yoyb+DN510RxldbZfrGiL9aqoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=NZYDtJ0BiW/k2qOFMg+PstvusEvul2CB6Zc7lJogRqCSzfVY++wkvwAj4E7G9s2XB
	 KjEl5+No+ilTO2KFfuxG5iF1Svw9qLYVuyNLiwFjzbZ/TAwNhCkA9OiBbPMjkCbAYU
	 t78Wy9+P7SlAyzAH8dSayvjPiTo/QgoH6CT/MsL0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfBKHkO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Feb 2019 02:40:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:57374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbfBKHkO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 11 Feb 2019 02:40:14 -0500
Received: from localhost.localdomain (unknown [117.99.91.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67E2721479;
        Mon, 11 Feb 2019 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549870812;
        bh=Nzp/hm+HXwku9rUt5Yoyb+DN510RxldbZfrGiL9aqoY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1l9skCXtTXpNZSWE3Nfk4Uz0BbTuD0N3d1sm0mcrA51OpTOV626pMJivU+86t02iL
         84ZHJUzveVhBabEgZ9L5sQOeclUnjKMk8l1pl+y7xYsKI87+Z03tNgLa4NdhkluJuk
         1P16Ii2Aji+3XmXha1lcecFv3V2xdA7cZcDEu1NY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/3] clk: qcom: clk-rcg2: Introduce a cfg offset for RCGs
Date:   Mon, 11 Feb 2019 13:09:27 +0530
Message-Id: <20190211073928.20456-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211073928.20456-1-vkoul@kernel.org>
References: <20190211073928.20456-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

The RCG CFG/M/N/D register base could be at a different offset than
the CMD register, so introduce a cfg_offset to identify the offset
with respect to the CMD RCGR register.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v2:
 - add macros and update comment

 drivers/clk/qcom/clk-rcg.h  |  2 ++
 drivers/clk/qcom/clk-rcg2.c | 24 ++++++++++++++----------
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 91336a030179..c25b57c3cbc8 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -138,6 +138,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
  * @clkr: regmap clock handle
+ * @cfg_off: defines the cfg register offset from the CMD_RCGR + CFG_REG
  */
 struct clk_rcg2 {
 	u32			cmd_rcgr;
@@ -147,6 +148,7 @@ struct clk_rcg2 {
 	const struct parent_map	*parent_map;
 	const struct freq_tbl	*freq_tbl;
 	struct clk_regmap	clkr;
+	u8			cfg_off;
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 6e3bd195d012..8c02bffe50df 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -41,6 +41,11 @@
 #define N_REG			0xc
 #define D_REG			0x10
 
+#define RCG_CFG_OFFSET(rcg)	((rcg)->cmd_rcgr + (rcg)->cfg_off + CFG_REG)
+#define RCG_M_OFFSET(rcg)	((rcg)->cmd_rcgr + (rcg)->cfg_off + M_REG)
+#define RCG_N_OFFSET(rcg)	((rcg)->cmd_rcgr + (rcg)->cfg_off + N_REG)
+#define RCG_D_OFFSET(rcg)	((rcg)->cmd_rcgr + (rcg)->cfg_off + D_REG)
+
 /* Dynamic Frequency Scaling */
 #define MAX_PERF_LEVEL		8
 #define SE_CMD_DFSR_OFFSET	0x14
@@ -74,7 +79,7 @@ static u8 clk_rcg2_get_parent(struct clk_hw *hw)
 	u32 cfg;
 	int i, ret;
 
-	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
 	if (ret)
 		goto err;
 
@@ -123,7 +128,7 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	int ret;
 	u32 cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 
-	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
+	ret = regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
 				 CFG_SRC_SEL_MASK, cfg);
 	if (ret)
 		return ret;
@@ -162,13 +167,13 @@ clk_rcg2_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	u32 cfg, hid_div, m = 0, n = 0, mode = 0, mask;
 
-	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
 
 	if (rcg->mnd_width) {
 		mask = BIT(rcg->mnd_width) - 1;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + M_REG, &m);
+		regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m);
 		m &= mask;
-		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + N_REG, &n);
+		regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &n);
 		n =  ~n;
 		n &= mask;
 		n += m;
@@ -263,17 +268,17 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + M_REG, mask, f->m);
+				RCG_M_OFFSET(rcg), mask, f->m);
 		if (ret)
 			return ret;
 
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + N_REG, mask, ~(f->n - f->m));
+				RCG_N_OFFSET(rcg), mask, ~(f->n - f->m));
 		if (ret)
 			return ret;
 
 		ret = regmap_update_bits(rcg->clkr.regmap,
-				rcg->cmd_rcgr + D_REG, mask, ~f->n);
+				RCG_D_OFFSET(rcg), mask, ~f->n);
 		if (ret)
 			return ret;
 	}
@@ -284,8 +289,7 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
-
-	return regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
+	return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
 					mask, cfg);
 }
 
-- 
2.20.1


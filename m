Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2627C433E9
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 17:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5CD52251E
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 17:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbhAYRJp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jan 2021 12:09:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728789AbhAYRJa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 12:09:30 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F1AC4FB;
        Mon, 25 Jan 2021 18:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611594522;
        bh=21jZDp6AmGTzqy0r9Y9p8sY+31nxlQiEl8X7DDY0UbM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X9pN+ndq/SBvHXuTRsMtO1pNq3XnU7bnDgIRdDmUBvukUMuZWjdxKog/HWJawqV+K
         2C3PBzq5Ma+7JTGYQ0Lfe1T4yBFp3tLCgna87BvWWWiCJ+jHSkjLrdeoaWTtcWVgfJ
         VZTLAsBEZDdMeOOu9NxdwHQe4zS699RZUjG+8M1c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Phi-Bang Nguyen <pnguyen@baylibre.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] clk: mediatek: mux: Drop unused clock ops
Date:   Mon, 25 Jan 2021 19:08:18 +0200
Message-Id: <20210125170819.26130-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Three out of the four defined clock ops are unused. Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/clk/mediatek/clk-mux.c | 61 ++--------------------------------
 drivers/clk/mediatek/clk-mux.h | 13 ++------
 2 files changed, 4 insertions(+), 70 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index dcc1352bf13c..9370bebca7f8 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -17,23 +17,6 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 	return container_of(hw, struct mtk_clk_mux, hw);
 }
 
-static int mtk_clk_mux_enable(struct clk_hw *hw)
-{
-	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
-	u32 mask = BIT(mux->data->gate_shift);
-
-	return regmap_update_bits(mux->regmap, mux->data->mux_ofs,
-			mask, ~mask);
-}
-
-static void mtk_clk_mux_disable(struct clk_hw *hw)
-{
-	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
-	u32 mask = BIT(mux->data->gate_shift);
-
-	regmap_update_bits(mux->regmap, mux->data->mux_ofs, mask, mask);
-}
-
 static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
@@ -72,28 +55,6 @@ static u8 mtk_clk_mux_get_parent(struct clk_hw *hw)
 	return val;
 }
 
-static int mtk_clk_mux_set_parent_lock(struct clk_hw *hw, u8 index)
-{
-	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
-	u32 mask = GENMASK(mux->data->mux_width - 1, 0);
-	unsigned long flags = 0;
-
-	if (mux->lock)
-		spin_lock_irqsave(mux->lock, flags);
-	else
-		__acquire(mux->lock);
-
-	regmap_update_bits(mux->regmap, mux->data->mux_ofs, mask,
-		index << mux->data->mux_shift);
-
-	if (mux->lock)
-		spin_unlock_irqrestore(mux->lock, flags);
-	else
-		__release(mux->lock);
-
-	return 0;
-}
-
 static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
@@ -129,25 +90,7 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 	return 0;
 }
 
-const struct clk_ops mtk_mux_ops = {
-	.get_parent = mtk_clk_mux_get_parent,
-	.set_parent = mtk_clk_mux_set_parent_lock,
-};
-
-const struct clk_ops mtk_mux_clr_set_upd_ops = {
-	.get_parent = mtk_clk_mux_get_parent,
-	.set_parent = mtk_clk_mux_set_parent_setclr_lock,
-};
-
-const struct clk_ops mtk_mux_gate_ops = {
-	.enable = mtk_clk_mux_enable,
-	.disable = mtk_clk_mux_disable,
-	.is_enabled = mtk_clk_mux_is_enabled,
-	.get_parent = mtk_clk_mux_get_parent,
-	.set_parent = mtk_clk_mux_set_parent_lock,
-};
-
-const struct clk_ops mtk_mux_gate_clr_set_upd_ops = {
+static const struct clk_ops mtk_mux_ops = {
 	.enable = mtk_clk_mux_enable_setclr,
 	.disable = mtk_clk_mux_disable_setclr,
 	.is_enabled = mtk_clk_mux_is_enabled,
@@ -171,7 +114,7 @@ static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 	init.flags = mux->flags | CLK_SET_RATE_PARENT;
 	init.parent_names = mux->parent_names;
 	init.num_parents = mux->num_parents;
-	init.ops = mux->ops;
+	init.ops = &mtk_mux_ops;
 
 	clk_mux->regmap = regmap;
 	clk_mux->data = mux;
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 8e2f927dd2ff..15c62366ba9a 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -32,19 +32,12 @@ struct mtk_mux {
 	u8 gate_shift;
 	s8 upd_shift;
 
-	const struct clk_ops *ops;
-
 	signed char num_parents;
 };
 
-extern const struct clk_ops mtk_mux_ops;
-extern const struct clk_ops mtk_mux_clr_set_upd_ops;
-extern const struct clk_ops mtk_mux_gate_ops;
-extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
-
 #define GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-			_gate, _upd_ofs, _upd, _flags, _ops) {		\
+			_gate, _upd_ofs, _upd, _flags) {		\
 		.id = _id,						\
 		.name = _name,						\
 		.mux_ofs = _mux_ofs,					\
@@ -58,7 +51,6 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 		.parent_names = _parents,				\
 		.num_parents = ARRAY_SIZE(_parents),			\
 		.flags = _flags,					\
-		.ops = &_ops,						\
 	}
 
 #define MUX_GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
@@ -66,8 +58,7 @@ extern const struct clk_ops mtk_mux_gate_clr_set_upd_ops;
 			_gate, _upd_ofs, _upd, _flags)			\
 		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-			_gate, _upd_ofs, _upd, _flags,			\
-			mtk_mux_gate_clr_set_upd_ops)
+			_gate, _upd_ofs, _upd, _flags)			\
 
 #define MUX_GATE_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,		\
 			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
-- 
Regards,

Laurent Pinchart


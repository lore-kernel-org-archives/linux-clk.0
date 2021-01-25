Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_PH_BODY_ACCOUNTS_PRE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560D0C433DB
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 17:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2990322AAC
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 17:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbhAYRJz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jan 2021 12:09:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56882 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729298AbhAYRJ3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 12:09:29 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23C5C9FF;
        Mon, 25 Jan 2021 18:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611594523;
        bh=s4U9Ejb6ol7vRTaFMsIKJy4NuPLqT6wMBylgJBy1dSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ArlWlQfPnEgt7FObe6Od4x1PeZQmehnZwing1Dq3sWG1U9JYNclI0FL9b7sKLhR9T
         CvpSjtNTLy6axfLQfPpZkglkiZxPCESgieYAsGC9//Jyhkt4VpBY++EJrfUB3wLqX0
         7epKXVAP4KjO4unGFCMWyAwLX4To+gHjLP7UFMHU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Phi-Bang Nguyen <pnguyen@baylibre.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] clk: mediatek: mux: Update parent at enable time
Date:   Mon, 25 Jan 2021 19:08:19 +0200
Message-Id: <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The mux clocks don't always correctly take the new parent into account
when the parent is updated while the clock is disabled. Set the update
bit when enabling the clock to force an update of the mux.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/clk/mediatek/clk-mux.c | 32 +++++++++++++++++++++++++++++---
 drivers/clk/mediatek/clk-mux.h |  1 +
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 9370bebca7f8..b0c61709bacc 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -20,9 +20,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
+	unsigned long flags = 0;
 
-	return regmap_write(mux->regmap, mux->data->clr_ofs,
-			BIT(mux->data->gate_shift));
+	if (mux->lock)
+		spin_lock_irqsave(mux->lock, flags);
+	else
+		__acquire(mux->lock);
+
+	regmap_write(mux->regmap, mux->data->clr_ofs,
+		     BIT(mux->data->gate_shift));
+
+	/*
+	 * If the parent has been changed when the clock was disabled, it will
+	 * not be effective yet. Set the update bit to ensure the mux gets
+	 * updated.
+	 */
+	if (mux->reparent && mux->data->upd_shift >= 0) {
+		regmap_write(mux->regmap, mux->data->upd_ofs,
+			     BIT(mux->data->upd_shift));
+		mux->reparent = false;
+	}
+
+	if (mux->lock)
+		spin_unlock_irqrestore(mux->lock, flags);
+	else
+		__release(mux->lock);
+
+	return 0;
 }
 
 static void mtk_clk_mux_disable_setclr(struct clk_hw *hw)
@@ -77,9 +101,11 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 		regmap_write(mux->regmap, mux->data->set_ofs,
 				index << mux->data->mux_shift);
 
-		if (mux->data->upd_shift >= 0)
+		if (mux->data->upd_shift >= 0) {
 			regmap_write(mux->regmap, mux->data->upd_ofs,
 					BIT(mux->data->upd_shift));
+			mux->reparent = true;
+		}
 	}
 
 	if (mux->lock)
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 15c62366ba9a..f1946161ade1 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -14,6 +14,7 @@ struct mtk_clk_mux {
 	struct regmap *regmap;
 	const struct mtk_mux *data;
 	spinlock_t *lock;
+	bool reparent;
 };
 
 struct mtk_mux {
-- 
Regards,

Laurent Pinchart


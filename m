Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87364C05027
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 15:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjBFPau (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjBFPaV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 10:30:21 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50882A995;
        Mon,  6 Feb 2023 07:30:05 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 508506602F93;
        Mon,  6 Feb 2023 15:30:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675697404;
        bh=mkbBbWYebgdFxhv1Yxn8HTTQtR6Vhd4o4rssC48MQ34=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jFs+SXYiVnSZdJLTy6IIhlF529ucepOu6DlEbMwRYnkeYypwUdRb0I3oC6xb8ZHwo
         wfwJPhM3qpQ3ifSpkw6ZCVFrUjA65IW/F3AhA35DT10xWNT7FG0ueNU8ajnIccKkX0
         tvEkS4tMzIviI//V0yU8WszwroEh6NwGwJM21fxjGBD7bzJdu64uJpNHGIK47r9dK8
         quTGiS4ewuIhVHeGCAa1QZ5XJTzDYM8MvgY8lmlQJ3OfRq97+n9EmNkI8YSTU0eXwU
         ocigwoZ9iobno7ZgdfXlboFRtjzoDrYK/es1rme+k/aAxTRLrrhZQA6neXhCswBZFs
         0uBguxbwJzUVg==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v1 13/45] clk: mediatek: mt8167: Compress GATE_TOPx macros
Date:   Mon,  6 Feb 2023 16:28:56 +0100
Message-Id: <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the GATE_MTK macro to compress the GATE_TOP{0..5} macros.
No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 88 +++++++++----------------------
 1 file changed, 24 insertions(+), 64 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index 91669ebafaf9..97a443fdfc77 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -736,77 +736,37 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	.sta_ofs = 0x44,
 };
 
-#define GATE_TOP0(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top0_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP0_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top0_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP0_I(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP1(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top1_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP2(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top2_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP2_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top2_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP2_I(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP3(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top3_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP3(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top3_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP4_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top4_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP4_I(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &top4_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP5(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top5_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_no_setclr,	\
-	}
+#define GATE_TOP5(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top5_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate top_clks[] __initconst = {
 	/* TOP0 */
-- 
2.39.1


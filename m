Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF81C388F7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:30:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9248B20B80
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgKMIaA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 03:30:00 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:34613 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725866AbgKMI37 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2020 03:29:59 -0500
X-UUID: ecd4d68091624f2cb8b08da4dbbc4a69-20201113
X-UUID: ecd4d68091624f2cb8b08da4dbbc4a69-20201113
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1776010858; Fri, 13 Nov 2020 16:29:55 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Nov 2020 16:29:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Nov 2020 16:29:54 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>
Subject: [PATCH v3] clk: mediatek: Make mtk_clk_register_mux() a static function
Date:   Fri, 13 Nov 2020 16:29:52 +0800
Message-ID: <1605256192-31307-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

mtk_clk_register_mux() should be a static function

Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 2 +-
 drivers/clk/mediatek/clk-mux.h | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 14e127e..dcc1352 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -155,7 +155,7 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 	.set_parent = mtk_clk_mux_set_parent_setclr_lock,
 };
 
-struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
+static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 				 struct regmap *regmap,
 				 spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index f5625f4..8e2f927 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -77,10 +77,6 @@ struct mtk_mux {
 			_width, _gate, _upd_ofs, _upd,			\
 			CLK_SET_RATE_PARENT)
 
-struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
-				 struct regmap *regmap,
-				 spinlock_t *lock);
-
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
-- 
1.8.1.1.dirty


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E60C4338F
	for <linux-clk@archiver.kernel.org>; Fri, 20 Aug 2021 11:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 809F261040
	for <linux-clk@archiver.kernel.org>; Fri, 20 Aug 2021 11:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhHTLRk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Aug 2021 07:17:40 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:42848 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239528AbhHTLRh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Aug 2021 07:17:37 -0400
X-UUID: c50f22ddf8fd44e8bdfa9786222ef4e3-20210820
X-UUID: c50f22ddf8fd44e8bdfa9786222ef4e3-20210820
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1548983139; Fri, 20 Aug 2021 19:16:57 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:16:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 19:16:55 +0800
From:   Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [v2 04/24] clk: mediatek: Add API for clock resource recycle
Date:   Fri, 20 Aug 2021 19:14:44 +0800
Message-ID: <20210820111504.350-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to avoid resource leak when fail clock registartion appears,
so add the common interface to handle it.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 9 +++++++++
 drivers/clk/mediatek/clk-mtk.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 4b6096c44d74..c3d385c0cfcb 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -43,6 +43,15 @@ struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
 	return NULL;
 }
 
+void mtk_free_clk_data(struct clk_onecell_data *clk_data)
+{
+	if (!clk_data)
+		return;
+
+	kfree(clk_data->clks);
+	kfree(clk_data);
+}
+
 void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 		int num, struct clk_onecell_data *clk_data)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 7de41c3b3206..0ff289d93452 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -202,6 +202,7 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 				struct clk_onecell_data *clk_data);
 
 struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
+void mtk_free_clk_data(struct clk_onecell_data *clk_data);
 
 #define HAVE_RST_BAR	BIT(0)
 #define PLL_AO		BIT(1)
-- 
2.18.0


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BF6C49EA4
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 22:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE4FA613FA
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 22:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234244AbhFPWvd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 18:51:33 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33228 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234231AbhFPWvc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 18:51:32 -0400
X-UUID: b941abc295ca46e99e818863ffc78dbb-20210617
X-UUID: b941abc295ca46e99e818863ffc78dbb-20210617
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1949136275; Thu, 17 Jun 2021 06:49:22 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:49:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Jun 2021 06:49:20 +0800
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
Subject: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
Date:   Thu, 17 Jun 2021 06:47:24 +0800
Message-ID: <20210616224743.5109-4-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On MT8195, tuner_en_reg is moved to register offest 0x0.
If we only judge by tuner_en_reg, it may lead to wrong address.
Add tuner_en_bit to the check condition. And it has been confirmed,
on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
clock square control.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 7fb001a4e7d8..99ada6e06697 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -332,7 +332,7 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		pll->pcw_chg_addr = pll->base_addr + REG_CON1;
 	if (data->tuner_reg)
 		pll->tuner_addr = base + data->tuner_reg;
-	if (data->tuner_en_reg)
+	if (data->tuner_en_reg || data->tuner_en_bit)
 		pll->tuner_en_addr = base + data->tuner_en_reg;
 	if (data->en_reg)
 		pll->en_addr = base + data->en_reg;
-- 
2.18.0


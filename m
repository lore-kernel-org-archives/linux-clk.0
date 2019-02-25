Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96714C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 02:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EC7B20989
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 02:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbfBYCJw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 Feb 2019 21:09:52 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:43014 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728417AbfBYCJv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Feb 2019 21:09:51 -0500
X-UUID: 397c713a589d443ab209c25614665348-20190225
X-UUID: 397c713a589d443ab209c25614665348-20190225
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <wangyan.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1791226743; Mon, 25 Feb 2019 10:09:39 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 25 Feb
 2019 10:09:38 +0800
Received: from mszsdaap41.mediatek.inc (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 25 Feb 2019 10:09:37 +0800
From:   wangyan wang <wangyan.wang@mediatek.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>
CC:     wangyan wang <wangyan.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        chunhui dai <chunhui.dai@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH V6 6/8] clk: mediatek: using CLK_MUX_ROUND_CLOSEST for the clock of dpi1_sel
Date:   Mon, 25 Feb 2019 10:09:10 +0800
Message-ID: <20190225020912.29120-7-wangyan.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190225020912.29120-1-wangyan.wang@mediatek.com>
References: <20190225020912.29120-1-wangyan.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: chunhui dai <chunhui.dai@mediatek.com>

The MUX clock of dpi1_sel should select the closet clock for itself.
We could add this flag to enable this function of MUX in CCF.

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: wangyan wang <wangyan.wang@mediatek.com>
---
 drivers/clk/mediatek/clk-mt2701.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index ab6ab07f53e6..905a2316f6a7 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -535,8 +535,8 @@ static const struct mtk_composite top_muxes[] = {
 		0x0080, 8, 2, 15),
 	MUX_GATE(CLK_TOP_DPI0_SEL, "dpi0_sel", dpi0_parents,
 		0x0080, 16, 3, 23),
-	MUX_GATE(CLK_TOP_DPI1_SEL, "dpi1_sel", dpi1_parents,
-		0x0080, 24, 2, 31),
+	MUX_GATE_FLAGS_2(CLK_TOP_DPI1_SEL, "dpi1_sel", dpi1_parents,
+		0x0080, 24, 2, 31, 0, CLK_MUX_ROUND_CLOSEST),
 
 	MUX_GATE(CLK_TOP_TVE_SEL, "tve_sel", tve_parents,
 		0x0090, 0, 3, 7),
-- 
2.14.1


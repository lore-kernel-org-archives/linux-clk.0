Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475DCC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 22 Dec 2020 05:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6AEE23127
	for <linux-clk@archiver.kernel.org>; Tue, 22 Dec 2020 05:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgLVFgQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Dec 2020 00:36:16 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:34625 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725881AbgLVFgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Dec 2020 00:36:16 -0500
X-UUID: 036f7ad2a492424bb0d477bb187aec05-20201222
X-UUID: 036f7ad2a492424bb0d477bb187aec05-20201222
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 175159508; Tue, 22 Dec 2020 13:35:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 13:35:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 13:35:30 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <drinkcat@chromium.org>, <matthias.bgg@gmail.com>,
        <sboyd@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <weiyi.lu@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        TingHan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] clk: mediatek: Remove unused MT8192 mcupm clock
Date:   Tue, 22 Dec 2020 13:35:02 +0800
Message-ID: <20201222053502.27872-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: "TingHan Shen" <tinghan.shen@mediatek.com>

Remove unused MT8192 mcupm clock

Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
---
This patch depends on series "Mediatek MT8192 clock support"[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=379955
---
 drivers/clk/mediatek/clk-mt8192.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 673dc60182f5..80df1903bd58 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -649,12 +649,6 @@ static const char * const aes_msdcfde_parents[] = {
 	"univpll_d6"
 };
 
-static const char * const mcupm_parents[] = {
-	"clk26m",
-	"mainpll_d6_d4",
-	"mainpll_d6_d2"
-};
-
 static const char * const sflash_parents[] = {
 	"clk26m",
 	"mainpll_d7_d8",
@@ -856,8 +850,6 @@ static const struct mtk_mux top_mtk_muxes[] = {
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_MSDCFDE_SEL, "aes_msdcfde_sel",
 		aes_msdcfde_parents, 0x100, 0x104, 0x108, 24, 3, 31, 0x00c, 1),
 	/* CLK_CFG_16 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_MCUPM_SEL, "mcupm_sel",
-		mcupm_parents, 0x110, 0x114, 0x118, 0, 2, 7, 0x00c, 2),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_SFLASH_SEL, "sflash_sel",
 		sflash_parents, 0x110, 0x114, 0x118, 8, 2, 15, 0x00c, 3),
 };
@@ -983,7 +975,6 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA0(CLK_INFRA_SCPSYS, "infra_scpsys", "scp_sel", 4),
 	GATE_INFRA0(CLK_INFRA_SEJ, "infra_sej", "axi_sel", 5),
 	GATE_INFRA0(CLK_INFRA_APXGPT, "infra_apxgpt", "axi_sel", 6),
-	GATE_INFRA0(CLK_INFRA_MCUPM, "infra_mcupm", "mcupm_sel", 7),
 	GATE_INFRA0(CLK_INFRA_GCE, "infra_gce", "axi_sel", 8),
 	GATE_INFRA0(CLK_INFRA_GCE2, "infra_gce2", "axi_sel", 9),
 	GATE_INFRA0(CLK_INFRA_THERM, "infra_therm", "axi_sel", 10),
-- 
2.18.0


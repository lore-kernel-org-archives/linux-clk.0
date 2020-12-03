Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB120C71156
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 10:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E9CE21D91
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 10:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388802AbgLCKa4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 05:30:56 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:44372 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387578AbgLCKaz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Dec 2020 05:30:55 -0500
X-UUID: 62003900041843c687a019304fdfbf12-20201203
X-UUID: 62003900041843c687a019304fdfbf12-20201203
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1287491766; Thu, 03 Dec 2020 18:30:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 18:30:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Dec 2020 18:30:08 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <drinkcat@chromium.org>, <matthias.bgg@gmail.com>,
        <sboyd@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <weiyi.lu@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] clk: mediatek: Remove MT8192 unused clock
Date:   Thu, 3 Dec 2020 18:30:07 +0800
Message-ID: <20201203103007.14823-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: "Tinghan Shen" <tinghan.shen@mediatek.com>

Remove MT8192 sspm clock

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
This patch depends on series "Mediatek MT8192 clock support"[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=379955 

---
 drivers/clk/mediatek/clk-mt8192.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index 673dc60182f5..6983707e4ac9 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -403,15 +403,6 @@ static const char * const atb_parents[] = {
 	"mainpll_d5_d2"
 };
 
-static const char * const sspm_parents[] = {
-	"clk26m",
-	"mainpll_d5_d2",
-	"univpll_d5_d2",
-	"mainpll_d4_d2",
-	"univpll_d4_d2",
-	"mainpll_d6"
-};
-
 static const char * const dpi_parents[] = {
 	"clk26m",
 	"tvdpll_d2",
@@ -792,8 +783,6 @@ static const struct mtk_mux top_mtk_muxes[] = {
 		pwrap_ulposc_parents, 0x090, 0x094, 0x098, 8, 3, 15, 0x008, 2),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_ATB_SEL, "atb_sel",
 		atb_parents, 0x090, 0x094, 0x098, 16, 2, 23, 0x008, 3),
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSPM_SEL, "sspm_sel",
-		sspm_parents, 0x090, 0x094, 0x098, 24, 3, 31, 0x008, 4),
 	/* CLK_CFG_9 */
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI_SEL, "dpi_sel",
 		dpi_parents, 0x0a0, 0x0a4, 0x0a8, 0, 3, 7, 0x008, 5),
@@ -1047,9 +1036,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA2(CLK_INFRA_UNIPRO_TICK, "infra_unipro_tick", "clk26m", 12),
 	GATE_INFRA2(CLK_INFRA_UFS_MP_SAP_B, "infra_ufs_mp_sap_b", "clk26m", 13),
 	GATE_INFRA2(CLK_INFRA_MD32_B, "infra_md32_b", "axi_sel", 14),
-	GATE_INFRA2(CLK_INFRA_SSPM, "infra_sspm", "sspm_sel", 15),
 	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist", "axi_sel", 16),
-	GATE_INFRA2(CLK_INFRA_SSPM_BUS_H, "infra_sspm_bus_h", "axi_sel", 17),
 	GATE_INFRA2(CLK_INFRA_I2C5, "infra_i2c5", "i2c_sel", 18),
 	GATE_INFRA2(CLK_INFRA_I2C5_ARBITER, "infra_i2c5_arbiter", "i2c_sel", 19),
 	GATE_INFRA2(CLK_INFRA_I2C5_IMM, "infra_i2c5_imm", "i2c_sel", 20),
@@ -1068,8 +1055,6 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA3(CLK_INFRA_MSDC0_SELF, "infra_msdc0_self", "msdc50_0_sel", 0),
 	GATE_INFRA3(CLK_INFRA_MSDC1_SELF, "infra_msdc1_self", "msdc50_0_sel", 1),
 	GATE_INFRA3(CLK_INFRA_MSDC2_SELF, "infra_msdc2_self", "msdc50_0_sel", 2),
-	GATE_INFRA3(CLK_INFRA_SSPM_26M_SELF, "infra_sspm_26m_self", "clk26m", 3),
-	GATE_INFRA3(CLK_INFRA_SSPM_32K_SELF, "infra_sspm_32k_self", "clk32k", 4),
 	GATE_INFRA3(CLK_INFRA_UFS_AXI, "infra_ufs_axi", "axi_sel", 5),
 	GATE_INFRA3(CLK_INFRA_I2C6, "infra_i2c6", "i2c_sel", 6),
 	GATE_INFRA3(CLK_INFRA_AP_MSDC0, "infra_ap_msdc0", "msdc50_0_sel", 7),
-- 
2.18.0


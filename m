Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:60128 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731025AbeITPkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Sep 2018 11:40:43 -0400
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh@kernel.org>
CC: James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 2/3] clk: mediatek: update clock driver of MT2712
Date: Thu, 20 Sep 2018 17:57:26 +0800
Message-ID: <20180920095727.11868-4-weiyi.lu@mediatek.com>
In-Reply-To: <20180920095727.11868-1-weiyi.lu@mediatek.com>
References: <20180920095727.11868-1-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

According to 3rd ECO design change,
1. Add new fixed factor clock of audio.
2. Add the parent clocks for audio clock mux.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt2712.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 991d4093726e..e36f4aab634d 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -223,6 +223,8 @@ static const struct mtk_fixed_factor top_divs[] = {
 		4),
 	FACTOR(CLK_TOP_APLL1_D3, "apll1_d3", "apll1_ck", 1,
 		3),
+	FACTOR(CLK_TOP_APLL2_D3, "apll2_d3", "apll2_ck", 1,
+		3),
 };
 
 static const char * const axi_parents[] = {
@@ -594,7 +596,8 @@ static const char * const a1sys_hp_parents[] = {
 	"apll1_ck",
 	"apll1_d2",
 	"apll1_d4",
-	"apll1_d8"
+	"apll1_d8",
+	"apll1_d3"
 };
 
 static const char * const a2sys_hp_parents[] = {
@@ -602,7 +605,8 @@ static const char * const a2sys_hp_parents[] = {
 	"apll2_ck",
 	"apll2_d2",
 	"apll2_d4",
-	"apll2_d8"
+	"apll2_d8",
+	"apll2_d3"
 };
 
 static const char * const asm_l_parents[] = {
-- 
2.12.5.2.gbdf23ab

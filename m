Return-Path: <SRS0=O9me=ED=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD900C5DF9D
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 22:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B821206F4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 22:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733018AbgJ1WZ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:25:57 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58384 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732948AbgJ1WZp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Oct 2020 18:25:45 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 87D07201609;
        Wed, 28 Oct 2020 13:59:36 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BCAA20160B;
        Wed, 28 Oct 2020 13:59:36 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D2B9A2030E;
        Wed, 28 Oct 2020 13:59:35 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 2/5] clk: imx: gate2: Keep the register writing in on place
Date:   Wed, 28 Oct 2020 14:58:59 +0200
Message-Id: <1603889942-27026-3-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603889942-27026-1-git-send-email-abel.vesa@nxp.com>
References: <1603889942-27026-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move all the register writing to the newly added clk_gate2_do_shared_clks
and call that everywhere need needed. Cleans up the code a little bit.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-gate2.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index 49952ee..e1f6cd9 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -37,10 +37,21 @@ struct clk_gate2 {
 
 #define to_clk_gate2(_hw) container_of(_hw, struct clk_gate2, hw)
 
+static void clk_gate2_do_shared_clks(struct clk_hw *hw, bool enable)
+{
+	struct clk_gate2 *gate = to_clk_gate2(hw);
+	u32 reg;
+
+	reg = readl(gate->reg);
+	reg &= ~(3 << gate->bit_idx);
+	if (enable)
+		reg |= gate->cgr_val << gate->bit_idx;
+	writel(reg, gate->reg);
+}
+
 static int clk_gate2_enable(struct clk_hw *hw)
 {
 	struct clk_gate2 *gate = to_clk_gate2(hw);
-	u32 reg;
 	unsigned long flags;
 	int ret = 0;
 
@@ -49,11 +60,7 @@ static int clk_gate2_enable(struct clk_hw *hw)
 	if (gate->share_count && (*gate->share_count)++ > 0)
 		goto out;
 
-	reg = readl(gate->reg);
-	reg &= ~(3 << gate->bit_idx);
-	reg |= gate->cgr_val << gate->bit_idx;
-	writel(reg, gate->reg);
-
+	clk_gate2_do_shared_clks(hw, true);
 out:
 	spin_unlock_irqrestore(gate->lock, flags);
 
@@ -63,7 +70,6 @@ static int clk_gate2_enable(struct clk_hw *hw)
 static void clk_gate2_disable(struct clk_hw *hw)
 {
 	struct clk_gate2 *gate = to_clk_gate2(hw);
-	u32 reg;
 	unsigned long flags;
 
 	spin_lock_irqsave(gate->lock, flags);
@@ -75,10 +81,7 @@ static void clk_gate2_disable(struct clk_hw *hw)
 			goto out;
 	}
 
-	reg = readl(gate->reg);
-	reg &= ~(3 << gate->bit_idx);
-	writel(reg, gate->reg);
-
+	clk_gate2_do_shared_clks(hw, false);
 out:
 	spin_unlock_irqrestore(gate->lock, flags);
 }
@@ -104,15 +107,11 @@ static void clk_gate2_disable_unused(struct clk_hw *hw)
 {
 	struct clk_gate2 *gate = to_clk_gate2(hw);
 	unsigned long flags;
-	u32 reg;
 
 	spin_lock_irqsave(gate->lock, flags);
 
-	if (!gate->share_count || *gate->share_count == 0) {
-		reg = readl(gate->reg);
-		reg &= ~(3 << gate->bit_idx);
-		writel(reg, gate->reg);
-	}
+	if (!gate->share_count || *gate->share_count == 0)
+		clk_gate2_do_shared_clks(hw, false);
 
 	spin_unlock_irqrestore(gate->lock, flags);
 }
-- 
2.7.4


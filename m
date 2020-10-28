Return-Path: <SRS0=O9me=ED=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ABDC4363A
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 22:26:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 505FE20706
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 22:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733036AbgJ1W0C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:26:02 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58432 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732966AbgJ1WZo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Oct 2020 18:25:44 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B92F920160E;
        Wed, 28 Oct 2020 13:59:38 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AC273201601;
        Wed, 28 Oct 2020 13:59:38 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 064A52030E;
        Wed, 28 Oct 2020 13:59:37 +0100 (CET)
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
Subject: [PATCH v2 5/5] clk: imx: gate2: Add locking in is_enabled op
Date:   Wed, 28 Oct 2020 14:59:02 +0200
Message-Id: <1603889942-27026-6-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603889942-27026-1-git-send-email-abel.vesa@nxp.com>
References: <1603889942-27026-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Protect against enabling/disabling the gate while we're
checking if it is enabled.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-gate2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index 7e4b5e8..480a184 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -101,9 +101,17 @@ static int clk_gate2_reg_is_enabled(void __iomem *reg, u8 bit_idx,
 static int clk_gate2_is_enabled(struct clk_hw *hw)
 {
 	struct clk_gate2 *gate = to_clk_gate2(hw);
+	unsigned long flags;
+	int ret = 0;
 
-	return clk_gate2_reg_is_enabled(gate->reg, gate->bit_idx,
+	spin_lock_irqsave(gate->lock, flags);
+
+	ret = clk_gate2_reg_is_enabled(gate->reg, gate->bit_idx,
 					gate->cgr_val, gate->cgr_mask);
+
+	spin_unlock_irqrestore(gate->lock, flags);
+
+	return ret;
 }
 
 static void clk_gate2_disable_unused(struct clk_hw *hw)
-- 
2.7.4


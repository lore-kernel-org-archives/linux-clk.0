Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5BFC64E7C
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 12:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6C7D21741
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 12:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389274AbgKZMls (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 07:41:48 -0500
Received: from inva020.nxp.com ([92.121.34.13]:43140 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389090AbgKZMlr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Nov 2020 07:41:47 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D2CBF1A0BA9;
        Thu, 26 Nov 2020 13:41:45 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C46E41A099E;
        Thu, 26 Nov 2020 13:41:45 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 481BA2026B;
        Thu, 26 Nov 2020 13:41:45 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 3/5] clk: composite: Allow gate ops with only .is_enabled op
Date:   Thu, 26 Nov 2020 14:40:07 +0200
Message-Id: <1606394409-12755-4-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606394409-12755-1-git-send-email-abel.vesa@nxp.com>
References: <1606394409-12755-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some composite clocks might be enabled/disabled from outside the
clock framework. So allow the composite clock register successfully
with only the .is_enabled op for gate ops.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/clk-composite.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 2ddb54f..29f00a9 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -278,17 +278,18 @@ static struct clk_hw *__clk_hw_register_composite(struct device *dev,
 	}
 
 	if (gate_hw && gate_ops) {
-		if (!gate_ops->is_enabled || !gate_ops->enable ||
-		    !gate_ops->disable) {
-			hw = ERR_PTR(-EINVAL);
-			goto err;
-		}
-
 		composite->gate_hw = gate_hw;
 		composite->gate_ops = gate_ops;
-		clk_composite_ops->is_enabled = clk_composite_is_enabled;
-		clk_composite_ops->enable = clk_composite_enable;
-		clk_composite_ops->disable = clk_composite_disable;
+		if (gate_ops->is_enabled) {
+			clk_composite_ops->is_enabled = clk_composite_is_enabled;
+		} else {
+			hw = ERR_PTR(-EINVAL);
+			goto err;
+		}
+		if (gate_ops->enable)
+			clk_composite_ops->enable = clk_composite_enable;
+		if (gate_ops->disable)
+			clk_composite_ops->disable = clk_composite_disable;
 	}
 
 	init.ops = clk_composite_ops;
-- 
2.7.4


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E6AEB64D9
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 20:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbjGGUC5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 16:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbjGGUCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 16:02:54 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911B31FE1
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 13:02:53 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id HrfFqvZhDbalEHrfFq3piE; Fri, 07 Jul 2023 22:02:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688760171;
        bh=WHBxp/DNnVvolpj0sacEs6o3uNv+OMzOoI0vJ6ekVxw=;
        h=From:To:Cc:Subject:Date;
        b=pfhl6ISeEJ4F6M+X25JNYSbHnXQA1ZqdfIrYrYIdUtT+YmcU6iCxvqx1J5lqkTdLq
         jgFMrnXO+fMHqbbV2Hi/kfTMODwxqc28ZVo4HbJDTtguHsW/hObCTsmmp/mtfTLDUK
         ZYzvpTTJywpWaycwzPTuUP4thj4G1odrAYTmjjQndkxyPMpMCMyw2WRvdVJgsx0HdN
         8wcYYedcqQ4X0G996VmhE6QV4HlmJ9Sp8aH79cLrm18ecSWyTd6qYEgQGi0FfM3WBp
         ZXan13RNN/W+Ayj/28/74p6V2vK6FfaVBZC/N57znawc5LQe1iaSw+q5z91QdplPN2
         lxv2Ng7w9G2jw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 Jul 2023 22:02:51 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: clk-gpr-mux: Simplify .determine_rate()
Date:   Fri,  7 Jul 2023 22:02:48 +0200
Message-Id: <ac8bd50c41b84f244bb0ec94e8aed25c513c9037.1688760152.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

imx_clk_gpr_mux_determine_rate() is the same as __clk_mux_determine_rate(),
so use the latter to save some LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/imx/clk-gpr-mux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-gpr-mux.c b/drivers/clk/imx/clk-gpr-mux.c
index 0b5a97698b47..0e14b61cba84 100644
--- a/drivers/clk/imx/clk-gpr-mux.c
+++ b/drivers/clk/imx/clk-gpr-mux.c
@@ -65,16 +65,10 @@ static int imx_clk_gpr_mux_set_parent(struct clk_hw *hw, u8 index)
 	return regmap_update_bits(priv->regmap, priv->reg, priv->mask, val);
 }
 
-static int imx_clk_gpr_mux_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
-{
-	return clk_mux_determine_rate_flags(hw, req, 0);
-}
-
 static const struct clk_ops imx_clk_gpr_mux_ops = {
 	.get_parent = imx_clk_gpr_mux_get_parent,
 	.set_parent = imx_clk_gpr_mux_set_parent,
-	.determine_rate = imx_clk_gpr_mux_determine_rate,
+	.determine_rate = __clk_mux_determine_rate,
 };
 
 struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
-- 
2.34.1


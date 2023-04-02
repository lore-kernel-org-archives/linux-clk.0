Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF51C77B6C
	for <linux-clk@archiver.kernel.org>; Sun,  2 Apr 2023 09:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjDBJma (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Apr 2023 05:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbjDBJm3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Apr 2023 05:42:29 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D9F1BF79
        for <linux-clk@vger.kernel.org>; Sun,  2 Apr 2023 02:42:28 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id iuDzpwm4hwFKBiuEEpeDj1; Sun, 02 Apr 2023 11:42:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Apr 2023 11:42:26 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mturquette@baylibre.com, sboyd@kernel.org, abelvesa@kernel.org,
        peng.fan@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/4] clk: rockchip: Remove values for mmask and nmask in struct clk_fractional_divider
Date:   Sun,  2 Apr 2023 11:42:06 +0200
Message-Id: <58e1950566e40e2fbb31004baee57a164ca6a390.1680423909.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680423909.git.christophe.jaillet@wanadoo.fr>
References: <cover.1680423909.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that fractional_divider clk computes mmask and nmask when needed, there
is no more need to provide them explicitly anymore.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/rockchip/clk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index a8646794575a..4059d9365ae6 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -244,10 +244,8 @@ static struct clk *rockchip_clk_register_frac_branch(
 	div->reg = base + muxdiv_offset;
 	div->mshift = 16;
 	div->mwidth = 16;
-	div->mmask = GENMASK(div->mwidth - 1, 0) << div->mshift;
 	div->nshift = 0;
 	div->nwidth = 16;
-	div->nmask = GENMASK(div->nwidth - 1, 0) << div->nshift;
 	div->lock = lock;
 	div->approximation = rockchip_fractional_approximation;
 	div_ops = &clk_fractional_divider_ops;
-- 
2.34.1


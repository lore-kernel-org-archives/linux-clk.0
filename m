Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8E1C76196
	for <linux-clk@archiver.kernel.org>; Sun,  2 Apr 2023 09:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjDBJmU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Apr 2023 05:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjDBJmT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Apr 2023 05:42:19 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF408E39D
        for <linux-clk@vger.kernel.org>; Sun,  2 Apr 2023 02:42:17 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id iuDzpwm4hwFKBiuE0peDgu; Sun, 02 Apr 2023 11:42:15 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Apr 2023 11:42:15 +0200
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
Subject: [PATCH v2 0/4] clk: shrink struct clk_fractional_divider
Date:   Sun,  2 Apr 2023 11:42:03 +0200
Message-Id: <cover.1680423909.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This serie removes 2 fields from struct clk_fractional_divider and shrinks it
from 72 to 56 bytes.

Instead of been pre-computed, thse fields are now computed when needed.

The first patch makes the [mn]mask fields useless.
Patch 2 and 3 make some needed modification in 2 drivers that where using these
fields.
Finally, patch 4 removes the now used fields.

This is a another approach of what was proposed in v1. (i.e. just moving a field
to shrink from 72 ro 64 bytes)

Compared to v1, all 4 patches are new.

Suggested-by: Stephen Boyd <sboyd@kernel.org>

v1:
https://lore.kernel.org/linux-kernel/d1874eb8848d5f97f87337011188640a1463a666.1676649335.git.christophe.jaillet@wanadoo.fr/

Christophe JAILLET (4):
  clk: Compute masks for fractional_divider clk when needed.
  clk: imx: Remove values for mmask and nmask in struct
    clk_fractional_divider
  clk: rockchip: Remove values for mmask and nmask in struct
    clk_fractional_divider
  clk: Remove mmask and nmask fields in struct clk_fractional_divider

 drivers/clk/clk-fractional-divider.c | 16 +++++++++++-----
 drivers/clk/imx/clk-composite-7ulp.c |  4 ----
 drivers/clk/rockchip/clk.c           |  2 --
 include/linux/clk-provider.h         |  2 --
 4 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.34.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C648FEB64D9
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 20:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjGGUCa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 16:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjGGUC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 16:02:29 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BC61FE0
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 13:02:27 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id Hrepqf0QVSMckHreqqzs8D; Fri, 07 Jul 2023 22:02:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688760145;
        bh=fdKSf2lM13oDsLK578xn0Ae9iOX668fZDk7OB3TOWx4=;
        h=From:To:Cc:Subject:Date;
        b=XYD2xtwVmBx+xOTyy2rhnu6ACkAE1O3RSjhOyHW1qZ9OuA7E3ToFTeZ53Vh5TlMcM
         dAA1i/a7xiDws6Xje5Pba2ppcxmouxrJR5iFGjCA5qxCDAJQamyLeEgjKaXJ5hK4iZ
         MYtvxhBufhZN9jSxrFD8wJCSlaJzBFNV6ppkdRGrNp21si0Dh1BhZbbleey2VuJmjA
         R2pOo7sCPtCGdsvUOdB+32wxFN9OZb60j2NV0VQ2wOoni/UJbAC8ghiR0xYxMWyUms
         IIAJ7Wxy8ZvEuXqwBIgAcSw1LaZ044og0m0/mmX+/9/whNsZwhbPPYJkm08GZ0pEZ0
         3Uzbu5PN7+ghQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 Jul 2023 22:02:25 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-clk@vger.kernel.org
Subject: [PATCH] clk: starfive: Simplify .determine_rate()
Date:   Fri,  7 Jul 2023 22:02:18 +0200
Message-Id: <085541814ebe2543cb7e8a31004c0da3e7d5b6eb.1688760111.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

jh71x0_clk_mux_determine_rate() is the same as __clk_mux_determine_rate(),
so use the latter to save some LoC.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/starfive/clk-starfive-jh71x0.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index b372083d11c3..aebc99264a0b 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -174,12 +174,6 @@ static int jh71x0_clk_set_parent(struct clk_hw *hw, u8 index)
 	return 0;
 }
 
-static int jh71x0_clk_mux_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
-{
-	return clk_mux_determine_rate_flags(hw, req, 0);
-}
-
 static int jh71x0_clk_get_phase(struct clk_hw *hw)
 {
 	struct jh71x0_clk *clk = jh71x0_clk_from(hw);
@@ -261,7 +255,7 @@ static const struct clk_ops jh71x0_clk_gdiv_ops = {
 };
 
 static const struct clk_ops jh71x0_clk_mux_ops = {
-	.determine_rate = jh71x0_clk_mux_determine_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = jh71x0_clk_set_parent,
 	.get_parent = jh71x0_clk_get_parent,
 	.debug_init = jh71x0_clk_debug_init,
@@ -271,7 +265,7 @@ static const struct clk_ops jh71x0_clk_gmux_ops = {
 	.enable = jh71x0_clk_enable,
 	.disable = jh71x0_clk_disable,
 	.is_enabled = jh71x0_clk_is_enabled,
-	.determine_rate = jh71x0_clk_mux_determine_rate,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = jh71x0_clk_set_parent,
 	.get_parent = jh71x0_clk_get_parent,
 	.debug_init = jh71x0_clk_debug_init,
-- 
2.34.1


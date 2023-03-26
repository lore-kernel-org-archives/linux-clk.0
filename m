Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1CBC74A5B
	for <linux-clk@archiver.kernel.org>; Sun, 26 Mar 2023 15:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjCZPT0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 26 Mar 2023 11:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCZPTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 26 Mar 2023 11:19:25 -0400
X-Greylist: delayed 1350 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Mar 2023 08:19:22 PDT
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DBC436EAD
        for <linux-clk@vger.kernel.org>; Sun, 26 Mar 2023 08:19:22 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id gRgCpQ21Z6OWigRgCpM9dQ; Sun, 26 Mar 2023 16:49:10 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Mar 2023 16:49:10 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-clk@vger.kernel.org
Subject: [PATCH] clk: versaclock7: Fix an error handling path in vc7_probe()
Date:   Sun, 26 Mar 2023 16:49:06 +0200
Message-Id: <68c2fac5e774088437200aaeca8737a691bf951c.1679842132.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If an error code other than -EPROBE_DEFER is returned, it is likely that
there will be some trouble when:
   __clk_get_name(vc7->pin_xin)
is called a few lines below.

__clk_get_name() only checks for NULL.

Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative and compile tested only.
---
 drivers/clk/clk-versaclock7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 8e4f86e852aa..8d11e68e94b2 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1111,8 +1111,8 @@ static int vc7_probe(struct i2c_client *client)
 	vc7->chip_info = of_device_get_match_data(&client->dev);
 
 	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
-	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
-		return dev_err_probe(&client->dev, -EPROBE_DEFER,
+	if (IS_ERR(vc7->pin_xin)) {
+		return dev_err_probe(&client->dev, PTR_ERR(vc7->pin_xin),
 				     "xin not specified\n");
 	}
 
-- 
2.34.1


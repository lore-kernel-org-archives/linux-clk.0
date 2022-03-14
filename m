Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972EBC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 14:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242232AbiCNOST (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 10:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242226AbiCNOST (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 10:18:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A9619C1C
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 07:17:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVM-00050A-2Z; Mon, 14 Mar 2022 15:17:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVM-000f3E-Kq; Mon, 14 Mar 2022 15:16:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVK-0097bA-H4; Mon, 14 Mar 2022 15:16:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 10/16] clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()
Date:   Mon, 14 Mar 2022 15:16:37 +0100
Message-Id: <20220314141643.22184-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=uwe@kleine-koenig.org; h=from:subject; bh=ifDCWLNWOL0YsD190lDHgYWEgpILJPKuKKXrEJE9+6k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04L4e9IWDji46EkjNnzAhHVqLKQME2Cj5ZGNUdC xgjHkqmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OCwAKCRDB/BR4rcrsCaRsB/ 4lw+anORVBYqdBZWfiCRFFXRQ1s91OC7WxPcmn0FjB9HAVMFy2dbkDyj6f0nmTf+yUwEGrDTPZOFJN sm4dQ6knZvNGSweqsOAOLHFzuLkqcEE4Q25ruO0NF7Lvc6zA276x7VDCocmn7B8oKPg2+sITuo7qcW l6GpEHjwOvtN+FrW61a/R97V0S9wv6Ko0ZkN43U5h5uQsgt1hGo3JjZEf2wLOMIgq+MDqlMu8Fd7fC 88wZVw9dR6TsrgMSkJrdXY/2ykuniA9i3TmaWCIZ0qIc9Sa5tOp2sw1MqXJaX1blBcXqn4Kw5x5lZy U5SXida2sOuLdzEBzT18QLzS/ce2Dc
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk API recently got a function with a slightly different name and
the same functionality. Remove the duplication.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/meson/axg-audio.c | 36 ++++-------------------------------
 1 file changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index bfe36bd41339..5016682e47c8 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1657,35 +1657,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_sysclk_b_en,
 };
 
-static int devm_clk_get_enable(struct device *dev, char *id)
-{
-	struct clk *clk;
-	int ret;
-
-	clk = devm_clk_get(dev, id);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		dev_err_probe(dev, ret, "failed to get %s", id);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "failed to enable %s", id);
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       clk);
-	if (ret) {
-		dev_err(dev, "failed to add reset action on %s", id);
-		return ret;
-	}
-
-	return 0;
-}
-
 struct axg_audio_reset_data {
 	struct reset_controller_dev rstc;
 	struct regmap *map;
@@ -1787,6 +1758,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	struct regmap *map;
 	void __iomem *regs;
 	struct clk_hw *hw;
+	struct clk *clk;
 	int ret, i;
 
 	data = of_device_get_match_data(dev);
@@ -1804,9 +1776,9 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Get the mandatory peripheral clock */
-	ret = devm_clk_get_enable(dev, "pclk");
-	if (ret)
-		return ret;
+	clk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	ret = device_reset(dev);
 	if (ret) {
-- 
2.35.1


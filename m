Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAF1C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 07:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346723AbiETH6G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 03:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbiETH6C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 03:58:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CC315AB34
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:58:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWI-0006bJ-3L; Fri, 20 May 2022 09:57:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-003RP0-VN; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWF-00Avea-Ti; Fri, 20 May 2022 09:57:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Subject: [PATCH v9 4/4] clk: meson: axg-audio: Don't duplicate devm_clk_get_enabled()
Date:   Fri, 20 May 2022 09:57:37 +0200
Message-Id: <20220520075737.758761-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; h=from:subject; bh=emep3XTkeTU0GpA6wJdvDAVmYPRGFjZLqCqv5c74cSE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nqFtRg24pg7iF4i0BIc3b62DZbS0YtPVV+6mw8 mTbF7qmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ6gAKCRDB/BR4rcrsCYLpB/ 91Ah3ys+uVCA3xVXezxTZAjAHX5LK2RJgoLEEz0GbNNL44wWlYFBRErQO/r3KnOU9lsaRDpstCBZ6E E3jpb025VuPXKQR59SOMXhkHRclNY6Vm1xLlT3thqs4yU55BuoLkHm6k23EkzvMc6APn8kXV8pzCai hiQEcbLzzWm42ehymmL39l4VW4dRYoz2xNmSiZEcT3JB1SP/ja3SjmHzjWKlb9IR216d2mjiZT0QZp WP7m8cla/i9IZ5SqyZg/zIn26pv5cGTb5yaDKiOLQR9ISfVyfZFa8/zhwYczzr+Fa0Rhsks7/ayIvc BTqxJa4Q/Ymo7DxBS+1tEUT0qfF+lW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk API just got a function with a slightly different name and
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


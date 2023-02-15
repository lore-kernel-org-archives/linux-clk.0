Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39707C636CC
	for <linux-clk@archiver.kernel.org>; Wed, 15 Feb 2023 08:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjBOIhh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Feb 2023 03:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjBOIhg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Feb 2023 03:37:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DD436FC6
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 00:37:17 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pSDHk-0004og-4Y; Wed, 15 Feb 2023 09:37:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pSDHh-0054Kq-Ts; Wed, 15 Feb 2023 09:37:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pSDHi-003hLJ-GW; Wed, 15 Feb 2023 09:37:02 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] clk: Fix a typo "opereation" -> "operation"
Date:   Wed, 15 Feb 2023 09:37:01 +0100
Message-Id: <20230215083701.124786-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2KFcWN7rKTZsPy2GBm5oZ3My/xIDnFYbf1AVW7sx+FY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj7JmpWAtA8enhXi3f75089xL4mZseUaZ861l8y 98BjuU1PouJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+yZqQAKCRDB/BR4rcrs CS9mB/4jMpMMw2MT0vYsn9FGoQ5epXnUH4O6nYhYvU+XRTWiWn1csTTrlPJA12wJYS0wn5Ey6jX hygCKyxqSM5cH5ZY1jVZ0QXCFcDgDhdW11+G/W3xIBDvKmB5X5NmPnfU0dquF8GrcXcqzo52Pns 1XzhxGpCtptlc3/odUmnivzQl0BwiZZjbRv+VbbGNUDoSU2DrxUFXfDGNuAT1ERV6f6OqKZU3ag YdBZb8BcOvgbJjYtSnAYpd5mg6gHsYXJYyXQnHcgO7HKHHN6oJDSM5U8hXtNd48K/3PigNDntnp A63ggNGiqCciZt8pgpxl5ySdH7V+iOlb1XudSeiZJHwSa0VZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While touching that comment also add an article and a full stop at the end
of the sentence

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/clk.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 1ef013324237..21fe9504091e 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -589,8 +589,8 @@ struct clk *devm_get_clk_from_child(struct device *dev,
  * @clk: clock source
  *
  * This function allows drivers to get exclusive control over the rate of a
- * provider. It prevents any other consumer to execute, even indirectly,
- * opereation which could alter the rate of the provider or cause glitches
+ * provider. It prevents any other consumer to execute, even indirectly, an
+ * operation which could alter the rate of the provider or cause glitches.
  *
  * If exlusivity is claimed more than once on clock, even by the same driver,
  * the rate effectively gets locked as exclusivity can't be preempted.
-- 
2.39.1


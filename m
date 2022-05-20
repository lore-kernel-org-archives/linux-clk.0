Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CBCC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 07:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346716AbiETH6E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 03:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346725AbiETH6B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 03:58:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C987E15AB2D
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:57:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-0006bF-QE; Fri, 20 May 2022 09:57:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-003ROn-Cb; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWF-00AveR-CO; Fri, 20 May 2022 09:57:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH v9 1/4] clk: Improve documentation for devm_clk_get() and its optional variant
Date:   Fri, 20 May 2022 09:57:34 +0200
Message-Id: <20220520075737.758761-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561; h=from:subject; bh=QHZJYKxL315JBFkIR1WQM7x+Ej2LfDYrbdaQuOMSUp0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nc2XeHoOAHjTWMJt1apAGk9LNQAxatE2fYNtHF bwLW06iJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ3AAKCRDB/BR4rcrsCVtpB/ 9temtsU7fTAblMLKuj+WrtSgS5N4K7E8zVuLdITj34q7LpTCNu1AUkXx56IO4EPpiOM0ANExJ72yI+ EGT01BcnVC+ZS/3TXHmqjcX4VHmyq7Lcech0YBsemCAxArqvjraNlqkcjrDWr/So6TrZY4F7Frwf8M kelZNsq4vxoLjG6eY4SpPebr25+CXEuZ3igtgZZzOrwTejG4KS6HuJTHUo6rIEuSSyJq/1mIKa9rwb VHlcEKIUgl/iy0lKyEqyhuXxRUZ55Uf1iVv5hFK7AUhYJMEwOxS0SAe6nO167WXWRVz724u8M4rIzs fWI7RFtY+sih+oOk+ep9y7loyn588F
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make use of "Context:" and "Return:". Mention that the clk is not to be
expected to be prepared, previously only not being enabled was mentioned
which probably dates from the times when the concept of clk preparation
wasn't invented yet.

Also describe devm_clk_get_optional() fully instead of just referencing
devm_clk_get().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/clk.h | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 39faa54efe88..c8fc398d2ad7 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -443,15 +443,16 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
  * @dev: device for clock "consumer"
  * @id: clock consumer ID
  *
- * Returns a struct clk corresponding to the clock producer, or
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
  * valid IS_ERR() condition containing errno.  The implementation
  * uses @dev and @id to determine the clock consumer, and thereby
  * the clock producer.  (IOW, @id may be identical strings, but
  * clk_get may return different clock producers depending on @dev.)
  *
- * Drivers must assume that the clock source is not enabled.
- *
- * devm_clk_get should not be called from within interrupt context.
+ * Drivers must assume that the clock source is neither prepared nor
+ * enabled.
  *
  * The clock will automatically be freed when the device is unbound
  * from the bus.
@@ -464,8 +465,20 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
  * @dev: device for clock "consumer"
  * @id: clock consumer ID
  *
- * Behaves the same as devm_clk_get() except where there is no clock producer.
- * In this case, instead of returning -ENOENT, the function returns NULL.
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  If no such clk is found, it returns NULL
+ * which serves as a dummy clk.  That's the only difference compared
+ * to devm_clk_get().
+ *
+ * Drivers must assume that the clock source is neither prepared nor
+ * enabled.
+ *
+ * The clock will automatically be freed when the device is unbound
+ * from the bus.
  */
 struct clk *devm_clk_get_optional(struct device *dev, const char *id);
 
-- 
2.35.1


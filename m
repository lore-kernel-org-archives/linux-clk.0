Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF58C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 07:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346733AbiETH6C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 03:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346723AbiETH6B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 03:58:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B147414D79D
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:57:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-0006bI-QQ; Fri, 20 May 2022 09:57:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-003ROx-Ta; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWF-00AveX-NZ; Fri, 20 May 2022 09:57:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v9 3/4] clk: Provide new devm_clk helpers for prepared and enabled clocks
Date:   Fri, 20 May 2022 09:57:36 +0200
Message-Id: <20220520075737.758761-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6882; h=from:subject; bh=ogDbBx7E4GUtuSR49sDDJBXMs/fAJ/3v59DK89N9qtk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nlPXXK6BwapAtuHU66y+lIjs5Y1IwMXxIJkF9f 7AzZWWmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ5QAKCRDB/BR4rcrsCX7lB/ 0eZuuq82HakTLcYNPQRJLCt4q14HlJ/DiScaczSAlkw3kzZZkwJur4N4wzEIfMbZih5Z3wb7fsedeH cwOqSqHWL2tLrZTYu6yL0oUiI0nZwApmnIhTLsHGmEkW8FoLZltOU/5aK+4fhXIT1iVmvNzav5M/XY Mb3geAKKWJ437xXpYqd3RN2vc+pMNr0wTF76D1A7V3yisaw/ejVQvtYBjQCrtaZyE+yS7Upex6ryej ghTRVTR1LZdq+mznZN7vTkoFDudA+fZhXvW8Onxo/1sItu+OyQhuhn9ARyJaooQ/QBLFEXgyPJBWg+ p8ExIuQS34xcgEvW5aDNfgkuww5tJ6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When a driver keeps a clock prepared (or enabled) during the whole
lifetime of the driver, these helpers allow to simplify the drivers.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk-devres.c |  27 ++++++++++
 include/linux/clk.h      | 109 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index c822f4ef1584..43ccd20e0298 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -66,12 +66,39 @@ struct clk *devm_clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(devm_clk_get);
 
+struct clk *devm_clk_get_prepared(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get, clk_prepare, clk_unprepare);
+}
+EXPORT_SYMBOL_GPL(devm_clk_get_prepared);
+
+struct clk *devm_clk_get_enabled(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get,
+			      clk_prepare_enable, clk_disable_unprepare);
+}
+EXPORT_SYMBOL_GPL(devm_clk_get_enabled);
+
 struct clk *devm_clk_get_optional(struct device *dev, const char *id)
 {
 	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
 }
 EXPORT_SYMBOL(devm_clk_get_optional);
 
+struct clk *devm_clk_get_optional_prepared(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get_optional,
+			      clk_prepare, clk_unprepare);
+}
+EXPORT_SYMBOL_GPL(devm_clk_get_optional_prepared);
+
+struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get_optional,
+			      clk_prepare_enable, clk_disable_unprepare);
+}
+EXPORT_SYMBOL_GPL(devm_clk_get_optional_enabled);
+
 struct clk_bulk_devres {
 	struct clk_bulk_data *clks;
 	int num_clks;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index c8fc398d2ad7..c13061cabdfc 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -459,6 +459,47 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
  */
 struct clk *devm_clk_get(struct device *dev, const char *id);
 
+/**
+ * devm_clk_get_prepared - devm_clk_get() + clk_prepare()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  (IOW, @id may be identical strings, but
+ * clk_get may return different clock producers depending on @dev.)
+ *
+ * The returned clk (if valid) is prepared. Drivers must however assume
+ * that the clock is not enabled.
+ *
+ * The clock will automatically be unprepared and freed when the device
+ * is unbound from the bus.
+ */
+struct clk *devm_clk_get_prepared(struct device *dev, const char *id);
+
+/**
+ * devm_clk_get_enabled - devm_clk_get() + clk_prepare_enable()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  (IOW, @id may be identical strings, but
+ * clk_get may return different clock producers depending on @dev.)
+ *
+ * The returned clk (if valid) is prepared and enabled.
+ *
+ * The clock will automatically be disabled, unprepared and freed
+ * when the device is unbound from the bus.
+ */
+struct clk *devm_clk_get_enabled(struct device *dev, const char *id);
+
 /**
  * devm_clk_get_optional - lookup and obtain a managed reference to an optional
  *			   clock producer.
@@ -482,6 +523,50 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
  */
 struct clk *devm_clk_get_optional(struct device *dev, const char *id);
 
+/**
+ * devm_clk_get_optional_prepared - devm_clk_get_optional() + clk_prepare()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  If no such clk is found, it returns NULL
+ * which serves as a dummy clk.  That's the only difference compared
+ * to devm_clk_get_prepared().
+ *
+ * The returned clk (if valid) is prepared. Drivers must however
+ * assume that the clock is not enabled.
+ *
+ * The clock will automatically be unprepared and freed when the
+ * device is unbound from the bus.
+ */
+struct clk *devm_clk_get_optional_prepared(struct device *dev, const char *id);
+
+/**
+ * devm_clk_get_optional_enabled - devm_clk_get_optional() +
+ *                                 clk_prepare_enable()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  If no such clk is found, it returns NULL
+ * which serves as a dummy clk.  That's the only difference compared
+ * to devm_clk_get_enabled().
+ *
+ * The returned clk (if valid) is prepared and enabled.
+ *
+ * The clock will automatically be disabled, unprepared and freed
+ * when the device is unbound from the bus.
+ */
+struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id);
+
 /**
  * devm_get_clk_from_child - lookup and obtain a managed reference to a
  *			     clock producer from child node.
@@ -826,12 +911,36 @@ static inline struct clk *devm_clk_get(struct device *dev, const char *id)
 	return NULL;
 }
 
+static inline struct clk *devm_clk_get_prepared(struct device *dev,
+						const char *id)
+{
+	return NULL;
+}
+
+static inline struct clk *devm_clk_get_enabled(struct device *dev,
+					       const char *id)
+{
+	return NULL;
+}
+
 static inline struct clk *devm_clk_get_optional(struct device *dev,
 						const char *id)
 {
 	return NULL;
 }
 
+static inline struct clk *devm_clk_get_optional_prepared(struct device *dev,
+							 const char *id)
+{
+	return NULL;
+}
+
+static inline struct clk *devm_clk_get_optional_enabled(struct device *dev,
+							const char *id)
+{
+	return NULL;
+}
+
 static inline int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
 						 struct clk_bulk_data *clks)
 {
-- 
2.35.1


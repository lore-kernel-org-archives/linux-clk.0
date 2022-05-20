Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC1FC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 07:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346729AbiETH6F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 03:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346728AbiETH6B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 03:58:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA92715AB30
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 00:57:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-0006bG-QP; Fri, 20 May 2022 09:57:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWH-003ROr-JP; Fri, 20 May 2022 09:57:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nrxWF-00AveU-HE; Fri, 20 May 2022 09:57:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v9 2/4] clk: generalize devm_clk_get() a bit
Date:   Fri, 20 May 2022 09:57:35 +0200
Message-Id: <20220520075737.758761-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682; h=from:subject; bh=OQYYOEDGCon66NFfSuwdckxn75oeg0JHAX9AQ4BmOtM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih0nh3Md9V5Qg80I8Z8yyycXwcJGIG1154tI9mVH/ E/elzKyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYodJ4QAKCRDB/BR4rcrsCTv9B/ 9g2koWACRk+VMd0mJP9XiQH7RmyFhDMBPYqul2hvrSnbpeIx/PhfAzOapIpJAc4HoqqCuTE83L/gkL 1Xv9X6vYQPS2PY1miCfEy9rKqvEdaCiP37DfRVo44v4Xf8pGaAhWdNxoZ/ppZBh9kYGLPU+KS5Ti5b iN29UCTtG1jQ9tMNyhg7l8Mcp9KaxKqbVnivjcLYUUoewwhv+shZmb6WIOvC1z3vf/OmbvGYLhIJx/ kX2nRjrzHpk/vjRfi/+cFWRjwKRNMUx9uMMk/Ac3/klIqEbNB4Ewqrn4NLMJZt3Z1HRnMieQQbqQHn +DFSrfuCYVf4ijvjBWrSzPre7msKHx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow to add an exit hook to devm managed clocks. Also use
clk_get_optional() in devm_clk_get_optional instead of open coding it.
The generalisation will be used in the next commit to add some more
devm_clk helpers.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk-devres.c | 66 +++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index f9d5b7334341..c822f4ef1584 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -4,39 +4,71 @@
 #include <linux/export.h>
 #include <linux/gfp.h>
 
+struct devm_clk_state {
+	struct clk *clk;
+	void (*exit)(struct clk *clk);
+};
+
 static void devm_clk_release(struct device *dev, void *res)
 {
-	clk_put(*(struct clk **)res);
+	struct devm_clk_state *state = *(struct devm_clk_state **)res;
+
+	if (state->exit)
+		state->exit(state->clk);
+
+	clk_put(state->clk);
 }
 
-struct clk *devm_clk_get(struct device *dev, const char *id)
+static struct clk *__devm_clk_get(struct device *dev, const char *id,
+				  struct clk *(*get)(struct device *dev, const char *id),
+				  int (*init)(struct clk *clk),
+				  void (*exit)(struct clk *clk))
 {
-	struct clk **ptr, *clk;
+	struct devm_clk_state *state;
+	struct clk *clk;
+	int ret;
 
-	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
+	state = devres_alloc(devm_clk_release, sizeof(*state), GFP_KERNEL);
+	if (!state)
 		return ERR_PTR(-ENOMEM);
 
-	clk = clk_get(dev, id);
-	if (!IS_ERR(clk)) {
-		*ptr = clk;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
+	clk = get(dev, id);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		goto err_clk_get;
 	}
 
+	if (init) {
+		ret = init(clk);
+		if (ret)
+			goto err_clk_init;
+	}
+
+	state->clk = clk;
+	state->exit = exit;
+
+	devres_add(dev, state);
+
 	return clk;
+
+err_clk_init:
+
+	clk_put(clk);
+err_clk_get:
+
+	devres_free(state);
+	return ERR_PTR(ret);
+}
+
+struct clk *devm_clk_get(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get, NULL, NULL);
 }
 EXPORT_SYMBOL(devm_clk_get);
 
 struct clk *devm_clk_get_optional(struct device *dev, const char *id)
 {
-	struct clk *clk = devm_clk_get(dev, id);
-
-	if (clk == ERR_PTR(-ENOENT))
-		return NULL;
-
-	return clk;
+	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
 }
 EXPORT_SYMBOL(devm_clk_get_optional);
 
-- 
2.35.1


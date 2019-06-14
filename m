Return-Path: <SRS0=ubJx=UN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D186C31E44
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 04:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5674F208CA
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jun 2019 04:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbfFNEH1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jun 2019 00:07:27 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:50701 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfFNEH1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jun 2019 00:07:27 -0400
X-Greylist: delayed 877 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 00:07:26 EDT
Received: (qmail 365 invoked by uid 5089); 14 Jun 2019 03:52:47 -0000
Received: by simscan 1.2.0 ppid: 337, pid: 338, t: 0.0345s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 14 Jun 2019 03:52:47 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id F34A0201497BF; Fri, 14 Jun 2019 11:52:45 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     mturquette@baylibre.com, sboyd@kernel.org, preid@electromag.com.au,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/1] clk: clk-cdce925: Add regulator support
Date:   Fri, 14 Jun 2019 11:52:43 +0800
Message-Id: <1560484363-77239-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cdce925 power supplies could be controllable on some platforms.
Enable them before communicating with the cdce925.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---

Notes:
    We see a kernel panic later in the boot if the regulator is not
    enabled. Unsure what in the driver is causing that. Something
    to do with regmap perhaps?

 drivers/clk/clk-cdce925.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index a98b3f19..2678ee6 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/gcd.h>
 
@@ -602,6 +603,30 @@ static int cdce925_regmap_i2c_read(void *context,
 	return &data->clk[idx].hw;
 }
 
+static void cdce925_regulator_disable(void *regulator)
+{
+	regulator_disable(regulator);
+}
+
+static int cdce925_regulator_enable(struct device *dev, const char *name)
+{
+	struct regulator *regulator;
+	int err;
+
+	regulator = devm_regulator_get(dev, name);
+	if (IS_ERR(regulator))
+		return PTR_ERR(regulator);
+
+	err = regulator_enable(regulator);
+	if (err) {
+		dev_err(dev, "Failed to enable %s: %d\n", name, err);
+		return err;
+	}
+
+	return devm_add_action_or_reset(dev, cdce925_regulator_disable,
+					regulator);
+}
+
 /* The CDCE925 uses a funky way to read/write registers. Bulk mode is
  * just weird, so just use the single byte mode exclusively. */
 static struct regmap_bus regmap_cdce925_bus = {
@@ -630,6 +655,15 @@ static int cdce925_probe(struct i2c_client *client,
 	};
 
 	dev_dbg(&client->dev, "%s\n", __func__);
+
+	err = cdce925_regulator_enable(&client->dev, "vdd");
+	if (err)
+		return err;
+
+	err = cdce925_regulator_enable(&client->dev, "vddout");
+	if (err)
+		return err;
+
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-- 
1.8.3.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6997DC3F6B0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Aug 2022 12:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236708AbiHYMqL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Aug 2022 08:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbiHYMqK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Aug 2022 08:46:10 -0400
X-Greylist: delayed 387 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 Aug 2022 05:46:06 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00F694D17B;
        Thu, 25 Aug 2022 05:46:06 -0700 (PDT)
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
        by mail.bugwerft.de (Postfix) with ESMTPSA id A9A02421360;
        Thu, 25 Aug 2022 12:39:37 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 2/2] clk: cs2000-cp: make PLL lock timeout configurable
Date:   Thu, 25 Aug 2022 14:39:24 +0200
Message-Id: <20220825123924.2284276-2-daniel@zonque.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825123924.2284276-1-daniel@zonque.org>
References: <20220825123924.2284276-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver currently does 256 iterations of reads from the DEVICE_CTRL
register to wait for the PLL_LOCK to clear, and sleeps one microsecond
after each attempts.

This isn't ideal because

 a) the total time this allows for the device to settle depends on the I2C
    bus speed, and
 b) the device might need more time, depending on the application.

This patch allows users to configure this timeout through a new device-tree
property "cirrus,pll-lock-timeout-msec".

In order to not break existing applications, a default value of 50 ms is
assumed: For each read cycle, 8 bits are sent for the register address, and
8 bits are read with the values. 16 bits take about 160 us on a 100 kHz bus
and 40 us on a 400 kHz bus. Hence 256 iterations would take a maximum of
around 44 ms. Round up to be on the safe side.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index aa5c72bab83e..6ba36b470a74 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -110,6 +110,8 @@ struct cs2000_priv {
 	bool lf_ratio;
 	bool clk_skip;
 
+	unsigned int pll_lock_timeout_ms;
+
 	/* suspend/resume */
 	unsigned long saved_rate;
 	unsigned long saved_parent_rate;
@@ -171,21 +173,16 @@ static int cs2000_ref_clk_bound_rate(struct cs2000_priv *priv,
 static int cs2000_wait_pll_lock(struct cs2000_priv *priv)
 {
 	struct device *dev = priv_to_dev(priv);
-	unsigned int i, val;
+	unsigned int val;
 	int ret;
 
-	for (i = 0; i < 256; i++) {
-		ret = regmap_read(priv->regmap, DEVICE_CTRL, &val);
-		if (ret < 0)
-			return ret;
-		if (!(val & PLL_UNLOCK))
-			return 0;
-		udelay(1);
-	}
-
-	dev_err(dev, "pll lock failed\n");
+	ret = regmap_read_poll_timeout(priv->regmap, DEVICE_CTRL, val,
+				       !(val & PLL_UNLOCK), USEC_PER_MSEC,
+				       priv->pll_lock_timeout_ms * USEC_PER_MSEC);
+	if (ret < 0)
+		dev_err(dev, "pll lock failed\n");
 
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static int cs2000_clk_out_enable(struct cs2000_priv *priv, bool enable)
@@ -481,6 +478,10 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	priv->pll_lock_timeout_ms = 50;
+	of_property_read_u32(np, "cirrus,pll-lock-timeout-msec",
+			     &priv->pll_lock_timeout_ms);
+
 	priv->clk_skip = of_property_read_bool(np, "cirrus,clock-skip");
 
 	ref_clk_rate = clk_get_rate(priv->ref_clk);
-- 
2.37.2


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C4AC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 19:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiI2Tzd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 15:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiI2Tzc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 15:55:32 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5A710C78C
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 12:55:31 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8B79E84C81;
        Thu, 29 Sep 2022 21:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664481329;
        bh=Jbxtjl+BDgabVTiJePxER3bBrbC5VfzT1Gafv7NaaDs=;
        h=From:To:Cc:Subject:Date:From;
        b=C9aNLPCtXeMigtsvm4fnc7I+MZDMfj9cDNWpP5NdL3c6VHcmuNFxZfuML0zme4qqX
         D5pogJKDNrH12UrGkU7WWj63RFQmvuQbBvkWCC/tks8Zga5wUY/49E8Yq48dX4i47E
         hhTPEjOCGw682Hdbrfp74YE5Q0XmtgkjMctv5X5Rjao3bHACsvTbolYeYoMO0GEPb2
         Pj+8hZiQmrJzw3eGEOvqNBeVLUqTWrHRTHvQUmKnI179XpVVTE+7RGnkPknAIQujye
         1nH+Tg7xuskDrY50NK8Eto5h673enD8kD6nlAU7oSuGaU3AcnY6BL/mJ9IjDzrMcmV
         +nLNTR6NqlgGA==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4] clk: rs9: Fix I2C accessors
Date:   Thu, 29 Sep 2022 21:55:21 +0200
Message-Id: <20220929195521.284497-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add custom I2C accessors to this driver, since the regular I2C regmap ones
do not generate the exact I2C transfers required by the chip. On I2C write,
it is mandatory to send transfer length first, on read the chip returns the
transfer length in first byte. Instead of always reading back 8 bytes, which
is the default and also the size of the entire register file, set BCP register
to 1 to read out 1 byte which is less wasteful.

Fixes: 892e0ddea1aa ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
V2: Fix endianness handling in rs9_regmap_i2c_read() i2c_transfer
V3: - Disable regcache, the driver does a couple of I2C writes on boot
      and that is all, so it only adds complexity
    - Set regmap max_register to RS9_REG_BCP which is the correct one
V4: - Do not use I2C_M_RECV_LEN due to overhead, it requires buffer 4
      times the size of this devices' register file, just read two bytes
      via I2C
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-renesas-pcie.c | 65 ++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 4f5df1fc74b46..e6247141d0c05 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -90,13 +90,66 @@ static const struct regmap_access_table rs9_writeable_table = {
 	.n_yes_ranges = ARRAY_SIZE(rs9_writeable_ranges),
 };
 
+static int rs9_regmap_i2c_write(void *context,
+				unsigned int reg, unsigned int val)
+{
+	struct i2c_client *i2c = context;
+	const u8 data[3] = { reg, 1, val };
+	const int count = ARRAY_SIZE(data);
+	int ret;
+
+	ret = i2c_master_send(i2c, data, count);
+	if (ret == count)
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static int rs9_regmap_i2c_read(void *context,
+			       unsigned int reg, unsigned int *val)
+{
+	struct i2c_client *i2c = context;
+	struct i2c_msg xfer[2];
+	u8 txdata = reg;
+	u8 rxdata[2];
+	int ret;
+
+	xfer[0].addr = i2c->addr;
+	xfer[0].flags = 0;
+	xfer[0].len = 1;
+	xfer[0].buf = (void *)&txdata;
+
+	xfer[1].addr = i2c->addr;
+	xfer[1].flags = I2C_M_RD;
+	xfer[1].len = 2;
+	xfer[1].buf = (void *)rxdata;
+
+	ret = i2c_transfer(i2c->adapter, xfer, 2);
+	if (ret < 0)
+		return ret;
+	if (ret != 2)
+		return -EIO;
+
+	/*
+	 * Byte 0 is transfer length, which is always 1 due
+	 * to BCP register programming to 1 in rs9_probe(),
+	 * ignore it and use data from Byte 1.
+	 */
+	*val = rxdata[1];
+	return 0;
+}
+
 static const struct regmap_config rs9_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.cache_type = REGCACHE_FLAT,
-	.max_register = 0x8,
+	.cache_type = REGCACHE_NONE,
+	.max_register = RS9_REG_BCP,
 	.rd_table = &rs9_readable_table,
 	.wr_table = &rs9_writeable_table,
+	.reg_write = rs9_regmap_i2c_write,
+	.reg_read = rs9_regmap_i2c_read,
 };
 
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
@@ -242,11 +295,17 @@ static int rs9_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
+	rs9->regmap = devm_regmap_init(&client->dev, NULL,
+				       client, &rs9_regmap_config);
 	if (IS_ERR(rs9->regmap))
 		return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
 				     "Failed to allocate register map\n");
 
+	/* Always read back 1 Byte via I2C */
+	ret = regmap_write(rs9->regmap, RS9_REG_BCP, 1);
+	if (ret < 0)
+		return ret;
+
 	/* Register clock */
 	for (i = 0; i < rs9->chip_info->num_clks; i++) {
 		snprintf(name, 5, "DIF%d", i);
-- 
2.35.1


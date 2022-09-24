Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF632C07E9D
	for <linux-clk@archiver.kernel.org>; Sat, 24 Sep 2022 16:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbiIXQtw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Sep 2022 12:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233782AbiIXQtv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Sep 2022 12:49:51 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9F81EAD8
        for <linux-clk@vger.kernel.org>; Sat, 24 Sep 2022 09:49:50 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AC828845C3;
        Sat, 24 Sep 2022 18:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664038188;
        bh=PvlKRIgH8rkUTAxRj1+/sUcpy3xzLstXWOrIuTWCmIY=;
        h=From:To:Cc:Subject:Date:From;
        b=pWXbKQ1Ji7iUn6AZf9nM0yNoSSUfkowBwOvBDTMADXkSPpRSoBkAn3zoJR9jgP44r
         drbpa+OPFVXPYU8ohGg9t7v3WaNwuPsSB3LOjSTYXHTSjAPlGzqD//mlT/RQYHRe/e
         u14PhIKpime1vYnK5kZU/V7aj0rmZXWxGpKi3vJyKxyCLA2DdpVIPIBNIehegT3Fv9
         7fUrgenwdUWMNN2znbSfxlhS5oxYSYbXXQXZVGbSIeR8NkkkZsMuOwWYk64jJqWFu5
         2i2/X/uwBoMS1/Yo9q7vbbd8BZ1q2L2Q4RpYCN6fIu4ymLbgb/B/GnHcVtMhbIEOef
         9B94Ls67TQHaQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2] clk: rs9: Fix I2C accessors
Date:   Sat, 24 Sep 2022 18:49:33 +0200
Message-Id: <20220924164933.393649-1-marex@denx.de>
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

Fixes: 892e0ddea1aa6 ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
V2: Fix endianness handling in rs9_regmap_i2c_read() i2c_transfer
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk-renesas-pcie.c | 56 +++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 4f5df1fc74b46..c320ce25c11b6 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -90,6 +90,52 @@ static const struct regmap_access_table rs9_writeable_table = {
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
+	xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
+	xfer[1].len = 1;
+	xfer[1].buf = (void *)rxdata;
+
+	ret = i2c_transfer(i2c->adapter, xfer, 2);
+	if (ret < 0)
+		return ret;
+	if (ret != 2)
+		return -EIO;
+
+	*val = rxdata[1];
+	return 0;
+}
+
 static const struct regmap_config rs9_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -97,6 +143,8 @@ static const struct regmap_config rs9_regmap_config = {
 	.max_register = 0x8,
 	.rd_table = &rs9_readable_table,
 	.wr_table = &rs9_writeable_table,
+	.reg_write = rs9_regmap_i2c_write,
+	.reg_read = rs9_regmap_i2c_read,
 };
 
 static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
@@ -242,11 +290,17 @@ static int rs9_probe(struct i2c_client *client)
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


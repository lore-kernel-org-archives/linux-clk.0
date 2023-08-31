Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F82C83F39
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 18:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjHaSRR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 14:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242148AbjHaSRQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 14:17:16 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E1CE63
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 11:17:13 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E1AD2865A5;
        Thu, 31 Aug 2023 20:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693505832;
        bh=engeLbYancj3YYp33i8Voi3lxlyAVqVjm4hCrapue8E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GFqmei1cDXkLcNuQwL3dtHerZM0xex1MHOP2GYwu5GWJxePoxRx8Zi+fpcqFPpvqN
         tbp0c/om7W8NhWwVgR58Gd7e6vs6jKxjqrBIU6wx7ciIWjyUunUppo0x5Crzg9Lm7/
         9KcEtxOurQGAH7rYZJLHBI7hzpiYi2B8SZvOda71ccj3ZHoDVj1BUwhX89rticwVbL
         Xl/U+sIQ27Q/8FkO9zJtupFUlgr4/sBcF9MDZtWOfWis5fEchV/8z1SmMwwubz3fJM
         1zPb21ARj/zxkwPVB/QeWAn10ab3C0UihHHmJdtgYgacwxT0jFc16BDg8PG8H3riKI
         ahie/n1GjN1fQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/2] clk: si521xx: Fix regmap write accessor
Date:   Thu, 31 Aug 2023 20:16:56 +0200
Message-Id: <20230831181656.154750-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230831181656.154750-1-marex@denx.de>
References: <20230831181656.154750-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework the write operation such that the Byte Count register is written with
a single raw i2c write outside of regmap using transfer which does specify
the number of bytes to be transfered, one in this case, and which makes the
expected subsequent write transfer look like address+register+data, and then
make use of this method. Without this change, the Byte Count register write
in probe() would succeed as it would provide the byte count as part of its
write payload, but any subsequent writes would fail due to this Byte Count
register programming. Such failing writes happens e.g. during resume, when
restoring the regmap content.

Fixes: edc12763a3a2 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-si521xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index 0b9e2edbbe67c..ef4ba467e747b 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -96,7 +96,7 @@ static int si521xx_regmap_i2c_write(void *context, unsigned int reg,
 				    unsigned int val)
 {
 	struct i2c_client *i2c = context;
-	const u8 data[3] = { reg, 1, val };
+	const u8 data[2] = { reg, val };
 	const int count = ARRAY_SIZE(data);
 	int ret;
 
@@ -281,9 +281,10 @@ static int si521xx_probe(struct i2c_client *client)
 {
 	const u16 chip_info = (u16)(uintptr_t)device_get_match_data(&client->dev);
 	const struct clk_parent_data clk_parent_data = { .index = 0 };
-	struct si521xx *si;
+	const u8 data[3] = { SI521XX_REG_BC, 1, 1 };
 	unsigned char name[6] = "DIFF0";
 	struct clk_init_data init = {};
+	struct si521xx *si;
 	int i, ret;
 
 	if (!chip_info)
@@ -308,7 +309,7 @@ static int si521xx_probe(struct i2c_client *client)
 				     "Failed to allocate register map\n");
 
 	/* Always read back 1 Byte via I2C */
-	ret = regmap_write(si->regmap, SI521XX_REG_BC, 1);
+	ret = i2c_master_send(client, data, ARRAY_SIZE(data));
 	if (ret < 0)
 		return ret;
 
-- 
2.40.1


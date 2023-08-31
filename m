Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA339C83F38
	for <linux-clk@archiver.kernel.org>; Thu, 31 Aug 2023 18:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242688AbjHaSRR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Aug 2023 14:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjHaSRQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Aug 2023 14:17:16 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA5EE61
        for <linux-clk@vger.kernel.org>; Thu, 31 Aug 2023 11:17:13 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 93694865A2;
        Thu, 31 Aug 2023 20:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693505831;
        bh=mXbehQGECEv5pU1dSGv2icd3/krk8omGByZk4Cw6YGA=;
        h=From:To:Cc:Subject:Date:From;
        b=zOIMvjUMx/D8oTwiX6lVkg/SgTMgE3lPmIA8wcOF2WfHzo6AZNRDm2lFXaFU7G/8/
         wmh8XY4r5rdMr+/PMFkDZy4OPxrY+XU/BN1uv+++48dpm6exXzXpX/nLWn5r0RJ7+0
         1rBtgkEFkJlyNQMUN7VDLBuIGCceH2YATXa8moiHgM3Z/u1wBF50jZKeqFM2StIhvw
         TI4Rucbskcy60cwIcQsso8CR0pHsu1uE3mvhGtccrdIhi9IdsCW4RP04pOyHM5uTql
         +9QTP6Ay/ypBELDMPtLSc/qmyyg7oUGA8Fz5AtyXrN3iQE8DE151avcZwd4adAbeP+
         Ue6JaUFjAHDlQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] clk: si521xx: Use REGCACHE_FLAT instead of NONE
Date:   Thu, 31 Aug 2023 20:16:55 +0200
Message-Id: <20230831181656.154750-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to reload registers into the clock generator on resume using
regcache_sync(), it is necessary to select one of the regcache types
which are not NONE. Since this device has some 7 registers, use the
simplest one, FLAT. The regcache code complains about REGCACHE_NONE
being selected and generates a WARNING, this fixes that warning.

Fixes: edc12763a3a2 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-si521xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index 4eaf1b53f06bd..0b9e2edbbe67c 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -146,7 +146,7 @@ static int si521xx_regmap_i2c_read(void *context, unsigned int reg,
 static const struct regmap_config si521xx_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.cache_type = REGCACHE_NONE,
+	.cache_type = REGCACHE_FLAT,
 	.max_register = SI521XX_REG_DA,
 	.rd_table = &si521xx_readable_table,
 	.wr_table = &si521xx_writeable_table,
-- 
2.40.1


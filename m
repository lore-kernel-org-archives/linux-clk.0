Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1142C6FA99
	for <linux-clk@archiver.kernel.org>; Fri, 10 Mar 2023 07:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCJHuF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Mar 2023 02:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjCJHts (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Mar 2023 02:49:48 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C07F13539
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 23:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434587; x=1709970587;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9EgvBIaAI2oCfJ+DzadicnJdaG1gei3k/C+WQD0AIcU=;
  b=f5nlfhbR6Ceh+tE0KpE7v3ZdLkwuZ5jQGz1KSpzpgn8vWiTcbt+cM4Kx
   BRn8vvpYSKvMBlyeiQbIytXgI0SQVSyapS9lZ3D6nAh1zP4sxrE9ZFEXn
   fT+7gbgqTHyWDa+yNuvHGXKUXdEeZrAWhwljpEIEcJqQ8yA79b+ZNhgAE
   roW3xz9gMzDKUxstMk8z+YEsYdT3gk23pSpdHIiJqnZc4ova5dIJvjGhs
   ZnZxUx9nUjQgMiWVajxbU5X8D3R0n7OXqnmFX+FtVvqNMsuHmb7ulPqYg
   d9A7JOYu8gwlztk7Lwc3goa/TqhoXlefDw/Cjtb9Rvf0EJZxRy8HD2q85
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29596922"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Mar 2023 08:49:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 10 Mar 2023 08:49:45 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 10 Mar 2023 08:49:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434585; x=1709970585;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9EgvBIaAI2oCfJ+DzadicnJdaG1gei3k/C+WQD0AIcU=;
  b=SJudJ/hNLW8mgj7t+c70SYeeLv7+oQrBnB1r2ceRsrWOoJmryaPtgpJL
   imAyBDZS9lFm0tsZgLP1fy7T4I+Rdg2t52EvAFdyF9NwrMeyJO3TUMUVI
   a0KH5CUxm5fEkvckB+vNu800zZum3iT9u1Z4DWaWSGXktkFw+o7xfvlLb
   4BdWji7Xfg1+JaZ/EjL41x2811nrPCat9CRR4AsB2hcUzGqttEiaGr2cr
   F5ejptzFv8yIUhOmDLZsalViMsi9px+g+EYtS0K+QOAO8N1/MTCNT7fzl
   LPZH4XCkx7+AUvPtAGpUT8yN9zpqPBMfFIqUYMczgAhImKyetFlCommDL
   g==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29596921"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Mar 2023 08:49:45 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 73B1C280056;
        Fri, 10 Mar 2023 08:49:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/1] clk: rs9: Fix suspend/resume
Date:   Fri, 10 Mar 2023 08:49:40 +0100
Message-Id: <20230310074940.3475703-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Disabling the cache in commit 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
without removing cache synchronization in resume path results in a
kernel panic as map->cache_ops is unset, due to REGCACHE_NONE.
Enable flat cache again to support resume again. num_reg_defaults_raw
is necessary to read the cache defaults from hardware. Some registers
are strapped in hardware and cannot be provided in software.

Fixes: 2ff4ba9e3702 ("clk: rs9: Fix I2C accessors")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
There is also a series to not panic when using regcache_sync on
REGCACHE_NONE maps at [1].

[1] https://lore.kernel.org/lkml/20230310073911.3470892-1-alexander.stein@ew.tq-group.com/T/#u

 drivers/clk/clk-renesas-pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 1e8b196e36f3..3377ee55c4f0 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -149,8 +149,9 @@ static int rs9_regmap_i2c_read(void *context,
 static const struct regmap_config rs9_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.cache_type = REGCACHE_NONE,
+	.cache_type = REGCACHE_FLAT,
 	.max_register = RS9_REG_BCP,
+	.num_reg_defaults_raw = 0x8,
 	.rd_table = &rs9_readable_table,
 	.wr_table = &rs9_writeable_table,
 	.reg_write = rs9_regmap_i2c_write,
-- 
2.34.1


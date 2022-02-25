Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0116C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 17:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbiBYRbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 12:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243734AbiBYRbE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 12:31:04 -0500
X-Greylist: delayed 915 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Feb 2022 09:30:26 PST
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 980A260D8B
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MziJy
        eKtUoRsiZinTshO21CHXaFn+Yc0G5M/yw91x/8=; b=GLxXfgx1IDJCtOB+esS9h
        F/kFOYv/+DTm1WV3VqETah0y1+PtN4XeIUdZDcnSI9DKw9swXIGtY3zdC0hQFRcZ
        sPppRPpwSAVp4pC6TjYG314GaDY5UdYvTvFX19aSRZOZIeJrTD5xugOEKpq/Q03D
        iysfPTw/8I4c15ydzjTPn4=
Received: from localhost.localdomain (unknown [14.221.173.100])
        by smtp9 (Coremail) with SMTP id DcCowAAX7xqODhlibbHRAA--.18593S2;
        Sat, 26 Feb 2022 01:14:55 +0800 (CST)
From:   logic_wei@163.com
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, popcornmix@gmail.com,
        dave.stevenson@raspberrypi.com, nsaenz@kernel.org,
        linux-clk@vger.kernel.org, Peng Wei <logic_wei@163.com>
Subject: [PATCH] clk: bcm: rpi: Fix slab-out-of-bounds during raspberrypi_discover_clocks.
Date:   Sat, 26 Feb 2022 01:14:53 +0800
Message-Id: <20220225171453.1241132-1-logic_wei@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAX7xqODhlibbHRAA--.18593S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWDJryrtryDXrWUAF1UKFg_yoW8ZrW3pF
        W8Xa43AF1qgr45KF45Jayq93WS93909Fy5WryIvwsavFW7GF98KFWjkrn5GryrGr1UX3Z8
        Xry5AFWDZFnrAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_LvKAUUUUU=
X-Originating-IP: [14.221.173.100]
X-CM-SenderInfo: 5orjxupbzhxqqrwthudrp/xtbBLQ+yulzialPR1AAAso
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Wei <logic_wei@163.com>

There're two potential bugs here:
1) RPI_FIRMWARE_EMMC_CLK_ID the first element of enum rpi_firmware_clk_id
   is set to be 1.So RPI_FIRMWARE_NUM_CLK_ID will be bigger than the total
   number of the enum rpi_firmware_clk_id.It maybe cause overflow bug when
   accessing the array of clks.Besides it will cost more memory when alloc
   memory for clks.
2) When iterating the clks,there's no way to break the loop until any error
   is returned.
So change the RPI_FIRMWARE_EMMC_CLK_ID from 1 to 0.And then tell the loop
the way to break.

The KASAN warning:

BUG: KASAN: slab-out-of-bounds in raspberrypi_clk_probe+0x1d8/0x2f8

Read of size 4 at addr ffffff8040bd8704 by task swapper/0/1

Call trace:
 ...
 __asan_load4+0x94/0xd0
 raspberrypi_clk_probe+0x1d8/0x2f8
 platform_probe+0x94/0x110
 ...

Signed-off-by: Peng Wei <logic_wei@163.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 99cc4c856de1..726b3f45c137 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -19,7 +19,7 @@
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
 enum rpi_firmware_clk_id {
-	RPI_FIRMWARE_EMMC_CLK_ID = 1,
+	RPI_FIRMWARE_EMMC_CLK_ID = 0,
 	RPI_FIRMWARE_UART_CLK_ID,
 	RPI_FIRMWARE_ARM_CLK_ID,
 	RPI_FIRMWARE_CORE_CLK_ID,
@@ -252,6 +252,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 {
 	struct rpi_firmware_get_clocks_response *clks;
 	int ret;
+	int count = 0;
 
 	clks = devm_kcalloc(rpi->dev,
 			    sizeof(*clks), RPI_FIRMWARE_NUM_CLK_ID,
@@ -265,7 +266,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 	if (ret)
 		return ret;
 
-	while (clks->id) {
+	while (count++ < RPI_FIRMWARE_NUM_CLK_ID && clks->id) {
 		struct clk_hw *hw;
 
 		switch (clks->id) {
-- 
2.25.1


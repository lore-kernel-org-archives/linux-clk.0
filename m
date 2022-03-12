Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F92C433FE
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 15:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiCLPoz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 10:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiCLPoz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 10:44:55 -0500
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 54BAA44774
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 07:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lZWbX
        flR8AcZkbYCaKCSLjseRw1brO/TC22nKV0dYJM=; b=WpLTI2pUKq2jFXGb9Mg97
        bB5pLzaNzVpJ8FsNGQl2/Im9iR22fPA7OG1rUZlomrHV9t9ogHAKh9vkpZ/pm2qv
        XZcpsRKE9Ie0vJoVKQ5XNIbskpgLgeuwGwV5xT6v1kr1omFkKHDFd/3hPEHEto11
        EHKFkXZ4Bsts7DWU4PBSZY=
Received: from localhost.localdomain (unknown [183.53.78.103])
        by smtp11 (Coremail) with SMTP id D8CowABnSTmPvyxiPke3BA--.444S2;
        Sat, 12 Mar 2022 23:43:16 +0800 (CST)
From:   logic_wei@163.com
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     nsaenz@kernel.org, f.fainelli@gmail.com, maxime@cerno.tech,
        linux-clk@vger.kernel.org, Peng Wei <logic_wei@163.com>
Subject: [PATCH v2] clk: bcm: rpi: Fix slab-out-of-bounds during raspberrypi_discover_clocks.
Date:   Sat, 12 Mar 2022 23:42:44 +0800
Message-Id: <20220312154244.557841-1-logic_wei@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowABnSTmPvyxiPke3BA--.444S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr13XFWUGF15WryrKFy5twb_yoW8Zw1UpF
        W8Aa45AFyjqw4vga15JF1Duw1F93yavFWrWr97uw4Sva17GF95KF4UKr97JFyrWr48twn8
        GrW3A398AF1xZFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRfsqQUUUUU=
X-Originating-IP: [183.53.78.103]
X-CM-SenderInfo: 5orjxupbzhxqqrwthudrp/xtbB0BTBumEspbfPiQAAsm
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Wei <logic_wei@163.com>

There's no way to break the loop until any error is returned. It causes
overflow bug when accessing the clks.

The KASAN warning:

BUG: KASAN: slab-out-of-bounds in raspberrypi_clk_probe+0x1d8/0x2f8

Read of size 4 at addr ffffff8040bd8704 by task swapper/0/1

Call trace:
 ...
 __asan_load4+0x94/0xd0
 raspberrypi_clk_probe+0x1d8/0x2f8
 platform_probe+0x94/0x110
 ...

v2:
 - Improve the comments
 - Change to for loop
 - Add fixes tag
 - Remove the modification about enum rpi_firmware_clk_id

Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
Signed-off-by: Peng Wei <logic_wei@163.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index dd3b71eafabf..5f963254d4eb 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -250,6 +250,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 {
 	struct rpi_firmware_get_clocks_response *clks;
 	int ret;
+	int i;
 
 	clks = devm_kcalloc(rpi->dev,
 			    sizeof(*clks), RPI_FIRMWARE_NUM_CLK_ID,
@@ -263,26 +264,25 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 	if (ret)
 		return ret;
 
-	while (clks->id) {
+	for (i = 0; i < RPI_FIRMWARE_NUM_CLK_ID; i++) {
 		struct clk_hw *hw;
 
-		switch (clks->id) {
+		switch (clks[i].id) {
 		case RPI_FIRMWARE_ARM_CLK_ID:
 		case RPI_FIRMWARE_CORE_CLK_ID:
 		case RPI_FIRMWARE_M2MC_CLK_ID:
 		case RPI_FIRMWARE_V3D_CLK_ID:
 		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
-			hw = raspberrypi_clk_register(rpi, clks->parent,
-						      clks->id);
+			hw = raspberrypi_clk_register(rpi, clks[i].parent,
+						      clks[i].id);
 			if (IS_ERR(hw))
 				return PTR_ERR(hw);
 
-			data->hws[clks->id] = hw;
-			data->num = clks->id + 1;
+			data->hws[clks[i].id] = hw;
+			data->num = clks[i].id + 1;
 			fallthrough;
 
 		default:
-			clks++;
 			break;
 		}
 	}
-- 
2.25.1


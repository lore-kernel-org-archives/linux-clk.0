Return-Path: <SRS0=z+8+=6U=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE36C38A2A
	for <linux-clk@archiver.kernel.org>; Wed,  6 May 2020 12:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16597206DD
	for <linux-clk@archiver.kernel.org>; Wed,  6 May 2020 12:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgEFMCN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 May 2020 08:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727067AbgEFMCN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 May 2020 08:02:13 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35556C061A0F
        for <linux-clk@vger.kernel.org>; Wed,  6 May 2020 05:02:13 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by baptiste.telenet-ops.be with bizsmtp
        id bQ252200e3ZRV0X01Q25VZ; Wed, 06 May 2020 14:02:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWIkX-0008QN-HP; Wed, 06 May 2020 14:02:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWIkX-0008BX-Ej; Wed, 06 May 2020 14:02:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        CK Hu <ck.hu@mediatek.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: mediatek: mmsys: Drop <linux/clk-provider.h>
Date:   Wed,  6 May 2020 14:02:04 +0200
Message-Id: <20200506120204.31422-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After the split, the mt8173 MMSYS driver is no longer a clock provider,
and thus does not need to include <linux/clk-provider.h>.

Fixes: 13032709e2328553 ("clk / soc: mediatek: Move mt8173 MMSYS to platform driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/mediatek/mtk-mmsys.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 05e322c9c301ad91..bb5ccd5b0386c041 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,7 +4,6 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-- 
2.17.1


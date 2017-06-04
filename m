Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:50873 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbdFDWDB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Jun 2017 18:03:01 -0400
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] clk: at91: fix clk-generated compilation
Date: Mon,  5 Jun 2017 00:02:57 +0200
Message-Id: <20170604220257.21098-1-alexandre.belloni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix missing }

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---

When taken alone clk: at91: fix clk-generated parenting, didn't compile
properly. This was actually fixed by the next patch in the series (hence, it was
compiling and working locally. Sorry about that.

Feel free to squash this fix.

 drivers/clk/at91/clk-generated.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 70474bd97a10..07c8f701e51c 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -266,6 +266,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 	if (ret) {
 		kfree(gck);
 		hw = ERR_PTR(ret);
+	}
 
 	return hw;
 }
-- 
2.11.0


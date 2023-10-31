Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B777C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 31 Oct 2023 02:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjJaCCX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Oct 2023 22:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjJaCCW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Oct 2023 22:02:22 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3059CFC;
        Mon, 30 Oct 2023 19:02:18 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 6E688602A9D36;
        Tue, 31 Oct 2023 10:02:13 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     Su Hui <suhui@nfschina.com>, mike.looijmans@topic.nl,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: si5341: fix an error code problem in si5341_output_clk_set_rate
Date:   Tue, 31 Oct 2023 10:02:00 +0800
Message-Id: <20231031020159.587686-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

regmap_bulk_write() return zero or negative error code, return 'err'
rather than '0'.

Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/clk/clk-si5341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 9599857842c7..9b1cc5a83b5b 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -898,7 +898,7 @@ static int si5341_output_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	err = regmap_bulk_write(output->data->regmap,
 			SI5341_OUT_R_REG(output), r, 3);
 
-	return 0;
+	return err;
 }
 
 static int si5341_output_reparent(struct clk_si5341_output *output, u8 index)
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3A7C77B6E
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjDJC2o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC2n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:28:43 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8E82707
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=G0V3U0998TVqR3tc0CCyhvwPc8WLgBtTHLL57EMnumM=; b=F0NFHoIVWh5YYkR48yRMysOtxX
        6rXKSiYPzNj/S+MdWHE3rEbGTwyVSzXLqSsCsWi9q4Z+wPrIyafgAlyzZqFtRrR2mtiWf2ZchZ0MB
        H9IeabnGMHogd2vOMhjxszx+ldJfX9NRMQ9zR0bk9GusqNE44xr8Vv9AvyI34/C518AzTrgX9x82t
        8x+UqgI3B99P7dZUkqJIDrLd7gHCOV4ZfCt70A3AVTZMSB8Xj28y9iPug+Z3pnHLG3PKVDmZOZXng
        k4esRFuvN8R7qtaZxzpjzIDzfSimdG1/Ni3edrHvas3ItFufkEXEXz0yn1dIXY5cZvbb6joDpufQu
        PJ+xSqRA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbH-0002RO-Ev; Mon, 10 Apr 2023 03:45:43 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbG-000EJ6-R9; Mon, 10 Apr 2023 03:45:43 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 06/11] clk: lmk04832: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:57 -0700
Message-Id: <20230410014502.27929-6-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230410014502.27929-1-lars@metafoo.de>
References: <20230410014502.27929-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26870/Sun Apr  9 09:25:02 2023)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the managed `devm_of_clk_add_hw_provider()` instead of
`of_clk_add_hw_provider()`.

This makes sure the provider gets automatically removed on unbind.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-lmk04832.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 57485356de4c..afdfee3b365f 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1522,8 +1522,8 @@ static int lmk04832_probe(struct spi_device *spi)
 	}
 
 	lmk->clk_data->num = info->num_channels;
-	ret = of_clk_add_hw_provider(lmk->dev->of_node, of_clk_hw_onecell_get,
-				     lmk->clk_data);
+	ret = devm_of_clk_add_hw_provider(lmk->dev, of_clk_hw_onecell_get,
+					  lmk->clk_data);
 	if (ret) {
 		dev_err(lmk->dev, "failed to add provider (%d)\n", ret);
 		goto err_disable_vco;
@@ -1547,7 +1547,6 @@ static void lmk04832_remove(struct spi_device *spi)
 	struct lmk04832 *lmk = spi_get_drvdata(spi);
 
 	clk_disable_unprepare(lmk->oscin);
-	of_clk_del_provider(spi->dev.of_node);
 }
 
 static const struct spi_device_id lmk04832_id[] = {
-- 
2.30.2


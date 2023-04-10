Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBBDC77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjDJC3d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC3c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:29:32 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA222707
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=P2ytClwWS6+nU1uzBbgjEyN/lfcPDV2AzQGJ53LURtY=; b=FHKQ35rgIoDsWhNmOWsQRMvIaw
        LtBxYsDIqGj75zXWbo2O4RvYXufhSjQTsrTB9qxSQQb0KcNukOjbtQsmXj6WbSV/RDues/SebIiN1
        PFxr8wTHGxOpi+nD12LVajUvOdd2cbCMA34PYVZQW2Aj3oyW+o2HoWNVgxWGpdVHJYOE7TlrCHEMy
        8mnCrhu9ga+USd9gY6IDYBgdN6d4Mmck8ywOA7S6VK5ko71o84WVNizmvtOkQz0sZ7DHQlabXdSWi
        n/IQERo2hpUU8MqKUjr8UJZZEHnIjL4Qt8+AEwpSp5Erk00SHKhGru1KK0bJJ3J46VrZgWBHPb4oP
        cM2o2igw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbC-0002Qq-O7; Mon, 10 Apr 2023 03:45:38 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbC-000EJ6-4I; Mon, 10 Apr 2023 03:45:38 +0200
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
Subject: [PATCH 04/11] clk: cdce706: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:55 -0700
Message-Id: <20230410014502.27929-4-lars@metafoo.de>
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

This makes sure the provider gets automatically removed on unbind and
allows to completely eliminate the drivers `remove()` callback.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-cdce706.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 1449d0537674..d8bee8180a6b 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -661,16 +661,10 @@ static int cdce706_probe(struct i2c_client *client)
 	ret = cdce706_register_clkouts(cdce);
 	if (ret < 0)
 		return ret;
-	return of_clk_add_hw_provider(client->dev.of_node, of_clk_cdce_get,
-				      cdce);
+	return devm_of_clk_add_hw_provider(&client->dev, of_clk_cdce_get,
+					   cdce);
 }
 
-static void cdce706_remove(struct i2c_client *client)
-{
-	of_clk_del_provider(client->dev.of_node);
-}
-
-
 #ifdef CONFIG_OF
 static const struct of_device_id cdce706_dt_match[] = {
 	{ .compatible = "ti,cdce706" },
@@ -691,7 +685,6 @@ static struct i2c_driver cdce706_i2c_driver = {
 		.of_match_table = of_match_ptr(cdce706_dt_match),
 	},
 	.probe_new	= cdce706_probe,
-	.remove		= cdce706_remove,
 	.id_table	= cdce706_id,
 };
 module_i2c_driver(cdce706_i2c_driver);
-- 
2.30.2


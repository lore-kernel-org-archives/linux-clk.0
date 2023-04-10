Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E00C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjDJC3G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:29:05 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919E2707
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=OACAmCnJzzFUADEQwQY2DOfhADXTuYzl/Z0mQvX1m/k=; b=ZpRq8Ww3H0IWdX6Tsa8mZNc8v1
        UDShxpMROjSzSiAlDk3YVmWBg/n1Ij97AySYsZFw/QfsgNnDkdt4DvQATD+38obgqFxTr5NEZaU9b
        5HAkZQ2WiFaCaVgzvCycfGbvQC5r0cf3rneUAcNr9Lj9VRpujlA3vpc8eEsMGQRUWfA0GuvjzTSkc
        VT8aSoiulZeW3FJkuaz5+kf5eAuFQQxPhVpNd6IqgeDgskvCLf3gWM7iBeQ3X6fvpd3MjD6pakNvK
        Ke9rXAgyAx/Ugp4Zl/vdEPtDs4/aM2ACtGN+FyVFX8UVT8UoaJ4ysPolD9PvMv6xDZjkwFmfIUR0h
        ePfjORyw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbO-0002U3-HC; Mon, 10 Apr 2023 03:45:50 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbN-000EJ6-T9; Mon, 10 Apr 2023 03:45:50 +0200
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
Subject: [PATCH 09/11] clk: si570: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:45:00 -0700
Message-Id: <20230410014502.27929-9-lars@metafoo.de>
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
 drivers/clk/clk-si570.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index 0a6d70c49726..0b834e9efb4b 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -474,8 +474,8 @@ static int si570_probe(struct i2c_client *client)
 		dev_err(&client->dev, "clock registration failed\n");
 		return err;
 	}
-	err = of_clk_add_hw_provider(client->dev.of_node, of_clk_hw_simple_get,
-				     &data->hw);
+	err = devm_of_clk_add_hw_provider(&client->dev, of_clk_hw_simple_get,
+					  &data->hw);
 	if (err) {
 		dev_err(&client->dev, "unable to add clk provider\n");
 		return err;
@@ -485,10 +485,8 @@ static int si570_probe(struct i2c_client *client)
 	if (!of_property_read_u32(client->dev.of_node, "clock-frequency",
 				&initial_fout)) {
 		err = clk_set_rate(data->hw.clk, initial_fout);
-		if (err) {
-			of_clk_del_provider(client->dev.of_node);
+		if (err)
 			return err;
-		}
 	}
 
 	/* Display a message indicating that we've successfully registered */
@@ -498,11 +496,6 @@ static int si570_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void si570_remove(struct i2c_client *client)
-{
-	of_clk_del_provider(client->dev.of_node);
-}
-
 static const struct of_device_id clk_si570_of_match[] = {
 	{ .compatible = "silabs,si570" },
 	{ .compatible = "silabs,si571" },
@@ -518,7 +511,6 @@ static struct i2c_driver si570_driver = {
 		.of_match_table = clk_si570_of_match,
 	},
 	.probe_new	= si570_probe,
-	.remove		= si570_remove,
 	.id_table	= si570_id,
 };
 module_i2c_driver(si570_driver);
-- 
2.30.2


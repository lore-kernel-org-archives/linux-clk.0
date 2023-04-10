Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BDCC77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjDJC1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjDJC1x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:27:53 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A783581
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=BjDI/aGsiz4hqT2SW8NQu0wSC+gKkAqaZALS5Khm6vM=; b=WI2q75yO38pIJY94syHtZunf9T
        QWWWEGNkL1ewz6D1eTYVj2p8nybwzobfQ36qGvuNjLR+/HduSFuiOwBP1C5uX6B6Ub8AAg1pWQiwa
        AWCF6DjO+wzRGhXE89ZvpVuyfmTsuEMkVFUbjdm9a64nDB78SgeolkowfSWpGa6IN7b9o9JStEeeE
        spKoh2y90fKLNmQpap9aZgtJaQUSrJobnLtOq3EcsDsk43wMi6t97eIZDOGlThoYPkIcT9nqRHzuz
        ulb9YR9KGRWnqgLIJXbLEMSbRQzxE/xiXNn/CMrQ5BK5WXQZM3sZwfp1zPQJbcT7VRqgpUEL/A49D
        uuo8L5SQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbM-0002Sr-67; Mon, 10 Apr 2023 03:45:48 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbL-000EJ6-Hk; Mon, 10 Apr 2023 03:45:47 +0200
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
Subject: [PATCH 08/11] clk: si514: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:59 -0700
Message-Id: <20230410014502.27929-8-lars@metafoo.de>
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
`of_clk_add_hw_provider()`. This makes sure the provider gets automatically
removed on unbind and allows to completely eliminate the drivers `remove()`
callback.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-si514.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index c028fa103bed..cabdd8e8f4db 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -360,8 +360,8 @@ static int si514_probe(struct i2c_client *client)
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
@@ -370,11 +370,6 @@ static int si514_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void si514_remove(struct i2c_client *client)
-{
-	of_clk_del_provider(client->dev.of_node);
-}
-
 static const struct i2c_device_id si514_id[] = {
 	{ "si514", 0 },
 	{ }
@@ -393,7 +388,6 @@ static struct i2c_driver si514_driver = {
 		.of_match_table = clk_si514_of_match,
 	},
 	.probe_new	= si514_probe,
-	.remove		= si514_remove,
 	.id_table	= si514_id,
 };
 module_i2c_driver(si514_driver);
-- 
2.30.2


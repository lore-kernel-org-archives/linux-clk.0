Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB011C77B6E
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjDJC3N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:29:12 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BD02707
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=x8BZFSGcvqvIdwesaw8duAjdQtuMH/hw45cvqPwO7fw=; b=XhhR/LBLAXDIVoIGbFQVbiAiXs
        ck8tQCgBD7MlfSvbwdEC90PBbYrR8CV4l2xVp1GqlBcZ+899ULbFCTCGjOH26ygxW/0chj2Tsgt6c
        0JIuTb5Ce3YFl6OHBpJHVVlJY2X0vsOdGjEwbCIxf6oqI3ljzGI2MhVG53MUit2LquZOy891+d66o
        M2sDQOhWfIqAH6jV/ZvLLg6dqjEAJ1a7++b+VHefHgqi2VoNnQ4DF8d2xj26/vIbsuaivMIzYyO1X
        n9teiZAUaJWTFYn2Qf2hD7K6Po7uwvJsemaBtiaKkx61Y5uPOdwunKFUfm1ainwl9EfIy4HRD/e2z
        TsvSkJsg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbQ-0002UJ-Ra; Mon, 10 Apr 2023 03:45:52 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbQ-000EJ6-8K; Mon, 10 Apr 2023 03:45:52 +0200
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
Subject: [PATCH 10/11] clk: si5351: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:45:01 -0700
Message-Id: <20230410014502.27929-10-lars@metafoo.de>
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
 drivers/clk/clk-si5351.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 9e939c98a455..4fcf7056717e 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1641,8 +1641,8 @@ static int si5351_i2c_probe(struct i2c_client *client)
 		}
 	}
 
-	ret = of_clk_add_hw_provider(client->dev.of_node, si53351_of_clk_get,
-				     drvdata);
+	ret = devm_of_clk_add_hw_provider(&client->dev, si53351_of_clk_get,
+					  drvdata);
 	if (ret) {
 		dev_err(&client->dev, "unable to add clk provider\n");
 		return ret;
@@ -1651,18 +1651,12 @@ static int si5351_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static void si5351_i2c_remove(struct i2c_client *client)
-{
-	of_clk_del_provider(client->dev.of_node);
-}
-
 static struct i2c_driver si5351_driver = {
 	.driver = {
 		.name = "si5351",
 		.of_match_table = of_match_ptr(si5351_dt_ids),
 	},
 	.probe_new = si5351_i2c_probe,
-	.remove = si5351_i2c_remove,
 	.id_table = si5351_i2c_ids,
 };
 module_i2c_driver(si5351_driver);
-- 
2.30.2


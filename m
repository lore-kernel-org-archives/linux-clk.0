Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A491C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjDJC2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:28:06 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6DA269A
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=mIjkrk724YD/HXZW413oauwHdopAvLJKM812ASmnn4E=; b=WoLwHqt7CH4bupj7HlkHpRbEJl
        GLFm3l6AQZSwq+/ud5l8M2lcE1SSBTGvP/mU+7CaJHVYtQ8q+B5huThdaH5LCHWk+x0io2KpKIiSe
        ZdqjbIDn9PqBUjGWkhVBb7v15Dig6ODCbe1iLRqCYCBuXyPPQtN4PGS3rhKgqmHmAMxwyNqmEu+ZI
        bXOQkcUvXpRQRINyHIj1eF0FP5nbkDmVlrCEkfYYqJU6cpjNd5kthOhtxBqUqHnDy4TozUxDZd6aa
        qA0yIYrHXmhPkGvn8nSD9JE6EGJ6jJaD6tOAe5MW8yYh/aHcIxeGhjlk0+L5bf7ZKhrk9lRVMMSdf
        Co45/JbQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgbF-0002R8-4X; Mon, 10 Apr 2023 03:45:41 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbE-000EJ6-Fi; Mon, 10 Apr 2023 03:45:40 +0200
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
Subject: [PATCH 05/11] clk: hsdk-pll: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:56 -0700
Message-Id: <20230410014502.27929-5-lars@metafoo.de>
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
 drivers/clk/clk-hsdk-pll.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index 766e139972fe..33b48ea5ea3d 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -346,13 +346,8 @@ static int hsdk_pll_clk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
-			&pll_clk->hw);
-}
-
-static void hsdk_pll_clk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &pll_clk->hw);
 }
 
 static void __init of_hsdk_pll_clk_setup(struct device_node *node)
@@ -431,6 +426,5 @@ static struct platform_driver hsdk_pll_clk_driver = {
 		.of_match_table = hsdk_pll_clk_id,
 	},
 	.probe = hsdk_pll_clk_probe,
-	.remove_new = hsdk_pll_clk_remove,
 };
 builtin_platform_driver(hsdk_pll_clk_driver);
-- 
2.30.2


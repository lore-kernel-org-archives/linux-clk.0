Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB78C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjDJC1r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjDJC1q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:27:46 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1D83581
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=y3JJ0JzUuuqhIhC4F7ewIguKeNISh63HKSCT4u/l5NQ=; b=m9wlB85PBF8qnR1IPZELgQ1Gr9
        NFrjafINILVk5OFgGQ9rL36BFz5cmrH55IH1lt1kjv/ZiPMqhJbnf8Q0p2SGk2xwc1y/BZhNYxSat
        1EfHYKqNkFJZbRisHu+Jh3V5SpzKfhf4RSJgoWiN1mFPTSsRu3s7VQmPUJ4Z2aHyXdP6wIhKNco7S
        shHRPu6XD3zKErONdTHmpaof/fmzVxBoJwHU66bMq+vM15DDDe4z76AaTqFtfED7jp5RVAjlnFQ08
        fpPHWqS68LMc2dgBVOgSZ8aHbRjyFMU/cly0zowT8FSs2xQzmPW62VF/zN7jtViFVuUi21q+ttxQN
        5sh2n1XA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgb5-0002QN-OJ; Mon, 10 Apr 2023 03:45:31 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgb5-000EJ6-2L; Mon, 10 Apr 2023 03:45:31 +0200
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
Subject: [PATCH 01/11] clk: axi-clkgen: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:52 -0700
Message-Id: <20230410014502.27929-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
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
Sorry if you received this multiple times. Forgot to cc the mailinglist.
---
 drivers/clk/clk-axi-clkgen.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 671bee55ceb3..a04a3d38c76e 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -553,13 +553,8 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_simple_get,
-				      &axi_clkgen->clk_hw);
-}
-
-static void axi_clkgen_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
+					   &axi_clkgen->clk_hw);
 }
 
 static const struct of_device_id axi_clkgen_ids[] = {
@@ -581,7 +576,6 @@ static struct platform_driver axi_clkgen_driver = {
 		.of_match_table = axi_clkgen_ids,
 	},
 	.probe = axi_clkgen_probe,
-	.remove_new = axi_clkgen_remove,
 };
 module_platform_driver(axi_clkgen_driver);
 
-- 
2.30.2


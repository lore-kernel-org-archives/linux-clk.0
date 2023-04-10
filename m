Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0B8C77B6E
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjDJC2a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC2a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:28:30 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED9F2707
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=4k8OCgcWnKrwJSAtm+LV3Y85i/5OU3HN3IdC4aa+VWM=; b=Y4VG3Mm8CceOto/d26gmh97J4y
        1KNIUX2WxRYVOcq7KkP3dBISAeqjcsJt6AbyX3rSlpTVLxGdvXl/Yr1epRo4vKcNcwDbUM4kodVIV
        Lza55tFs4ohKPpxiZzv7wgQhe8kDr33qHfQrZdgFRwhLjtFUkQSoPNLcXaQU3IPMhfGbHIJBqnfs8
        6AZQBeLL1rS7se7IONdGs9r1BvV7ZveZ8ECNWLWNIDWpz6YPnsUfyJQ26+CyR3mrWezSCLTjeb1Ro
        IsPlUTNrgEvwLvMSd0uQXyEepQimXq9KQrXZlx+1Pl5uzycChbm0zcFsQe0gjavT7Ig21BfJOPHQw
        vD0jq+fQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgb8-0002Qc-10; Mon, 10 Apr 2023 03:45:34 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgb7-000EJ6-Dj; Mon, 10 Apr 2023 03:45:33 +0200
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
Subject: [PATCH 02/11] clk: axm5516: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:44:53 -0700
Message-Id: <20230410014502.27929-2-lars@metafoo.de>
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
 drivers/clk/clk-axm5516.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/clk-axm5516.c b/drivers/clk/clk-axm5516.c
index 1dff2017ad9d..1afcfdf2e6f9 100644
--- a/drivers/clk/clk-axm5516.c
+++ b/drivers/clk/clk-axm5516.c
@@ -569,17 +569,11 @@ static int axmclk_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_axmclk_get, NULL);
-}
-
-static void axmclk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
+	return devm_of_clk_add_hw_provider(dev, of_clk_axmclk_get, NULL);
 }
 
 static struct platform_driver axmclk_driver = {
 	.probe		= axmclk_probe,
-	.remove_new	= axmclk_remove,
 	.driver		= {
 		.name	= "clk-axm5516",
 		.of_match_table = axmclk_match_table,
-- 
2.30.2


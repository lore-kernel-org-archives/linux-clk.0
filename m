Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBFDC77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 02:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjDJC3U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDJC3T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 22:29:19 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED9F2707
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 19:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=LEugraMhat8ELuRgKAwGAhgX6HCm0l+FgWHQ3aPTooQ=; b=j/9YNhj0aV5MD3L1JRFoApoGbg
        hqxLXQ8zptFZNDe0b4BAOY1FweT4SyBy4uIGJtltN6Ndht3BDugu5h9NHGXxfalbPxwDOPBYcx8UD
        +FIHfzP3t4+yi5+PqrCqROY0ELSa83rC/TsWMkT2sJJytjeOGcYKRlPtdVb1NTjGEtUGdENyos1yk
        FHQ7GGpwR8bQ93386hJI6xZ/j4Yi+wA9tItVo7F4Dmfj3tuEfsa+wt3Cse6Uoy/gXYARpvTUrdJI+
        BGz6lK7Vc/JcrXm9jTPYU+jn3p+YZK1QcEqmyTy53z2PeLRsiVjZpZlpkRzRWqoSqdYB3km6JXYaO
        d6NJqFnQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1plgt9-0004HP-AP; Mon, 10 Apr 2023 04:04:11 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1plgbS-000EJ6-Jk; Mon, 10 Apr 2023 03:45:54 +0200
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
Subject: [PATCH 11/11] clk: uniphier: Use managed `of_clk_add_hw_provider()`
Date:   Sun,  9 Apr 2023 18:45:02 -0700
Message-Id: <20230410014502.27929-11-lars@metafoo.de>
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
 drivers/clk/uniphier/clk-uniphier-core.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 92f4ddc593db..a61213311d6c 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -87,13 +87,8 @@ static int uniphier_clk_probe(struct platform_device *pdev)
 			hw_data->hws[p->idx] = hw;
 	}
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				      hw_data);
-}
-
-static void uniphier_clk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   hw_data);
 }
 
 static const struct of_device_id uniphier_clk_match[] = {
@@ -218,7 +213,6 @@ static const struct of_device_id uniphier_clk_match[] = {
 
 static struct platform_driver uniphier_clk_driver = {
 	.probe = uniphier_clk_probe,
-	.remove_new = uniphier_clk_remove,
 	.driver = {
 		.name = "uniphier-clk",
 		.of_match_table = uniphier_clk_match,
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166C4C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjG0Fcj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbjG0Fci (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:32:38 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699A4271B
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:37 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-563f4e49ff9so293599a12.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690435957; x=1691040757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uyw3PNfZIGdqDhQAwksMXr4rBdSDRWmBdpkW/XA90lY=;
        b=drVvjIcn6IwB7Xn0zmy1NP5nq8SSNIQeAYnATBZ8fVrsX3Re7hS8xvzwCPrOOmVYDT
         yvIrdOKnD205U8KOaVniDdHmXe61quc45RJ0Xm894JcBaaGRr4BKabCckcXl5URiQWH0
         OGbAX7YKljP3iTfl/3QanAGlykvZsQi5Y0AYQrXpWJViHwMX+u6xE7IXKi/2Z0Th2JQG
         IBiQCMQdJMO/DQaTOPzXZ1Tq9oT1VWrQk0dSWDwwnMayGY9EoNDPEtcPQjFfsnoaccIx
         5iW8qx8pC5Q4xnmtaK6y7SmD1mHgGXItb87R/AB/rTYXh3OuZAYkoO7kg72q+pYebyVk
         KTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690435957; x=1691040757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uyw3PNfZIGdqDhQAwksMXr4rBdSDRWmBdpkW/XA90lY=;
        b=e6KM0JT+kezaPJzUxudbQTtkxaGjYvy5YLlf3qBd/bRYtnh2tUWa1kI5Dn/jWEXrLk
         BUmdL07htoa3p/qGoWgdThOmYoVbgwhFDWSq3y3sP8CIE7oJ4nlxqTXKqqwJA+nZcPMG
         JD3FIm+XghlHiLaNPFaPrksHxdtaO4Js36TCzKF2HzRrU69tkFiPbSDK9DpsA+OfkOhz
         mPxzTs83vG68/lRIKkuhswYLLJiygzDMToU4NqLEgVpiE+pv/hlmbTrVVJdF/XDvcMcY
         ns64DrjxcBUak0OapfrpRNq2oAhqxGcXV7HfzvsqFqd4Xgf0UklaPj34Z0Z6xOxrz8ut
         Br9w==
X-Gm-Message-State: ABy/qLbCbYTrkw89MKYg4L8Qu2WetSUlhCgCWKyOyrmjSLz2WapYHYBW
        ctVcC691o1qAmnptI21G2M05OA==
X-Google-Smtp-Source: APBJJlFaiXidP9D8t/SlKdr/7PjGHe8B2LxzQ0uXp+qc5AmYStgN8YypNaZm+7pCUSKDHPRfKQtsJw==
X-Received: by 2002:a17:903:2305:b0:1b8:1687:b53 with SMTP id d5-20020a170903230500b001b816870b53mr4574340plh.26.1690435956889;
        Wed, 26 Jul 2023 22:32:36 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:32:36 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 01/42] clk: at91: sama7g5: check __clk_get_hw() argument for errors
Date:   Thu, 27 Jul 2023 08:31:15 +0300
Message-Id: <20230727053156.13587-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

__clk_get_hw() argument in sama7g5 is obtained using
of_clk_get_by_name() which might return error. Passing an error casted
pointer to __clk_get_hw() may lead to crashes. Thus, check the pointer
for errors before passing it to __clk_get_hw().

Fixes: de3383e993a5 ("clk: at91: sama7g5: switch to parent_hw and parent_data")
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/sama7g5.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 91b5c6f14819..16e458be8304 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -988,14 +988,27 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	struct clk_hw *td_slck_hw, *md_slck_hw;
 	static struct clk_parent_data parent_data;
 	struct clk_hw *parent_hws[10];
+	struct clk *clk;
 	bool bypass;
 	int i, j;
 
-	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
-	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
-
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	clk = of_clk_get_by_name(np, "td_slck");
+	if (IS_ERR(clk))
+		return;
+	td_slck_hw = __clk_get_hw(clk);
+	if (!td_slck_hw)
+		return;
+	clk = of_clk_get_by_name(np, "md_slck");
+	if (IS_ERR(clk))
+		return;
+	md_slck_hw = __clk_get_hw(clk);
+	if (!md_slck_hw)
+		return;
+	clk = of_clk_get_by_name(np, main_xtal_name);
+	if (IS_ERR(clk))
+		return;
+	main_xtal_hw = __clk_get_hw(clk);
+	if (!main_xtal_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
-- 
2.39.2


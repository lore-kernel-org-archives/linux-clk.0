Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21786C4167B
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 15:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiLIPax (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiLIPag (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 10:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EFCD4A
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 07:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670599772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iLUYz9gKiHY3ndA68I5cW74nts6kf3HnnSAI7CDyETY=;
        b=Y7tk27Dcw6TcbUoj/jy8MZyYgyZqg1r9iaSSp3Dfwc1/7T5UWIIITzuw62VELh9/s/P/6Z
        ZBxL6stBWNi7WGoFwMkXiRVy8GRiCitPEuiHqhOwO8X9lPS39ChFvOxu+bQgjOW2K/7KIr
        Jsu7t7n5sBLBTjGUZxW87Qkh+p8J65A=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-tX_2TEczOhSN2ohAFNl3tQ-1; Fri, 09 Dec 2022 10:29:31 -0500
X-MC-Unique: tX_2TEczOhSN2ohAFNl3tQ-1
Received: by mail-vs1-f69.google.com with SMTP id m125-20020a672683000000b003af413a8263so1332549vsm.17
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 07:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLUYz9gKiHY3ndA68I5cW74nts6kf3HnnSAI7CDyETY=;
        b=rCAsZtg1OEEeD9gdEvMMMTjP5S4NlzXnX7FhuGdInlIBLfV2qbyJCrfJSEJPqyw9v7
         9wB2G9+4Zq/XyDXPPYcBPWawyGKQKPcPnGmg0wQIJRCBi9ZCTexoOjWhlPWu7jafrntQ
         T7xbddTNM+73R/VDCLiJ0rlbRDYJf51rahAh1npTslm3+VGUEkqFTkcIqbzkf4NXd9ZO
         1bP7pBIe9efo9AsVZrTOVUGNQhCsuQNDdEWJIi7qVaXfu9jJAoiVFkfom7Ct2a5NSz55
         Gtzl9Za6yhc8NLdi61CbpOZ4vxgLfEsTHNXT2AxYFmHmZ8S4ACwXM7vkwt+i2tBMD4U3
         nhrA==
X-Gm-Message-State: ANoB5pnR8/P8co3wCGAXgtIEroZHadzmNjoGN7UhuO77p2MExy8K/3si
        flrBkAF/7Gt9dnwrGKhplZ1q2eUfUgNs5JjCd/2pR+Hji4Nj3c7RqXX6EZ6lJwgy2zu0Xjw3BkL
        o3fsefUQOGAsYqAeHut8=
X-Received: by 2002:a05:6122:2c5:b0:3bd:b78b:102b with SMTP id k5-20020a05612202c500b003bdb78b102bmr3298743vki.5.1670599770344;
        Fri, 09 Dec 2022 07:29:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+U2uhioAWISnye3Qoub4LCzfeuIPe70H/84a6MC+WFWRbN5P56LHkPbSWwOlcP2wVGqB3Mg==
X-Received: by 2002:a05:6122:2c5:b0:3bd:b78b:102b with SMTP id k5-20020a05612202c500b003bdb78b102bmr3298723vki.5.1670599770101;
        Fri, 09 Dec 2022 07:29:30 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id dt26-20020a05620a479a00b006fbf88667bcsm29484qkb.77.2022.12.09.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:29 -0800 (PST)
From:   Marco Pagani <marpagan@redhat.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] clk: socfpga: arria10: use of_clk_add_hw_provider and improve error handling
Date:   Fri,  9 Dec 2022 16:29:13 +0100
Message-Id: <20221209152913.1335068-7-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209152913.1335068-1-marpagan@redhat.com>
References: <20221209152913.1335068-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The function of_clk_add_provider() has been deprecated, so use its
suggested replacement of_clk_add_hw_provider() instead.

Since of_clk_add_hw_provider() can fail, like of_clk_add_provider(),
check its return value and do the error handling.

The return type of the init function has been changed to void since
the return value was not used, and the indentation of the parameters has
been aligned to match open parenthesis, as suggested by checkpatch.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/clk/socfpga/clk-pll-a10.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index bee0f7da5b6e..b028f25c658a 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -63,8 +63,8 @@ static const struct clk_ops clk_pll_ops = {
 	.get_parent = clk_pll_get_parent,
 };
 
-static struct clk_hw * __init __socfpga_pll_init(struct device_node *node,
-	const struct clk_ops *ops)
+static void __init __socfpga_pll_init(struct device_node *node,
+				      const struct clk_ops *ops)
 {
 	u32 reg;
 	struct clk_hw *hw_clk;
@@ -73,13 +73,14 @@ static struct clk_hw * __init __socfpga_pll_init(struct device_node *node,
 	const char *parent_name[SOCFGPA_MAX_PARENTS];
 	struct clk_init_data init;
 	struct device_node *clkmgr_np;
+	int rc;
 	int i = 0;
 
 	of_property_read_u32(node, "reg", &reg);
 
 	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
 	if (WARN_ON(!pll_clk))
-		return NULL;
+		return;
 
 	clkmgr_np = of_find_compatible_node(NULL, NULL, "altr,clk-mgr");
 	clk_mgr_a10_base_addr = of_iomap(clkmgr_np, 0);
@@ -103,12 +104,25 @@ static struct clk_hw * __init __socfpga_pll_init(struct device_node *node,
 	pll_clk->hw.bit_idx = SOCFPGA_PLL_EXT_ENA;
 	hw_clk = &pll_clk->hw.hw;
 
-	if (clk_hw_register(NULL, hw_clk)) {
-		kfree(pll_clk);
-		return NULL;
+	rc = clk_hw_register(NULL, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock:%s\n", clk_name);
+		goto err_clk_hw_register;
 	}
-	of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
-	return hw_clk;
+
+	rc = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock provider for node:%s\n",
+		       clk_name);
+		goto err_of_clk_add_hw_provider;
+	}
+
+	return;
+
+err_of_clk_add_hw_provider:
+	clk_hw_unregister(hw_clk);
+err_clk_hw_register:
+	kfree(pll_clk);
 }
 
 void __init socfpga_a10_pll_init(struct device_node *node)
-- 
2.38.1


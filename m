Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633BEE92715
	for <linux-clk@archiver.kernel.org>; Thu,  5 Oct 2023 14:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237719AbjJEOmc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236650AbjJEOgo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 10:36:44 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9E843514
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 07:02:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32167a4adaaso949836f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514521; x=1697119321; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbcoAiVjWZW5P7u3ypsUZftXt7DOl7esx6TwnJ6vnvw=;
        b=yMXc8n8Ma24feUaJ3nLJnrS0/sGbDmkbKFvd+GTKldX6HJBvxOtBXW3kOm/33ahOOD
         /vvpehycvVDywf9zDD6Dkt540SotCRKB8LZq2HmkfAaohkUoFu6vZ8iriL8fY5yDi8zP
         m69riz4SWRJkH1eGwqwPFbXV9qjwGdlfX2xSzKaCmlIdi1FvKRVFBYH+ZyyiT3WZ/0/S
         BvXyoBjJf5/dFOmVkrnFDcKPjqHVpeEMlWGeHVx0OJmPQcQPlC7liMOidJLq4FFQvNWa
         EkZ1H3P+B01GQ0Smwwc0EOF4lDapKHx5WJ6yMtd4/F5TuVek7kOPHIZWxQUAXR9uYAo6
         kVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514521; x=1697119321;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbcoAiVjWZW5P7u3ypsUZftXt7DOl7esx6TwnJ6vnvw=;
        b=oyE6y6DrTuvKU4l+46e9J/DzGUdqKY3DvLAsz31QqC+izb7lkIk4JLMmprFmk3gpyn
         xWTy2RjdnQbkO6YJSbdkieZw9LzdCG1kzeISQjP+5z0YOfzM5ZGkulo2c7n88qx61vac
         o/NH/zibV7aLjOjTqFEvnyd4qzUS69361ug4ksqHRE8nEz7ZgRFe2/Q5VJ75azRcGhVg
         1JY7i40wI+W/jUTbtxiwXJWVyhJN1NVnRuixxZEk8dHjrdY8mmSLNKYF5+3om+RWyEtu
         TitsR4fnnm0immVVgFQv1/iEMAbKDVhTPRGjV9myNerpJX6OolAqc2tU7tP/qiCGJPkZ
         8evg==
X-Gm-Message-State: AOJu0YxTMvm+06HXdi753W3lv8/cL6RBDZKvdwj/kBi72FwI8x1v4+yK
        kjnwY/uv2iijOUbdYy6bztOAHQ==
X-Google-Smtp-Source: AGHT+IFzMG84hWtgM7/kzXwiczHNUb5vU+sHKFOUOrM4aCWSY90+ZZWXEdv9Z3kAjAM3RZftvpszLg==
X-Received: by 2002:adf:f74a:0:b0:31a:d6cb:7f9d with SMTP id z10-20020adff74a000000b0031ad6cb7f9dmr4786129wrp.24.1696514520442;
        Thu, 05 Oct 2023 07:02:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d6052000000b003248a490e3asm1867036wrt.39.2023.10.05.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:02:00 -0700 (PDT)
Date:   Thu, 5 Oct 2023 17:01:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
Message-ID: <d9da4c97-0da9-499f-9a21-1f8e3f148dc1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_register_divider() and clk_register_mux() functions returns
error pointers on error but this code checks for NULL.  Fix that.

Fixes: b9e0d40c0d83 ("clk: keystone: add Keystone PLL clock driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/keystone/pll.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index ee5c72369334..6bbdd4705d71 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -281,12 +281,13 @@ static void __init of_pll_div_clk_init(struct device_node *node)
 
 	clk = clk_register_divider(NULL, clk_name, parent_name, 0, reg, shift,
 				 mask, 0, NULL);
-	if (clk) {
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-	} else {
+	if (IS_ERR(clk)) {
 		pr_err("%s: error registering divider %s\n", __func__, clk_name);
 		iounmap(reg);
+		return;
 	}
+
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 }
 CLK_OF_DECLARE(pll_divider_clock, "ti,keystone,pll-divider-clock", of_pll_div_clk_init);
 
@@ -328,10 +329,12 @@ static void __init of_pll_mux_clk_init(struct device_node *node)
 	clk = clk_register_mux(NULL, clk_name, (const char **)&parents,
 				ARRAY_SIZE(parents) , 0, reg, shift, mask,
 				0, NULL);
-	if (clk)
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-	else
+	if (IS_ERR(clk)) {
 		pr_err("%s: error registering mux %s\n", __func__, clk_name);
+		return;
+	}
+
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 }
 CLK_OF_DECLARE(pll_mux_clock, "ti,keystone,pll-mux-clock", of_pll_mux_clk_init);
 
-- 
2.39.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CE4E784A4
	for <linux-clk@archiver.kernel.org>; Mon,  2 Oct 2023 07:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235657AbjJBHEp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235641AbjJBHEo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 03:04:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB3CBD
        for <linux-clk@vger.kernel.org>; Mon,  2 Oct 2023 00:04:41 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so15538186f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Oct 2023 00:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230280; x=1696835080; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7ijRdP/7w6YuyMyRRQZzwnMWCZUlvsf+At2pKxS9oA=;
        b=TJLEzUQ51CsBW31A8R8VKBpzY9o/tgTYx+meecwuCsWKldc7bIaXW+lOVXlmaBHh4M
         kNTaSFoGLJiUiCD0vTHNvuNKXckXuORu8ZBZURhgbsaJxOd/i6yG67+2nzakHNQi4PHd
         tWOHPGap505zKlB7jxEhZrPHAZG/qqlMS4HOswi/W0+dIFYDZTvwt6xOs3GVTMLktlfV
         lF5BVX+n2lrxRbaoyU16QxVm9fWvVyjLI6vN/DaMBAS4LPMgdW5QCqkbrys3+sr2B7au
         v5w/ikyV68gMMxVdqqtbFMo+SzBpxQAvDvyTimSahI7FYWzCqtqUbpzrmV9ltcUvnZQG
         T/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230280; x=1696835080;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7ijRdP/7w6YuyMyRRQZzwnMWCZUlvsf+At2pKxS9oA=;
        b=IYYJcu7O+myzBdsreiXZ/moKifrT8MZ1C2soAzOtViKApeTUeGW7vqbczYaFRHFgb7
         Hx4PEi/uIinnqRanoxX/bn8uJx5R1HfmWJbCMN871avWWLjkK9zBOSC5vF9rJ2zeVVI5
         2qc1kiaTKrZMapTdCMzili/M9UeV7Crk/IEGWg48X+6nyKRiIvTcOrtGegnUEA0p8g0o
         P6ENUE5smNyAJAGHfMJJ/K+UeR/GVtmji80rjvxNBme3t5o0r+2aXYMgB82/0uUEYTAP
         Dw7M3pV2MBPawVHI5ImWUTga/LvhM3G5A5gfCFsEdoJqorkGmYmGsALTTo6vq5RBNQq9
         fTOA==
X-Gm-Message-State: AOJu0YxTU1ArhHa5wp+s8f4WKZy4JEph/9L5af+J0t4WefudSuHIK7SX
        zHHt/wreZCOoa+OMvKvCJwzeHg==
X-Google-Smtp-Source: AGHT+IFsiV7LuyeR2PhowHbyLrLUsKqyjEGfArvG7roW2WS/P1f6n1ITL262F7Y4H8H+JiPhkc6Cfw==
X-Received: by 2002:a05:6000:110c:b0:313:f0d7:a43 with SMTP id z12-20020a056000110c00b00313f0d70a43mr8788075wrw.23.1696230280362;
        Mon, 02 Oct 2023 00:04:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay13-20020a5d6f0d000000b003179b3fd837sm20220121wrb.33.2023.10.02.00.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:04:40 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:04:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: ti: fix double free in of_ti_divider_clk_setup()
Message-ID: <6d36eeec-6c8a-4f11-a579-aa3cd7c38749@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The "div" pointer is freed in _register_divider() and again in
of_ti_divider_clk_setup().  Delete the free in _register_divider()

Fixes: fbbc18591585 ("clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/ti/divider.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 768a1f3398b4..5d5bb123ba94 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -309,7 +309,6 @@ static struct clk *_register_divider(struct device_node *node,
 				     u32 flags,
 				     struct clk_omap_divider *div)
 {
-	struct clk *clk;
 	struct clk_init_data init;
 	const char *parent_name;
 	const char *name;
@@ -326,12 +325,7 @@ static struct clk *_register_divider(struct device_node *node,
 	div->hw.init = &init;
 
 	/* register the clock */
-	clk = of_ti_clk_register(node, &div->hw, name);
-
-	if (IS_ERR(clk))
-		kfree(div);
-
-	return clk;
+	return of_ti_clk_register(node, &div->hw, name);
 }
 
 int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
-- 
2.39.2


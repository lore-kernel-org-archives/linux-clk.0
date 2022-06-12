Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B097FC433EF
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbiFLTaX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234220AbiFLTaN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBAA41FB9
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id c196so4041110pfb.1
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zH7tRgS1kPhp4yimKnmW6BSRKLogEiz0V2ye7JMw0J4=;
        b=Tt9ZMWoGP/SE3JgfszEeP/C9v21GL9hkArBg8JYTU9zbzYsU9roh2KHavOcY0fDYhg
         S1Rj4Hvr1V/A8nGgnBGwgxzifzmWQ8Bxd+EmffCx3WRDL8ioJr9B3oyjnahihzmgJN80
         a2jBx7pmL5O3vPSY1gLaAdyb+cq73bRVtkbRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zH7tRgS1kPhp4yimKnmW6BSRKLogEiz0V2ye7JMw0J4=;
        b=eoyM786ocWsWcWmfF1LW5+VNvTgyqN1EaOFgpPsIcOn3g/GLHX8VxsFW4Sryn79yIf
         1KfhZ7FpyY3I/cxlR5Jb0sd/LRF1+GJAu4WjxZ+77W1qhKGmNZ2VvZukl11tjNOoYn4M
         GZ+i/xEWdS9KzYuJPZJvzxAuN5rTPLs68y4Kwo4+mIkhH6iGVdzy+X6rKEXj1bp4YpHL
         z+iBZj52hjKxBFa9atgpmbBA54NPzoPqJbWRz1stjoGik80a7vdjv6li1jRhS0DoV8jY
         TdYZHdsxXSkVlXCe/8Eopqfa6Du/s1hoc5g4oMSQgsdfCs6PtAbu7At1Le3A6mUIywZk
         EayQ==
X-Gm-Message-State: AOAM5310+mCecgcF1HorHQ9Ec4S4ECwZt+vkdZnZWHKi5FmzWS+yhT6/
        7uJ7ZB0w0nlBoJZ0kwKowqwubLYm1TQeaImXXsT/RA==
X-Google-Smtp-Source: ABdhPJyC2dSfEqr78OqhXUN5sNUdf+zX6fhM99vw6G1E98GZfGT9DAdYLLGCHL36SW5k0FHFQgFZpQ==
X-Received: by 2002:a62:7b94:0:b0:51b:c723:5724 with SMTP id w142-20020a627b94000000b0051bc7235724mr54680295pfc.8.1655062211601;
        Sun, 12 Jun 2022 12:30:11 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:11 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 04/12] clk: mmp: pxa168: add new clocks for peripherals
Date:   Sun, 12 Jun 2022 12:29:29 -0700
Message-Id: <20220612192937.162952-5-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit adds three new clocks that previously didn't exist, but are
needed in order to match the clock parenting as described in the PXA168
datasheet.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index 42569cf3f42f..aba58ce6e60c 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -94,6 +94,9 @@ static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
 	{PXA168_CLK_PLL1_13_1_5, "pll1_13_1_5", "pll1_13", 1, 5, 0},
 	{PXA168_CLK_PLL1_2_1_5, "pll1_2_1_5", "pll1_2", 1, 5, 0},
 	{PXA168_CLK_PLL1_3_16, "pll1_3_16", "pll1", 3, 16, 0},
+	{PXA168_CLK_PLL1_2_1_10, "pll1_2_1_10", "pll1_2", 1, 10, 0},
+	{PXA168_CLK_PLL1_2_3_16, "pll1_2_3_16", "pll1_2", 3, 16, 0},
+	{PXA168_CLK_CLK32_2, "clk32_2", "clk32", 1, 2, 0},
 };
 
 static struct mmp_clk_factor_masks uart_factor_masks = {
-- 
2.25.1


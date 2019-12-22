Return-Path: <SRS0=uTOl=2M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3B1C2D0C8
	for <linux-clk@archiver.kernel.org>; Sun, 22 Dec 2019 20:29:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E41DB206CB
	for <linux-clk@archiver.kernel.org>; Sun, 22 Dec 2019 20:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDCjAxuG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLVU3g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Dec 2019 15:29:36 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40345 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfLVU3g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Dec 2019 15:29:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id u1so15812704ljk.7
        for <linux-clk@vger.kernel.org>; Sun, 22 Dec 2019 12:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e1hSMTsmfaLaprOXSq+UVK8DvTxDFM0cuzoXJb6/s1U=;
        b=nDCjAxuGk/xzyq0ZuIn+tfZd3zr6PxFvDV4QMIWDybCuiAOzatWQD0tMqN+27gjMhq
         LgYAPezJEnPHmn7GMXLflmz/qWZ+CHNeTdf0Nvh3Nx53dXbh3gjgEBoX6OxJ+nwmc1gg
         eH6uux/BiU+1s4NgXEVfRQfVv/hG/aKe9HPCfjx1H4r7GC7J6EVCnd1/u3aqpFDKBbrN
         UnvgG4ULLjk1XXJJiSPQH4kMmMrrtgSXCRCFtrWPSGE1FMhpZlbZ+yQQW9na6kKbIBRv
         E3WyDQfkyhNZ9dzLXcA7tzcEGaTX49UsEWlUM5x1vSqx+yreUbq59OOnpDZ7uJFeZGDC
         QM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e1hSMTsmfaLaprOXSq+UVK8DvTxDFM0cuzoXJb6/s1U=;
        b=jBwhBU0Ykmcpg91t3WNCXjp6G9547f6ORsPan9rrvl+UpIrlbrZ0tGWQpKovAIvoS5
         ngHlEoJm15rIlZIA3JakL0J45N2Kup2zuEP7i/MukES++2oowNMTOEoGPjTDTxo0WkDO
         YNUwfzGK14sdkUI0rSr3jf3+NbRm0DmOZDyi14fUTyLoKi1TSNy7ogm67QjyYtnCWcxf
         Q/QWdFFWf/oQQBpd9PXsZM0mMnrgX9N1AnWVJmeffm4zuYi17szqrnM2AZUpjDRK2Ba8
         R4QzxSgnLyizBb/99EsW1sv7V1Dxu1AlQYMjOaIh/C6EfMcYniE8oztaMtt5C/p2FeMt
         Pkow==
X-Gm-Message-State: APjAAAWnW45pFw7GghHRuUT6pnl+fY4K05x5RfguiFVfYtKxt36X80P9
        lWgt3G89N2cY+f/I6+fZoFFVrc5BR6ee5g==
X-Google-Smtp-Source: APXvYqzeDPAKMoNKeoSj8E3kG+qFYXlPhCWaW5sGZ20Wjv6PYhaaCC9/sD4uGKXQmXcdSTJPwOiEwQ==
X-Received: by 2002:a2e:8916:: with SMTP id d22mr16079488lji.19.1577046574300;
        Sun, 22 Dec 2019 12:29:34 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
        by smtp.gmail.com with ESMTPSA id n23sm7059336lfa.41.2019.12.22.12.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 12:29:33 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] clk: ux500: Initialize DSI clocks before registering
Date:   Sun, 22 Dec 2019 21:29:28 +0100
Message-Id: <20191222202928.14142-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The DSI clocks need to be initialized properly and cannot
rely on boot defaults, this is especially important for the
U8420 SYSCLK variant of the PRCMU firmware which requires
that you poke these registers right before trying to use
the HS DSI clock. Some vital setup such as the PRCM_TVCLK_MGT
register will not happen unless we call this making some
displays fail to work on the U8420.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/ux500/u8500_of_clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index 0aedd42fad52..c1043a6b383f 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -65,6 +65,9 @@ static void u8500_clk_init(struct device_node *np)
 	u32 bases[CLKRST_MAX];
 	int i;
 
+	/* Initialize display clocks */
+	prcmu_set_display_clocks();
+
 	for (i = 0; i < ARRAY_SIZE(bases); i++) {
 		struct resource r;
 
-- 
2.21.0


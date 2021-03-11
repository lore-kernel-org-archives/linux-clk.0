Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA88C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 14:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FC6964FF2
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 14:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhCKOtD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 09:49:03 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60704 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233691AbhCKOsk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 09:48:40 -0500
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKMcB-0001JK-Jn
        for linux-clk@vger.kernel.org; Thu, 11 Mar 2021 14:48:39 +0000
Received: by mail-ed1-f71.google.com with SMTP id h2so9949320edw.10
        for <linux-clk@vger.kernel.org>; Thu, 11 Mar 2021 06:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AfZi1aLqaVnii5CtMfRTKmgGkJ5oB3CQKhmO+KpjKXk=;
        b=jkZJcgPtNQOTWZYBmiyZ/jPXah9+tDt/wkP2g9tBW3JzNVHP591pv5A71FD0BMDcn6
         0IiPjmY83LswJLrXE+yEC4LRiLuDPekq4WDBItVD7uvhEfJNVbN9zm9Xfzy/k35Iu1FV
         f6nbLsx4OCnRpZGkrAHF692vEeoEWVeMsirpq7aF3wF6WGPMs48UuXkz+cm0DU/kwYm2
         2+d8BxdK0IiW5nIyN9MdJ6IJbo2qQmmO8uFZ1zitLbUJxYhZs5F39M5xBNezbrCHRo5f
         3nUhaTTwNSK0ftqp4Gy8gGErXUyV33qEH3bSysHCxqvUonS2p5wkNMAfZzpQ69dv5Xyc
         2RLQ==
X-Gm-Message-State: AOAM531ErJwSrg8/wqt6QTdGhnUPhUlpVO7ELyJ35iy5ltkc3cu96wnj
        QSAHV0P0NjDYbiRtt6x3FNmUhhImOtH3ov8/Le/cLs/aLQtww3JCn7j+gGd1AQ7/+4BNzNxj3xG
        bWxxE7t8nUBIb8sfffbU/76X/Ck6eIU3Z//YZ+w==
X-Received: by 2002:a17:906:d9d1:: with SMTP id qk17mr3415850ejb.52.1615474119390;
        Thu, 11 Mar 2021 06:48:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyagpzsCI1n5bt7Tkf7ZjVO9M2j0SJ55XaHVkf0RzwuAx+DX5ofwBgGUu7nSq8q0RydQaLX5Q==
X-Received: by 2002:a17:906:d9d1:: with SMTP id qk17mr3415833ejb.52.1615474119145;
        Thu, 11 Mar 2021 06:48:39 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id u59sm1559995edc.73.2021.03.11.06.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 06:48:38 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] clk: socfpga: fix iomem pointer cast on 64-bit
Date:   Thu, 11 Mar 2021 15:48:33 +0100
Message-Id: <20210311144833.1313387-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Pointers should be cast to unsigned long instead of integer.  This fixes
warning when compile testing on ARM64:

  drivers/clk/socfpga/clk-gate.c: In function ‘socfpga_clk_recalc_rate’:
  drivers/clk/socfpga/clk-gate.c:102:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/socfpga/clk-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 43ecd507bf83..c876523d5d51 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -99,7 +99,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
 		val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
 		val &= GENMASK(socfpgaclk->width - 1, 0);
 		/* Check for GPIO_DB_CLK by its offset */
-		if ((int) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
+		if ((unsigned long) socfpgaclk->div_reg & SOCFPGA_GPIO_DB_CLK_OFFSET)
 			div = val + 1;
 		else
 			div = (1 << val);
-- 
2.25.1


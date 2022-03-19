Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D056BC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 22:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbiCSWzY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 18:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiCSWzY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 18:55:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEC9E994F
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 15:54:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a26so1354200lfg.10
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1H0Kr8NdTPDNAJ4whIcFCRZHEVI7wVTVLJ0HOgoRKVo=;
        b=ON0TvHBA1GBfiLjyoB+G5dl1iwEZcwobFrCAFL44tFbTD39+XRHHw6gEmGjAC0/Ltm
         JWZAoARC0LQ5CoKkcQFe3EZ5IjmNcmwI3YvvxS4J1hNHfTlaUiXJVec051j2SqyOU8OT
         MnjI/RAuduX+TNzbzpbw3wOmlhsXzfiqjdw+P87/NdRqSPaG6j371hLYPvYza7Rxo7lb
         xtNLsMH+6Ejc9rtbw7ouBjQMAXtB9yDgWwWJRanFvaMaQdkMw5kRqmyBWsmwh8HlKvTc
         Y1HKXvoDhvPkzcRQJ0+QJq006hOspF+/xbsGFE87FaJcNif2ccVS+cTo/qH1puUpwLQ+
         Od3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1H0Kr8NdTPDNAJ4whIcFCRZHEVI7wVTVLJ0HOgoRKVo=;
        b=p0fox9E4ja1PuJM4kwnYGbHEOi3wkLAsYI8hGnJba2zyu6bnQmJ47wWQzgDbbb+qJ2
         vmxnzfNZwLc5Mm0fEy6OW7h3IRBkVGV4guTeJM+dpokGLirU3HmjUOAiRskGC9TEiexU
         p3PxSzBx+jRIs0cmACiB2v5zccv5MmreudxUxLyl8TR2sGgYsm1fsFAmnsy9o17RvqZI
         aHYDyQ7EDa73ECSejVIT5X/3p4tLo2OyxKXoarqaTQ4hZ0KbSAI1usDVhzlDSlLEydv7
         JatK0LNTeElMX6TdxoxZiGd7Dm952g3/AF0uOuQM8Lphgpjg2ivZ/XGqN16ugeSaikpa
         KSnQ==
X-Gm-Message-State: AOAM530YgtHzwqwJDCWUGG9SAr2A/mtLHstLgFxwNVy0ZYfisyTTnU3x
        6PHHyV/E8Q9w1pOZ+qHLwjabY6BRNzbWRw==
X-Google-Smtp-Source: ABdhPJxVgY2lhH4ZnG+KrcXEKQafagmnA7cx1DahXeoN7i4qXEzuuuVJWWel4YAGT06SPePjv/Vx9w==
X-Received: by 2002:ac2:44bc:0:b0:448:30ec:685c with SMTP id c28-20020ac244bc000000b0044830ec685cmr10034760lfm.404.1647730439399;
        Sat, 19 Mar 2022 15:53:59 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z5-20020a196505000000b0044a12b953f9sm581520lfb.45.2022.03.19.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 15:53:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5 v2] U8500 clkout clocks v2
Date:   Sat, 19 Mar 2022 23:51:51 +0100
Message-Id: <20220319225156.1451636-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This second iteration adds patches that:

- Drops custom .is_enabled and .is_prepared implementations
  for the U8500 PRCMU clocks.
- Rewrite the PRCMU clocks to use clk_hw
- Then adds the new clkout clocks in the same style

Modernizing the PRCMU clock was necessary so the new clock
would not look off.

We can go on and fix the rest of the ux500 clocks to use
clk_hw style registration on top of this series if there
is desire.

Linus Walleij (5):
  dt-bindings: clock: u8500: Add clkout clock bindings
  clk: ux500: Drop .is_enabled state from PRCMU clocks
  clk: ux500: Drop .is_prepared state from PRCMU clocks
  clk: ux500: Rewrite PRCMU clocks to use clk_hw_*
  clk: ux500: Implement the missing CLKOUT clocks

 .../bindings/clock/stericsson,u8500-clks.yaml |  57 +++
 drivers/clk/ux500/clk-prcmu.c                 | 253 ++++++++-----
 drivers/clk/ux500/clk.h                       |  70 ++--
 drivers/clk/ux500/u8500_of_clk.c              | 349 ++++++++++--------
 include/dt-bindings/clock/ste-db8500-clkout.h |  17 +
 5 files changed, 464 insertions(+), 282 deletions(-)
 create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h

-- 
2.35.1


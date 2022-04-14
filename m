Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF55FC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 22:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbiDNWW0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiDNWW0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 18:22:26 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FA691ADB
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:19:59 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id r18so7767834ljp.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVI2dfsgSOLO2htNz0upjB4yRACLNzu4k7rX6kKtzIg=;
        b=kqmq64jm/5A9pFR4/LXTYueNq6Bn8uAfqB07LssUBsoLhvko3YMBOr8yIyudwJbD1W
         MDzejUOBgLzhZxx4AkeMlScKofNmaQIfBbf9Z+CrC/zm7aCIgDpfaoLgOTq7h2jjPD65
         nUJXhv491kuZFojQbc6b3nS5TNHB2cxV7id3J0zc9SRGlhXGQeeQOQadMVjy5pF/F48L
         zS+OY75bt/Krdj3IbqmjrwU/y26ybcwV17WSUYz5vwkzt0HaAV1PF8yUV1N2lw1gAY/R
         7UV+95H38/2+q6hqJAO3N6u37kaz7dvc94hhA8r7OVHuKHFLfiVrwKkdpiiGEp0JB3q8
         R7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVI2dfsgSOLO2htNz0upjB4yRACLNzu4k7rX6kKtzIg=;
        b=SbvQURxnZhDKJF0kpfpDqINe0G+povjS1E42uGs1d5+FdQ/zwsPigbXZJV7tjbNoh5
         30peorEpH5srHqgFhtfRUm8pO8ZqwhWBisltn21tbZjo5kU9YnprxvtMpS1caui+CVYp
         ia2r6/Sdh/ZSRx6NWgJdZMIU19h23E2uFvcJJWcZA/EX6kIfMdUkP9GAdytEbetowWpO
         x28uJLudMkhSWBKuH9uRRXeC5d05gIjmIY2epPhO2Dqs7xPX7dqJ3/5h+/DsAF49lANV
         xIDmsp/oaK4feYyS+nNMKrTQ5LYST+wtZPWP6g/8xji1szMMorAlznMZGSooZf6ZhOqb
         pk6g==
X-Gm-Message-State: AOAM530lXVvt88+LBig0sOBwfk4solq1ghXmq2/lhqyuIzFLjKmtqesY
        2KxGTvSi4QAmFuQPRHcJSGFTRw==
X-Google-Smtp-Source: ABdhPJzamfKnSI4hlcFuydynJdp6/1S6Ib/k1xTV14f+mbmvSYwTvkDYsIooirrsLT0sFrm7q88g0g==
X-Received: by 2002:a2e:a4cc:0:b0:24b:652a:40a2 with SMTP id p12-20020a2ea4cc000000b0024b652a40a2mr2762615ljm.425.1649974798280;
        Thu, 14 Apr 2022 15:19:58 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512029200b0046b9ba1c0edsm125169lfp.224.2022.04.14.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:19:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5 v3] U8500 clkout clocks v3
Date:   Fri, 15 Apr 2022 00:17:46 +0200
Message-Id: <20220414221751.323525-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This third iteration just fix a few small snags on the last
patch and picks up Ulf's review tags.

The second iteration added patches that:

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
 drivers/clk/ux500/clk-prcmu.c                 | 252 ++++++++-----
 drivers/clk/ux500/clk.h                       |  70 ++--
 drivers/clk/ux500/u8500_of_clk.c              | 350 ++++++++++--------
 include/dt-bindings/clock/ste-db8500-clkout.h |  17 +
 5 files changed, 463 insertions(+), 283 deletions(-)
 create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h

-- 
2.35.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA9BC07E98
	for <linux-clk@archiver.kernel.org>; Sun,  4 Jul 2021 02:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3276C61935
	for <linux-clk@archiver.kernel.org>; Sun,  4 Jul 2021 02:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhGDCnT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Jul 2021 22:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhGDCnT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Jul 2021 22:43:19 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BBBC061762
        for <linux-clk@vger.kernel.org>; Sat,  3 Jul 2021 19:40:44 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 17so13055523pfz.4
        for <linux-clk@vger.kernel.org>; Sat, 03 Jul 2021 19:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uU2NpTsvF59o2UDF/rj+QinI8SocqNRod9hipss6dI8=;
        b=pbp6maqFDT5zuP/ZrL5tV9rHjvjUduTwnLhwaeC8P1nZQU+quf2RBzPUpl4YI1jjvx
         54dnlZzo+VTylHTUWvm329o0x/FXj+42aEOBN8Hfqpn5YO1E+7DMxvwCI61SqcMzjStT
         w0amGTB4ovAxCGANkd5GAFhsW+j0IQKn/XOhj/tKySjxH9TNfNWM0QNBGxHtEYuaOInB
         u3pAcdQ2CM8XLgwIrPnGtiYxLnrxV7jazFsAzPzF82UeduVO7nxcOp+QRYD1AWpDjGMx
         5yfFo+H++WIZGxV0FHEKuDuFXMGTV7tMr/g0xSm3M/6VKLaRM4H/VT2GcZHFW9FyYvCK
         AtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uU2NpTsvF59o2UDF/rj+QinI8SocqNRod9hipss6dI8=;
        b=CbBean8ZDbptWRgsojCpUc5pwLqCmt2qKwRdYMU+eERgdm2fLlhN9OiAVJBvFsuTOz
         RPzqfN8o9yRP/Zh6mXtgwPUbEI7oZw7aCzoawBFGOhi6riqHdwMWHzh3z5CWE4NiTOX/
         ItQvf5oCaAlCB0C5pNBc2ue6bguY+Ap/4f5dfKw8/kVyv8uG0pJGInuSVtIQla01I9k6
         0uA1qpEJjZO4YisSdGXOX7GehIjLNJNTdzHXwf2h4TlssgVtqeaL0bXnb487gEqoe/vS
         DdR4fuYA3sRM4yZ6wttjtV70bVnNA4fGpzwrJUhi2AYbBOL/m5+o/oy8FlXitAz/HttI
         HCqQ==
X-Gm-Message-State: AOAM532Zi+1Wx+QQGsykpY8LTp9683a3ofxIpvpmKrP/ArTWA9P2BOsv
        nAvB//uB98HPmTL8jTHb6jAWAw==
X-Google-Smtp-Source: ABdhPJwemRyLkkvqTWv+WSoRHmb6LSFLzTrS3NzI2cS3xpY4VQrMzxWJYFxyhduWhnwLwYm75XvF0w==
X-Received: by 2002:a05:6a00:1c45:b029:31c:5106:e354 with SMTP id s5-20020a056a001c45b029031c5106e354mr1865849pfw.15.1625366444025;
        Sat, 03 Jul 2021 19:40:44 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g17sm9394624pgh.61.2021.07.03.19.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 19:40:43 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/4] Add MSM8939 APCS/A53PLL clock support
Date:   Sun,  4 Jul 2021 10:40:28 +0800
Message-Id: <20210704024032.11559-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
(little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
respectively.

Changes for v2:
- Reword the commit log of first patch as suggested by Stephen.
- Drop 'clock-output-names' bindings and use @unit-address to get unique
  a53pll/mux clock names.
- Use 'operating-points-v2' bindings to pass frequency table via OPP, so
  that we can use one single compatible for all 3 MSM8939 a53pll.

Shawn Guo (4):
  clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
  clk: qcom: a53pll/mux: Use unique clock name
  dt-bindings: clock: Update qcom,a53pll bindings for MSM8939 support
  clk: qcom: a53-pll: Add MSM8939 a53pll support

 .../bindings/clock/qcom,a53pll.yaml           |  3 +
 drivers/clk/qcom/a53-pll.c                    | 68 ++++++++++++++++++-
 drivers/clk/qcom/apcs-msm8916.c               | 10 ++-
 3 files changed, 76 insertions(+), 5 deletions(-)

-- 
2.17.1


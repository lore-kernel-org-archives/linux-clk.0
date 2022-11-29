Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D25BC4167B
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 07:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiK2HOG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 02:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiK2HOE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 02:14:04 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC932AC71
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 23:14:03 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id jn7so12540669plb.13
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 23:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtj4EzuHnodtWtwYDI9OOTsnptwEOETlUZBcz/3372k=;
        b=kyP4uiwGXyDgVqDTGoCaw/78YQeCD69XjjBrGYMopqpcuEDZIvInEx/Fi5b1U2XaTt
         b5bLElSN+j7jHnHXL9YnNcTRiwLiSn5Qeel81HL0/Sirj0H7SKVkWPDPFIOHE2BVaGvA
         eQDn91aQf44U+wMqG1CqjBF0o50njS8U7t3OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtj4EzuHnodtWtwYDI9OOTsnptwEOETlUZBcz/3372k=;
        b=eZ+I0ovjU3wv+gJhLdhK0OOP0WkE0zImNp3KWiEhdJm5agZLpv5LS6H2BafmLH7PX6
         CpdNh31ma2fMnjt1+F+oLL/a/L65isNlhpSiI6pIGuwsaoLB2vOOFRF+6rksau+xUGWl
         7loM1Xjv6ajkDphPeCWoD9z5fn+QIln2qAFEBa/7rYfFYHGvI+PysXt0ig/WZ8FeMApp
         3Ta5553RKRqISeJL06tvNYH/z+U9Zf4wIdW76bh5uKeUtfhQPVDDx0Pv+0M5GqwMHI95
         Fo11yw4wWcWtAUbs+zV1z5NFLe230pXqnP935T6lZah1LTwZmyD6hIQiR4YwcRC28yzd
         oOwg==
X-Gm-Message-State: ANoB5pmj9SrCF6HwXZ8nMGIU+CdCrMJYeKxINAss5t1b5jcbzIposI6Q
        28T3SqWRbX6hqmfqdFlxLdpbMA==
X-Google-Smtp-Source: AA0mqf4fDGZ8xAyjEF56qfkDg0qbpzX9vPVE3FfOuM6JAorO5szAigWFaIUnXHiGPDQ6SLi/ln26nw==
X-Received: by 2002:a17:90b:4109:b0:219:f99:2809 with SMTP id io9-20020a17090b410900b002190f992809mr20095927pjb.36.1669706042752;
        Mon, 28 Nov 2022 23:14:02 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id ik16-20020a170902ab1000b00172f6726d8esm9974908plb.277.2022.11.28.23.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:14:02 -0800 (PST)
Date:   Tue, 29 Nov 2022 15:13:59 +0800
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [GIT PULL] MediaTek Clock Changes for 6.2
Message-ID: <Y4WxN+u0nB4gg39Z@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git tags/mtk-clk-for-6.2

for you to fetch changes up to a46315295489933209e902638cd287aeb5f982ab:

  clk: mediatek: fix dependency of MT7986 ADC clocks (2022-11-29 14:49:29 +0800)

----------------------------------------------------------------
MediaTek clk driver changes for 6.2

Some more cleanup work, and a new driver for frequency hopping
controller hardware.

- Remove flags from univ/main/syspll child fixed factor clocks across
  MediaTek platforms
  - The idea is to not have the clk core try to reconfigure the system
    PLLs, i.e. have them be stable
- Fix clock dependency for ADC on MT7986
- New driver for frequency hopping controller hardware on MT8186
  - This does frequency hopping and spread spectrum clocks in hardware

----------------------------------------------------------------
AngeloGioacchino Del Regno (10):
      clk: mediatek: clk-mtk: Allow specifying flags on mtk_fixed_factor clocks
      clk: mediatek: mt8186-topckgen: Drop flags for main/univpll fixed factors
      clk: mediatek: mt8183: Compress top_divs array entries
      clk: mediatek: mt8183: Drop flags for sys/univpll fixed factors
      clk: mediatek: mt8173: Drop flags for main/sys/univpll fixed factors
      clk: mediatek: mt6795-topckgen: Drop flags for main/sys/univpll fixed factors
      clk: mediatek: mt8192: Drop flags for main/univpll fixed factors
      clk: mediatek: mt8195-topckgen: Drop flags for main/univpll fixed factors
      clk: mediatek: mt8186-mfg: Propagate rate changes to parent
      clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier

Daniel Golle (1):
      clk: mediatek: fix dependency of MT7986 ADC clocks

Johnson Wang (4):
      clk: mediatek: Export PLL operations symbols
      dt-bindings: clock: mediatek: Add new bindings of MediaTek frequency hopping
      clk: mediatek: Add new clock driver to handle FHCTL hardware
      clk: mediatek: Change PLL register API for MT8186

 .../bindings/clock/mediatek,mt8186-fhctl.yaml      |  53 ++++
 drivers/clk/mediatek/Kconfig                       |   8 +
 drivers/clk/mediatek/Makefile                      |   1 +
 drivers/clk/mediatek/clk-fhctl.c                   | 244 ++++++++++++++++++
 drivers/clk/mediatek/clk-fhctl.h                   |  26 ++
 drivers/clk/mediatek/clk-mt6795-topckgen.c         |  76 +++---
 drivers/clk/mediatek/clk-mt7986-infracfg.c         |   2 +-
 drivers/clk/mediatek/clk-mt8173.c                  |  76 +++---
 drivers/clk/mediatek/clk-mt8183.c                  | 216 ++++++----------
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c       |  66 ++++-
 drivers/clk/mediatek/clk-mt8186-mfg.c              |   5 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c         |  89 ++++---
 drivers/clk/mediatek/clk-mt8192.c                  |  76 +++---
 drivers/clk/mediatek/clk-mt8195-topckgen.c         |  78 +++---
 drivers/clk/mediatek/clk-mtk.c                     |   2 +-
 drivers/clk/mediatek/clk-mtk.h                     |   7 +-
 drivers/clk/mediatek/clk-pll.c                     |  84 +++----
 drivers/clk/mediatek/clk-pll.h                     |  55 +++++
 drivers/clk/mediatek/clk-pllfh.c                   | 275 +++++++++++++++++++++
 drivers/clk/mediatek/clk-pllfh.h                   |  82 ++++++
 20 files changed, 1135 insertions(+), 386 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
 create mode 100644 drivers/clk/mediatek/clk-fhctl.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl.h
 create mode 100644 drivers/clk/mediatek/clk-pllfh.c
 create mode 100644 drivers/clk/mediatek/clk-pllfh.h

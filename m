Return-Path: <SRS0=k6hG=65=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE490C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 15 May 2020 14:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C943D2076A
	for <linux-clk@archiver.kernel.org>; Fri, 15 May 2020 14:27:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSzF8uWM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgEOO1e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 May 2020 10:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOO1e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 May 2020 10:27:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2ADC061A0C;
        Fri, 15 May 2020 07:27:33 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j5so3826029wrq.2;
        Fri, 15 May 2020 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZqEfVTuDY9bEUsJPlzwIaQx1lrVA14fy9lOBt0SuZsI=;
        b=nSzF8uWMlBuWgPkJo620l4HBDnpGUQc0GuB5wiBQybK2PHDmdqv74v6aDOtP2rH6ti
         K4m1KkwrO+q8BvTwTabJcixy71OE6H5xL2sy44a0g8Un/GwifvjFpLegkil8BRcG9pn7
         08icjkBQ6zcvYqU6Z+irBm59G0ASQ7vDutWt5X4BLHcGV6tY6/IF6Ekm9iS3KZfn7Ne0
         Ky53qLFw2VzACWQ61ZOc3S+vxNHvHn44pv9Ga/RAarZflluzKZXRRjNzwvkxqqmcCULQ
         edKnX/UnxRv3FTNOq+K5v6tNS/cUmzvXAC7/Ae4kFoahElfIX8sA2TMJcn1kpQxCVtqy
         CJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZqEfVTuDY9bEUsJPlzwIaQx1lrVA14fy9lOBt0SuZsI=;
        b=P5jjjWU2utfV6bMjW9Jc7bcoSconaansFe4IqxIvJr2fKGDc8SuCklnKXRQhVZazS7
         4Q6YOrypp8m4NbBb7muq16lEml4ebBSk/HnKGeYMsGUqDhax30DSy558L7iuSuTqW8NN
         rPgiSV45/RqksXqDXAA6hxVqk85o86TNUsK6tDJrumExjulYCShle1iyc2LccupNLd0w
         yCuKDCjZdFr9XJAZmRv9A5J6sfjhZKvrl7C7gmeL4GnTfF28VVTPr0xfhU4CxO6OoXPo
         grVIrgPEsHM6j7TKC9sj7oKyqaszYmeB1i4vghad3xXdo3KBLDvMEWBe2Q6BySxpmpRw
         oqpQ==
X-Gm-Message-State: AOAM531SK606U0PTjjHHs8GFqfhc+BTEV2QOI70iwb/CjRgNLQ7BIgzS
        qoDriXxAaLLeMyIZn9fqLPE=
X-Google-Smtp-Source: ABdhPJwB9R/SLlX2Uxqudh6APRzsvbqZz9CPXwL6WTdh11Gs3GYpUtZTTqDrfcrZ4txXKIu5R7d7lA==
X-Received: by 2002:adf:f4c4:: with SMTP id h4mr4675606wrp.142.1589552852640;
        Fri, 15 May 2020 07:27:32 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id a10sm3841945wmf.46.2020.05.15.07.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:27:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:27:30 +0200
Message-Id: <20200515142730.1573945-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-clk

for you to fetch changes up to dec396322d25ca5ce2f307b6da897060fdf9a782:

  clk: tegra: Add Tegra210 CSI TPG clock gate (2020-05-12 22:48:43 +0200)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.8-rc1

Thise are a couple of changes to implement EMC frequency scaling on
Tegra210, CPU frequency scaling on Tegra20 and Tegra30 as well as a
special clock gate for the CSI test pattern generator on Tegra210.

----------------------------------------------------------------
Dmitry Osipenko (5):
      clk: tegra: Add custom CCLK implementation
      clk: tegra: pll: Add pre/post rate-change hooks
      clk: tegra: cclk: Add helpers for handling PLLX rate changes
      clk: tegra20: Use custom CCLK implementation
      clk: tegra30: Use custom CCLK implementation

Joseph Lo (4):
      clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
      clk: tegra: Export functions for EMC clock scaling
      clk: tegra: Implement Tegra210 EMC clock
      clk: tegra: Remove the old emc_mux clock for Tegra210

Sowjanya Komatineni (2):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      clk: tegra: Add Tegra210 CSI TPG clock gate

Thierry Reding (2):
      Merge branch 'for-5.8/dt-bindings' into for-5.8/clk
      clk: tegra: Rename Tegra124 EMC clock source file

 drivers/clk/tegra/Kconfig                          |   4 -
 drivers/clk/tegra/Makefile                         |   4 +-
 drivers/clk/tegra/clk-pll.c                        |  12 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c           | 212 ++++++++++++
 .../clk/tegra/{clk-emc.c => clk-tegra124-emc.c}    |   0
 drivers/clk/tegra/clk-tegra20.c                    |   7 +-
 drivers/clk/tegra/clk-tegra210-emc.c               | 369 +++++++++++++++++++++
 drivers/clk/tegra/clk-tegra210.c                   |  94 ++++--
 drivers/clk/tegra/clk-tegra30.c                    |   6 +-
 drivers/clk/tegra/clk.h                            |  24 +-
 include/dt-bindings/clock/tegra210-car.h           |   6 +-
 include/linux/clk/tegra.h                          |  27 ++
 12 files changed, 730 insertions(+), 35 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra-super-cclk.c
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAA7C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47D6164E8A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 05:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBKFXR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 00:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhBKFXN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 00:23:13 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB3BC061756
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:32 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d13so2753733plg.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 21:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnNepfMt6SkUB80VLnkD+4T2OWTmkVQGDZU4Ef/AiRA=;
        b=hKAPTehETeAxx7YcildAqVGRxa9k7ELIQjfmGk4Buh3w43CGMdrfgNra+j/Iglny9w
         vgW1YGq5Y9ZGcps7qhIbqYR/NRZr5vIJUzI77l4Ze4v/bJLU+QGS8Rd80d4ZDz4w5ZYB
         21CM1nhjRCggoqQyCGLAj2DatNv6lZel+kdhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnNepfMt6SkUB80VLnkD+4T2OWTmkVQGDZU4Ef/AiRA=;
        b=qBnCzhdEZGGgtmvXoSZlKme+o0bIqYgshfX3CfGFHX3kJNNKtpS26bfv+5shO5x5oO
         niQ7fykrg6DRVl1D74GcYREtbCEG3scooZTnz2SMYyYRPGla94/8+aCjSbtXyAqvgc8p
         0PMG1N/t4YvseDFDgaPipkoRQmTq1gRiTuz9tyX1F1GOuOSOztBwWuUKsZDcJ5hrkl3M
         wXrhbv6FVD/z1RO1qV5TeTie9DWwIgl8ASFEAXP1uS09M/MzDEtW+NRV4B05T2RKvs97
         x/e/3De+pnW5EBmMay6OqDpDPASK68vitiTGrSpEwbD/lyBMs259VoTUS4uqB020Ed/u
         fw1w==
X-Gm-Message-State: AOAM531vhMLJyoLbmQDC3+YSiu84hOgk9/MQAsy76t+Va+LygLHcsHxy
        HOVCc3YlwO2l3KIvRmeVSbjwy3Zb4czVAg==
X-Google-Smtp-Source: ABdhPJxm9oq3kysAb4UsaHFK9obWwRxLAj7T0n4HlVeKP+0AkVLpg2wqoyeo8d/MtmBWD0fi4V2DXw==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id h7mr2350979pjs.200.1613020952009;
        Wed, 10 Feb 2021 21:22:32 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id o21sm3493511pjp.42.2021.02.10.21.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 21:22:31 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        devicetree@vger.kernel.org
Cc:     w@1wt.eu, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 0/7] ARM: mstar: Basic MPLL support
Date:   Thu, 11 Feb 2021 14:21:59 +0900
Message-Id: <20210211052206.2955988-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds support for the MPLL block that is present in
MStar/SigmaStar ARMv7 SoCs.

This block is intended to be set and forgotten about before
Linux is running so all it actually does it read the registers
and calculate what the output frequencies should be.

We only care about this block because there are upstream dividers,
gates, muxes etc that need something between the input crystal
and themselves to calculate their own rates.

Changes since v1:
  - The clock output name related parts of the binding
    description are gone. Clock names are generated inside the driver.
    I dropped Rob's reviewed-by because of these changes.
  - A devm helper has been added for clk_hw_register_fixed_factor()
    to allow drivers to register multiple fixed factor clks  
    without having to handle all of the clean up.             
  - Numerous clean ups to the mpll driver itself based on Stephen's 
    feedback.

Daniel Palmer (7):
  dt-bindings: clk: mstar msc313 mpll binding header
  dt-bindings: clk: mstar msc313 mpll binding description
  clk: fixed: add devm helper for clk_hw_register_fixed_factor()
  clk: mstar: MStar/SigmaStar MPLL driver
  ARM: mstar: Select MSTAR_MSC313_MPLL
  ARM: mstar: Add the external clocks to the base dsti
  ARM: mstar: Add mpll to base dtsi

 .../bindings/clock/mstar,msc313-mpll.yaml     |  46 ++++++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  23 +++
 arch/arm/mach-mstar/Kconfig                   |   1 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-fixed-factor.c                |  39 ++++-
 drivers/clk/mstar/Kconfig                     |   5 +
 drivers/clk/mstar/Makefile                    |   6 +
 drivers/clk/mstar/clk-msc313-mpll.c           | 155 ++++++++++++++++++
 include/dt-bindings/clock/mstar-msc313-mpll.h |  19 +++
 include/linux/clk-provider.h                  |   4 +-
 12 files changed, 296 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-mpll.yaml
 create mode 100644 drivers/clk/mstar/Kconfig
 create mode 100644 drivers/clk/mstar/Makefile
 create mode 100644 drivers/clk/mstar/clk-msc313-mpll.c
 create mode 100644 include/dt-bindings/clock/mstar-msc313-mpll.h

-- 
2.30.0.rc2


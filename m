Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0653C636CC
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbjBCGJE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjBCGJD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:09:03 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B826B009
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:09:02 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id r34-20020a05683044a200b0068d4a8a8d2dso1089627otv.12
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onrI71TD6WqFZBzvBnCt+Gild5OdRHzAV9MK+sKDnqY=;
        b=gYQw/IZoNsuFi2SH+ea5NNpnPFwmqf03PJiE7ERwjJ6xFjfgcjQ161n03LOiPIHxHk
         LjrEmv3Gw7ELY1yev4HdfoFiXyUUZpc2a9BHF4lPqVOh6VS/CFm44oayMOfNosX7z14I
         Vah3pOgiT492kV6lxqngLnplVklrplugAEi5hyHqEj1iZgqkQsisMr87qpmJDeSyeyv3
         bo5N4wpZAkI2wrOE/BvX04ejUc5vcbkoRi8OWmR+b8riJZ7hpgHH41Ikt37JnyNzspwy
         pJ0nomi+uL6C2/TDJ3KYVaI1LGEkENRaYe1SoDZE8E7LDxUb4Gu29dOoz8I7hvwu3rav
         v0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onrI71TD6WqFZBzvBnCt+Gild5OdRHzAV9MK+sKDnqY=;
        b=rGhOQERzlKjuaKHQX8YnKoAp6A0oa/Wl/zTOg+mwNefKHVBahOad7J1nXaZUWfvJWx
         k0tPJk5PJ1l0CHDP/icNwuVNHLZipMiepG8rCCxjs5fdDuiQIFZ85Lt99DwTy1Yshw5T
         DG/XRtLTLc5CY+bnUPSTArY5du8B55H0s50+0LVLXIgP9vg1CAvfdo6BSxQSswTf6UJj
         WU11Q34nWCNRHTPkTwrnfgyUeMOhELRlXfebGj+QK4sEQxFsygIjARejEs2UN4SsgDw0
         I6nXAXT4rALJ/4GqTBlyUd6X24+R8k5h4pyuL83Tjg5g+qUMT0hiKSthD+FWmUDz/c6R
         kX6w==
X-Gm-Message-State: AO0yUKWcCntQLAu+yBvDpHoD6nKNZJzHlASdttdvDh3DOMbADzwqLXRw
        SfzXdaG7xt7C1FGzz50sCNiweA==
X-Google-Smtp-Source: AK7set/Eaw+FWQJ5ZOw2BxuOM6d1N0+6Zivr73NDLw4GGuMzl5IttPfbTXwzt/Dcc4KoTTjeq+aRhg==
X-Received: by 2002:a9d:148:0:b0:68d:4eb7:49d9 with SMTP id 66-20020a9d0148000000b0068d4eb749d9mr2730497otu.37.1675404541752;
        Thu, 02 Feb 2023 22:09:01 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id 88-20020a9d02e1000000b00684cbd8dd49sm692895otl.79.2023.02.02.22.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 22:09:01 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] clk: samsung: Add PM support for ARM64 Exynos chips
Date:   Fri,  3 Feb 2023 00:09:18 -0600
Message-Id: <20230203060924.8257-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to prepare for PM enablement in clk-exynos850, common PM code
was extracted from clk-exynos5433 to clk-exynos-arm64. Also some related
cleanups were done prior to that. More specifically:

  - patches #1..5: cleanups
  - patch #6: PM code extraction

During the extraction of the exynos5433_cmu_probe() content to
exynos_arm64_register_cmu_pm() some code was reworked a bit, and also
split into smaller functions. In particular:

  - cmu_data structure now contains a pointer to ctx, which is now
    allocated in samsung_clk_init()
  - cmu_data structure initialization was moved into separate function
  - code for configuring gate clocks was added (optional)

Which in turn resulted in somehow modified code of probe function:

  Original
  --------

    ...
    devm_platform_ioremap_resource(...);
    samsung_clk_init(...);
    exynos_arm64_cmu_prepare_pm(...);
    exynos_arm64_enable_bus_clk(...);
    platform_set_drvdata(...);
    ...

  Modified
  --------

    ...
    platform_set_drvdata(...);
    exynos_arm64_cmu_prepare_pm(...);
    exynos_arm64_enable_bus_clk(...);
    exynos_arm64_init_clocks(...);
    devm_platform_ioremap_resource(...);
    samsung_clk_init(...);
    ...

That shouldn't really change the logic or mode of operation. It was
preliminary tested on Exynos850 based board, with some extra patches on
top of this series (will be submitted later).

Marek, could you please test these patches on Exynos5433 platform, and
also review accordingly?

Thanks!

Sam Protsenko (6):
  clk: samsung: Don't pass reg_base to samsung_clk_register_pll()
  clk: samsung: Remove np argument from samsung_clk_init()
  clk: samsung: Set dev in samsung_clk_init()
  clk: samsung: Extract clocks registration to common function
  clk: samsung: Extract parent clock enabling to common function
  clk: samsung: exynos5433: Extract PM support to common ARM64 layer

 drivers/clk/samsung/clk-exynos-arm64.c   | 219 +++++++++++++++++++++--
 drivers/clk/samsung/clk-exynos-arm64.h   |   3 +
 drivers/clk/samsung/clk-exynos4.c        |   6 +-
 drivers/clk/samsung/clk-exynos4412-isp.c |   3 +-
 drivers/clk/samsung/clk-exynos5250.c     |   5 +-
 drivers/clk/samsung/clk-exynos5420.c     |   5 +-
 drivers/clk/samsung/clk-exynos5433.c     | 157 +---------------
 drivers/clk/samsung/clk-pll.c            |  11 +-
 drivers/clk/samsung/clk-s3c2410.c        |   6 +-
 drivers/clk/samsung/clk-s3c2412.c        |   5 +-
 drivers/clk/samsung/clk-s3c2443.c        |   6 +-
 drivers/clk/samsung/clk-s3c64xx.c        |   4 +-
 drivers/clk/samsung/clk-s5pv210.c        |   6 +-
 drivers/clk/samsung/clk.c                |  64 ++++---
 drivers/clk/samsung/clk.h                |  10 +-
 15 files changed, 282 insertions(+), 228 deletions(-)

-- 
2.39.0


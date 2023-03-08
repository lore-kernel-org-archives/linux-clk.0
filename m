Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3F8C678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjCHXi2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjCHXi0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 18:38:26 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CCE57D09
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 15:38:24 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bm20so364482oib.7
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 15:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O5FO4JwEp2Kjzh0k17TvUro3yR+jx+xZgIAaan5bX5Y=;
        b=YNsoYLnfDHjDb8JcTVyzn6779ksJvl46OwrzuWq1h9NZr5FePk2pq3zfpbmsXWKmCP
         F0xBViNocLHXPrN7vgv2x292+vQNgAsQdDGR0mruvhYoew1N7Bs4GMYxfLQiG0p3ptfU
         zNka13oasgbN7uCLS7tSEDYa8O/kf2EoLJj4uPz5hXXTk2Oa/1AIXqjWVNj7axnh03R1
         EezCvHZweLK4S/LlV6xZ4W+ztsnRYzjcyzXGwMcoDaaEUndB4ldr1LA9OuaHDCR2VJWI
         WZ3VhFo/4csbX2QfT/WgbBtr37ekXHAzkpjLV5gYue/zxSZ8h+WYLbOvG2Yt4zTCfzix
         hhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5FO4JwEp2Kjzh0k17TvUro3yR+jx+xZgIAaan5bX5Y=;
        b=m1fsKhUeFAcYQtN3XKgdSpS21C5LpMgEMMAGX3/IT/sHkAJRzcmcKamlbNwooAK5ta
         SWuZVKYV2jGyQKbNEHZzscHsKwHXy+U44zR7A0EOXYB85aGqtAK5FXyP35ibyvhj382V
         UYMnLY78owQIi7b52Iik4kZr1ym1Tvyd+jaecqkHFHXob73mGJg/VQmWe8AtdYsvRtMX
         ACxLCNWZCKWG6pQ6ylccZ7LDwvytio31xhiJtrr91j1WGBgDCtfPd0wwKfXkaVL/AaVy
         ICO5TCkCjSeAz+HOi5Vk5db3WGHvlP/1b1OdPMv4j95FWCamQRvMD7FKDguv5kcdKNyo
         GDhw==
X-Gm-Message-State: AO0yUKUPBUwYLvbgugnyglqGNxnfVUoVhSpKGRvVJZalgTqiY1D3Z10M
        hmxgyd16jr9hKZBwNO+ewZnEZA==
X-Google-Smtp-Source: AK7set+XFOsOoucxEaYKPa3vsibaK3J2lN8yAlAGdVHAY22gDwluoI76GNWfvkybvR34AfUwUARGwg==
X-Received: by 2002:a05:6808:b2c:b0:383:e7c8:4000 with SMTP id t12-20020a0568080b2c00b00383e7c84000mr8584833oij.13.1678318703864;
        Wed, 08 Mar 2023 15:38:23 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id r36-20020a056808212400b00383d9700294sm6772901oiw.40.2023.03.08.15.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:23 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] clk: samsung: Enable PM in Exynos850 clk driver
Date:   Wed,  8 Mar 2023 17:38:15 -0600
Message-Id: <20230308233822.31180-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

One difference Exynos850 has w.r.t. other Exynos platforms in terms of
PM is that EL3 monitor handles TZ protection of CMU domains on
suspend/resume for us. This series enables PM support in clk-exynos850,
which was originally borrowed/extracted from clk-exynos5433 driver, and
also adds other missing bits, like adding those SMC calls, keeping PMU
clock always enabled and configuring MUX clocks before the suspend.

Dependencies inside of this series:

  - patch #7 must go after #4
  - patches 3-6 should go in the same order as in the series
  - better to keep patche #1 and #2 before the rest of patches,
    so that the driver and dts always use documented properties

Sam Protsenko (7):
  dt-bindings: clock: exynos850: Add power-domains property
  dt-bindings: clock: exynos850: Add tzpc property
  clk: samsung: Implement PM SMC calls for ARM64 Exynos SoCs
  clk: samsung: exynos850: Make PMU_ALIVE_PCLK critical
  clk: samsung: exynos850: Add suspend state for all CMUs
  clk: samsung: exynos850: Enable PM support in clk-exynos850
  arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller

 .../clock/samsung,exynos850-clock.yaml        |  13 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   1 -
 drivers/clk/samsung/clk-exynos-arm64.c        |  39 +++++-
 drivers/clk/samsung/clk-exynos850.c           | 112 ++++++++++++++++--
 4 files changed, 153 insertions(+), 12 deletions(-)

-- 
2.39.2


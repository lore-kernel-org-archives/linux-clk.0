Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00847C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 04:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbjBWEW6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbjBWEW3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 23:22:29 -0500
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B0B4AFE4
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 20:21:20 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1723ab0375eso8670658fac.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 20:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AP/utragEALezW3Ha75no5d74aFMJt+dhmrs5kxzbYM=;
        b=trwPlfAaZmqWVHbqG56+BQQgrz4to+s36ShbBlqZxc1IYWDQeIdikgrVQnjZLhgMcE
         I5u19YbZglTI7Od7NffsaMdUmiYzWSLGVvjmhuABb5W3PkTTgFmDL4J78BjzQOYb66eY
         Nlg3/hmcJuchXHUzFMDAQCZOOXBlQxLSuZoZB1b353xmylnQIYOVGkv/rjKF3SyCb4Fe
         F/bcZaQwfvZSzR1gmlurEFGSgQRU+0oxKUgVxoN5JjJEUHILpaoH4X3JtT06vTeHq6BS
         OJlIny5z43/C5nUzRafzM8lFsCNjUesAI85J04MqX4gzLot1diujtBsYdYPYpGFqEgP7
         TXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP/utragEALezW3Ha75no5d74aFMJt+dhmrs5kxzbYM=;
        b=H03NxT7TH6nGE+BGqzF1xahjsuw2ihNIMOdmWSV3mCZ0Q/T8f1bofSUGap6+9hnPUK
         /Eog9qEqj48oSmoABbniioQMw0IZf27yZYpNVxBafPKJFuWXHpXRqP9dlytJKYaMQBN9
         bhb+158JrzHbx6R+u2Deo/yRXK2yZ8nIFKLw2/qYXzgZ2mUzt7A9nk6KpgCtoB2wnuTr
         EhRgmHcdNW2Fd6GNXQ+THoH80A/MT1Op+pV6hYbkWMmkMAR7W/w8IPPwSdFZjirdbywO
         bNovN4SwRkmAzdZRcZhyMQIxSyiNl4NIC2rBhRISyQgfp+cB6Ot/RPJFHR9/+PBqdQ90
         yPkw==
X-Gm-Message-State: AO0yUKULXxqBmohtDvHRkqrfTPbLwan8+suepzH5spmm171bUqAPENjP
        g6uVUxmcjN7HoaN6m8tKKugQzg==
X-Google-Smtp-Source: AK7set8OI207kgdyNYqKRL+J02jkEgjZ2aDTnLjWbJFGcw8gU+Xa69jUDpGbKyLsnH/EHUz4FQGP1w==
X-Received: by 2002:a05:6870:6586:b0:16d:ea08:cd96 with SMTP id fp6-20020a056870658600b0016dea08cd96mr9717419oab.43.1677126078469;
        Wed, 22 Feb 2023 20:21:18 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id p3-20020a056870a54300b0016a37572d17sm5807383oal.2.2023.02.22.20.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:21:18 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] clk: samsung: exynos850: Add missing clocks for PM
Date:   Wed, 22 Feb 2023 22:21:27 -0600
Message-Id: <20230223042133.26551-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As a part of preparation for PM enablement in Exynos850 clock driver,
this patch series implements CMU_G3D, and also main gate clocks for AUD
and HSI CMUs. The series brings corresponding changes to bindings, the
driver and SoC dts file.

Changes in v2:
  - Rebased all patches on top of the most recent soc/for-next tree
  - Added A-b and R-b tags
  - Minor fixes

Sam Protsenko (6):
  dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
  dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
  clk: samsung: clk-pll: Implement pll0818x PLL type
  clk: samsung: exynos850: Implement CMU_G3D domain
  clk: samsung: exynos850: Add AUD and HSI main gate clocks
  arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC

 .../clock/samsung,exynos850-clock.yaml        |  19 +++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   9 ++
 drivers/clk/samsung/clk-exynos850.c           | 139 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   1 +
 drivers/clk/samsung/clk-pll.h                 |   1 +
 include/dt-bindings/clock/exynos850.h         |  28 +++-
 6 files changed, 194 insertions(+), 3 deletions(-)

-- 
2.39.1


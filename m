Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03563C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbhLOQJK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhLOQJJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:09:09 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF36C061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:09 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t18so39015468wrg.11
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=miak/i2hpYLrUnHAJtCSqYH++KiQVAx0lzOfX3VFDhs=;
        b=YLi+Map8CrZDUMzwjQftVbIvXrD/TGP48S7VMuAlfV4OA9QBsCobU0lZvNTKgmO4Bd
         VMiaDUtne7LqIdkK4A1i7n5NOio6+cRyMfqvu+gXr4R4HjDpPe0327RaIaYUMKLRZlhI
         o2OzS2sZLp9WdYnoVswGfp0ECWlMrrilKGoIrpa8nWY8dGafejh9sTAaUW2dK5nBhy81
         lIdvX6E11MUFCyfZOXP7ppSiwuK7lCE/8QCC+bYxrUk+mBQnemzNiPWrmpWeAiHdgcCH
         5+SLT9bgqXasuDO12QP/FFuh9kzHPw6+B7mDzvfyRliLar2Cl3mwfOnI6JEztIORZW43
         iCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=miak/i2hpYLrUnHAJtCSqYH++KiQVAx0lzOfX3VFDhs=;
        b=VtZj8BtipPrl8ZkqHJP0JkMlFBcst8Z1GONKLTESDNx4qbKA3PMpUYXpH4QxW69jBF
         xKcoIh4Q1k7nIkUKbx8I2Q0pt7Qg1IDEoonsELLZJ7Mb+mGY8AgnREQVRgvfLBDM8U2S
         vNKXs7tyz34sczKiWh4a/rAaNC8Z9wYGyzhLV9NeO+59sg6tBtj5W7zJoSa8TKUDv41r
         Q/v/Ea5VS7QRONn1KnigyOh+Cj+CA8UU6kfNQ4sDX9014kHV2k2Pi/npub1yA1/I5P9Y
         2mmfZU6Sfq1SqIJN1KiUvNEZwRujqeKqJBOFUo6MPy1KE+uhd52Mfia41u38csTJ5DK8
         +kdw==
X-Gm-Message-State: AOAM533K9CZnvfcR6cxsSpQ0zgltyKt+8Pw9UIfikLRHG4MRUOe0xB++
        KIIv8nFGMZ3EPuBGdqYG9FPgrw==
X-Google-Smtp-Source: ABdhPJzsGRd487Qtry582CfMd10zTS8QWxJIAZQOiMVPhG3S8uwc8QKnH4OH3ZsHO9NGfYMgiYPcwQ==
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr4932000wrd.296.1639584547840;
        Wed, 15 Dec 2021 08:09:07 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bg34sm5861786wmb.47.2021.12.15.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:07 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: exynos: Add E850-96 board support
Date:   Wed, 15 Dec 2021 18:08:59 +0200
Message-Id: <20211215160906.17451-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

WinLink's E850-96 is a dev board based on Exynos850 SoC [1]. The board's
design follows 96boards specifications, hence it's compatible with
96boards mezzanines [2].

This patch series adds the initial support for E850-96 board and
Exynos850 SoC, along with corresponding bindings. Only basic platform
components are enabled at the moment (like serial, I2C, eMMC, RTC, WDT,
clock driver, etc). Right now with this patch series it's possible to
run the kernel with BusyBox rootfs as a RAM disk. More features are
coming soon.

[1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
[2] https://www.96boards.org/products/mezzanine/

Sam Protsenko (7):
  dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg
    clocks
  clk: samsung: exynos850: Add missing sysreg clocks
  dt-bindings: Add vendor prefix for WinLink
  dt-bindings: arm: samsung: Document E850-96 board binding
  dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
  arm64: dts: exynos: Add initial Exynos850 SoC support
  arm64: dts: exynos: Add initial E850-96 board support

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/exynos/Makefile           |   3 +-
 .../boot/dts/exynos/exynos850-e850-96.dts     | 157 ++++
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 755 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 755 ++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c           |  29 +
 include/dt-bindings/clock/exynos850.h         |  12 +-
 include/dt-bindings/pinctrl/samsung.h         |  13 +-
 9 files changed, 1727 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

-- 
2.30.2


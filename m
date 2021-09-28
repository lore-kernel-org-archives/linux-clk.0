Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9359C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 23:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A65F1613A0
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 23:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243306AbhI1X6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 19:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243373AbhI1X6e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 19:58:34 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E89C061749
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 16:56:54 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id v5-20020a17090331c500b0013e32daaffcso101681ple.22
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 16:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WOfA7vqZaeoKU/e1lLNxRvQ3gUoOauPeXLamkl8PSGc=;
        b=KiEqOgIm3SGRYiytUWMvkiFilRMq4hcnoUjGZy2fugPVesXqH0cImCsb3qJue8v6bv
         7Fx7Z6pokfjGwdqweU4uFrb8jyM2FQCE+yFFpD9+a1q64oEa+tk+OlF9pA4thqki5OXQ
         J2BflQ12t6BE31Vf1AiPHhDsaJjob8WjumAWDbYvOEWJMoFLRSomDpzXufIVo1Xu8e7M
         62KIypn6Als+Q+iL1ifJKTJRiNUywEMTbV/c3Yimd6dK+zfjrdMHp74RRuj4HD6Wk695
         ANwAAn/AxRb/X5L3FpEtvixO4HQKesydwsz7T+U6X/W87/hi4d9OZDzJ0qaaKfGxAlkI
         KyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WOfA7vqZaeoKU/e1lLNxRvQ3gUoOauPeXLamkl8PSGc=;
        b=x7bkYWxDfMAvwhMYdEruuA+jO1E1CsOb3Yr8G8rzBwBuqvcyRPxHprFYVdTPLx/cu8
         KvRPbncjVcy5uCSR4F0puknHii47jgqyBTi2sBmtKtUtLweBqDWYdledzsZ3GCgSUihH
         2qgrRwRkGu8u8700uoJPjUDQb+voo6bO8NVFNzpXea2Cc2MABwzqSMO9UKIT5Bx+JUew
         nmdjt0jcRmCrAxyMDFAZLbn0m14uK2Zer6GYNo3yAlDkOL405S7dy+V/itpgVodAfHbT
         CyuA/+J1zdqf+IDHGTQb5exOw9S/ZzhmXnwDHfXKzUD/8bjL4AC9uT5fPRccFhKhM8Ig
         iI1w==
X-Gm-Message-State: AOAM531aNqG2CPoMtI6AkysDdpIImZyTwugCekX5kdjSAT0FSVtBif15
        6XhwTaR9DIL2JnCLDhf4d7qcsITXo1pahv3sddw=
X-Google-Smtp-Source: ABdhPJyTX0ueGZRrc4pLQX2FyNwm8KLBrvGP099JJM4DTlk3tPSz5MIXRLHVcvqtvDkUGGw+nFFpupf7/tOk4GeOGUI=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a62:1d4d:0:b0:443:eac2:8a1b with SMTP
 id d74-20020a621d4d000000b00443eac28a1bmr7873523pfd.2.1632873413309; Tue, 28
 Sep 2021 16:56:53 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:18 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-2-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that EXYNOS_CHIPID can be a module and is enabled by default via
ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
remove that.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b0ce18d4cc98..90c5cf4856e1 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -92,7 +92,6 @@ config ARCH_BRCMSTB
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-	select EXYNOS_CHIPID
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select HAVE_S3C_RTC if RTC_CLASS
-- 
2.33.0.685.g46640cef36-goog


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEEFC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:12:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D59523110
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391907AbhAZNMZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391803AbhAZMrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:47:52 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B17C0698D1
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:54 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 190so2361301wmz.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N8T1u34dorC88muTgROvb30sAlojxHjcjn3S8eWKchI=;
        b=oMD6xl4SFT0eTU53M3uPErJ4+nTXkWKXmdZubrAueDfO34/ooNIHmfH7T8dREJUgm1
         OlkGDp/8inaEAuBHE+132rS8QA22d841x8psc4+RlNgkNEDarvxXe47YPeV3ZfW+HANT
         YCCbXQAyAanjmvkhnvi5ks2A8p0MW5er65CsVWB8lysY23+FhQjF3lSI8N21KSNspYuF
         IHM/o+AKe4GzK5us1spd0tVVMCypmikMFco+py/5KcYlhwi670zXSjinTjHjU34mUK3a
         ovNcky78HGkVG8r6Tat6mr0Kiy4zkp3Em916tKSp+5On/sB3u38Gns489lMoZxC1GJ9k
         lw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N8T1u34dorC88muTgROvb30sAlojxHjcjn3S8eWKchI=;
        b=ZeHHzdPZpaJeNJbwpALXUQ5TExo4EUTU97JhfXslbfURHjAlq/T5Lqf5qBafuYhok4
         uFMeY2r4GRzoFV+ZnBpRo1HXdcwGDzvDiSHqFWzVn1W9ozLaAJSLLdVRa6W/GMT9ijtx
         xL/PLSclWwzQC1wDUif4RAO+0iWcQwxqpicmtlNjZqgYj2K4fDLXuHLE1MiCdmqkonuY
         V0ch77sJk9UvyTSnk3OcdsfLxkmLWJpOmSYTot7q0ufjyPjzMUvSI7BqKtdjIBW+iFil
         f3jldR0dhv05TlePqG2ed6itUsvMisbmfEyx5Bx/jip8Psitjpruj1rhOYCp0Bq9LDGe
         SGlQ==
X-Gm-Message-State: AOAM531qiCVqXjESxlhCsvQzbyA+qS4XhVlw6KmLLoHCDzk1qVHsXjqX
        fCVJs4eLDajrB4MXxwaFf3i+/A==
X-Google-Smtp-Source: ABdhPJwQJjhHhz6+8aVdRCxnSCzGI7zL38pJJEIEPZSfK1LrkdeGVtS3fjzmGZYKF25DJn0g2cu2Dg==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr4566691wmf.151.1611665153187;
        Tue, 26 Jan 2021 04:45:53 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:52 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 07/21] clk: tegra: clk-tegra30: Remove unused variable 'reg'
Date:   Tue, 26 Jan 2021 12:45:26 +0000
Message-Id: <20210126124540.3320214-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/tegra/clk-tegra30.c: In function ‘tegra30_enable_cpu_clock’:
 drivers/clk/tegra/clk-tegra30.c:1107:15: warning: variable ‘reg’ set but not used [-Wunused-but-set-variable]

Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/tegra/clk-tegra30.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 9cf249c344d9e..16dbf83d2f62a 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1104,12 +1104,9 @@ static void tegra30_cpu_out_of_reset(u32 cpu)
 
 static void tegra30_enable_cpu_clock(u32 cpu)
 {
-	unsigned int reg;
-
 	writel(CPU_CLOCK(cpu),
 	       clk_base + TEGRA30_CLK_RST_CONTROLLER_CLK_CPU_CMPLX_CLR);
-	reg = readl(clk_base +
-		    TEGRA30_CLK_RST_CONTROLLER_CLK_CPU_CMPLX_CLR);
+	readl(clk_base + TEGRA30_CLK_RST_CONTROLLER_CLK_CPU_CMPLX_CLR);
 }
 
 static void tegra30_disable_cpu_clock(u32 cpu)
-- 
2.25.1


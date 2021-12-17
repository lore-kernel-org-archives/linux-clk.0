Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B52C4321E
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 01:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhLQBaL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhLQBaK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:30:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24897C06173E
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:30:10 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l22so1430864lfg.7
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yuiR3XHwD32nQQSyEGMDlqMBszeUDsewPKrEObZDzmc=;
        b=XTVKSwrUT7kVpmugHodaQ3bRT6sG3k8/j/OVLmtWbN/Hdq0TLSrhl0v1QOL72oJ1nU
         3cfGmpwfe8EIme5Gm8u7Uj56SJmOcWnjGgCjZ9eKYZ1tpWFhCsObOXUGyyTQ6Fj097TQ
         OqyF8K/4w/nq1RixjXpADe2H69xXDzIv0SwrQFfcXx3hqcGOR7uPUWE2dOR3q5ectcYH
         /cfBt+LBKsIRQK8P5fAjjypu55xyjYeaymYTe63H/9TdN902tUW/05Of/6aftFkvjBbP
         lRdbY/bJKDZtZCw5sEFAmI2QqRY3GD5cXP3x/70ChM4eVbJ3WQAiNpj47o5ZVcYUkxWZ
         i/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yuiR3XHwD32nQQSyEGMDlqMBszeUDsewPKrEObZDzmc=;
        b=kfKwT0O8qkXd+SqSrC9jtNfvKGVTdqkqgm3Ns8UVtA+QqBj53gKc+sqfDREwwSPPjp
         Rywx0OVlv3rXkQjKX++L0S73gPxskYP18oSKFKs9b3kdOIr3phYGyI+rkEVLv8NI7YhE
         /GSRPf3AOfct12a3lnfNeizJcJi3u7i2pngYA2DGOagqu3OurE3897JQyiaLs4iQQN1Y
         6bH1Uy+wgUo1rN7UVWyl4slxpbd5AuH7fd7HpydzuL+KnPFoS+4CC6GdFa0VrM47+U+3
         dVo2r2zuH6P8yub//DyMgnMBrqhN1o5Q0rZez/dNl0Vrc2Rl8nacI4MwHzbYsIxYtHNc
         cMBw==
X-Gm-Message-State: AOAM530QQxZlE5sfcyGCFGQ6l6GEMaDvq6GaWHjDXZU74RvG+iPWUoxS
        7d9hWMCx6RBwgcC/bB9sTqqD+A==
X-Google-Smtp-Source: ABdhPJyrazrMYbsMpDAFM/nM9yDLrnqps9xzq3+sisgsdwVgDDx0J/FFyqDlQ11oOHhoSAYxqJkcZw==
X-Received: by 2002:a05:6512:3b8a:: with SMTP id g10mr781424lfv.93.1639704608269;
        Thu, 16 Dec 2021 17:30:08 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b7sm1131676lfb.224.2021.12.16.17.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:30:07 -0800 (PST)
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
Subject: [PATCH v2 1/7] dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg clocks
Date:   Fri, 17 Dec 2021 03:29:59 +0200
Message-Id: <20211217013005.16646-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217013005.16646-1-semen.protsenko@linaro.org>
References: <20211217013005.16646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

System Register is used to configure system behavior, like USI protocol,
etc. SYSREG clocks should be provided to corresponding syscon nodes, to
make it possible to modify SYSREG registers.

While at it, add also missing PMU and GPIO clocks, which looks necessary
and might be needed for corresponding Exynos850 features soon.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack tag by Rob Herring
  - Added Ack tag by Chanwoo Choi

 include/dt-bindings/clock/exynos850.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 8aa5e82af0d3..0b6a3c6a7c90 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -82,7 +82,10 @@
 #define CLK_GOUT_I3C_PCLK		19
 #define CLK_GOUT_I3C_SCLK		20
 #define CLK_GOUT_SPEEDY_PCLK		21
-#define APM_NR_CLK			22
+#define CLK_GOUT_GPIO_ALIVE_PCLK	22
+#define CLK_GOUT_PMU_ALIVE_PCLK		23
+#define CLK_GOUT_SYSREG_APM_PCLK	24
+#define APM_NR_CLK			25
 
 /* CMU_CMGP */
 #define CLK_RCO_CMGP			1
@@ -99,7 +102,8 @@
 #define CLK_GOUT_CMGP_USI0_PCLK		12
 #define CLK_GOUT_CMGP_USI1_IPCLK	13
 #define CLK_GOUT_CMGP_USI1_PCLK		14
-#define CMGP_NR_CLK			15
+#define CLK_GOUT_SYSREG_CMGP_PCLK	15
+#define CMGP_NR_CLK			16
 
 /* CMU_HSI */
 #define CLK_MOUT_HSI_BUS_USER		1
@@ -167,7 +171,9 @@
 #define CLK_GOUT_MMC_EMBD_SDCLKIN	10
 #define CLK_GOUT_SSS_ACLK		11
 #define CLK_GOUT_SSS_PCLK		12
-#define CORE_NR_CLK			13
+#define CLK_GOUT_GPIO_CORE_PCLK		13
+#define CLK_GOUT_SYSREG_CORE_PCLK	14
+#define CORE_NR_CLK			15
 
 /* CMU_DPU */
 #define CLK_MOUT_DPU_USER		1
-- 
2.30.2


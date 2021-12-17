Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99794C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 01:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhLQBq1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhLQBqY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:46:24 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADCAC061574
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:46:24 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bt1so1408561lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 16 Dec 2021 17:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pWZ3VqkixP63yliHPRMo0MEnH6Ek4K9Uct53tM9/STk=;
        b=lMawe/RE1stZKCZShVm5Wq0mSwUp6FaAr7qucwfjfd+l38p2E8+TvLTfAh943WJOwm
         CjfN0Txt8nL2iYgjIk3W2jGm2Tfp8TS5XQZfSiS6+P2z6leHbLdc1JgVX9SReIlAUWBE
         G5v22EUi1EeC31WXFZrj/mEmV7Gzfg20rtOb05pPpJm4jxAoksc3yQ0aHOmwS6HyOS5v
         +wdluBZUOmkOJhg1hQDD/bFROQKCx8T8gpJIofYKmaYlkzCvq/TtIEAq6bYnqa/zKinK
         fA7mGT5B336t82jlKhUk0HwJ1dozxg89lOh8LcSfeQGXnNZsLR+dWqJIK34YVaavs9O3
         80tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWZ3VqkixP63yliHPRMo0MEnH6Ek4K9Uct53tM9/STk=;
        b=ffXgTeGyQNxUCnPZGQzt6v34Ad6A81xMsNlD8ReCxenC9O33UEWtdXDg3uCGrUH5Pf
         ZOgFH4LxPFvgnN8VzS5ewyPXOK+neWgV82bedixULmYs+aONmvDnLxeqy1GM/32cnf1z
         aOiX7mj2jZRtcnwPDCGinOEDqEhq0qEM+QtDQiEaCT7x0X/YMQzLuQR9Viv3sPfS10Yg
         rClZ9TZnRuP9YnEUhYmS1gpS/+oOQWdLMIS9HXG1LbLd7dxsAmp7oyrfXtUM3iw2i/w6
         4X3mQFOv6KPCIoTnqPCFekOIkORWX3+x3zYzr4G//84dEWdcrNtZ/tp/aXSUeCaLjWdq
         W7cg==
X-Gm-Message-State: AOAM533/Tc7EGOomNDCF4/qSwutwaq2oO5akSjvl1sZ75EcvFKv0EoL9
        w4cuSVpzm+muBOok1ukRGPoxxA==
X-Google-Smtp-Source: ABdhPJy5rDebfQs5ETfUVCgzouJfn9mYo78YMAaM/Gst/TZOyIs7CIxL06vNWf3rPxCu/0faVXTLcQ==
X-Received: by 2002:a05:6512:2098:: with SMTP id t24mr779816lfr.289.1639705582641;
        Thu, 16 Dec 2021 17:46:22 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bq36sm829621lfb.42.2021.12.16.17.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:22 -0800 (PST)
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
Subject: [PATCH v3 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Fri, 17 Dec 2021 03:46:11 +0200
Message-Id: <20211217014613.15203-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217014613.15203-1-semen.protsenko@linaro.org>
References: <20211217014613.15203-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
block correspondingly.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - (none)

Changes in v2:
  - Added Ack tag by Rob Herring

 include/dt-bindings/pinctrl/samsung.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index b1832506b923..950970634dfe 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -36,7 +36,10 @@
 #define EXYNOS5260_PIN_DRV_LV4		2
 #define EXYNOS5260_PIN_DRV_LV6		3
 
-/* Drive strengths for Exynos5410, Exynos542x and Exynos5800 */
+/*
+ * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
+ * GPIO_HSI block)
+ */
 #define EXYNOS5420_PIN_DRV_LV1		0
 #define EXYNOS5420_PIN_DRV_LV2		1
 #define EXYNOS5420_PIN_DRV_LV3		2
@@ -56,6 +59,14 @@
 #define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
 #define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
 
+/* Drive strengths for Exynos850 GPIO_HSI block */
+#define EXYNOS850_HSI_PIN_DRV_LV1	0	/* 1x   */
+#define EXYNOS850_HSI_PIN_DRV_LV1_5	1	/* 1.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV2	2	/* 2x   */
+#define EXYNOS850_HSI_PIN_DRV_LV2_5	3	/* 2.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV3	4	/* 3x   */
+#define EXYNOS850_HSI_PIN_DRV_LV4	5	/* 4x   */
+
 #define EXYNOS_PIN_FUNC_INPUT		0
 #define EXYNOS_PIN_FUNC_OUTPUT		1
 #define EXYNOS_PIN_FUNC_2		2
-- 
2.30.2


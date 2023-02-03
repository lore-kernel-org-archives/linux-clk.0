Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA13C636D7
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjBCGJR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjBCGJH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:09:07 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4587167F
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:09:05 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-163bd802238so5546781fac.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yDr1A3i4lDIJ+wlIu+l4d4VuNidJwmq/Y1jBeWohDk=;
        b=K2zByDQKA8e0euNkkSni0gOKbDACnfLRXRi54ui/9SqIbiQ2rFkNElrHR0lY34wKb2
         wwn2+EVJXWb4jwCc7S2vXPo4/XydrGvPMYDzKf645rG/18dv81JvvOGT+k/f7HGi0ItW
         ibdS8Gbopb+eKrbGJNAQE3ClVwDxjzMMBN18HBfvVEtWV+EuJY1lgOTMaNFcFrZsGLwp
         +miJnlW1xouk3hSK6HoVo94ptseWtxaot4sXMkEoHBwYI+9YkvR1CPb1Yf+26ZGnjPha
         901ifJh8+tabdAnXafQ5XsxF/6HjgTLCvG1XbDeg2blQMaSBceEDCOCgrt2+FWBk01q7
         1xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yDr1A3i4lDIJ+wlIu+l4d4VuNidJwmq/Y1jBeWohDk=;
        b=muCaJr8QM+lXK1SaU0rWsyWiOPrJ57b2EJIXokH8NZawUQxuwzDsfR6GsGlfd7T+d4
         JzKl+2qvTeKN9v0h7+jG5LrsvaqBBYhqEOdS35bKg3YIrXjxKrmZ14NEc7DkgZt7RgBS
         4VUeFfDgS4gd9sHEFLnvpxJKfP5XaV55q0U3GkWSiMhoM3Y0Y/E2+BoojCfWKLjH0NyH
         koYt0Aod+H+cmtq17KUNaZbGCCctl1BMAeYdW5pkYAwxFbBrjgoB15ZKJMMXa1B9M3qv
         bqU0jOrV6eo2WnGP5nRwHOucH2GwP5cooYC01Immm6O9PnVI9+DgMRrZogh5dfg/BCmM
         zEtQ==
X-Gm-Message-State: AO0yUKWadnsrWHlpGpwA3yf/3JmZDtmk7Kr0bU1K3joBoQp05qEmnogo
        rNWCYA0BA2akfZj9Qs1KnCkJew==
X-Google-Smtp-Source: AK7set9YBh2frMwtpfDlDcpzwrz1BTgBwLN6EiL7cpETUY+zyn/f/f+l47+u+zB5kN7qLYJOme64ng==
X-Received: by 2002:a05:6870:4414:b0:169:c27f:abf5 with SMTP id u20-20020a056870441400b00169c27fabf5mr4082876oah.15.1675404544827;
        Thu, 02 Feb 2023 22:09:04 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id dt10-20020a0568705a8a00b00163b3472300sm616309oab.2.2023.02.02.22.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 22:09:04 -0800 (PST)
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
Subject: [PATCH 3/6] clk: samsung: Set dev in samsung_clk_init()
Date:   Fri,  3 Feb 2023 00:09:21 -0600
Message-Id: <20230203060924.8257-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230203060924.8257-1-semen.protsenko@linaro.org>
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some drivers set dev to context in order to implement PM. Make that part
of samsung_clk_init() instead of assigning `ctx->dev = dev' separately.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos4.c        |  2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c |  3 +--
 drivers/clk/samsung/clk-exynos5250.c     |  2 +-
 drivers/clk/samsung/clk-exynos5420.c     |  2 +-
 drivers/clk/samsung/clk-s3c2410.c        |  2 +-
 drivers/clk/samsung/clk-s3c2412.c        |  2 +-
 drivers/clk/samsung/clk-s3c2443.c        |  2 +-
 drivers/clk/samsung/clk-s3c64xx.c        |  2 +-
 drivers/clk/samsung/clk-s5pv210.c        |  2 +-
 drivers/clk/samsung/clk.c                | 19 +++++++++++++++----
 drivers/clk/samsung/clk.h                |  5 +++--
 11 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 7a9994144d72..d7dbb3858347 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1251,7 +1251,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
 
-	ctx = samsung_clk_init(reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos4_fixed_rate_ext_clks,
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 0b6390e04533..1470c15e95da 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -121,8 +121,7 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 	if (!exynos4x12_save_isp)
 		return -ENOMEM;
 
-	ctx = samsung_clk_init(reg_base, CLK_NR_ISP_CLKS);
-	ctx->dev = dev;
+	ctx = samsung_clk_init(dev, reg_base, CLK_NR_ISP_CLKS);
 
 	platform_set_drvdata(pdev, ctx);
 
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index f1cb69aea10e..92fb09922f28 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -797,7 +797,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		panic("%s: unable to determine soc\n", __func__);
 	}
 
-	ctx = samsung_clk_init(reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5250_fixed_rate_ext_clks,
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 46cac4980be2..1e0cbf762408 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1587,7 +1587,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 
 	exynos5x_soc = soc;
 
-	ctx = samsung_clk_init(reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5x_fixed_rate_ext_clks,
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index 8483d4a2be03..a30db5b5b0d3 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -332,7 +332,7 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
 			panic("%s: failed to map registers\n", __func__);
 	}
 
-	ctx = samsung_clk_init(reg_base, NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, NR_CLKS);
 	hws = ctx->clk_data.hws;
 
 	/* Register external clocks only in non-dt cases */
diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
index 8f12a40790d4..c4a9abbdd1e8 100644
--- a/drivers/clk/samsung/clk-s3c2412.c
+++ b/drivers/clk/samsung/clk-s3c2412.c
@@ -216,7 +216,7 @@ void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
 			panic("%s: failed to map registers\n", __func__);
 	}
 
-	ctx = samsung_clk_init(reg_base, NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, NR_CLKS);
 
 	/* Register external clocks only in non-dt cases */
 	if (!np)
diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index 6db8147f0aa2..be0a378d0a92 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -353,7 +353,7 @@ void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
 			panic("%s: failed to map registers\n", __func__);
 	}
 
-	ctx = samsung_clk_init(reg_base, NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, NR_CLKS);
 
 	/* Register external clocks only in non-dt cases */
 	if (!np)
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index 47e9d19486dc..d27a1f73f077 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -405,7 +405,7 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 			panic("%s: failed to map registers\n", __func__);
 	}
 
-	ctx = samsung_clk_init(reg_base, NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, NR_CLKS);
 	hws = ctx->clk_data.hws;
 
 	/* Register external clocks. */
diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index b0ab6bc9d21d..cd85342e4ddb 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -743,7 +743,7 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 	struct samsung_clk_provider *ctx;
 	struct clk_hw **hws;
 
-	ctx = samsung_clk_init(reg_base, NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, NR_CLKS);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_register_mux(ctx, early_mux_clks,
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 2436223aac1a..912dfbe5ac20 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -53,9 +53,19 @@ struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 	return rd;
 }
 
-/* setup the essentials required to support clock lookup using ccf */
-struct samsung_clk_provider * __init samsung_clk_init(void __iomem *base,
-			unsigned long nr_clks)
+/**
+ * samsung_clk_init() - Create and initialize a clock provider object
+ * @dev:	CMU device to enable runtime PM, or NULL if RPM is not needed
+ * @base:	Start address (mapped) of CMU registers
+ * @nr_clks:	Total clock count to allocate in clock provider object
+ *
+ * Setup the essentials required to support clock lookup using Common Clock
+ * Framework.
+ *
+ * Return: Allocated and initialized clock provider object.
+ */
+struct samsung_clk_provider * __init samsung_clk_init(struct device *dev,
+			void __iomem *base, unsigned long nr_clks)
 {
 	struct samsung_clk_provider *ctx;
 	int i;
@@ -67,6 +77,7 @@ struct samsung_clk_provider * __init samsung_clk_init(void __iomem *base,
 	for (i = 0; i < nr_clks; ++i)
 		ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
 
+	ctx->dev = dev;
 	ctx->reg_base = base;
 	ctx->clk_data.num = nr_clks;
 	spin_lock_init(&ctx->lock);
@@ -341,7 +352,7 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 		return NULL;
 	}
 
-	ctx = samsung_clk_init(reg_base, cmu->nr_clk_ids);
+	ctx = samsung_clk_init(NULL, reg_base, cmu->nr_clk_ids);
 
 	if (cmu->pll_clks)
 		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 98753b0e5055..3fd6c0868921 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -16,6 +16,7 @@
 /**
  * struct samsung_clk_provider: information about clock provider
  * @reg_base: virtual address for the register base.
+ * @dev: clock provider device needed for runtime PM.
  * @lock: maintains exclusion between callbacks for a given clock-provider.
  * @clk_data: holds clock related data like clk_hw* and number of clocks.
  */
@@ -337,8 +338,8 @@ struct samsung_cmu_info {
 	const char *clk_name;
 };
 
-struct samsung_clk_provider *samsung_clk_init(void __iomem *base,
-			unsigned long nr_clks);
+struct samsung_clk_provider *samsung_clk_init(struct device *dev,
+			void __iomem *base, unsigned long nr_clks);
 void samsung_clk_of_add_provider(struct device_node *np,
 			struct samsung_clk_provider *ctx);
 void samsung_clk_of_register_fixed_ext(
-- 
2.39.0


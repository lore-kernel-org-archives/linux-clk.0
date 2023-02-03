Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B1AC61DA4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 06:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbjBCGJX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 01:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjBCGJQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 01:09:16 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E9A7EFEF
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 22:09:07 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id bx13so3346659oib.13
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 22:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFGVK/R7IvXJOW0JsMc8GEWmuVlJkiZ67MQd9wzMPas=;
        b=f0lvHe+RIZvGMkZgAgwmx4KWkCK8Zp2/njSt24OxDyyvDxYCbuU0NB9H1p+yJaaWaC
         R39D0bvTg9tZI5OMnUlRROenCJ3zbi5yCRr8gu3E6BJqHVFR14wHLR3TB3sK0rKjLH3M
         jaMGlcn4dA0BcMl5zGDe0S4Cqimu2CUGQDE2ri3Ddy9cA4Ajj1+wFi5o6kjJ8v1PCuQ6
         6rhN3Vgs3RPulsjgWxlP4jEnghopSIoqgqPzYMA27MNLILBSkoMTBzXQb7vrSdDtyCIt
         doPnT9HRvNAIibc1HFN392CohVYLs6cbUtaPcQS7CLPLSyZbON6vm0211k5nzFcNEmQ8
         OtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFGVK/R7IvXJOW0JsMc8GEWmuVlJkiZ67MQd9wzMPas=;
        b=OwwYlRM61Yrf7JZ0T0NNrA5KyHf/htjOW94X26vY3jl1XRQQR7GHvpwXzPTHCq/dF/
         luRO5U+QoVgJ89d65wbcM+dKBjV9yir25TqFWYLFEF1DVDTD5K/0oF67naoW5fizAOBE
         w5sDLC48jrGT20g0Erd7vjs1i24fRb6h5ophCca6Sha/ZhC3K0d5NrNo5w+gM57g0/YR
         R9LTV0AvHcuCErpB0FLsdleijQ3PwFcj2ssFIPSi3qQiLAGKYRN6cCaF16RbK3QwLo4z
         sUUbRefscY+rYHO96zfRHPvZg/SkZDAMSuPkyb76zpT6+4OKucllaLd7Rtb54S5s3H1r
         UTsQ==
X-Gm-Message-State: AO0yUKWSFClWPHH0jO7JSDjm38Q/Gj1r9/yFWn+NT3ZyAupG5pYPhFr2
        ejZqXY7DRENbhwDmNkFP61gcUg==
X-Google-Smtp-Source: AK7set+hV484I96OKvacApzyMi+v5hfOAHMNKGNJFQ9Su+QkLejUQN0sLqyh94gC3wT3nxzXwkVYVg==
X-Received: by 2002:a05:6808:2021:b0:378:976a:9cb5 with SMTP id q33-20020a056808202100b00378976a9cb5mr6123598oiw.0.1675404546859;
        Thu, 02 Feb 2023 22:09:06 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a056830055200b00684152e9ff2sm781235otb.0.2023.02.02.22.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 22:09:06 -0800 (PST)
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
Subject: [PATCH 5/6] clk: samsung: Extract parent clock enabling to common function
Date:   Fri,  3 Feb 2023 00:09:23 -0600
Message-Id: <20230203060924.8257-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230203060924.8257-1-semen.protsenko@linaro.org>
References: <20230203060924.8257-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Extract parent clock enabling from exynos_arm64_register_cmu() to
dedicated function. No functional change.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos-arm64.c | 53 +++++++++++++++++---------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index b921b9a1134a..361663223a24 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -56,6 +56,41 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 	iounmap(reg_base);
 }
 
+/**
+ * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
+ *
+ * @dev:	Device object; may be NULL if this function is not being
+ *		called from platform driver probe function
+ * @np:		CMU device tree node
+ * @cmu:	CMU data
+ *
+ * Keep CMU parent clock running (needed for CMU registers access).
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+static int __init exynos_arm64_enable_bus_clk(struct device *dev,
+		struct device_node *np, const struct samsung_cmu_info *cmu)
+{
+	struct clk *parent_clk;
+
+	if (!cmu->clk_name)
+		return 0;
+
+	if (dev)
+		parent_clk = clk_get(dev, cmu->clk_name);
+	else
+		parent_clk = of_clk_get_by_name(np, cmu->clk_name);
+
+	if (IS_ERR(parent_clk)) {
+		pr_err("%s: could not find bus clock %s; err = %ld\n",
+		       __func__, cmu->clk_name, PTR_ERR(parent_clk));
+		return PTR_ERR(parent_clk);
+	}
+
+	clk_prepare_enable(parent_clk);
+	return 0;
+}
+
 /**
  * exynos_arm64_register_cmu - Register specified Exynos CMU domain
  * @dev:	Device object; may be NULL if this function is not being
@@ -72,23 +107,7 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 void __init exynos_arm64_register_cmu(struct device *dev,
 		struct device_node *np, const struct samsung_cmu_info *cmu)
 {
-	/* Keep CMU parent clock running (needed for CMU registers access) */
-	if (cmu->clk_name) {
-		struct clk *parent_clk;
-
-		if (dev)
-			parent_clk = clk_get(dev, cmu->clk_name);
-		else
-			parent_clk = of_clk_get_by_name(np, cmu->clk_name);
-
-		if (IS_ERR(parent_clk)) {
-			pr_err("%s: could not find bus clock %s; err = %ld\n",
-			       __func__, cmu->clk_name, PTR_ERR(parent_clk));
-		} else {
-			clk_prepare_enable(parent_clk);
-		}
-	}
-
+	exynos_arm64_enable_bus_clk(dev, np, cmu);
 	exynos_arm64_init_clocks(np, cmu->clk_regs, cmu->nr_clk_regs);
 	samsung_cmu_register_one(np, cmu);
 }
-- 
2.39.0


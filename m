Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3444C64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjCHXig (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjCHXid (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 18:38:33 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFBB58493
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 15:38:29 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-17711f56136so512488fac.12
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 15:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIF+TzoNCpNgaaPFRZQkOEM2aIrfReHqLZ5t062NKS8=;
        b=Ltdx//bI8+EcfFFzVD0xzgZ4Q9JkiCo8HulKF9GyblSCbeO0M/DRcxuu8WKR+GRUt9
         6rkQSewqo20alox3EQ+oRwG64/ER6XRoEI5koKP+nd5pPV78gPeSp4lGf2DN5/bCpSVY
         UJXMb/luPG/27tbLPKu93kXMaa/V/kRtyHs6FCuQFYAfe6z9WSTqiELHdh+jywdC3Xi9
         /SmYl5EyeUI02L1KMc8YjRjPQ9DJ6vAPhbRAiNAsR6cVUPZA/4Ge9azkkf0yoRDl7gAX
         HjzXlRtiCn4bzKRnerkvp3AwZTvxIHWPNfegjOTCQvix4WHDgZkfqcl1OftcgReOrEQX
         aCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIF+TzoNCpNgaaPFRZQkOEM2aIrfReHqLZ5t062NKS8=;
        b=OVUQc0F7pCt444/RT1CWKpoY8wF6j9gJV2AZJCN66r8QttJvpICSbIgjG7qNk9e4Kk
         yRRL5X6YXCpLJDGk1pTKA2ebvEegwihydyW71kD91Dzf5y9XXKGWqC47YqhG5gVZiEVD
         JhVoby/wjSl142laBppMsbQo2cwKWQ6NexY4Mm2JEp11RHdqxloqb8BADcqvuujcLonh
         fSavDRvSvqTkGdI8MYMboX1XNBJ6CLo7PTvBJi72Aqgagvk7mKfTeJ/KVUXbfkPdpe5Q
         Rb8yDUYtvD5RSyqQEUTR4TB6hX5Gyu6/nNm367PwKZzXYpNMDc45A/5sGQ1ou+iIjbqo
         CqLw==
X-Gm-Message-State: AO0yUKXR2U+aAMCsWX+R7HoRx0NqkrxcoIMHtq8VBE5WIcC74dnWt3Si
        kzjNDftEYqZK0IWwd9EqFe8yaQ==
X-Google-Smtp-Source: AK7set9VYwr+T8z+k6L0BS4GEK0pru9L4q1IR9HnAm4ODTR2MOgjxtRbVtTujQn6EOwctOvNq02Lpg==
X-Received: by 2002:a05:6870:5703:b0:16e:9056:4a03 with SMTP id k3-20020a056870570300b0016e90564a03mr1788575oap.47.1678318709176;
        Wed, 08 Mar 2023 15:38:29 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id m41-20020a4a952c000000b0051ff746e2b2sm6714646ooi.8.2023.03.08.15.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:28 -0800 (PST)
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
Subject: [PATCH 4/7] clk: samsung: exynos850: Make PMU_ALIVE_PCLK critical
Date:   Wed,  8 Mar 2023 17:38:19 -0600
Message-Id: <20230308233822.31180-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PMU_ALIVE_PCLK is needed for PMU registers access, and it must be always
running, as not only the kernel accesses PMU registers. Make it critical
to ensure that.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 6ab5fa8c2ef3..98b23af7324d 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -612,7 +612,7 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK, 21, CLK_IGNORE_UNUSED,
 	     0),
 	GATE(CLK_GOUT_PMU_ALIVE_PCLK, "gout_pmu_alive_pclk", "dout_apm_bus",
-	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
 };
-- 
2.39.2


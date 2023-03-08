Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0663CC678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjCHXit (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjCHXie (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 18:38:34 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0689164237
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 15:38:32 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id bp19so376100oib.4
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 15:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfnUNqAxuAYnW+uBC0eeR8bX/4fPfr5shHESRUBLMio=;
        b=uLvZoGmQBxkLibP85KJwwV9I0Dug6Qn7VOBCLNaopen2OfM/66LoxydINuuqPQo3zo
         S7tCsm9HBml14rIWOjSCYSSjMiluxQ9ETeLN669ZGi4+2XwbpXOByh0W5SnoRCxPhRfv
         6qCazivlQc0xR3rKvSop0+qqzmhyGBaXnnDjk6/JI87aac2p4Sofpzuf4b2Lwu1B64Y0
         0iYxJ4jOlo+NIoDGNKHeTZVVgUu3iqBYkXEJmRJrb13s5APFzrgvryqwa0ZqpQX2IAqY
         XyxMNDQ5D9VtUwCRWzL4ujnDvb8FdHwQaDk0PiDhVfhjg72+4k3l39VA99gfaq5Vdt8K
         KpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfnUNqAxuAYnW+uBC0eeR8bX/4fPfr5shHESRUBLMio=;
        b=jed6jFXwlG9FmVHUBU2c62SLbAhTlr2LNsJzzCFA/u2xxkZCQB88TpVGD+cqMaKfLo
         fs7Pjzr7l/9tkFCPLrJ/eRTub+db7TolqdbLZM3OARZofy75Y8qGTNs8yWdHliFk1hK/
         qNyCoYsBeTcigjJoiVxvRtL6JLu4KGjkELcgmReoyaBq+r30XRsdTzRZ5eWq5bftiME6
         QUw18aMgJ4FY4V/nalGPnVE697C+VECfs8N+2C0SyWrfdV9/3BGUVetoJOwm2gwnua+o
         NlgYgi4HJzAGkhk2WYEAWFld9+XzVmac4gLi3wCLTjxiFY3WUAMjA//eBd84b8C3+U/N
         Tv7A==
X-Gm-Message-State: AO0yUKWZd1xGqubuLtMR3bec+AQqUiMrlLcOco8rCERhlXq0ReHBR2gS
        d9mnGMPMELAXK6Mt9Hn3Uig/lA==
X-Google-Smtp-Source: AK7set+LdKfl2pV7rFrK7MHlgWGS3BOHTe4zWqh2BQ94RSgtvMfaZ+LHiZ0J7LRnfOojDpCNdSs1Vw==
X-Received: by 2002:a05:6808:3b0:b0:384:352f:9810 with SMTP id n16-20020a05680803b000b00384352f9810mr7700050oie.31.1678318711881;
        Wed, 08 Mar 2023 15:38:31 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id s81-20020acadb54000000b00383f58e7e95sm6985322oig.17.2023.03.08.15.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:31 -0800 (PST)
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
Subject: [PATCH 6/7] clk: samsung: exynos850: Enable PM support in clk-exynos850
Date:   Wed,  8 Mar 2023 17:38:21 -0600
Message-Id: <20230308233822.31180-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some CMUs in Exynos850 SoC belong to power domains. In order to support
"power-domains" property for such CMUs, use
exynos_arm64_register_cmu_pm() API instead of
exynos_arm64_register_cmu() in the probe function, and also provide PM
ops for suspend/resume accordingly.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 5664d17bae83..bbf0498dd0b0 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -9,8 +9,8 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <dt-bindings/clock/exynos850.h>
 
@@ -1909,13 +1909,7 @@ static const struct samsung_cmu_info dpu_cmu_info __initconst = {
 
 static int __init exynos850_cmu_probe(struct platform_device *pdev)
 {
-	const struct samsung_cmu_info *info;
-	struct device *dev = &pdev->dev;
-
-	info = of_device_get_match_data(dev);
-	exynos_arm64_register_cmu(dev, dev->of_node, info);
-
-	return 0;
+	return exynos_arm64_register_cmu_pm(pdev, true);
 }
 
 static const struct of_device_id exynos850_cmu_of_match[] = {
@@ -1950,11 +1944,19 @@ static const struct of_device_id exynos850_cmu_of_match[] = {
 	},
 };
 
+static const struct dev_pm_ops exynos850_cmu_pm_ops = {
+	SET_RUNTIME_PM_OPS(exynos_arm64_cmu_suspend, exynos_arm64_cmu_resume,
+			   NULL)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
+};
+
 static struct platform_driver exynos850_cmu_driver __refdata = {
 	.driver	= {
 		.name = "exynos850-cmu",
 		.of_match_table = exynos850_cmu_of_match,
 		.suppress_bind_attrs = true,
+		.pm = &exynos850_cmu_pm_ops,
 	},
 	.probe = exynos850_cmu_probe,
 };
-- 
2.39.2


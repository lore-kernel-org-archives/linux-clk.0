Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BA0C64ED9
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 11:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjBNLBo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 06:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbjBNLBk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 06:01:40 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA31B2310F
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 03:01:36 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id mc25so1703827ejb.13
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 03:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFzfHrOtIZCqMj4zPJVlDbK817D86+LN2MDM7zmPIms=;
        b=z7Y+KEKJCkG36g6nHpsRZt2V/JBZpah+ipSiZDJVgvbDsSx4Tv64H6Y3bVpYdX7o+r
         wOTURRQpXui2zhy+Bcnovh3VtWMqv948xVpvsGUec3Av9OHqUGlyHn4bU1v/JhFPks48
         dqtDabMnErd5bzpW4+e2HG6j6tR8/DkWW+zInedQT1C7pmfnfDcvQvzSnTsC/ycT+4k8
         MUfH+DvJeIspqCep3zPagWMJwcUYYuzRdFQOFOBsH+GkxflSQDkdEdkWoQyaB6Aq4Gnd
         DGRUrKlKcXKQctfYcZ3DTqC0HzK5qghRaYYWPxXdY7ehIWTdVVL0Q4yWkAfvAJCvT+/5
         jduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFzfHrOtIZCqMj4zPJVlDbK817D86+LN2MDM7zmPIms=;
        b=MMkaUZwdDwQY4SjmWIYDAQ+Uz+wQnVO2EO/7rQNnhuKJ3VcNgjisFZyUAiglD/EQOw
         x8gh8ar/M0fX1k9wJdfyqoQlq46kQkXiEPE2y4vubrxZ6TA0quhZrW8JlCoZn38ow32A
         orr9ty5UKvOldxvrbnyQNavkuSUTafR+IiKyQP6Rs6jI4rTuJYItRXWoLHngaD5X8atj
         Jv/SsmSaBgLmH+j6+4rK6O6Q2kr99EIg3qjjl56Gy4l0qXPkOCCYXQiYH3wbLiPep8N/
         +oxFiXsjlCerWN0lBfa/K9lV+9+hyIhdpApUF3SqirWr2f3cbRXAC+st2eEgZ4lJKV68
         N/Rg==
X-Gm-Message-State: AO0yUKUy85bTuwv9KA6Rds2zJi2bBEziCXJnIgveqZEVzhrgE3KKRpDR
        Z2XpSVmsIDknP1KXC5GDaoGPhA==
X-Google-Smtp-Source: AK7set8MNrao1ntWwi8JnefpATCpH+M6d7iyhDNkq1v2nvlIZi4jwzWz8P2KHMCicfQgmF8KsOQ2CQ==
X-Received: by 2002:a17:906:6ad4:b0:877:573d:e919 with SMTP id q20-20020a1709066ad400b00877573de919mr2597986ejs.20.1676372495311;
        Tue, 14 Feb 2023 03:01:35 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906115500b008711cab8875sm7959596eja.216.2023.02.14.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 03:01:35 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 14 Feb 2023 12:01:32 +0100
Subject: [PATCH v3 1/2] clk: qcom: camcc-sm6350: add pm_runtime support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v3-1-d35e0d833cc4@fairphone.com>
References: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make sure that we can enable and disable the power domains used for
camcc when the clocks are and aren't used.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-sm6350.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index acba9f99d960..fc5532e2ee5b 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -7,6 +7,8 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6350-camcc.h>
@@ -1869,6 +1871,19 @@ MODULE_DEVICE_TABLE(of, camcc_sm6350_match_table);
 static int camcc_sm6350_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = pm_runtime_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &camcc_sm6350_desc);
 	if (IS_ERR(regmap))
@@ -1879,14 +1894,22 @@ static int camcc_sm6350_probe(struct platform_device *pdev)
 	clk_agera_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 
-	return qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
+static const struct dev_pm_ops camcc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver camcc_sm6350_driver = {
 	.probe = camcc_sm6350_probe,
 	.driver = {
 		.name = "sm6350-camcc",
 		.of_match_table = camcc_sm6350_match_table,
+		.pm = &camcc_pm_ops,
 	},
 };
 

-- 
2.39.1


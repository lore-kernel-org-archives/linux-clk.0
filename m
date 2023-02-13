Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931B6C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjBMNIN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjBMNIL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:08:11 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2661717B
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:08:10 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id p12so5613330edc.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toszlCApAapEeFqDOAwpUXkStpvwASomRZo2T6mEG/c=;
        b=ymahPWWQURF/O1Lh4FbkzLW/klW8mPcwTS4dUtGnpIiTl0m1RG7LIo5Oj+kZS/i4rA
         MfyIFRxD+4HyrQ7A4hBXrn3XUEQG0DhWf2NY5RYakFukCccZYUUAv0qibS3Q1LxuRMIn
         J1e7C1mCjK6gY4dDLRwNEUgUxF9Voq+X7G113L0qIrUZ/jndesKHgvdU1JPO3y2aXDip
         s+zCrQVbTd4Eyugib/hlqi9QekwJg/0itEKNZ8Kj/6jULIILRtyNrN5qWnoi+Kru9j9d
         j2Im5sgON9hZa2nWDidfUmc6yF0rOQ9VSSFYel3eN93xS5s3ca9KLXaRYN5EgAhz8kkc
         XMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toszlCApAapEeFqDOAwpUXkStpvwASomRZo2T6mEG/c=;
        b=GxyWUKD+N/HTOgrcdpjlfIcex946FyJSrz3Im6zbWqoxBD25bGETm71fKjLwxh+abj
         97XVtLD0VMTbhzIdiMqxkRdGJZDpaIR3fn5MyCahQmMl5NDRdMNJvkOAtoYk5T4QXOTT
         zVsWl5Sh9v3aDb+Ev2GMhdcatEScJ8GF2groHVtUIfvAe8Vz0TQvDKewKqINufjx91E8
         gew396IFRTgfzGbOiRZYFnOVN3oVbwXxqz6lTygQlXagPYWCXTpfaWesNXsTVexl6WXI
         k96/9zRH/9gfppCuf8beB2UkGapRJn+tlVdiKb/npiLWg/a8E4e2w6s5WtcwJdokdjYG
         qs6g==
X-Gm-Message-State: AO0yUKUz8PcN3Gf0lQ/WXIrrX+YjnZVf21cC5xF/xStdxW6k8yKRgpCA
        35biqpV9K6fgjr64WQkvtxkOpw==
X-Google-Smtp-Source: AK7set/PoneDQZG6t0Zyg+WutlmMmUqL7cOJ3103UYH+QyyVg32InIC9jei4mrMKCUzwdI8sQ+5K3w==
X-Received: by 2002:a50:9b13:0:b0:4ab:44bd:80a1 with SMTP id o19-20020a509b13000000b004ab44bd80a1mr12636185edi.22.1676293688775;
        Mon, 13 Feb 2023 05:08:08 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id f22-20020a50a6d6000000b004acc6cbc451sm1616515edc.36.2023.02.13.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:08:08 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 13 Feb 2023 14:08:06 +0100
Subject: [PATCH v2 1/2] clk: qcom: camcc-sm6350: add pm_runtime support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v2-1-60a507bf3e68@z3ntu.xyz>
References: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
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
        Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make sure that we can enable and disable the power domains used for
camcc when the clocks are and aren't used.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/clk/qcom/camcc-sm6350.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index acba9f99d960..dd65f3ef0857 100644
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
@@ -1879,14 +1894,26 @@ static int camcc_sm6350_probe(struct platform_device *pdev)
 	clk_agera_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 
-	return qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
+		return ret;
+	}
+
+	return 0;
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


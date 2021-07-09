Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464CFC07E9C
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BC78613FC
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 17:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhGIRfB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 13:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhGIRex (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 13:34:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051F1C0613F0
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 10:32:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a18so24659279lfs.10
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjFzSjONYuEpNPrn8vILKcXv8t+6phQCfA+Cce2Zw8Y=;
        b=p1R064hgfUHwIESmq5LWdQ94d96i6QYw/zDC96aRgFZNeECDduxwX5DPaypaqL8KvL
         qq9vz4ZgnML2KJfPa6ObS6NeNfG2TIX1xOGXMZRdjMtDU3+ZwhWDlWgwL2Y2t6QBllsZ
         xJCH8mDwzSbeJ+L7X8saMxxPRidmmJ8fMQNF0ifXOaa/ZyOjmVQYOuh2zhGUKEgBQTL7
         a7BLDovTgb7UTa8F9oH64kxrVpk8PMltfj7qNrUZVtpFKwraRRPtpGiY5pVOuk/DK8iu
         esK8He96Cw4cAEP84HrkKLYrb1Qh0kfK7hCyuGXXa4bakHyxLUsT4f8tpPxe+AHKTtpt
         0IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjFzSjONYuEpNPrn8vILKcXv8t+6phQCfA+Cce2Zw8Y=;
        b=lU9L9USqV74zTujwuE6aMbKeFOUAEq1SuhWSHA26Z0hnEL2bp5dTjcvjWFMVFpJAcq
         2SlreUmgEN0nUyRD5yJFB2Gj7AWirYcLoXPnYZnh7VSryZriTq+fxREEGP93HkvOmOVe
         yTC3Gf9fWA6pYv6IRhYwduluYyH3Y1F9HwDV/AharzZPWQ1Qmu26Ml/jBPvchKTFk6IY
         dAABpmmHN8/6RhA7aa4cY9tdaGyoiboXZRGXn8e55ksi7tcefPrsH3kPyVcaBYB8BjMs
         iL4lyTxJfmavjGR+P8TGrWaBDnxs3M4vkPOLzLfR49xclLhWp93ryCZZFUJ6J2kY8v0v
         UScw==
X-Gm-Message-State: AOAM5314o7GgiEAU9tiU7bmBr91zUsOQbgdROstpb3DbpyfgtKeuR7XD
        RDD/5iCa/QlBtTAKr487mKWt8g==
X-Google-Smtp-Source: ABdhPJxxhH7SM7baNOUo0Mq3dmeWjfYanS0QKQOTHAWpnSZ35GCpRbqzhPLXwGtMNwnpbKIk3Yhe5Q==
X-Received: by 2002:a19:6a09:: with SMTP id u9mr1385279lfu.119.1625851927371;
        Fri, 09 Jul 2021 10:32:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm511129lfb.132.2021.07.09.10.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:32:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] clk: qcom: gdsc: call runtime PM functions for the provider device
Date:   Fri,  9 Jul 2021 20:31:59 +0300
Message-Id: <20210709173202.667820-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to properly handle runtime PM status of the provider device,
call pm_runtime_get/pm_runtime_put on the clock controller device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 66 ++++++++++++++++++++++++++++++++++++++---
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index ccd36617d067..6bec31fccb09 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset-controller.h>
@@ -50,6 +51,30 @@ enum gdsc_status {
 	GDSC_ON
 };
 
+static int gdsc_pm_runtime_get(struct gdsc *sc)
+{
+	int ret;
+
+	if (!sc->rpm_dev)
+		return 0;
+
+	ret = pm_runtime_get_sync(sc->rpm_dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(sc->rpm_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int gdsc_pm_runtime_put(struct gdsc *sc)
+{
+	if (!sc->rpm_dev)
+		return 0;
+
+	return pm_runtime_put_sync(sc->rpm_dev);
+}
+
 /* Returns 1 if GDSC status is status, 0 if not, and < 0 on error */
 static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
 {
@@ -232,9 +257,8 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
 	regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
 }
 
-static int gdsc_enable(struct generic_pm_domain *domain)
+static int _gdsc_enable(struct gdsc *sc)
 {
-	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
 	if (sc->pwrsts == PWRSTS_ON)
@@ -290,11 +314,28 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	return 0;
 }
 
-static int gdsc_disable(struct generic_pm_domain *domain)
+static int gdsc_enable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	ret = gdsc_pm_runtime_get(sc);
+	if (ret)
+		return ret;
+
+	ret = _gdsc_enable(sc);
+	if (ret) {
+		gdsc_pm_runtime_put(sc);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int _gdsc_disable(struct gdsc *sc)
+{
+	int ret;
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
@@ -329,6 +370,18 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static int gdsc_disable(struct generic_pm_domain *domain)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+	int ret;
+
+	ret = _gdsc_disable(sc);
+	if (ret)
+		return ret;
+
+	return gdsc_pm_runtime_put(sc);
+}
+
 static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
@@ -425,6 +478,8 @@ int gdsc_register(struct gdsc_desc *desc,
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
 			continue;
+		if (pm_runtime_enabled(dev))
+			scs[i]->rpm_dev = dev;
 		scs[i]->regmap = regmap;
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
@@ -486,7 +541,10 @@ void gdsc_unregister(struct gdsc_desc *desc)
  */
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
 {
+	struct gdsc *sc = domain_to_gdsc(domain);
+
 	/* Do nothing but give genpd the impression that we were successful */
-	return 0;
+	/* Get the runtime PM device only */
+	return gdsc_pm_runtime_get(sc);
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 5bb396b344d1..a82982df0a55 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -25,6 +25,7 @@ struct reset_controller_dev;
  * @resets: ids of resets associated with this gdsc
  * @reset_count: number of @resets
  * @rcdev: reset controller
+ * @rpm_dev: runtime PM device
  */
 struct gdsc {
 	struct generic_pm_domain	pd;
@@ -58,6 +59,7 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+	struct device 			*rpm_dev;
 };
 
 struct gdsc_desc {
-- 
2.30.2


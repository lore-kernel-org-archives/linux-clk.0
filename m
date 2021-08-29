Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D172CC25AEF
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 15:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D7860FBF
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 15:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235671AbhH2PtB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 11:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235709AbhH2Ps5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 11:48:57 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5786C06175F
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:48:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id p15so21258146ljn.3
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lv6y3mb4458qOlyVLvAvnT8xa7t93W3QxGvdMJI2inM=;
        b=GgK7AZo3krArkMm0spn/T7HhYWil1BQIbWVvuQL3T05gSXYaGv0r9wP3WP9sQ4E3mf
         RZRaVj6JNj/6TZivJ50D/NxzYa0TmdcxZnLUZTUgh22WeNNFBFFA1m5O+zqh7woct66S
         VLvNIBgkuP/2PtcmGC7YrfT5EdYAGAoL2zX+CgedhBE+ezIdb67JUufP+Gv8QBsSIPSS
         Bdz2gePDFrwF1sTFdffQKp7LkU3bLtLRakGhzJxzDua5500m2s/gfQOQ50BIXSd1a0Dk
         wb0ty/OYNwv1V/Lq1Wc8l9boHvUx4Ghzc7ZWwbivI5T3foGeRRwbZCTiUg1BD9dx6ji0
         jMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lv6y3mb4458qOlyVLvAvnT8xa7t93W3QxGvdMJI2inM=;
        b=GGAYuXLVU75h5fOFycV2L29oSOineO98T3F2pzDWAbbnN2RPce1077xdqEVQRAPmgs
         u0m7VKxDUL/tFJ2p6ztkWbdeTFmpRu3B/KF7gfTErXrQe2lAccAl4cbAcX8wDO/FE74C
         3rGHxa5kMxQMmhrsyNVY23LGnLfT9yLJnsBsYif8mLAKiKHVyL6DL0xpkPcROCvcOaZR
         EQGAxn6pWt3SL2c9RIAFaMUQOprvvTKCXwVazbjTseUkmzj0ZY1Jp2CqKiiOD8qA2vwL
         U0zM9w5Atvoc2GoJ1mlJzDGP4LwsfEwN2/MbaBq+2xEJQEKTD1w70kOmO5gvkFRhJOwh
         u+Rg==
X-Gm-Message-State: AOAM533C0oAEgk+OU8e7ub+nDSsbSU4QmzZXoteCCGkSclhADHVbjaMx
        YpA+4rMzgYyLo7hJBmEACo5XWg==
X-Google-Smtp-Source: ABdhPJwhvDPL8WDDIlDaOvwxiUTRjs11fQpNSBXj5NgtitMRZXYDe4hooML2X9xyTotR0BgP4amrJw==
X-Received: by 2002:a05:651c:1785:: with SMTP id bn5mr17081807ljb.18.1630252083261;
        Sun, 29 Aug 2021 08:48:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5sm1481243ljd.38.2021.08.29.08.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:48:02 -0700 (PDT)
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
Subject: [PATCH v7 5/8] clk: qcom: gdsc: enable optional power domain support
Date:   Sun, 29 Aug 2021 18:47:54 +0300
Message-Id: <20210829154757.784699-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On sm8250 dispcc and videocc registers are powered up by the MMCX power
domain. Currently we use a regulator to enable this domain on demand,
however this has some consequences, as genpd code is not reentrant.

Make gdsc code also use pm_runtime calls to ensure that registers are
accessible during the gdsc_enable/gdsc_disable operations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 51 ++++++++++++++++++++++++++++++++++++++---
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 4ece326ea233..7e1dd8ccfa38 100644
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
@@ -50,6 +51,22 @@ enum gdsc_status {
 	GDSC_ON
 };
 
+static int gdsc_pm_runtime_get(struct gdsc *sc)
+{
+	if (!sc->dev)
+		return 0;
+
+	return pm_runtime_resume_and_get(sc->dev);
+}
+
+static int gdsc_pm_runtime_put(struct gdsc *sc)
+{
+	if (!sc->dev)
+		return 0;
+
+	return pm_runtime_put_sync(sc->dev);
+}
+
 /* Returns 1 if GDSC status is status, 0 if not, and < 0 on error */
 static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
 {
@@ -232,9 +249,8 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
 	regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
 }
 
-static int gdsc_enable(struct generic_pm_domain *domain)
+static int _gdsc_enable(struct gdsc *sc)
 {
-	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
 	if (sc->pwrsts == PWRSTS_ON)
@@ -290,11 +306,22 @@ static int gdsc_enable(struct generic_pm_domain *domain)
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
+	return _gdsc_enable(sc);
+}
+
+static int _gdsc_disable(struct gdsc *sc)
+{
+	int ret;
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
@@ -329,6 +356,18 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static int gdsc_disable(struct generic_pm_domain *domain)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+	int ret;
+
+	ret = _gdsc_disable(sc);
+
+	gdsc_pm_runtime_put(sc);
+
+	return ret;
+}
+
 static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
@@ -443,6 +482,8 @@ int gdsc_register(struct gdsc_desc *desc,
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
 			continue;
+		if (pm_runtime_enabled(dev))
+			scs[i]->dev = dev;
 		scs[i]->regmap = regmap;
 		scs[i]->rcdev = rcdev;
 		ret = gdsc_init(scs[i]);
@@ -457,6 +498,8 @@ int gdsc_register(struct gdsc_desc *desc,
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);
@@ -475,6 +518,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 5bb396b344d1..702d47a87af6 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -25,6 +25,7 @@ struct reset_controller_dev;
  * @resets: ids of resets associated with this gdsc
  * @reset_count: number of @resets
  * @rcdev: reset controller
+ * @dev: the device holding the GDSC, used for pm_runtime calls
  */
 struct gdsc {
 	struct generic_pm_domain	pd;
@@ -58,6 +59,7 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+	struct device 			*dev;
 };
 
 struct gdsc_desc {
-- 
2.33.0


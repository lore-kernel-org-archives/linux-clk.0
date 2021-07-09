Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A407DC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 04:31:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B27561451
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 04:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhGIEec (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jul 2021 00:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhGIEe0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 00:34:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E37C06175F
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 21:31:43 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q18so20668649lfc.7
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 21:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89M3kJH8Z+ezz3X5xX4Jb+p6yEZY6o3ZbKwB3aRtLuw=;
        b=Pq6G2lRNhxw2vUhHwwMP5b3OyWgTa/hegNC+tgzuvNtJVP2KQi1yzBsVU/T9DkgCm9
         2lzKbNs2lCbjDaCqwJYxG3Lug+E/uCOEzEX3+uAj8maq3ApVt+FkTix5La9N0KDdV+n4
         rOxQHIVNw2hdhCLEN03XQtZb7ra7c3BNNhZlZwUhy69u8mwrwRtkdeW5wlp6bB+79FpC
         SQLmjZNW8ueVUTAwdDOeWMOEN6M6qt2rG86Sz7hhxRsjEsqMsDFDYiR4+57Iep8Xzsg5
         nxJlBAqu1l6w7vfo6ilFZPZFYcbe/W5WrNYliWhOkKgjmTnPNz1U9AH9L48oaAOHIHhR
         aGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89M3kJH8Z+ezz3X5xX4Jb+p6yEZY6o3ZbKwB3aRtLuw=;
        b=Evym0zNMkxGvqAu5BIQ5Q5SyyZw70DA/o8ZZN0JvkoxjDoKMN7qPaGwGq1ksFROBbg
         3HAhnXmtU/C1CwmS+pPsVCvFQ+imP4Pgi2CeWSceMhrGl5tdT3J5IL+YBwBqqdXfHhE5
         AQf7qYJKdVSbfrMEEyQ8dgfUEZ15uBAKEY26wuWEDR6XomifLOE/NCUQImiC3R5/lgJC
         2ZPinAajM748IV2PRwhmxlRZx/gii6uIGBP3Y06hko/HcPz8mHOyWJuv6ryZuFNH/DGT
         /iVlwDlOblBMUDLbXcBJdzfbvYD9bj7qIYdgzVsm5R3KU9LqAAZF0LyeTgURMXZz2Oqm
         n3yg==
X-Gm-Message-State: AOAM532cFQ7ANvviRkm3w+2D4Xg/Ouj412T0q+MPyzEzh6NPNy0Zh7ye
        ef+UMPawewHmzjXrBfxmkVZ4eg==
X-Google-Smtp-Source: ABdhPJxjr4KOVW/vv2+NJuenHFEE/zVGc85kBiQOrraHkR6yx60M/RGbz/Un+Am7IUgnNnrrl+IC6g==
X-Received: by 2002:ac2:4d37:: with SMTP id h23mr22176135lfk.177.1625805102035;
        Thu, 08 Jul 2021 21:31:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:41 -0700 (PDT)
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
Subject: [RESEND PATCH v2 4/7] clk: qcom: gdsc: enable optional power domain support
Date:   Fri,  9 Jul 2021 07:31:33 +0300
Message-Id: <20210709043136.533205-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On sm8250 dispcc and videocc registers are powered up by the MMCX power
domain. Currently we used a regulator to enable this domain on demand,
however this has some consequences, as genpd code is not reentrant.

Teach Qualcomm clock controller code about setting up power domains and
using them for gdsc control.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 37 +++++++++++++++++++++++++++++++------
 drivers/clk/qcom/gdsc.c   |  5 +++++
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..43d8f8feeb3c 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -10,6 +10,7 @@
 #include <linux/clk-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 
 #include "common.h"
 #include "clk-rcg.h"
@@ -224,6 +225,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
+static void qcom_cc_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 int qcom_cc_really_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -241,6 +247,18 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (!cc)
 		return -ENOMEM;
 
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put(dev);
+		pm_runtime_disable(dev);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
+	if (ret)
+		goto err;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
@@ -251,7 +269,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 
 	ret = devm_reset_controller_register(dev, &reset->rcdev);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
@@ -262,11 +280,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 		scd->num = desc->num_gdscs;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
-			return ret;
+			goto err;
 		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
 					       scd);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	cc->rclks = rclks;
@@ -277,7 +295,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	for (i = 0; i < num_clk_hws; i++) {
 		ret = devm_clk_hw_register(dev, clk_hws[i]);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	for (i = 0; i < num_clks; i++) {
@@ -286,14 +304,21 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 
 		ret = devm_clk_register_regmap(dev, rclks[i]);
 		if (ret)
-			return ret;
+			goto err;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
 	if (ret)
-		return ret;
+		goto err;
+
+	pm_runtime_put(dev);
 
 	return 0;
+
+err:
+	pm_runtime_put(dev);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
 
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 51ed640e527b..9401d01533c8 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
 			continue;
 		scs[i]->regmap = regmap;
 		scs[i]->rcdev = rcdev;
+		scs[i]->pd.dev.parent = desc->dev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
 			return ret;
@@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);
@@ -457,6 +460,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+		else if (!IS_ERR_OR_NULL(dev->pm_domain))
+			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
-- 
2.30.2


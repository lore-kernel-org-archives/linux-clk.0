Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE31C4338F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jul 2021 14:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67F6760F02
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jul 2021 14:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235487AbhG1O0m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jul 2021 10:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236640AbhG1OZL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jul 2021 10:25:11 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7C7C0617A0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jul 2021 07:24:55 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id n6so3292173ljp.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Jul 2021 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORimO8D42kAHhnXfoY653OGm+8ilcZTSD9Rm8q3p1bo=;
        b=QJdRABVp43c7JWRg8sbdKu6k+iBY7vTqpmXGlj/FeZzkEkG0i2omtElZod1AQGXI+J
         xVcYDap+fs7EweFwsu5TGdUi+b4kz0H14GE78mjrH+cwSAyJhxf26ZxMCYO0v/D+/kPt
         p73Cs8lzaG9gsFIorWc4P2FunLeHMpnaVREsNm6j+2URPW65Id04ee0oiY8qxio2CzmZ
         taYFAte0h2oRGq3fYRMftGNkXj4bxAZYQFGpZXn5fQeL7Bu2ezzJemFEF5o+0dJrZGsz
         E+WOBQiLRdGamNCkP2YOv9JdXV9kA7AIYSc13BAOiwVt9ddt+haN4UPVrQ0WIOZ10NSb
         aB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORimO8D42kAHhnXfoY653OGm+8ilcZTSD9Rm8q3p1bo=;
        b=Dc56gYNogVOg4S9x/90eYvP1+FbMGLtyrJdcLtkFksCx55haLLte06dyoyVV4I0BfP
         i4x0UaXZ7ervqG9Gd2Yla8UHCiItClo8Qh8VGiaSVNaC3Y4HyNntdNNnZL2X8IyvFmYo
         mqnWRbKrwdmJ7prazA3YfLnbCrq9tpDoSh1wMH2DOoeWrKBZyE/C+PvMuD/s9wrSKG/P
         xyYhwVDrcIAUcj9NBYT/H+UrVSuJEGwbguD+d8/3HceG7LGs9bzJVa1GTCWqO5CQV1Y4
         BD9+BxFq3k/3I/5fD7gSh5CcjavrOELhH729Ez3N5/YkcyBHfCi5KZSTLeB0mOwXmYrM
         P4/g==
X-Gm-Message-State: AOAM531h174ub7SR01pkQGZEflkn6494Kbqzi2YzfVFpS6mu1Tg8kMT3
        rzD14v8PV7iO8dMg0STUCqZAMg==
X-Google-Smtp-Source: ABdhPJyeHeYmfbX0mRutc4wBGIzl3E+3k3LZVsC7Z0deZwgnV/53DecPXbUtBDHZbzjGmXyhXbm+uw==
X-Received: by 2002:a2e:9605:: with SMTP id v5mr97711ljh.178.1627482293728;
        Wed, 28 Jul 2021 07:24:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h4sm15610lft.184.2021.07.28.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:24:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] clk: qcom: use common code for qcom_cc_probe_by_index
Date:   Wed, 28 Jul 2021 17:24:44 +0300
Message-Id: <20210728142445.774158-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
References: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rewrite qcom_cc_map and qcom_cc_probe_by_index to use (new)
qcom_cc_map_by_index, removing code duplication and opening a way to
have more common code in qcom_cc_map*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..ed7c516a597a 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -69,20 +69,26 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 }
 EXPORT_SYMBOL_GPL(qcom_find_src_index);
 
-struct regmap *
-qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+static struct regmap *
+qcom_cc_map_by_index(struct platform_device *pdev, const struct qcom_cc_desc *desc, int index)
 {
 	void __iomem *base;
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
 	return devm_regmap_init_mmio(dev, base, desc->config);
 }
+
+struct regmap *
+qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+{
+	return qcom_cc_map_by_index(pdev, desc, 0);
+}
 EXPORT_SYMBOL_GPL(qcom_cc_map);
 
 void
@@ -313,15 +319,8 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 			   const struct qcom_cc_desc *desc)
 {
 	struct regmap *regmap;
-	struct resource *res;
-	void __iomem *base;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return -ENOMEM;
 
-	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
+	regmap = qcom_cc_map_by_index(pdev, desc, index);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.30.2


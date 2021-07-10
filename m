Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98531C07E95
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 14:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 741F9613AF
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jul 2021 14:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhGJOEY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jul 2021 10:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbhGJOEW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jul 2021 10:04:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96234C0613E9
        for <linux-clk@vger.kernel.org>; Sat, 10 Jul 2021 07:01:36 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a18so13390318ljk.6
        for <linux-clk@vger.kernel.org>; Sat, 10 Jul 2021 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORimO8D42kAHhnXfoY653OGm+8ilcZTSD9Rm8q3p1bo=;
        b=oJg8R2kOn/Q8zV6O+9+VgKdjnBKeWsscQ3XKfT0VWS00P4UCenkG7rOqZ0zC82iX4m
         zVrosu9Bfl7nfUwnAdD1PpQCwEP8qd6F1J4DvhyGLHJ7DsyidNDu5PH4l0Cr/eXB9kMp
         ABeWAT4KPiaTH4uAR2tm/0bvxB9Llg3PBodvKqrksq0JlxR4pI8pJGvifr7wO50Vk33h
         DjVpnBDWhkC/yvib6mH9dthiIXyvAhFGmNlTjvo46o7J7+rDiRHqh7hCX6nYCzBdeQ+C
         oPuXdj6ZfkKJCFE81OAFDAyoSQAMrbakBRyrBwZEvo2HQpTlnvUhmCnJGbqtF2pNoRfz
         B7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORimO8D42kAHhnXfoY653OGm+8ilcZTSD9Rm8q3p1bo=;
        b=kvDqv9ytx2GKHGwc2dSHSFobxHjpkMYWWHplDPOgPTrKEQ1X7KHr7POoaMMsJW6Kwh
         79KuUYu0D9Ryg/IHwzvD6gBJQUUN8h7R15O3RriMZgrRwo8UlVI0ekmvKO55rkSpTsGG
         CW2jYsY5YdQvTjnu/Di/ehNw6HmVzxv8HHvHkoQlKE4PmLBOK5x6ijA5VtdCJBNgYwGa
         GydwvSPMohD8cJYP7Er76EA1dVNsA3tc+CL9ICT04jUm7l6LwWy6s7Kg8wiG8sBalRFp
         q7IYChUAOe/DbKBciRJIsmNz9N34Ou3siRNbua/il3qRH4qoHXqtJIftjvCNVoFuIHIL
         iz8Q==
X-Gm-Message-State: AOAM531wrffDygzgwQwY9Etvb61+JiVuI0Ou+sZoiZKoZcKPbZN1yDR2
        Yi7MI9aWmStRIouCkVH1gg3e1w==
X-Google-Smtp-Source: ABdhPJxkL0mVaNdNGkPZhr0PAeCFnI8HBiEc0aEIfelEZC0GW0P1UEdiNhs2CRJ/p5sbmstO5jqRxw==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr33568316ljn.331.1625925694941;
        Sat, 10 Jul 2021 07:01:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o17sm716111lfr.253.2021.07.10.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 07:01:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 1/2] clk: qcom: use common code for qcom_cc_probe_by_index
Date:   Sat, 10 Jul 2021 17:01:29 +0300
Message-Id: <20210710140130.1176657-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
References: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
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


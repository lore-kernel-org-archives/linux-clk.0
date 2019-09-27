Return-Path: <SRS0=fPJi=XW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16131C4360C
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 03:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E17BA2146E
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 03:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQjWf6PI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbfI0DvU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Sep 2019 23:51:20 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37124 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfI0DvT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Sep 2019 23:51:19 -0400
Received: by mail-pl1-f194.google.com with SMTP id u20so516338plq.4
        for <linux-clk@vger.kernel.org>; Thu, 26 Sep 2019 20:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Ro1weBOfHyrfHvVXj42WLEM+jvzuYy/MP2n8jxoh6Sw=;
        b=iQjWf6PIHd1v1UNoaVAblgCzkNb6Y31PZsclFAtKiEeyxoA/ZBhz42c1wwQb1Uo7sh
         Dezcpm8sod9AV4JS0qdMpF1LSML8dJx1P80ymBuFtN+p8Z8+FPFsgcKTcETG6EPKoLAm
         ED5gILcZrLBEy229SySmbmCw1wrkEtEplTuaYZDAi7TYvPkfu2WzOpzNwxs49jGj+9cD
         j7sLjfC/1lJ7D6z1uPsJ0HuhH5PpcZH3HI9Qk00mmb48QCyu3V3xxStoHzqK4yKnNxIm
         bGaISZM1api+Tb+gqZw4vOqZHjJ9rIW1ohO1CyODBWK1qF1EhtMtxhAgpQefOrSvlOhR
         txAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Ro1weBOfHyrfHvVXj42WLEM+jvzuYy/MP2n8jxoh6Sw=;
        b=EavzGWKVBqyTv+I4kA8qp/8FMJm+B+APsR7NFFOy278lmjiEfqy4ZIzOqtP7NTat7z
         lkGCs2Igfd5zr7p0laUX3fQVC+d6RaLOiMqVf9usi6kyTdUSDetd3Ge/HI17OGAL8Z2z
         J+v4TDK5DEXI+LPn0P5Wl6NJIAm52O4LAscLTwZHDGnjrTkyHXOmh6GV/I8mn21ESHeW
         FUH05flLR+l16QVuh5R3CJ86E2Gp5xNqZRBErJxWfpmxMlMi+lT3OPR6WQgiMSUnEvMu
         yvy/orpjMfkUUl0PIiN5VuU6xW3wdpP2z0lPzFt5gKl8eji3VIkOp/8ai/dwYsbjVSm/
         m3wA==
X-Gm-Message-State: APjAAAWRJ0YJjHAlJ2PnZMu4zatmytlYyktynrbLcrIzbiMH5YCnOzpI
        qQ3br7w2GsgsMFmUKgbEiWGOZw==
X-Google-Smtp-Source: APXvYqw5yUJIRQ9xSAy1GfOyiVB5qxoFBjwRMN9tsNQOWgJchrf1N4Y2d1kkQrAzmhk5dgjPQZaPiw==
X-Received: by 2002:a17:902:d887:: with SMTP id b7mr2142145plz.297.1569556279194;
        Thu, 26 Sep 2019 20:51:19 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id n66sm753640pfn.90.2019.09.26.20.51.16
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 26 Sep 2019 20:51:18 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: sprd:  Change to use devm_platform_ioremap_resource()
Date:   Fri, 27 Sep 2019 11:50:54 +0800
Message-Id: <64121209a05f6e34b70cf00d9303d13e765f8528.1569555841.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b7fbe8776703b9d637ab82ad4724353b359f1d04.1569555841.git.baolin.wang@linaro.org>
References: <b7fbe8776703b9d637ab82ad4724353b359f1d04.1569555841.git.baolin.wang@linaro.org>
In-Reply-To: <b7fbe8776703b9d637ab82ad4724353b359f1d04.1569555841.git.baolin.wang@linaro.org>
References: <b7fbe8776703b9d637ab82ad4724353b359f1d04.1569555841.git.baolin.wang@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together, which can simpify the code.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/clk/sprd/common.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
index 7ad5ba2..c0af477 100644
--- a/drivers/clk/sprd/common.c
+++ b/drivers/clk/sprd/common.c
@@ -42,7 +42,6 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
 	struct regmap *regmap;
-	struct resource *res;
 
 	if (of_find_property(node, "sprd,syscon", NULL)) {
 		regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
@@ -51,8 +50,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
 			return PTR_ERR(regmap);
 		}
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		base = devm_ioremap_resource(&pdev->dev, res);
+		base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 
-- 
1.7.9.5


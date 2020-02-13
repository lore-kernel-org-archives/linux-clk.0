Return-Path: <SRS0=sDih=4B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC73C3B189
	for <linux-clk@archiver.kernel.org>; Thu, 13 Feb 2020 14:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95442218AC
	for <linux-clk@archiver.kernel.org>; Thu, 13 Feb 2020 14:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/Xm0C5a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730127AbgBMOLd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Feb 2020 09:11:33 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41826 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730082AbgBMOLd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Feb 2020 09:11:33 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so6750931ljc.8
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2020 06:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jmInR6ToitfmuXt2m2m0REU0jG0tl34rmyR4/V6wbYg=;
        b=q/Xm0C5aRbv1Fcxc08JgWF0K+S46DK1lmjrPRupz0sb4ubVUB+IeaTR4LF2LUzmd17
         G7O9fQh7msbSazt7uHnF3mHzataYtwmluObQJE2FeJpUGZBJn2esR6EFHp+KOZjGnjcW
         UwryA3P8tzuu+cKCTq5FTfdIzleR24agZq0+Ots9int5zudKuWHyt6+RBs35q6Tc/+GA
         FlL4nM6+JbSdFxyOr3aIgr5WQm6Xqz+1ekzcIn3GLdOsNTOewao5tUtRAj9wkrC+7ugx
         0NrX+LedrX/xU0I0dVJMRa3lOjzpwG3V9ZGzgbXw6eg6GkS1MKtFJ3vMFG43j1Qc/prV
         EELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmInR6ToitfmuXt2m2m0REU0jG0tl34rmyR4/V6wbYg=;
        b=UqIQMYAgbBcAtUknLuzYU7NwykyMwi2J51MLcVo89QvgToEuVQdeb7/vJCy+4p9rfG
         7rPHcrSd0P+hsejPP7craJTlzpvm4ew1u97I/Ua8fi0cIdmZ/MbgHIOITR5cGtWvSNSK
         H5v5cRasYgVhW5DPzVd+F3io3auDjH5tI3kXX//wAHMWsX42LgA/EPEj8NKrwNr51Ko3
         9EqRFYh/F47h4B3e4+YR2nhEJkVJvOqd6nN3rvVcWWM+qB7uhZu2YP8cgqHbkjsShamI
         KI6fUvjaJk1vaL918GJ1B3WwwFmbdOOKtXzNBo90MiosnU5yu54lUuFl0FyN/ggJYX+l
         5dCQ==
X-Gm-Message-State: APjAAAV4wzB1WIEPkCEPlKWzvP/pZVU+MI780nXlVE9MdewXE9wRNBbJ
        sCdxp0toR1yUEJ3baBggf0XMEA==
X-Google-Smtp-Source: APXvYqyW50HA7ZEhhXDGV1K1uohEVxNfR/6CJnWo6HJvN0BWMjntyKWw6/dCACHUO6pL6WmrCvqsAw==
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr11697255lji.254.1581603090018;
        Thu, 13 Feb 2020 06:11:30 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r2sm1707612lff.63.2020.02.13.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 06:11:29 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] clk: versatile: Add device tree probing for IM-PD1 clocks
Date:   Thu, 13 Feb 2020 15:11:19 +0100
Message-Id: <20200213141119.66462-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200213141119.66462-1-linus.walleij@linaro.org>
References: <20200213141119.66462-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we want to move these clocks over to probe from the device
tree we add a device tree probing path.

The old platform data path will be deleted once we have the
device tree overall code in place.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/clk-impd1.c | 68 +++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 1991f15a5db9..96b1018bcb7a 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -7,7 +7,9 @@
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <linux/platform_data/clk-integrator.h>
+#include <linux/module.h>
 
 #include "icst.h"
 #include "clk-icst.h"
@@ -175,3 +177,69 @@ void integrator_impd1_clk_exit(unsigned int id)
 	kfree(imc->pclkname);
 }
 EXPORT_SYMBOL_GPL(integrator_impd1_clk_exit);
+
+static void __init integrator_impd1_clk_spawn(struct device *dev,
+					      void __iomem *base,
+					      struct device_node *np)
+{
+	struct clk *clk = ERR_PTR(-EINVAL);
+	const char *clk_name = np->name;
+	const char *parent_name;
+	const struct clk_icst_desc *desc;
+
+	if (of_device_is_compatible(np, "arm,impd1-vco1")) {
+		dev_info(dev, "register VCO1\n");
+		desc = &impd1_icst1_desc;
+	} else if (of_device_is_compatible(np, "arm,impd1-vco2")) {
+		dev_info(dev, "register VCO2\n");
+		desc = &impd1_icst2_desc;
+	} else {
+		dev_err(dev, "not a clock node %s\n", np->name);
+		return;
+	}
+
+	of_property_read_string(np, "clock-output-names", &clk_name);
+
+	parent_name = of_clk_get_parent_name(np, 0);
+	clk = icst_clk_register(NULL, desc, clk_name, parent_name, base);
+	if (!IS_ERR(clk))
+		of_clk_add_provider(np, of_clk_src_simple_get, clk);
+}
+
+static int integrator_impd1_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "unable to remap syscon base\n");
+		return PTR_ERR(base);
+	}
+	dev_info(dev, "located syscon base\n");
+
+	for_each_available_child_of_node(np, child)
+		integrator_impd1_clk_spawn(dev, base, child);
+
+	return 0;
+}
+
+static const struct of_device_id impd1_syscon_match[] = {
+	{ .compatible = "arm,im-pd1-syscon", },
+	{}
+};
+
+static struct platform_driver impd1_clk_driver = {
+	.driver = {
+		.name = "impd1-clk",
+		.of_match_table = impd1_syscon_match,
+	},
+	.probe  = integrator_impd1_clk_probe,
+};
+builtin_platform_driver(impd1_clk_driver);
+
+MODULE_AUTHOR("Linus Walleij <linusw@kernel.org>");
+MODULE_DESCRIPTION("Arm IM-PD1 module clock driver");
+MODULE_LICENSE("GPL v2");
-- 
2.23.0


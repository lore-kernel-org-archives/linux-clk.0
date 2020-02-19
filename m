Return-Path: <SRS0=r8+F=4H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF02C34047
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 352B3208E4
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fIi8zPik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBSKdl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:33:41 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40491 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgBSKdk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 05:33:40 -0500
Received: by mail-lj1-f193.google.com with SMTP id n18so26472232ljo.7
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 02:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3zL8BqD3nSyMrng2ALzfLDHclW3URpye2o+jipVp44=;
        b=fIi8zPikranG0j9o2BCAT1Xd4cp4eNXZ/auO6yqpux1/UKrFLF0oPNUKcG15N9S8IV
         YivHbCSdgBrzWwzxKgVN8lqZ7iCuussecW+7/eeLJahc2YHSQSkNbgG83Fpns53JGobl
         fNNBacawYzkiLyi/NYQCv6jHLvAANvU4at7kbYhOv+eLU+SEWozYD6DMdQOSx8llQDAH
         s8SOfQuki3lXixxTfFI9WhXXF1rCTjnQnox8p2jG3h/hSUPrY3UsuO8vHbSW980kR4Dy
         +YKpSph3X9o7vAu0MTtKqTpt/qugW+vTsVMkM+0Bxq19lXsjyHurCoGOB7W6KEFWYvcE
         0JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3zL8BqD3nSyMrng2ALzfLDHclW3URpye2o+jipVp44=;
        b=tbxY0Nub6iOBTUe57fG0ZWsO3VNtB58LPdPtYGCZ67ycLZcxsnUBT9+FXXkI3kYs4m
         Wd+WoSnuSp6z60L32xZTHpdSlB1kDlVdJ08ZjJKMOJbRsFrdmRHVdWpWPW268OkKpmsZ
         XuLpCc5ptRlkS98H5opY0a/FyU+Qr01EgcvbAWy8ed8QCX9qsNP9pkFw9tuM1s/R5H3x
         6V3qd9+SL6OiAh61gqTvLculv9nGENhbkUU93MpNtE30UVue7v4bE22nhHjdLsLDbxWG
         c3tcvqlLa6UTKdxRoocnCm3UmBTk/GpyNuEhc2iKfSbtLb9zVRg7XVb/P+9x6iQE++iz
         ZzwA==
X-Gm-Message-State: APjAAAXRsN8nEhmkawK19BGjy5hgsDrXf5vTOeYP4zBiA3GPp84W6RsY
        NcH+U1nQibxzWBdjcvNjiyt/9g==
X-Google-Smtp-Source: APXvYqze6ZB453ElkEFby3I+4uyFRO1UUNvFJvSkApvJ/cL59Fj6qkjJYdvR6Kyw564HS+M0bfx0vQ==
X-Received: by 2002:a2e:a404:: with SMTP id p4mr15961894ljn.234.1582108418553;
        Wed, 19 Feb 2020 02:33:38 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id k12sm1003316lfc.33.2020.02.19.02.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:33:37 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v3] clk: versatile: Add device tree probing for IM-PD1 clocks
Date:   Wed, 19 Feb 2020 11:33:26 +0100
Message-Id: <20200219103326.81120-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219103326.81120-1-linus.walleij@linaro.org>
References: <20200219103326.81120-1-linus.walleij@linaro.org>
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
ChangeLog v2->v3:
- Resend with the rest
ChangeLog v1->v2:
- Drop some __init tagging
- Provide MODULE_DEVICE_TABLE()
- Rewrote to use the same method with regmap as clk-icst.c
- The reuse of clk-icst.c makes the clock probe using hw
  and then it needs no special handling for clock output
  names.
---
 drivers/clk/versatile/clk-icst.h  |  1 +
 drivers/clk/versatile/clk-impd1.c | 79 +++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/clk/versatile/clk-icst.h b/drivers/clk/versatile/clk-icst.h
index 1206f008c11a..1a119ef11066 100644
--- a/drivers/clk/versatile/clk-icst.h
+++ b/drivers/clk/versatile/clk-icst.h
@@ -11,6 +11,7 @@ enum icst_control_type {
 	ICST_INTEGRATOR_AP_PCI, /* Odd bit pattern storage */
 	ICST_INTEGRATOR_CP_CM_CORE, /* Only 8 bits of VDW and 3 bits of OD */
 	ICST_INTEGRATOR_CP_CM_MEM, /* Only 8 bits of VDW and 3 bits of OD */
+	ICST_INTEGRATOR_IM_PD1, /* Like the Versatile, all control bits */
 };
 
 /**
diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 1991f15a5db9..b05da8516d4c 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -7,7 +7,11 @@
 #include <linux/clkdev.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <linux/platform_data/clk-integrator.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #include "icst.h"
 #include "clk-icst.h"
@@ -175,3 +179,78 @@ void integrator_impd1_clk_exit(unsigned int id)
 	kfree(imc->pclkname);
 }
 EXPORT_SYMBOL_GPL(integrator_impd1_clk_exit);
+
+static int integrator_impd1_clk_spawn(struct device *dev,
+				      struct device_node *parent,
+				      struct device_node *np)
+{
+	struct regmap *map;
+	struct clk *clk = ERR_PTR(-EINVAL);
+	const char *name = np->name;
+	const char *parent_name;
+	const struct clk_icst_desc *desc;
+	int ret;
+
+	map = syscon_node_to_regmap(parent);
+	if (IS_ERR(map)) {
+		pr_err("no regmap for syscon IM-PD1 ICST clock parent\n");
+		return PTR_ERR(map);
+	}
+
+	if (of_device_is_compatible(np, "arm,impd1-vco1")) {
+		desc = &impd1_icst1_desc;
+	} else if (of_device_is_compatible(np, "arm,impd1-vco2")) {
+		desc = &impd1_icst2_desc;
+	} else {
+		dev_err(dev, "not a clock node %s\n", name);
+		return -ENODEV;
+	}
+
+	parent_name = of_clk_get_parent_name(np, 0);
+	clk = icst_clk_setup(NULL, desc, name, parent_name, map,
+			     ICST_INTEGRATOR_IM_PD1);
+	if (!IS_ERR(clk)) {
+		of_clk_add_provider(np, of_clk_src_simple_get, clk);
+		ret = 0;
+	} else {
+		dev_err(dev, "error setting up IM-PD1 ICST clock\n");
+		ret = PTR_ERR(clk);
+	}
+
+	return ret;
+}
+
+static int integrator_impd1_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *child;
+	int ret = 0;
+
+	for_each_available_child_of_node(np, child) {
+		ret = integrator_impd1_clk_spawn(dev, np, child);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id impd1_syscon_match[] = {
+	{ .compatible = "arm,im-pd1-syscon", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, impd1_syscon_match);
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
2.24.1


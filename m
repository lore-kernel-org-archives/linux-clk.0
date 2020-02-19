Return-Path: <SRS0=r8+F=4H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B10C34047
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE3E621D56
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3+Fsbmo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgBSKFy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:05:54 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40488 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgBSKFy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 05:05:54 -0500
Received: by mail-lf1-f67.google.com with SMTP id c23so16948682lfi.7
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 02:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gxi6KYGr5mqVq8fzO7WJDSPc3JwpyT1jXF3qnuigAWw=;
        b=v3+FsbmoIQQtOkkzrQpyy22SkRwnx1+JS1E8I/n6hdNh7XNG38hYWpByYwJCPR3P6j
         RXFkhWnqaUc+aDe8Ilzuqx0w2yjhbP6zBKDI4CwyRItv4kd/Hs9YY+PSODOIl759LzBK
         MC9XLSnd78vMatYpWiiwc+SGX56ttu5gec3GAdgCjHCAI7xIa3iwtOZCIgM2qxpjSZG0
         oDIG3lMgUbtvDWdJCGClZmBsE23H+n4/MVeQIVFJCvayqCFt2yS0CFHXTRDOwsO3+pRv
         71/tuKc+sXQKdd6ZNRHosnMDomluZTD2igpF7xciNDqfAtYSN49QDdipfZIcNKP0qZyh
         C2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gxi6KYGr5mqVq8fzO7WJDSPc3JwpyT1jXF3qnuigAWw=;
        b=a1DXmGOZPJLRl+SNt4ppsRZPQ5dHlDD1HcrbEpgzqRfLpj35LvFyE2WfG1prV78K7t
         1dnfoXr9gBDlQKnnfil7gqSawqNgB1+CeRRpZJp5kJP00HDJYvtTK3DPtD5ZySqeY4K3
         IYosxvWaoPMc/xzQf2cUOFtiMeQIoqz3NiTMiLQ/H6k3w+pnGVqFALamgT+6Wc2hSQPs
         7n0zwAGsQw4/BWsXFCwPDM2kAGYJCs2iywiuFNHgd3AspoV4ntsDcu1yscRhBQBsL9Dr
         Nw/pzNMSTCsAez0z/QvMofFUmgoZRYmjixEeyNB444tFfDF0VHX3lO8JD6ZWFZe4XWdx
         Y6Qw==
X-Gm-Message-State: APjAAAVb+AyHam/NA0rKpaxqfGdO/L6q5Dv/3+m5k0X5tzUXfiXzJHFO
        oBQA2Te7A0dntRcW7Odve8VfkhFY6V4=
X-Google-Smtp-Source: APXvYqx3iQsjpEqeXi8xn4Hpkmoi/scOdToBb9tKqNTemDoaHLz6+/2iFWvABtoCopSlAwxaWfF0Fw==
X-Received: by 2002:a05:6512:3f6:: with SMTP id n22mr13249538lfq.59.1582106751346;
        Wed, 19 Feb 2020 02:05:51 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r2sm1079982lff.63.2020.02.19.02.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:05:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v2] clk: versatile: Add device tree probing for IM-PD1 clocks
Date:   Wed, 19 Feb 2020 11:05:43 +0100
Message-Id: <20200219100543.78424-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219100543.78424-1-linus.walleij@linaro.org>
References: <20200219100543.78424-1-linus.walleij@linaro.org>
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


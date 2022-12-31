Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9E8C46467
	for <linux-clk@archiver.kernel.org>; Sat, 31 Dec 2022 10:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbiLaKsJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Dec 2022 05:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiLaKsD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Dec 2022 05:48:03 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A9D108
        for <linux-clk@vger.kernel.org>; Sat, 31 Dec 2022 02:48:02 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id i15so33628628edf.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Dec 2022 02:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNTG6siRVvvtXsy+GAwDHHb+RGsPbfwrQN+hKdCck/s=;
        b=h6suuaQS77Q7uXcGE0tPIOZR6gBZPftHQtxsZiWvYKzvoFpBLYY0mo7cbC6csHNPoF
         3NaUYsD6S+p2Q+FZCE0OaBn+CWnPrJ7vDGapfHiNJKYuCUAnvARnT+N8olSAMNF1QW7K
         O20zyLdNpY08v8qurYDkKtekosozQzLZuBqX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNTG6siRVvvtXsy+GAwDHHb+RGsPbfwrQN+hKdCck/s=;
        b=2fgu847/skCVwlUBMTUQiVxVnSRHOYBZ9rX2G+hj8CRTtZe1/OENhgUk1EMYbVhHr4
         NoOg76ptmbueQ4RRnrEtrptt0bTYdPELxMvZdMqrGZCeuZTsxCLKgxNqDggq+b0C5w9C
         itk3dvg85J/k++WbAHJY5KncDJyj9sJNsrN8Z6EE+Vs6kJjXkD0Rp2h59p+RLzl7HVMR
         2DM7Jgno28paGvwgRGzCG5SHrJqlOBNhvv4IUFfz0rs0x8GKJH4DJxJlb9fpQ63tC58t
         MNuKhTQ/y2ks9Jg4SpbCDWIdG1hyaX+3YlRMMsAoX4d1zCx3FPXIvJaorhllUofHdTWh
         RpmA==
X-Gm-Message-State: AFqh2koDBLRQT2Wz+z1BtIlx2k9p+SgSFuW63W8J7usSnWaH/4c0h3Nd
        uBqnts0HAxNRpM3V7tgk0HgzSQ==
X-Google-Smtp-Source: AMrXdXuM12mBzocEhuMcUaHxAAUx1SH1UDETPNtrsDAD8zfD6TsTHXBUEAZtLnOMm8WCM7+fJN+OCQ==
X-Received: by 2002:a05:6402:1854:b0:483:6039:9801 with SMTP id v20-20020a056402185400b0048360399801mr22324086edy.22.1672483680664;
        Sat, 31 Dec 2022 02:48:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090655c400b0083ffb81f01esm10765438ejp.136.2022.12.31.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 02:48:00 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     tommaso.merciai@amarulasolutions.com,
        linux-amarula@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>, jagan@amarulasolutions.com,
        angelo@amarulasolutions.com, anthony@amarulasolutions.com,
        michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [RFC PATCH 07/11] clk: imx: composite-8m: add device tree support
Date:   Sat, 31 Dec 2022 11:47:32 +0100
Message-Id: <20221231104736.12635-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221231104736.12635-1-dario.binacchi@amarulasolutions.com>
References: <20221231104736.12635-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch, backwards compatible, extends the driver to initialize the
clock directly from the device tree.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/imx/clk-composite-8m.c | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index cbf0d7955a00..8c945d180318 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -7,6 +7,8 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include "clk.h"
@@ -25,6 +27,9 @@
 
 #define PCG_CGC_SHIFT		28
 
+#undef pr_fmt
+#define pr_fmt(fmt) "%s: " fmt, __func__
+
 static unsigned long imx8m_clk_composite_divider_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
@@ -250,3 +255,81 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
 	return ERR_CAST(hw);
 }
 EXPORT_SYMBOL_GPL(__imx8m_clk_hw_composite);
+
+static void __init _of_imx_composite_clk_setup(struct device_node *node,
+					       u32 type)
+{
+	void __iomem *reg;
+	struct clk_hw *hw;
+	const char *name = node->name;
+	unsigned int num_parents;
+	const char **parent_names;
+	unsigned long flags = IMX_COMPOSITE_CLK_FLAGS_DEFAULT;
+
+	reg = of_iomap(node, 0);
+	if (IS_ERR(reg)) {
+		pr_err("failed to get reg address for %pOFn\n", node);
+		return;
+	}
+
+	num_parents = of_clk_get_parent_count(node);
+	if (num_parents < 2) {
+		pr_err("%pOFn must have parents\n", node);
+		return;
+	}
+
+	parent_names = kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
+	if (!parent_names)
+		return;
+
+	of_clk_parent_fill(node, parent_names, num_parents);
+	of_property_read_string(node, "clock-output-names", &name);
+
+	if (of_property_read_bool(node, "fsl,get-rate-nocache"))
+		flags |= CLK_GET_RATE_NOCACHE;
+
+	if (of_property_read_bool(node, "fsl,is-critical"))
+		flags |= CLK_IS_CRITICAL;
+
+	hw = __imx8m_clk_hw_composite(name, parent_names, num_parents, reg,
+				      type, flags);
+	if (!IS_ERR(hw))
+		of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
+
+	kfree(parent_names);
+}
+
+/**
+ * of_imx_composite_clk_setup() - Setup function for imx composite  clock
+ * @node:	device node for the clock
+ */
+void __init of_imx_composite_clk_setup(struct device_node *node)
+{
+	_of_imx_composite_clk_setup(node, IMX_COMPOSITE_CORE);
+}
+CLK_OF_DECLARE(fsl_composite_8m_clk, "fsl,imx8m-composite-clock",
+	       of_imx_composite_clk_setup);
+
+/**
+ * of_imx_composite_bus_clk_setup() - Setup function for imx composite  clock
+ * @node:	device node for the clock
+ */
+void __init of_imx_composite_bus_clk_setup(struct device_node *node)
+{
+	_of_imx_composite_clk_setup(node, IMX_COMPOSITE_BUS);
+}
+CLK_OF_DECLARE(fsl_composite_bus_8m_clk, "fsl,imx8m-composite-bus-clock",
+	       of_imx_composite_bus_clk_setup);
+
+/**
+ * of_imx_composite_fw_managed_clk_setup() - Setup function for imx
+ *		composite fw managed clock
+ * @node:	device node for the clock
+ */
+void __init of_imx_composite_fw_managed_clk_setup(struct device_node *node)
+{
+	_of_imx_composite_clk_setup(node, IMX_COMPOSITE_FW_MANAGED);
+}
+CLK_OF_DECLARE(fsl_composite_fw_managed_8m_clk,
+	       "fsl,imx8m-composite-fw-managed-clock",
+	       of_imx_composite_fw_managed_clk_setup);
-- 
2.32.0


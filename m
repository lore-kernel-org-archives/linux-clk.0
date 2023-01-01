Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543B2C4167B
	for <linux-clk@archiver.kernel.org>; Sun,  1 Jan 2023 17:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjAAR61 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Jan 2023 12:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbjAAR6F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 Jan 2023 12:58:05 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1ED13886
        for <linux-clk@vger.kernel.org>; Sun,  1 Jan 2023 09:58:00 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id tz12so62244213ejc.9
        for <linux-clk@vger.kernel.org>; Sun, 01 Jan 2023 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ANQd6bXt3IGDoNEOc8NxJt3wMiyzrQXu+RqmVmBeDs=;
        b=mJe4b2RijturIL0i0gYMqhYyZrq5yE58888YGpw5SuKxqw11OTF1jgUQbEGXQes+Bj
         g08qD16XDp9EIy/dlYAv4mIM2+7uit24d067Y03rx7bIcXGOOp7XK9OLAX1o2yySiGkP
         C2cjT0tk2e8sJMMRCDKMq+lj+XjQjBLBXRzRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ANQd6bXt3IGDoNEOc8NxJt3wMiyzrQXu+RqmVmBeDs=;
        b=Z0hYM2xkOlZg4kej9tqxOJ+3FD0JdselLJ403NSe4ztclX6VvyeefDFp3JNTqnuPP7
         zqzjz5t44nvACHPqSXGPv8Wj2Ju+sUPOHXDj0QGf6M845zeamK6h4EpUZYLs6K3MEJ61
         VGh8o6Zya0Y45fV65n88vM10IZ2w7PcN8s52gakp0bdL3StJssUOOrNPtNPINb5NfO5e
         5L1+O+m+KRYnX/XC0rS1M5ZHX60vilEchrJshl7uQiB3pH0ElFN2I53/nxJnwAnrLxKc
         yg5Gg5WKdnaHAzjCchrLnLIKAF8QD1XlSNRJabzxXkCEKTRLtFzfxavwHWRYwTy994gp
         PWmQ==
X-Gm-Message-State: AFqh2kp0FXRlKdAgj5friFycJgjota44GJeyPsQRxDXARlkOBSPdubR5
        xtbhoe9b66laJ5nVjzaOPCJuxg==
X-Google-Smtp-Source: AMrXdXso8nbBqMtt1gTfs/eQvnUDWYvkn4cvq16z7m5ZY+eEiCoFsgF/aVFX8u9ZgdaZ0F7gZ9a+6w==
X-Received: by 2002:a17:907:72d3:b0:7c0:fd1e:972e with SMTP id du19-20020a17090772d300b007c0fd1e972emr42553684ejc.46.1672595879577;
        Sun, 01 Jan 2023 09:57:59 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709063d4200b0082ddfb47d06sm12273018ejf.148.2023.01.01.09.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:57:59 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     angelo@amarulasolutions.com, michael@amarulasolutions.com,
        tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com,
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
Subject: [RFC PATCH v2 09/11] clk: imx: cpu: add device tree support
Date:   Sun,  1 Jan 2023 18:57:38 +0100
Message-Id: <20230101175740.1010258-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patch, backwards compatible, extends the driver to initialize the
clock directly from the device tree.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-cpu.c | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/clk/imx/clk-cpu.c b/drivers/clk/imx/clk-cpu.c
index cb6ca4cf0535..28fb75c6ecea 100644
--- a/drivers/clk/imx/clk-cpu.c
+++ b/drivers/clk/imx/clk-cpu.c
@@ -106,3 +106,57 @@ struct clk_hw *imx_clk_hw_cpu(const char *name, const char *parent_name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_clk_hw_cpu);
+
+/**
+ * of_imx_cpu_clk_setup - Setup function for imx low power gate
+ *                            clock
+ * @node:	device node for the clock
+ */
+static void __init of_imx_cpu_clk_setup(struct device_node *node)
+{
+	struct clk_hw *hw;
+	struct clk *parent_clk, *div, *mux, *pll, *step;
+	const char *name = node->name, *parent_name;
+
+	parent_clk = of_clk_get_by_name(node, "fck");
+	if (IS_ERR(parent_clk)) {
+		pr_err("failed to get parent clock for %pOFn\n", node);
+		return;
+	}
+
+	div = of_clk_get_by_name(node, "div-clk");
+	if (IS_ERR(div)) {
+		pr_err("failed to get div clock for %pOFn\n", node);
+		return;
+	}
+
+	mux = of_clk_get_by_name(node, "mux-clk");
+	if (IS_ERR(div)) {
+		pr_err("failed to get mux clock for %pOFn\n", node);
+		return;
+	}
+
+	pll = of_clk_get_by_name(node, "pll-clk");
+	if (IS_ERR(div)) {
+		pr_err("failed to get pll clock for %pOFn\n", node);
+		return;
+	}
+
+	step = of_clk_get_by_name(node, "step-clk");
+	if (IS_ERR(div)) {
+		pr_err("failed to get step clock for %pOFn\n", node);
+		return;
+	}
+
+	parent_name = __clk_get_name(parent_clk);
+	of_property_read_string(node, "clock-output-names", &name);
+
+	hw = imx_clk_hw_cpu(name, parent_name, div, mux, pll, step);
+	if (!IS_ERR(hw))
+		of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
+
+	pr_debug("name: %s, parent: %s, div: %s, mux: %s, pll: %s, step: %s\n",
+		 name, parent_name, __clk_get_name(div), __clk_get_name(mux),
+		 __clk_get_name(pll), __clk_get_name(step));
+}
+CLK_OF_DECLARE(fsl_cpu_clk, "fsl,cpu-clock", of_imx_cpu_clk_setup);
-- 
2.32.0


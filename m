Return-Path: <SRS0=BIUh=BI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38152C433E4
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E61A21D95
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgG2IEu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:50 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34566 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgG2IEu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:50 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A53221A10E0;
        Wed, 29 Jul 2020 10:04:48 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B8A471A0F3A;
        Wed, 29 Jul 2020 10:04:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B9AC14032B;
        Wed, 29 Jul 2020 10:04:38 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v7 08/11] clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
Date:   Wed, 29 Jul 2020 16:00:15 +0800
Message-Id: <1596009618-25516-9-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

One LPCG controller supports up to 8 clock outputs while each of them
is fixed to 4 bits.  It supports only gating function with fixed bits.
So we can use the clk-indices to fetch the corresponding clock idx from
device tree. With this way, we can write a generic LPCG clock drivers.

This patch add that support to parse clocks from device tree.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
Changelog:
v5->v7:
 * no changes
v4->v5:
 * add error check for devm_of_clk_add_hw_provider
 * add more commit message
 * a few minor updates
v3->v4:
 * remove hw_autogate which is not still used by driver
 * use clock-indices to indicate LPCG clock bit offset
v1->v3: no changes
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 124 +++++++++++++++++++++++++++++
 drivers/clk/imx/clk-lpcg-scu.c     |   8 ++
 drivers/clk/imx/clk-scu.h          |   1 +
 3 files changed, 133 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 04c8ee35e14c..1881d7f3ccec 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -157,6 +158,122 @@ static const struct imx8qxp_ss_lpcg imx8qxp_ss_lsio = {
 	.num_max = IMX_LSIO_LPCG_CLK_END,
 };
 
+#define IMX_LPCG_MAX_CLKS	8
+
+static struct clk_hw *imx_lpcg_of_clk_src_get(struct of_phandle_args *clkspec,
+					      void *data)
+{
+	struct clk_hw_onecell_data *hw_data = data;
+	unsigned int idx = clkspec->args[0] / 4;
+
+	if (idx >= hw_data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return hw_data->hws[idx];
+}
+
+static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
+				       struct device_node *np)
+{
+	const char *output_names[IMX_LPCG_MAX_CLKS];
+	const char *parent_names[IMX_LPCG_MAX_CLKS];
+	unsigned int bit_offset[IMX_LPCG_MAX_CLKS];
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clk_hws;
+	struct resource *res;
+	void __iomem *base;
+	int count;
+	int idx;
+	int ret;
+	int i;
+
+	if (!of_device_is_compatible(np, "fsl,imx8qxp-lpcg"))
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	count = of_property_count_u32_elems(np, "clock-indices");
+	if (count < 0) {
+		dev_err(&pdev->dev, "failed to count clocks\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * A trick here is that we set the num of clks to the MAX instead
+	 * of the count from clock-indices because one LPCG supports up to
+	 * 8 clock outputs which each of them is fixed to 4 bits. Then we can
+	 * easily get the clock by clk-indices (bit-offset) / 4.
+	 * And the cost is very limited few pointers.
+	 */
+
+	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
+				IMX_LPCG_MAX_CLKS), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX_LPCG_MAX_CLKS;
+	clk_hws = clk_data->hws;
+
+	ret = of_property_read_u32_array(np, "clock-indices", bit_offset,
+					 count);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to read clock-indices\n");
+		return -EINVAL;
+	}
+
+	ret = of_clk_parent_fill(np, parent_names, count);
+	if (ret != count) {
+		dev_err(&pdev->dev, "failed to get clock parent names\n");
+		return count;
+	}
+
+	ret = of_property_read_string_array(np, "clock-output-names",
+					    output_names, count);
+	if (ret != count) {
+		dev_err(&pdev->dev, "failed to read clock-output-names\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < count; i++) {
+		idx = bit_offset[i] / 4;
+		if (idx > IMX_LPCG_MAX_CLKS) {
+			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
+				 i);
+			ret = -EINVAL;
+			goto unreg;
+		}
+
+		clk_hws[idx] = imx_clk_lpcg_scu(output_names[i],
+						parent_names[i], 0, base,
+						bit_offset[i], false);
+		if (IS_ERR(clk_hws[idx])) {
+			dev_warn(&pdev->dev, "failed to register clock %d\n",
+				 idx);
+			ret = PTR_ERR(clk_hws[idx]);
+			goto unreg;
+		}
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, imx_lpcg_of_clk_src_get,
+					  clk_data);
+	if (!ret)
+		return 0;
+
+unreg:
+	while (--i >= 0) {
+		idx = bit_offset[i] / 4;
+		if (clk_hws[idx])
+			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
+	}
+
+	return ret;
+}
+
 static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -167,8 +284,14 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct clk_hw **clks;
 	void __iomem *base;
+	int ret;
 	int i;
 
+	/* try new binding to parse clocks from device tree first */
+	ret = imx_lpcg_parse_clks_from_dt(pdev, np);
+	if (!ret)
+		return 0;
+
 	ss_lpcg = of_device_get_match_data(dev);
 	if (!ss_lpcg)
 		return -ENODEV;
@@ -219,6 +342,7 @@ static const struct of_device_id imx8qxp_lpcg_match[] = {
 	{ .compatible = "fsl,imx8qxp-lpcg-adma", &imx8qxp_ss_adma, },
 	{ .compatible = "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
 	{ .compatible = "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
+	{ .compatible = "fsl,imx8qxp-lpcg", NULL },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
index a73a799fb777..897a4c3c02e2 100644
--- a/drivers/clk/imx/clk-lpcg-scu.c
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -114,3 +114,11 @@ struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
 
 	return hw;
 }
+
+void imx_clk_lpcg_scu_unregister(struct clk_hw *hw)
+{
+	struct clk_lpcg_scu *clk = to_clk_lpcg_scu(hw);
+
+	clk_hw_unregister(&clk->hw);
+	kfree(clk);
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 22976d64a96a..6a879526b3d5 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -47,4 +47,5 @@ static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *
 struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
 				unsigned long flags, void __iomem *reg,
 				u8 bit_idx, bool hw_gate);
+void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
 #endif
-- 
2.23.0


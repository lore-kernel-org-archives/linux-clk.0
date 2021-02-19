Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1B1C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 16:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 824BE64EB7
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 16:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBSQDV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Feb 2021 11:03:21 -0500
Received: from inva020.nxp.com ([92.121.34.13]:36974 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230010AbhBSQCi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Feb 2021 11:02:38 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6FAE11A026F;
        Fri, 19 Feb 2021 17:01:10 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 614431A00BD;
        Fri, 19 Feb 2021 17:01:10 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BB2122042F;
        Fri, 19 Feb 2021 17:01:09 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Georgi Djakov <djakov@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Martin Kepplinger <martink@posteo.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 19/19] mmc: sdhci-esdhc-imx: Add interconnect support
Date:   Fri, 19 Feb 2021 18:00:16 +0200
Message-Id: <1613750416-11901-20-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com>
References: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On probe, if the dts node contains a valid icc path, then look for the
fsl,icc-rate property and get the rate. Also set the icc bandwidth
for that path to the nominal rate needed for sdhc to function right.
Then enable and disable the path every time the sdhc is used or not.
This will result in reducing the clock speeds along the icc path
for each pl301 and NoC, but still meet the requirements for all the
other icc consumers.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a20459744d21..65c5caf82e0c 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/interconnect.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/delay.h>
@@ -287,6 +288,9 @@ struct pltfm_imx_data {
 	struct clk *clk_ahb;
 	struct clk *clk_per;
 	unsigned int actual_clock;
+	struct icc_path *bus_path;
+	unsigned int bus_rate;
+
 	enum {
 		NO_CMD_PENDING,      /* no multiblock command pending */
 		MULTIBLK_IN_PROCESS, /* exact multiblock cmd in process */
@@ -1539,6 +1543,18 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
 		cpu_latency_qos_add_request(&imx_data->pm_qos_req, 0);
 
+	imx_data->bus_path = devm_of_icc_get(&pdev->dev, "path");
+	if (IS_ERR(imx_data->bus_path)) {
+		return PTR_ERR(imx_data->bus_path);
+	} else if (imx_data->bus_path) {
+		if (of_property_read_u32(pdev->dev.of_node, "fsl,icc-rate", &imx_data->bus_rate)) {
+			dev_err(&pdev->dev, "icc-rate missing\n");
+			return -EINVAL;
+		}
+
+		err = icc_set_bw(imx_data->bus_path, 0, imx_data->bus_rate);
+	}
+
 	imx_data->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
 	if (IS_ERR(imx_data->clk_ipg)) {
 		err = PTR_ERR(imx_data->clk_ipg);
@@ -1720,14 +1736,20 @@ static int sdhci_esdhc_suspend(struct device *dev)
 
 	ret = mmc_gpio_set_cd_wake(host->mmc, true);
 
+	icc_disable(imx_data->bus_path);
+
 	return ret;
 }
 
 static int sdhci_esdhc_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
 	int ret;
 
+	icc_enable(imx_data->bus_path);
+
 	ret = pinctrl_pm_select_default_state(dev);
 	if (ret)
 		return ret;
@@ -1779,6 +1801,8 @@ static int sdhci_esdhc_runtime_suspend(struct device *dev)
 	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
 		cpu_latency_qos_remove_request(&imx_data->pm_qos_req);
 
+	icc_disable(imx_data->bus_path);
+
 	return ret;
 }
 
@@ -1789,6 +1813,8 @@ static int sdhci_esdhc_runtime_resume(struct device *dev)
 	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
 	int err;
 
+	icc_enable(imx_data->bus_path);
+
 	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
 		cpu_latency_qos_add_request(&imx_data->pm_qos_req, 0);
 
-- 
2.29.2


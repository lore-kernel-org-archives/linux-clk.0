Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B970EC282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B64120857
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Rj8La++t";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="czyZLeW1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfBBP06 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:26:58 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37880 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfBBP06 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:26:58 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AAE96609E2; Sat,  2 Feb 2019 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121216;
        bh=16WB7//x6knntlvnWJTCLm9ZHZzkdidEzFbvpj0dNas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rj8La++tXMeaYGpnnZ4A0Vkydp+IsSW18EtQDwf1KsJ1msUmDWL7PodvIcawSKjfS
         VygrEdkDNA/5JG5Z/fpTiDIuYYbYzM11qYe8WsPFc+RZHWF3tmnfZFJqrfCP4RTsAi
         GU+xwu+u4TwQ5JXJLXNv/CPMncCHzv8RNrAtm4qI=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1287609C1;
        Sat,  2 Feb 2019 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121215;
        bh=16WB7//x6knntlvnWJTCLm9ZHZzkdidEzFbvpj0dNas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czyZLeW1WilgVR2YNdGZaskOS8djM1acs3HJNXWdBDGPC4BlYj3mc7nzJ0wPGJ0H5
         R/bxBfzbYd9RK16XRZ8VRYMBxBYnxTYLAhbVyb6BTqNT4uLMSLcsM0YnNqOLug4qIn
         PchQQt00JQ23syZ0P3KnR2nf7xkasJevR0jlKrIM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1287609C1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 5/8] remoteproc: qcom: wcss: populate hardcoded param using driver data
Date:   Sat,  2 Feb 2019 20:56:23 +0530
Message-Id: <20190202152626.1006-6-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Q6 based WiFi fw loading is supported across
different targets, ex: IPQ8074/QCS404. In order to
support different fw names/pas id etc, populate
hardcoded param using driver data.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 35 ++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index f93e1e4a1cc0..f18b55227805 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -16,7 +17,6 @@
 #include "qcom_common.h"
 #include "qcom_q6v5.h"
 
-#define WCSS_CRASH_REASON		421
 
 /* Q6SS Register Offsets */
 #define Q6SS_RESET_REG		0x014
@@ -70,6 +70,12 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
+struct wcss_data {
+	const char *firmware_name;
+	int crash_reason_smem;
+	u8 version;
+};
+
 struct q6v5_wcss {
 	struct device *dev;
 
@@ -91,6 +97,9 @@ struct q6v5_wcss {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+
+	int crash_reason_smem;
+	u8 version;
 };
 
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
@@ -427,7 +436,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 				     wcss->mem_size, &wcss->mem_reloc);
 }
 
-static const struct rproc_ops q6v5_wcss_ops = {
+static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.start = q6v5_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
@@ -527,12 +536,17 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
+	const struct wcss_data *desc;
 	struct q6v5_wcss *wcss;
 	struct rproc *rproc;
 	int ret;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
-			    "IPQ8074/q6_fw.mdt", sizeof(*wcss));
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ipq8074_ops,
+			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -540,6 +554,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss = rproc->priv;
 	wcss->dev = &pdev->dev;
+	wcss->version = desc->version;
+	wcss->crash_reason_smem = desc->crash_reason_smem;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -553,7 +569,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, WCSS_CRASH_REASON, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem,
+			     NULL);
 	if (ret)
 		goto free_rproc;
 
@@ -581,8 +598,14 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct wcss_data wcss_ipq8074_res_init = {
+	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.crash_reason_smem = 421,
+};
+
 static const struct of_device_id q6v5_wcss_of_match[] = {
-	{ .compatible = "qcom,ipq8074-wcss-pil" },
+	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+
 	{ },
 };
 MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


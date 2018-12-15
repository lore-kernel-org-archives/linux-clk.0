Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76C8C43387
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8B512084D
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="OKkgTNQa";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="AkkFJlOy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbeLOKgm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 05:36:42 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45886 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeLOKgm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 05:36:42 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CC946608A5; Sat, 15 Dec 2018 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870201;
        bh=qgyl6Kt3ROb5r71OdnXBDsOZ+bM0BidVOEPm12F2RJw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OKkgTNQaO8mLXuBJJVmW8tomO6q1VbjkP+R723OMCXs+Sk+LgP0fDbZQ4laKs1vjD
         U/6e6+5o11m2EVn6xzpOLOlYrb3N7+ctgV6yy4hAhf9sSjIwj0zfoGnkNb7aLmhbY0
         jxubyQTfwoHjtPfR7GyUrOr5ytAJFb5kzuFs4M+Q=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B54B6090F;
        Sat, 15 Dec 2018 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870198;
        bh=qgyl6Kt3ROb5r71OdnXBDsOZ+bM0BidVOEPm12F2RJw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AkkFJlOy5lrfet9AwhnPukwFgiWtgewyMKxhwbUnA7F7HHm4fsvw/gp7l6pvguPwY
         p7aZsj06ZQ0PdYDNzrGmOxsjFqy3xuRbi/aAU3OsLLLSqQO+HB8rp9PQU8FBmHeRBZ
         TWvgDO13nVPh9ClLAKBYJvYmJC8wIDIp/S5BQt3k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B54B6090F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 7/7] remoteproc: qcom: wcss: explicitly request exclusive reset control
Date:   Sat, 15 Dec 2018 16:05:57 +0530
Message-Id: <20181215103557.2748-8-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181215103557.2748-1-govinds@codeaurora.org>
References: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use request exclusive reset control for wcss reset controls.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 3f66bd8fa407..b382e5eba26d 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -756,20 +756,20 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 	struct device *dev = wcss->dev;
 
 	if (aon_reset_required) {
-		wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");
+		wcss->wcss_aon_reset = devm_reset_control_get_exclusive(dev, "wcss_aon_reset");
 		if (IS_ERR(wcss->wcss_aon_reset)) {
 			dev_err(wcss->dev, "fail to acquire wcss_aon_reset\n");
 			return PTR_ERR(wcss->wcss_aon_reset);
 		}
 	}
 
-	wcss->wcss_reset = devm_reset_control_get(dev, "wcss_reset");
+	wcss->wcss_reset = devm_reset_control_get_exclusive(dev, "wcss_reset");
 	if (IS_ERR(wcss->wcss_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_reset\n");
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
-	wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
+	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
 	if (IS_ERR(wcss->wcss_q6_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
 		return PTR_ERR(wcss->wcss_q6_reset);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


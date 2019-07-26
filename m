Return-Path: <SRS0=bWzc=VX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4724C7618B
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 09:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C0A122CB9
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 09:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ZCDUTutg";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="LFOAS/iy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfGZJYI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jul 2019 05:24:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59446 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfGZJYH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jul 2019 05:24:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AADD96192C; Fri, 26 Jul 2019 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133046;
        bh=xP6UNwG/IosfwSrscp1xWFAuEJXHy9xTR/aAp7folSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZCDUTutg8M1tredKqRkdIzbOt929mA1Q1fKDTC17vfcaiMYKRB7TWeMilSYeoNwQ0
         wH6Mju//HjkfopQV66WQRLYqmlgqIWNa7Dm0KGFdzyWQAiyDEtcUJwPzREgVrx6mdq
         N8JwTqFFw11KhJmsqDtlKZl0E3Tdp+SCZoxa58t4=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8643B61893;
        Fri, 26 Jul 2019 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133042;
        bh=xP6UNwG/IosfwSrscp1xWFAuEJXHy9xTR/aAp7folSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LFOAS/iyOTiRYrrMTsUqZ3Zg+Lpy8fFiWUuGM2uICoKb6HNcSnMuXofb1b60urBbs
         KoIGlS/k7Wj+cAdY8aoui2PJGl0bp9OrrqjBKcVD7GSZA8jT/WnfED5KkrPBpau88G
         1N5uhWAhiSSalDNgpnGv+XclN5evm8xEXwJspZY8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8643B61893
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 7/7] remoteproc: qcom: wcss: explicitly request exclusive reset control
Date:   Fri, 26 Jul 2019 14:53:32 +0530
Message-Id: <20190726092332.25202-8-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
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
index c2e75f5b5737..a2671a19f2d0 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -781,21 +781,21 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 	struct device *dev = wcss->dev;
 
 	if (desc->aon_reset_required) {
-		wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");;
+		wcss->wcss_aon_reset = devm_reset_control_get_exclusive(dev, "wcss_aon_reset");;
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
 
 	if (desc->wcss_q6_reset_required) {
-		wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
+		wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
 		if (IS_ERR(wcss->wcss_q6_reset)) {
 			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
 			return PTR_ERR(wcss->wcss_q6_reset);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


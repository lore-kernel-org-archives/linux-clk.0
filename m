Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02AFC282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 807732086C
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="NrurUSC5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ky9/ypZY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfBBP1K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:27:10 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38374 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfBBP1K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:27:10 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B87ED6085C; Sat,  2 Feb 2019 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121229;
        bh=o2XUr4ArMgaqceLywvsAvCpp5+0829fBo6Z7zpOZVes=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NrurUSC5hoIkOLFOjAspVL2Qgs+tffER6Fp2o+2854SanopwVAmWsXHdCEe3hwktr
         8bvuDjc/DXw41IQboSz6tTcA/My0f3t2SF5Da49eJeUqNMIpnV0ZfzhbgOEqJMsmTe
         3YuqYaS09Bv386MIpPRKODlpUgIQcoVuNrrAqfpA=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BA4560A0B;
        Sat,  2 Feb 2019 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121228;
        bh=o2XUr4ArMgaqceLywvsAvCpp5+0829fBo6Z7zpOZVes=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ky9/ypZYBluZNPY5YXbdyT0amDckjrimh1esfUbw5iTNBWQ5GALCNPrDVSN8/sfRB
         g6lx+k3WkLGVxJWB/MY07bQT/t0n+qf6yVf+wQykhPi2G34nMEEbGogE8Ygvn79C0w
         7mJBT6+msAlID3Gx9OJHEZ7MSMytQ5UjeXywrCK0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BA4560A0B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 8/8] remoteproc: qcom: wcss: explicitly request exclusive reset control
Date:   Sat,  2 Feb 2019 20:56:26 +0530
Message-Id: <20190202152626.1006-9-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
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
index 0b1f6f537a1e..0821c94be6eb 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -752,20 +752,20 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 	struct device *dev = wcss->dev;
 
 	if (aon_reset_required) {
-		wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");;
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


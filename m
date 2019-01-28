Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFBEC282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82A7520881
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6f9KG0t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfA1Sej (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:34:39 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36826 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727438AbfA1SdV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:21 -0500
Received: by mail-wm1-f67.google.com with SMTP id p6so15011194wmc.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CByMJapU1NSkj2K6jtzA4klxdw2kAUsE2KAShgBobpo=;
        b=Q6f9KG0tQSMK7v4MMXKg9Vd31jOXjH7CP9t+KgkhFYmdQpoyZV6HBbFm3l4TqXT+PX
         hr8hgWw4OZxPVL8DpYBSfsPfjAjV/+AHnfBn2DRYjXOl8DbczY4kDSEFL1rC5bCrDLoT
         ohHlTGHsTYIF6efkQA1tlhU/U3e9wcYqnhm38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CByMJapU1NSkj2K6jtzA4klxdw2kAUsE2KAShgBobpo=;
        b=AViXoMc232iuSHrGSAMgkQfqVjVkG5MTXotPaYzhSEK1Edr7G7kgeJkPekSEdZX+aW
         OabIPeJCm53LF8bLX2MonaplhXnCm3ScEYb+KHtn3BQjepflcr7v5pAWVLaFvoI6O3k+
         sG8mNV5cp5KQQizOwadT6l5Htgg03wTL9gWU+uQTSHlI/xbt7ZPrSG8esWoChZnblGnr
         EWaholfy296eNxtc7lg/yNaaWIbybn3wdShqTARq5CGf3TDbCL3TbK4fq9dqLGQJ214N
         +9YTx6FF3PKiEyJz1lOAGceUKUQZrgxwPNNq3pH4BCd/swLVJoivp1I/ncBWHUSy6pXI
         aQ8g==
X-Gm-Message-State: AJcUukddwWExaVNc/UP0Ai4r88+b7uo3tUq9jY9/m5QsFEQhOJMoI2Ew
        ovSIo63THBGFueCJW6M/i53GUQ==
X-Google-Smtp-Source: ALg8bN5uTTcLsM/5hu9M1d/2tZ5GXlZp7xlAlHOAgHNAZwjGQ/mxSNxCBB3KJ6tzvl5Nj9oJFtBp7Q==
X-Received: by 2002:a1c:dd04:: with SMTP id u4mr18068554wmg.84.1548700399573;
        Mon, 28 Jan 2019 10:33:19 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:19 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v2 02/14] mbox: qcom: add APCS child device for QCS404
Date:   Mon, 28 Jan 2019 19:32:49 +0100
Message-Id: <1548700381-22376-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is clock controller functionality in the APCS hardware block of
qcs404 devices similar to msm8916.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 3cf2937..0d64aa5 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -97,16 +97,21 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
-		apcs->clk = platform_device_register_data(&pdev->dev,
-							  "qcom-apcs-msm8916-clk",
-							  -1, NULL, 0);
-		if (IS_ERR(apcs->clk))
-			dev_err(&pdev->dev, "failed to register APCS clk\n");
-	}
-
 	platform_set_drvdata(pdev, apcs);
 
+	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") ||
+	    of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global"))
+		goto register_clk;
+
+	return 0;
+
+register_clk:
+	apcs->clk = platform_device_register_data(&pdev->dev,
+						  "qcom-apcs-msm8916-clk",
+						  -1, NULL, 0);
+	if (IS_ERR(apcs->clk))
+		dev_err(&pdev->dev, "failed to register APCS clk\n");
+
 	return 0;
 }
 
-- 
2.7.4


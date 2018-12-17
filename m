Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA8FC43612
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F162D2086C
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzHtBQec"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732155AbeLQJrs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 04:47:48 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41034 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732117AbeLQJqm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 04:46:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id x10so11528184wrs.8
        for <linux-clk@vger.kernel.org>; Mon, 17 Dec 2018 01:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DZnT+i5jw7FKMKXrOSMgnbdLeVWkWYBBUnpyBbjaMIo=;
        b=FzHtBQecwnsOdmLrHWs1fQzYOhp3dfjJ0dhPsVXtjH7IPLKxHLdtL8K99B09iFOjlM
         nKlO/8up0jW8eqbjiOZjUhUdv9/rStEqwSDMqAXIih+cpUEK8huEj4Gk+ybQPCePF8fA
         dPkfbuUPbHOjqKk5/e3mvs5VhMyDoWap7Knr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DZnT+i5jw7FKMKXrOSMgnbdLeVWkWYBBUnpyBbjaMIo=;
        b=ZHjiYERJcL5O1blaltrHrjVK3BTGJu2F1fV+FnVrCxDjt0DGezG4uwzxF9RqIwHXqT
         RpSYII172WPQVPQzolM8nXIMSLE6WES/YQPC0VelFA/JtOSSEUIxIht8twXN4uZd68wS
         4Zhrd7/LjBj8qHwVIFF+FcwivZXb0//luXHyqFmltjLkQq7TFYXK4CQBIjmIfxd6YOXr
         hUkxD23XQ76w0JduUFMmKAsHRwmR3lxRJi2Zl0OfywnrrobVfTaRrp6vct1I9oJHmPcC
         RRH8zjGb2j/eZbe3x0R1bTUL016tQ7hQJW2yGvw7VNLRs3t9ZBxdU8GRkXhalvkpg9WH
         0+Xg==
X-Gm-Message-State: AA+aEWYSmBClRDzYuFj8EPGCDytKq9OAJX6teg6EfR9UbjDrqV2TX3Qs
        oiEw+Ye7Gefp4rDT+BcdYN2mEw==
X-Google-Smtp-Source: AFSGD/W556/G72nW1KLgphiChECIUNEbP+PQ5P/XZO+ldt3E2+Te6cBFOdGtxBOq5cdnXt3oz6dVlQ==
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr9285946wrb.167.1545040000993;
        Mon, 17 Dec 2018 01:46:40 -0800 (PST)
Received: from localhost.localdomain (58.red-81-47-145.staticip.rima-tde.net. [81.47.145.58])
        by smtp.gmail.com with ESMTPSA id h12sm28878113wma.48.2018.12.17.01.46.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 01:46:40 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 03/13] mbox: qcom: replace integer with valid macro
Date:   Mon, 17 Dec 2018 10:46:20 +0100
Message-Id: <1545039990-19984-4-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use the correct macro when registering the platform device.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index dc8fdab1..b782173 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -108,7 +108,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 register_clk:
 	apcs->clk = platform_device_register_data(&pdev->dev,
 						  "qcom-apcs-msm8916-clk",
-						  -1, NULL, 0);
+						  PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(apcs->clk))
 		dev_err(&pdev->dev, "failed to register APCS clk\n");
 
-- 
2.7.4


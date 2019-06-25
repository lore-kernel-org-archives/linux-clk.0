Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE76C48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42095204FD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xbo7XSFN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730371AbfFYQsu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 12:48:50 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55918 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730674AbfFYQrm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 12:47:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so3541578wmj.5
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DnmUUmlBFAOJ6r0lO2j/n/ft2AG+WeYI8h0EcXuhXCs=;
        b=Xbo7XSFN9rED5NZS/+c+eS51wLoYcSb+HfUkS0fXp+WEVZI/klmyc/xzDQcSk6kbda
         PLkTwD+LzBS3AZ94fFA8beUaDPzXToHiAtQGtYgMEa7xGSHRnmt9i8HHb4RkAENDHe5e
         IsL0oKoIDRchTHu/mEX4S5wUizdEf+RMRPLLMDrB7AmcmgO+P7E3pn73quB2Juy8UxTW
         jEED9bkXwE57LB6U9SOCXArx0Oju7R8iZ1WfU5HvlkhPqgCsPcO1+tnAvFeSoPUrrDae
         33cxR70DEVqATeHx9PamU6pz/v/4lzjTi/KGso5mz5Zz8Vhl6pl2nCo9mmky/EQOLFvo
         3uUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DnmUUmlBFAOJ6r0lO2j/n/ft2AG+WeYI8h0EcXuhXCs=;
        b=Gv6LN7DXwNS2BBGUNV8hQD9UOQ6l+JJzjjuWqwfh/HaGR4Ui0NLWwuiLTVQ3yM4CJR
         YgyZd/43Z8/1z8javMiddmi5MWjfmzvXUJhBtRjeAW4eRXr6aGVFeujyzPqmhcBx7gAV
         CaaIjwQ92c+lsSbF3oaTaxr4iZSbaZJ8VKWuoaUdeTtD7JYfm9Z0kjQCKmwSMtlcdOtt
         m/VLbRV6t7/X2BoOo42V+rTVHpfokHXD33yKw5xibBMOzz0HhlqRmmxHVtqyfv10gWJc
         fNR+Y9J2HwZBgRTRuJChIaRGHXlNUmMN5Y5No8p9OsizRfisXG614tGjJoH0a6/gmWVc
         gVWw==
X-Gm-Message-State: APjAAAWQagGsZs34UzD1RfhJK5SL9HpDZ0znlRalEHI7gyyXGsirgT2V
        I8tBvQ3qjWyCYXYW5UtUJvXNsg==
X-Google-Smtp-Source: APXvYqw0MlFamdgw8IfuZ/mw6IFGIsihCgTjA9lyv6BtUZRI3MTMXO+uUOMmyuh2w+RBxwxPXQqvxw==
X-Received: by 2002:a1c:cb4d:: with SMTP id b74mr14944322wmg.43.1561481260999;
        Tue, 25 Jun 2019 09:47:40 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:40 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 02/14] mbox: qcom: add APCS child device for QCS404
Date:   Tue, 25 Jun 2019 18:47:21 +0200
Message-Id: <20190625164733.11091-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479c..a05dc3aabac7 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -89,16 +89,18 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
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
 
+	if (!of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") &&
+	    !of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global"))
+		return 0;
+
+	apcs->clk = platform_device_register_data(&pdev->dev,
+						  "qcom-apcs-msm8916-clk",
+						  -1, NULL, 0);
+	if (IS_ERR(apcs->clk))
+		dev_err(&pdev->dev, "failed to register APCS clk\n");
+
 	return 0;
 }
 
-- 
2.21.0


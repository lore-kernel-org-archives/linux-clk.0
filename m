Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFDFC43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E76662086C
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbXbCYun"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732102AbeLQJsA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 04:48:00 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55840 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732099AbeLQJqk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 04:46:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id y139so11567465wmc.5
        for <linux-clk@vger.kernel.org>; Mon, 17 Dec 2018 01:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rA8teKiCQvBpv/jfjC2a7MA/lCNZKpqm0xO+S8oLkqM=;
        b=YbXbCYunUW3tubTWVVJb5UBGIYmnq3QR6aAeKO8sBv641SUkCq2JGFk3UXK9gihIF+
         yS59VYvgidBAEq9hRQ3kc5BPXQuoJEoA2f6mXSojC1iz7M4w1nmn/S/TNOGEKdzbLP7n
         tCUPHDMhIQ7mrxrDTHm3zx9iIT7shIbdFz2GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rA8teKiCQvBpv/jfjC2a7MA/lCNZKpqm0xO+S8oLkqM=;
        b=RssOHrC8c/1MPzB0mDTDZFuC5e3t7SogmcwkfKkLXtcAhnuHiFc5/dUvhNUK0Crzga
         RzDmVXGgi2YzjAJlkRVvgHl2jcWT5P58+q/bzzjwMuVF/HZT/81oVHnoRB3uPyXXyobi
         eTHekWHTRrYbCsPIYFmWRcOf6rbyspQntKLWX7dh+JWP/WShBrwJ7Va/9gtmeambrdm5
         xfB5w+Dao8KX7ANjWJLdwS0+kywMMtkHn+BTDEA18YkUatPvOAnZpi5XdVgLAdUHlid1
         cwbevA+LtzERm2enqarDt9gbxFX8w/TPJZOcocUW+rQvF5vYdwoCyi+jFpydW6lqJeKg
         tPYg==
X-Gm-Message-State: AA+aEWbGTcCO6oauPzU54KOrZ6FIeiyCFI3P8lUTArEAskGpJWn4j4LB
        k+S1kRqteUMBixIQ1veA37hi1g==
X-Google-Smtp-Source: AFSGD/UYdiFVj+9m/cqZ0SaVersMLTUha7XyliP7JunYTdoPuXWcGMWWqcUG/I8FWhybcV+WFxCHSw==
X-Received: by 2002:a1c:1b8d:: with SMTP id b135mr10854223wmb.115.1545039999082;
        Mon, 17 Dec 2018 01:46:39 -0800 (PST)
Received: from localhost.localdomain (58.red-81-47-145.staticip.rima-tde.net. [81.47.145.58])
        by smtp.gmail.com with ESMTPSA id h12sm28878113wma.48.2018.12.17.01.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 01:46:38 -0800 (PST)
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
Subject: [PATCH 02/13] mbox: qcom: add APCS child device for QCS404
Date:   Mon, 17 Dec 2018 10:46:19 +0100
Message-Id: <1545039990-19984-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
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
index aed23ac..dc8fdab1 100644
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


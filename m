Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3106C433EF
	for <linux-clk@archiver.kernel.org>; Sun,  5 Jun 2022 16:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiFEQ5Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351326AbiFEQ5O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Jun 2022 12:57:14 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BD92607
        for <linux-clk@vger.kernel.org>; Sun,  5 Jun 2022 09:57:12 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fu3so23357265ejc.7
        for <linux-clk@vger.kernel.org>; Sun, 05 Jun 2022 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uqI55ErVc07HSIivOX7AXS9kfYIm1rBhZwSqgaXUh40=;
        b=VIbhzFl/bTjxpaT0eAACnezKnRbICldZ9hYrKiZSu8aZCsyIkvl+8ItvppwWMaM4cy
         vX2bu2dfheiQ1Y7jfYkNbnp08WFWGXzWDrijCAU8ZK2neE8ilIIQ7fFDBcpcoTFpfTzg
         so8qbCau2wxK0Lg3SPKxyi/ywoSq5tOmi5U2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uqI55ErVc07HSIivOX7AXS9kfYIm1rBhZwSqgaXUh40=;
        b=Q+1r6E9EQSXli9FQbVCMn13g3pbw2zhVgLy5F+aX3mztBeRy9NOmt/6MZwHn/SBNr3
         Wvk+PO/gii1twpAjvlWus9XKZls8F1GCsKk8dn0nL/nDi1/XnT4MbXGCB85LqZLqPq8a
         Jfbsz5mPmYQLj9XKaRwaLHyAuio6VACZrAspPoRMsmxCU2Pxb9Qd5u6n9pf8BipsyHCT
         JOT88RbO0EuuxUYwsbfcmtHyY4Y/Lw93xHb9C1msuFP2TgDH5XDKULlfh1X59mfFZpZT
         1O7pu5wRfNaSfAc/2IKCvXEPeF5JF3kfYym06eb/naFieV4vtB94Dv+eNsLahP/xCicB
         b4oA==
X-Gm-Message-State: AOAM531/z4N6qmg7JRXcCZH0RzIsznReKiV5RbPA3yL47XNwO03xjpWr
        GAy5pHdN9r1SyGjwqN0K1i0Aig==
X-Google-Smtp-Source: ABdhPJxGFBkk0/mTq0YRR9HHsIxQAOOFxD2SkOe81uKOGO5XMMxqU0A+LvckNQefcbuJLeKgkpBRYg==
X-Received: by 2002:a17:906:1492:b0:70e:294c:c37e with SMTP id x18-20020a170906149200b0070e294cc37emr12007185ejc.574.1654448231288;
        Sun, 05 Jun 2022 09:57:11 -0700 (PDT)
Received: from localhost.localdomain (mob-83-225-9-201.net.vodafone.it. [83.225.9.201])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906660c00b0070e3f58ed5csm3260761ejp.48.2022.06.05.09.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:57:10 -0700 (PDT)
From:   Michael Trimarchi <michael@amarulasolutions.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 2/3] clk: bd718x7: Enable the possibility to mark the clock as critical
Date:   Sun,  5 Jun 2022 18:57:02 +0200
Message-Id: <20220605165703.1565234-3-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220605165703.1565234-1-michael@amarulasolutions.com>
References: <20220605165703.1565234-1-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the clock is used to generate the osc_32k, we need to mark
as critical. clock-critical has no binding description at the moment
but it's defined in linux kernel

bd71847: pmic@4b {
...
	rohm,reset-snvs-powered;

	#clock-cells = <0>;
	clock-critical = <1>;
	clocks = <&osc_32k 0>;
	clock-output-names = "clk-32k-out";
...
}

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 drivers/clk/clk-bd718x7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index 04cc0beb67df..5088379ec2b7 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -83,6 +83,7 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	const char *parent_clk;
 	struct device *dev = &pdev->dev;
 	struct device *parent = pdev->dev.parent;
+	unsigned long flags;
 	struct clk_init_data init = {
 		.name = "bd718xx-32k-out",
 		.ops = &bd71837_clk_ops,
@@ -100,6 +101,9 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 
 	parent_clk = of_clk_get_parent_name(parent->of_node, 0);
 
+	of_clk_detect_critical(dev->of_node, 0, &flags);
+	init.flags = flags;
+
 	init.parent_names = &parent_clk;
 	if (!parent_clk) {
 		dev_err(dev, "No parent clk found\n");
-- 
2.25.1


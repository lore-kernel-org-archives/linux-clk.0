Return-Path: <SRS0=sgdq=ZC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4EBC43331
	for <linux-clk@archiver.kernel.org>; Sun, 10 Nov 2019 16:35:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EADD52080F
	for <linux-clk@archiver.kernel.org>; Sun, 10 Nov 2019 16:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n4ghcpQ+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfKJQfh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Nov 2019 11:35:37 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33302 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbfKJQfh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Nov 2019 11:35:37 -0500
Received: by mail-wm1-f68.google.com with SMTP id a17so10313517wmb.0
        for <linux-clk@vger.kernel.org>; Sun, 10 Nov 2019 08:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=owmOt9b7tYyOuPmCrpO23kXbaPycy+c3ErN7Myu9vJ8=;
        b=n4ghcpQ+kUtASUT7p4B1mEvCnLKqmdXuPMt1w/2DeBtAqzo4WFbQCPVLK6dA4oJ7TU
         UdTnOOQ3goDtumYpf2ojJb62lrlQD6SL4y8UVl1SV6HuQwkQ77v8SWLH/b2SgOlNE7jD
         bha4HDFgsSOO+9VNuaH1OL+snm06Es2jrgGsnwx4R9DJKFZsKSyMrsR7eM/YCRlaiCs/
         qRL/Dpkgx0fq/dtQDYRfK+01h1UpXYPCaEB8x82grpK278GBfw7ohvDiDBKZN9BCHG4G
         lRgo7tfVVh6wVyk878+MUQ2MPd/BVQppiXt6p//32S9yn9o+86OetyCNSO6/UjHMY9xN
         NJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=owmOt9b7tYyOuPmCrpO23kXbaPycy+c3ErN7Myu9vJ8=;
        b=KFIWb3wu6xNgTR/a8HGvUnmnIDYbIOnltrMaQCBMUG00Ahy3zYePdDSoU/tWW7lVO4
         yqb4QIJ9iaOFut/di7XgjHaX0UnBzoLsyo/B4KcHyMjzT5esF5EaLNh1XuNCLIqBQYFb
         PncVa969mMvsI2k5FBl7uAHZ90GZBlh/2o06/nvmMYxEmZfwwoUZtl/WofMvJ/qpPEFZ
         3GTj8wlQjL2cFKiD6WqalhFivrRkaI3mHrUh3U7LpsxTkWQfau3RA36JR9yZrVgvdj+Y
         8d4iDeMjExmhYw/mqu+EujIxojqhHzfkSXQtGDTfhYq9nDLnT4sc+bucEZBd8M8gWobh
         /x9g==
X-Gm-Message-State: APjAAAWsYA9IyMrf6oUwuIsWaltUq4gi9FHia+BmK7LkSYkznzIQ5RYm
        Uv4TfHlItVKX5Gxf7D2+cZv6yC7eEdo=
X-Google-Smtp-Source: APXvYqwVeZd0eFX2219nHb63noQDwm/1ZxRMPzw/Q8ktBro8sKumFEwgosCRDkkly22/ZmbDVN6v7Q==
X-Received: by 2002:a1c:7d16:: with SMTP id y22mr16288764wmc.106.1573403735405;
        Sun, 10 Nov 2019 08:35:35 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id a6sm13008230wrh.69.2019.11.10.08.35.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 10 Nov 2019 08:35:34 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     emilio@elopez.com.ar, mripard@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, wens@csie.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] clk: sunxi: use of_device_get_match_data
Date:   Sun, 10 Nov 2019 16:35:20 +0000
Message-Id: <1573403720-7916-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The usage of of_device_get_match_data reduce the code size a bit.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
index a165e7172346..4c75b0770c74 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
@@ -37,7 +37,6 @@ static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_onecell_data *clk_data;
-	const struct of_device_id *device;
 	const struct gates_data *data;
 	const char *clk_parent;
 	const char *clk_name;
@@ -50,10 +49,9 @@ static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENODEV;
 
-	device = of_match_device(sun6i_a31_apb0_gates_clk_dt_ids, &pdev->dev);
-	if (!device)
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
 		return -ENODEV;
-	data = device->data;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg = devm_ioremap_resource(&pdev->dev, r);
-- 
2.23.0


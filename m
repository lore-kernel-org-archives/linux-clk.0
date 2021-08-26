Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BF2C432BE
	for <linux-clk@archiver.kernel.org>; Thu, 26 Aug 2021 14:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7605660F5C
	for <linux-clk@archiver.kernel.org>; Thu, 26 Aug 2021 14:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbhHZOSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhHZOSW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Aug 2021 10:18:22 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B244BC061757
        for <linux-clk@vger.kernel.org>; Thu, 26 Aug 2021 07:17:35 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id b10so3916872ioq.9
        for <linux-clk@vger.kernel.org>; Thu, 26 Aug 2021 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yR0Q986hTr5u9uvjH/iJrbByc4I9teZ989KAuU/xvt0=;
        b=Rk4Lmvc8Qln4S9c+rGHBmdp3zVYc7yuYUTbbZRwi1dL66Y+QeK964IOx/DPMvHoYu+
         81CJncpaIBMkkrS6BUVJxGawclzFPTE7BROaHcF7vq0W5uj9q7TT5IR2BSuPbf0+G+O2
         xSkBeB+WOToFgIeyVw9rkdhasQUYYeAaMLw7T6evl96XZb7dQg92GPmMpYDcuHVlYSEz
         3Q6FZ8JKu39tCqNDFXlpGh4gcocjjZklKEJxOgEyC97WJhX4J+v0Bwl79nmCdnrOLiSz
         Vk4U5CH2QbGviMm1hiOHo2l/t1VvuDyJPJeGx967YLPvv1NRiF8f9LoNz2sePt+fZprV
         sR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yR0Q986hTr5u9uvjH/iJrbByc4I9teZ989KAuU/xvt0=;
        b=laatqdNzAXi3hT9tJAC9vKrkqd4k2/XnEmZx76ND6ushvOdJtRN+LPavmBjDaaKYbR
         Fl2yoDDKZ7IZFOXhZAfU6R9xPXbV6Zah/BOE0KX1PMWW+sGl4ObtpXwcjF3TwbcO0GEI
         Ya1qACjtnBJpDCoa093NcgnJdK6u71Ks12NgJUZI6bXU+TqZzUA0wJ9u/klDi5sqik0N
         r2CziJxD1ABdn4921FbiS6JkVhTFMtz+Bdk6//QutRg2jOmlmKEsqi6PQYSFR/VK3J5r
         piBubNivizaOoFweVMUDmq2IeiuSFh882obcQCkDuomVLh+E2OuR56ed6fZWbFZmaQlR
         DOIA==
X-Gm-Message-State: AOAM532qzRVyQZCiAKl6T0Zo14TYHNI1Ea4qrPjhui91FYIgfmlPcwfg
        a0gKz95oZNzkIy8q0/8CVz6pa4kIpBirrw==
X-Google-Smtp-Source: ABdhPJyR6JUkbkwq2lFqPjnTL2qaPcTyqNlO/pmqnVO7IDXr35X5W5zVMgWEDvU53JVoQia9NwR0RQ==
X-Received: by 2002:a6b:fd05:: with SMTP id c5mr3162164ioi.102.1629987454620;
        Thu, 26 Aug 2021 07:17:34 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id m1sm1828542ilf.24.2021.08.26.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:17:34 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-clk@vger.kernel.org
Cc:     sboyd@kernel.org, geert+renesas@glider.be, mturquette@baylibre.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] clk: renesas: rcar-usb2-clock-sel: Fix kernel NULL pointer dereference
Date:   Thu, 26 Aug 2021 09:17:21 -0500
Message-Id: <20210826141721.495067-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The probe was manually passing NULL instead of dev to devm_clk_hw_register.
This caused a Unable to handle kernel NULL pointer dereference error.
Fix this by passing 'dev'.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index 9fb79bd79435..684d8937965e 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -187,7 +187,7 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	init.ops = &usb2_clock_sel_clock_ops;
 	priv->hw.init = &init;
 
-	ret = devm_clk_hw_register(NULL, &priv->hw);
+	ret = devm_clk_hw_register(dev, &priv->hw);
 	if (ret)
 		goto pm_put;
 
-- 
2.25.1


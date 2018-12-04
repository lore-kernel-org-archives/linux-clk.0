Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A04CC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 18:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 037222082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 18:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVyg9jOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037222082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbeLDS11 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 13:27:27 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32901 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbeLDS11 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 13:27:27 -0500
Received: by mail-wm1-f66.google.com with SMTP id r24so10028689wmh.0;
        Tue, 04 Dec 2018 10:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CB3/+FLR0KrZ7YQTEPunoaekrnN1B992hCrt7Yfe+XE=;
        b=hVyg9jOb6l1RjoFUwP9iCiQjDR4GLcSi56vDMyPigKn64acN9cKi4+NKUm3Z2DfT7E
         fimdrRfVm4ygPHfzeE0rtJJblIQq6I5TZb01r78HYCl1JhCx5Bucb7/xZQuQeJNp0wht
         4J4YU2JULQ/uxQADhrdg5M8Jnmk+YUcWKRVadSXSh0Gd4asLFtlhqBzK+1M31TKxw65g
         EpRFi7d/z51OE5cH0OjvKa6DQCpfPVR0f9KaSi/9Dd/wBe1sps9C882I6XBBZkVMB8Ly
         thiUxzQeXLRfmpAWLXHIcxeeXZmJY7M5cwXh5/fFrCOJtL6hQbp6rKz8AyhSoXkENrbE
         6mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CB3/+FLR0KrZ7YQTEPunoaekrnN1B992hCrt7Yfe+XE=;
        b=C6ZmzcXhsCMpFAViLjG3PnR2L26XbOtl3oLCPuv0AJTnxzibJjEt4ULGQLPIaHM5Lb
         6f6vwwH6Uki+6b3oBBkkvtAi6jtYGiA36fRc8scVibT6QKDRN7+jSPPS1zHQyslbmQej
         BcLcQwQzPu9nMVAKTDwxq0IcMrLtSR0qHQmrlPdYsw0QLbwnQqPK2celF7x/RiTkZ+vV
         wDtYJz/HsxjfJrWCy4QC5UkIQUzG6+9L36rT3r/QJw6i4ctB9IRW/N8FQoz/u732IyXS
         mmAaURlGEA+WxXUL2UCRIbUO7mw17Fz/9/OsmM7QETw1rIAGN164DI1tQwCwh083KA24
         n0Fg==
X-Gm-Message-State: AA+aEWZG7lz1oy0/nN1SiV3QAY4y6QcldW/Hc3te/OHzS+9G5mq7+Sgg
        mRtY6e9efJIdCg607zs4QooF7l7K
X-Google-Smtp-Source: AFSGD/XaKgnBqzrkY1ypTdSGOD4IP25F7KJ/m+0Zc5O3eUU3KBPgLhSGXEFOvyxzeXKI336qyT716A==
X-Received: by 2002:a1c:868a:: with SMTP id i132mr9508798wmd.49.1543948045303;
        Tue, 04 Dec 2018 10:27:25 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id f2sm17238512wru.14.2018.12.04.10.27.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 10:27:24 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: vc5: Add suspend/resume support
Date:   Tue,  4 Dec 2018 19:27:21 +0100
Message-Id: <20181204182721.28258-1-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add simple suspend/resume handlers to the driver to restore the chip
configuration after resume. It is possible that the chip was configured
with non-default values before suspend-resume cycle and that the chip
is powered down during this cycle, so the configuration could get lost.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/clk-versaclock5.c | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3826ec..ac90fb36af1a 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -906,6 +906,39 @@ static int vc5_remove(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int vc5_suspend(struct device *dev)
+{
+	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regcache_sync(vc5->regmap);
+	if (ret != 0) {
+		dev_err(dev, "Failed to save register map: %d\n", ret);
+		return ret;
+	}
+	regcache_cache_only(vc5->regmap, true);
+	regcache_mark_dirty(vc5->regmap);
+
+	return 0;
+}
+
+static int vc5_resume(struct device *dev)
+{
+	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(vc5->regmap, false);
+	ret = regcache_sync(vc5->regmap);
+	if (ret != 0) {
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
 static const struct vc5_chip_info idt_5p49v5923_info = {
 	.model = IDT_VC5_5P49V5923,
 	.clk_fod_cnt = 2,
@@ -961,9 +994,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
 
+static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
+
 static struct i2c_driver vc5_driver = {
 	.driver = {
 		.name = "vc5",
+		.pm	= &vc5_pm_ops,
 		.of_match_table = clk_vc5_of_match,
 	},
 	.probe		= vc5_probe,
-- 
2.18.0


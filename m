Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD204C67839
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 01:41:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 828AB20870
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 01:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEHWop8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 828AB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbeLLBlf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:41:35 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39804 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbeLLBlf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 20:41:35 -0500
Received: by mail-wm1-f66.google.com with SMTP id f81so4190937wmd.4;
        Tue, 11 Dec 2018 17:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=b0gmXsO5OP57gsVOEg45HXYJC2cIpKkznTobeXNbJS8=;
        b=aEHWop8kdfvYD14gSreb9344r9sp99fsE4jkjrVTbBsU5hvWsgvB+98jQQ5+QJqv+6
         BVv1kk4p4OD3FUjtylxP6zYhRTavkNKTpZnNLXkaP3Ut+c7dirBDiW5EPQNJj2dtMU6O
         K1A1IR39Rg0zm0RSKuOoFH6p5xtQsDlrSpRxWZg1tmTXbt8pC682AEUUVKtTAcvcr5Ob
         bCIwmNRsSvzpArAjlj9Tn8nz0uQQvOQyVm1NVk0hS4L5MYu5EIaIYOJJIdMelVoMUczQ
         oc+eq36+NncGFTogceFinVnbYBh5G/1PNnnRn22LTW+zCHtraMFJjgSMsmB0ZzHwW1+a
         sUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=b0gmXsO5OP57gsVOEg45HXYJC2cIpKkznTobeXNbJS8=;
        b=JD05TyUGgQ3HXg/Sc6QYqfEU4oWBcu5mZp97z+CaZYvG3RUd8e/eylqXDXpHtF1NHz
         CB9KfpcDbLPvxo4f5qQZzv3wLG9+g11XiZ+/xLVdsP5DYRUndlOJVGTWZZi4EMiJcCSl
         K+Ew5syqUyvGW6E6uqFcWbz++cnajnRQ0QZt4VOmjzxIiaLtEZupg49b2enLXHIBavzX
         WPIQKVkEsFfPL+xD5S6rwCgXvY6xAZF8gNHiHlJeFxu1jkCHAUopURkxwFxZHJw2d1ZW
         Fw++cG7FtEdwVPXRinqVLab/5c7DwTEMaFGJaud2NpZRrPllcaPyVeHFhaVjOLCRzDA0
         s2FQ==
X-Gm-Message-State: AA+aEWbF+uJQXL2kZCuzoRvNPAg4y9qy/LKRSrgsb72iNs6I5Xy7PtPO
        AhuJmfKP/wLo5wfLKHVDpQmoyagM
X-Google-Smtp-Source: AFSGD/VWRxicaeCGs0ThmDYdKpI9xyiLWR2GGpQTdgz3yI6d3y0qOxnOfpRHKZwecXW8MfM1apYJeA==
X-Received: by 2002:a1c:a84f:: with SMTP id r76mr4486509wme.16.1544578893678;
        Tue, 11 Dec 2018 17:41:33 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v1sm20864870wrw.90.2018.12.11.17.41.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:41:32 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH V2] clk: vc5: Add suspend/resume support
Date:   Wed, 12 Dec 2018 02:41:30 +0100
Message-Id: <20181212014130.18634-1-marek.vasut+renesas@gmail.com>
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
V2: Replace ifdef with __maybe_unused
    Simplify return value handling in resume
---
 drivers/clk/clk-versaclock5.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3826ec..b66586a3abb7 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -906,6 +906,34 @@ static int vc5_remove(struct i2c_client *client)
 	return 0;
 }
 
+static int __maybe_unused vc5_suspend(struct device *dev)
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
+static int __maybe_unused vc5_resume(struct device *dev)
+{
+	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(vc5->regmap, false);
+	ret = regcache_sync(vc5->regmap);
+	if (ret)
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	return ret;
+}
+
 static const struct vc5_chip_info idt_5p49v5923_info = {
 	.model = IDT_VC5_5P49V5923,
 	.clk_fod_cnt = 2,
@@ -961,9 +989,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
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


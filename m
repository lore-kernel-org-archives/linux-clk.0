Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2132C67872
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 16:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66B262087F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 16:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW3Ru1oh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B262087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729176AbeLMQPi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 11:15:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33068 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbeLMQPh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 11:15:37 -0500
Received: by mail-wm1-f67.google.com with SMTP id r24so14246460wmh.0;
        Thu, 13 Dec 2018 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=G14zMTteNRs2A3ekbwTLJcgZ1mkxABc1c3P0nBrj9fQ=;
        b=kW3Ru1ohoLQ2xwWd7sZ+0JAsaXi6kTXLQ9PcQlyE6m7DmFNdyslbX3e8DR11+FKkzu
         T9Xjyas1QJtPsZr6AHKkHaer7pNkXI/DsohIsNlTjFB0Hgp4ao8E6r4/nKpDHlPp//S4
         JNYXU8yQI6XsCH0A+PnBVU88c2jRx4I1VOHmtYl9ZvK1ZNFG5DwKPE69OCTxCpRgx8wG
         hB8r7G3zuMSw/dPI7xvqz/9OZtekQyGjlyVrC2ovHgC4yKq+nAZqYxWhB9Wejtw9eCTO
         mPQ77odVNaJga+2buW3ckkNWE8CgQkm/mxdYqv5GDv8dqudYSPPcYJRceq/URVF92ekm
         XhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G14zMTteNRs2A3ekbwTLJcgZ1mkxABc1c3P0nBrj9fQ=;
        b=Z/UsDd6IBJmUWjHUF4FNz55Z+N+UYd1jLzm/0m9PJr9gZkxn7cnAXFVTYxUzElS7Jw
         yCMqzy/ah4RST4SoE2/7VcfohnpEQmVLoGrgKwzAgIJg+i7AsAepWpPKjjjNgGNRbHV/
         UdE0me5+23peoZvAnCbUlasnT3cx6Q9DnqdpqZTuWwIewaz6xmtXmZNcy89JAvLWP8lg
         FHJhX4x73qXofW4OkqWDRrY7ktvfQWV0DNv1JhB7FfDRdhDmh/Piw8hyakH2x9Cp5xMc
         e4QJ93FOlRIUn0pJucNYED9HQHwlUYhbAti9sTcMsLDwTL9C1IRyGo8JRuo5mZEgayrJ
         4klg==
X-Gm-Message-State: AA+aEWacwHqaAPDtcCKTTr62sIHy8id8DHdCl1SYiVIA+9QP9p7yTIba
        YGhxlapVHfw91WBN+i6jKa843uCk
X-Google-Smtp-Source: AFSGD/VclDJjf9VjgP2qSSznxFM0ALMXn3371tp0nJzmi2vnlwIMpfJhblgVtXMZs59583fnAO45ow==
X-Received: by 2002:a1c:18c:: with SMTP id 134mr10559167wmb.88.1544717735404;
        Thu, 13 Dec 2018 08:15:35 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id y34sm5512596wrd.68.2018.12.13.08.15.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 08:15:34 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH V3] clk: vc5: Add suspend/resume support
Date:   Thu, 13 Dec 2018 17:15:28 +0100
Message-Id: <20181213161528.20318-1-marek.vasut+renesas@gmail.com>
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
V3: Drop useless regcache_sync() call from suspend callback
    (thanks Laurent for testing with working DU)
---
 drivers/clk/clk-versaclock5.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3826ec..5b393e711e94 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -906,6 +906,28 @@ static int vc5_remove(struct i2c_client *client)
 	return 0;
 }
 
+static int __maybe_unused vc5_suspend(struct device *dev)
+{
+	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
+
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
@@ -961,9 +983,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
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


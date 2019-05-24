Return-Path: <SRS0=PuqA=TY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A13C072B5
	for <linux-clk@archiver.kernel.org>; Fri, 24 May 2019 07:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4EE921841
	for <linux-clk@archiver.kernel.org>; Fri, 24 May 2019 07:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c82BYFQQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388820AbfEXH23 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 May 2019 03:28:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44549 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389079AbfEXH22 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 May 2019 03:28:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so475355wru.11
        for <linux-clk@vger.kernel.org>; Fri, 24 May 2019 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=g7My6ofizNceL0e00TKw8x/q9/vF1etxKqWIBGqQLYI=;
        b=c82BYFQQkPE+bGt+UWZTTY1Thr/oBoM9ZFdoFk/8q3JUBVA64ibMZarit0jRi8MuMe
         kPgx4E/niQNHqyOSnrJkiTFmAFfZl01hiLoaRXUum4G//6nNPA7ECbs45p3EfghCUx+Q
         jZw2r6qjF0SrJ2FCrRHjOBZnc2c/1dMiK8rgUBT/bHnCLfJCRRol6u7ok0fVNhS8A4NR
         VdlxQ/GhNaq/k83UXxw2E4ghLFjQX9SQfj7iflvxE0MYTmiw7nIGbaT19kXXKu1HunUS
         Yjdp9dugqhf8IHpnI4yTdZgMEL3cpeBgxfEhcp7lgFvp4NIAsLodmTbRYXdAxE7SqqdP
         EmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g7My6ofizNceL0e00TKw8x/q9/vF1etxKqWIBGqQLYI=;
        b=KhVrHJRQvdpnAuehTzd3BNHfWKJqQr32IXdsvpt3UlZqufR5xO2lGXFwOBuEe2splr
         zpO8McUQ8JbCtCcizfzlEESBy3y1PM+sfsyMxNRxCWQrYpIM1J58K2mVRdIcvDUNnpa/
         6VfrTkl015yypk6ZDjGBE/9zeKS9XTpmE5CLyzo1kP54jE1BS7H4lytTlY5T91cNC0TU
         t4cQvGRH5TPEt1cw9fmXMaOYPNfptdwiZy/QqrAL2f+8ah4TeAalgkgCvTIDV3jCEoo2
         rq6ggKosc1x0qOBm8/pwmQUxLCfAx0fFqoiTDmLFKnqJNRzPfNlrNwxNpnMT2T/Yb+Ai
         3+eg==
X-Gm-Message-State: APjAAAVy/IhqIu3J5aV6PiBRfxWkCSAaxvh8KH6IXZguA+i/0lOpVpxW
        iDP7BmRIt/xVC2oOjJWYROU88g==
X-Google-Smtp-Source: APXvYqwhN0wfTDoWd2iPpzUi6HAWZlBGAu3YYnYfSG2+8PZwemaCJvdBGx51HB+WetqRnNT3ouREkw==
X-Received: by 2002:adf:f743:: with SMTP id z3mr16328930wrp.129.1558682907444;
        Fri, 24 May 2019 00:28:27 -0700 (PDT)
Received: from pop-os.baylibre.local (mx306-1-88-173-34-203.fbx.proxad.net. [88.173.34.203])
        by smtp.googlemail.com with ESMTPSA id s11sm3034349wrb.71.2019.05.24.00.28.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 00:28:26 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: fix clock global name usage.
Date:   Fri, 24 May 2019 09:27:45 +0200
Message-Id: <20190524072745.27398-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A recent patch allows the clock framework to specify the parent
relationship with either the clk_hw pointer, the global name or through
Device Tree name.

But the global name isn't handled by the clk framework because the DT name
is considered valid even if it's NULL, so of_clk_get_hw() returns an
unexpected clock (the first clock specified in DT).

This can be fixed by calling of_clk_get_hw() only when DT name is not NULL.

Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
Cc: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bdb077ba59b9..9624a75e5a8d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -368,7 +368,7 @@ static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
 	const char *dev_id = dev ? dev_name(dev) : NULL;
 	struct device_node *np = core->of_node;
 
-	if (np && index >= 0)
+	if (name && np && index >= 0)
 		hw = of_clk_get_hw(np, index, name);
 
 	/*
-- 
2.17.1


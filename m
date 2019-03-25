Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F33BC43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 10:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0C0B2084D
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 10:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1D0c140l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbfCYKmn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 06:42:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42038 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbfCYKmn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 06:42:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id g3so6004190wrx.9
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2019 03:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X4Cs93Td2ev+3BK1qi4u01I1+1mquQ3LynMHsDaBAJA=;
        b=1D0c140lZ3TuoOseTpYGn+KepDJTLUGQCx2qD7hQyg2W5oTW5jTPbmwJ1whikF4Dgf
         PGuC20teMw12a0Tf5eRXGGdhKZUVUlLGm8TaoVd3YI8tcKtmI50du8l3rouAP2aAx24P
         6QzhRTSNPNvSLYmlHo4fOmNj/vdb5Q9xwmqcDdYMwLfKFychAWGpDu9etYvhuAxsySBs
         uBGXmLzZyFPhyR5UcAIM7FWwDPJ4y1bubHNIZG89rJ0JJIaSZGeiNx7FHTsOWONT2ZmX
         9JMuyfBZDap3+RBVNZXJr7z7SVZM3UPZNatg44dwETeJ12LfqROtyzcCXB1A2xjEsHVw
         gC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X4Cs93Td2ev+3BK1qi4u01I1+1mquQ3LynMHsDaBAJA=;
        b=qKGuxPnEmvmwF+Rb/PhHFyuTXLBd9rXPwnsLfbMk7n9fABUZoaEPXF+hSsGmpTqMNb
         yio5bT+rj+gCsudbwEdscQp6aGJUj0YudgWeQLiYR/1Ari2ElrnrFqBFVZF82IZDwmNH
         oZQyC4K6pNJdwSQMT1WZZds7r2DfoKdNGfDW55Xa0wWg33tlHxmRFYyN/Gvm5kksGI70
         oIsK4YwEU+szbdTmM0H6r7Wb/QaYXiIiNPS4lEOZNHSy+kGRkX6MNQmHNm6xK4UwGdER
         TL/ymuqwTCJLOvjug1BgQkmAgJASTTutgQv/1rTjT2ZylklAIwn0DoYvB6ri2ARC2SBi
         Xi+g==
X-Gm-Message-State: APjAAAU9YdX7RbNRgcVb6/BDE8QqxA/KVGf8N3HV6u4NFbJjitH1PKZz
        NUyqkIjermqI+A8Vk17ZapQH/jdyuIo=
X-Google-Smtp-Source: APXvYqzmTIG/rqGXeKziNk/T5/p0SkUjSx6abAoIlZG9mN+VueyLCQl8QPz+VUUkS3jRKQkQwGwytQ==
X-Received: by 2002:a05:6000:5:: with SMTP id h5mr14681264wrx.271.1553510561778;
        Mon, 25 Mar 2019 03:42:41 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id o17sm16760232wrw.73.2019.03.25.03.42.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 03:42:41 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
Date:   Mon, 25 Mar 2019 11:42:30 +0100
Message-Id: <20190325104230.11245-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While some SoC samples are able to lock with a PLL factor of 55, others
samples can't. ATM, a minimum of 60 appears to work on all the samples
I have tried, so lets use this value until we have a good reason to put
something else.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0e1ce8c03259..d3f53a9b97dc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -151,7 +151,7 @@ static struct clk_regmap g12a_sys_pll = {
 };
 
 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 55,
+	.min = 60,
 	.max = 255,
 };
 
-- 
2.20.1

